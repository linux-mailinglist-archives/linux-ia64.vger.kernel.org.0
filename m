Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1ADD8494
	for <lists+linux-ia64@lfdr.de>; Wed, 16 Oct 2019 01:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbfJOXzF (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 15 Oct 2019 19:55:05 -0400
Received: from mga06.intel.com ([134.134.136.31]:62992 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727439AbfJOXzF (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 15 Oct 2019 19:55:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Oct 2019 16:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,301,1566889200"; 
   d="scan'208";a="370629838"
Received: from oux.sc.intel.com ([10.3.52.57])
  by orsmga005.jf.intel.com with ESMTP; 15 Oct 2019 16:55:04 -0700
From:   Yian Chen <yian.chen@intel.com>
To:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
        Joerg Roedel <joro@8bytes.org>,
        Ashok Raj <ashok.raj@intel.com>,
        Sohil Mehta <sohil.mehta@intel.com>,
        Tony Luck <tony.luck@intel.com>
Cc:     Yian Chen <yian.chen@intel.com>
Subject: [PATCH] iommu/vt-d: Check VT-d RMRR region in BIOS is reported as reserved
Date:   Tue, 15 Oct 2019 09:49:32 -0700
Message-Id: <20191015164932.18185-1-yian.chen@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

VT-d RMRR (Reserved Memory Region Reporting) regions are reserved
for device use only and should not be part of allocable memory pool of OS.

BIOS e820_table reports complete memory map to OS, including OS usable
memory ranges and BIOS reserved memory ranges etc.

x86 BIOS may not be trusted to include RMRR regions as reserved type
of memory in its e820 memory map, hence validate every RMRR entry
with the e820 memory map to make sure the RMRR regions will not be
used by OS for any other purposes.

ia64 EFI is working fine so implement RMRR validation as a dummy function

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
Signed-off-by: Yian Chen <yian.chen@intel.com>
---
 arch/ia64/include/asm/iommu.h |  5 +++++
 arch/x86/include/asm/iommu.h  | 18 ++++++++++++++++++
 drivers/iommu/intel-iommu.c   |  8 +++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/ia64/include/asm/iommu.h b/arch/ia64/include/asm/iommu.h
index 7904f591a79b..eb0db20c9d4c 100644
--- a/arch/ia64/include/asm/iommu.h
+++ b/arch/ia64/include/asm/iommu.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_IA64_IOMMU_H
 #define _ASM_IA64_IOMMU_H 1
 
+#include <linux/acpi.h>
+
 /* 10 seconds */
 #define DMAR_OPERATION_TIMEOUT (((cycles_t) local_cpu_data->itc_freq)*10)
 
@@ -9,6 +11,9 @@ extern void no_iommu_init(void);
 #ifdef	CONFIG_INTEL_IOMMU
 extern int force_iommu, no_iommu;
 extern int iommu_detected;
+
+static inline int __init
+arch_rmrr_sanity_check(struct acpi_dmar_reserved_memory *rmrr) { return 0; }
 #else
 #define no_iommu		(1)
 #define iommu_detected		(0)
diff --git a/arch/x86/include/asm/iommu.h b/arch/x86/include/asm/iommu.h
index b91623d521d9..95fa65a5f0dc 100644
--- a/arch/x86/include/asm/iommu.h
+++ b/arch/x86/include/asm/iommu.h
@@ -2,10 +2,28 @@
 #ifndef _ASM_X86_IOMMU_H
 #define _ASM_X86_IOMMU_H
 
+#include <linux/acpi.h>
+
+#include <asm/e820/api.h>
+
 extern int force_iommu, no_iommu;
 extern int iommu_detected;
 
 /* 10 seconds */
 #define DMAR_OPERATION_TIMEOUT ((cycles_t) tsc_khz*10*1000)
 
+static inline int __init
+arch_rmrr_sanity_check(struct acpi_dmar_reserved_memory *rmrr)
+{
+	u64 start = rmrr->base_address;
+	u64 end = rmrr->end_address + 1;
+
+	if (e820__mapped_all(start, end, E820_TYPE_RESERVED))
+		return 0;
+
+	pr_err(FW_BUG "No firmware reserved region can cover this RMRR [%#018Lx-%#018Lx], contact BIOS vendor for fixes\n",
+	       start, end - 1);
+	return -EFAULT;
+}
+
 #endif /* _ASM_X86_IOMMU_H */
diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 3f974919d3bd..722290014143 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -4306,13 +4306,19 @@ int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
 {
 	struct acpi_dmar_reserved_memory *rmrr;
 	struct dmar_rmrr_unit *rmrru;
+	int ret;
+
+	rmrr = (struct acpi_dmar_reserved_memory *)header;
+	ret = arch_rmrr_sanity_check(rmrr);
+	if (ret)
+		return ret;
 
 	rmrru = kzalloc(sizeof(*rmrru), GFP_KERNEL);
 	if (!rmrru)
 		goto out;
 
 	rmrru->hdr = header;
-	rmrr = (struct acpi_dmar_reserved_memory *)header;
+
 	rmrru->base_address = rmrr->base_address;
 	rmrru->end_address = rmrr->end_address;
 
-- 
2.17.1

