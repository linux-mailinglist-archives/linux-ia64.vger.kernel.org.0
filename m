Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA228244027
	for <lists+linux-ia64@lfdr.de>; Thu, 13 Aug 2020 22:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgHMUz3 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 13 Aug 2020 16:55:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:58290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726192AbgHMUz2 (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Thu, 13 Aug 2020 16:55:28 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A80A206B2;
        Thu, 13 Aug 2020 20:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597352127;
        bh=fwqNF7Ek4YQWXYA/eB6lJuI0t+SdQtcs0nxaBRdmccY=;
        h=From:To:Cc:Subject:Date:From;
        b=Oa3whIX734bl++81bmONQOYVwNO8rDrBDDv3AnscYHnXEUwcHEqZoJTQxe/8nfU7D
         7MdcAO7g9VROG4Zju4dpSwFlkDqotXyzYuyIvAe1EuZdiQc7HB0J3EG8QTZZ/iAACU
         W51oZd0yIrUz5JliVpYs1NYqgFuxg0fWMbv7kMq4=
From:   Mike Rapoport <rppt@kernel.org>
To:     Jessica Clarke <jrtc27@jrtc27.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        Anatoly Pugachev <matorola@gmail.com>,
        Sergei Trofimovich <slyfox@gentoo.org>, linux-mm@kvack.org,
        Frank Scheiner <frank.scheiner@web.de>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH v5] arch/ia64: Restore arch-specific pgd_offset_k implementation
Date:   Thu, 13 Aug 2020 23:55:21 +0300
Message-Id: <20200813205521.5405-1-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

From: Jessica Clarke <jrtc27@jrtc27.com>

IA-64 is special and treats pgd_offset_k() differently to pgd_offset(),
using different formulae to calculate the indices into the kernel and user
PGDs.  The index into the user PGDs takes into account the region number,
but the index into the kernel (init_mm) PGD always assumes a predefined
kernel region number. Commit 974b9b2c68 ("mm: consolidate pte_index() and
pte_offset_*() definitions") made IA-64 use a generic pgd_offset_k() which
incorrectly used pgd_index() for kernel page tables.  As a result, the
index into the kernel PGD was going out of bounds and the kernel hung
during early boot.

Allow overrides of pgd_offset_k() and override it on IA-64 with the old
implementation that will correctly index the kernel PGD.

Fixes: 974b9b2c68 ("mm: consolidate pte_index() and pte_offset_*() definitions")
Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
Changes in v4:
* Correct the comment that I missed in v4 :(

Changes since v3:
* Correct commit message as Jessica suggested

Changes since v2:
* Rephrase commit message and comment about pgd_offset_k()

Changes since v1:
 * Fixed typo in commit message
 * Slightly reworded commit message to sound less weird
 * Included Adrian's Tested-by
 arch/ia64/include/asm/pgtable.h | 9 +++++++++
 include/linux/pgtable.h         | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/arch/ia64/include/asm/pgtable.h b/arch/ia64/include/asm/pgtable.h
index 10850897a91c..779b6972aa84 100644
--- a/arch/ia64/include/asm/pgtable.h
+++ b/arch/ia64/include/asm/pgtable.h
@@ -366,6 +366,15 @@ pgd_index (unsigned long address)
 }
 #define pgd_index pgd_index
 
+/*
+ * In the kernel's mapped region we know everything is in region number 5, so
+ * as an optimisation its PGD already points to the area for that region.
+ * However, this also means that we cannot use pgd_index() and we must
+ * never add the region here.
+ */
+#define pgd_offset_k(addr) \
+	(init_mm.pgd + (((addr) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1)))
+
 /* Look up a pgd entry in the gate area.  On IA-64, the gate-area
    resides in the kernel-mapped segment, hence we use pgd_offset_k()
    here.  */
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index a124c21e3204..e8cbc2e795d5 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -117,7 +117,9 @@ static inline pgd_t *pgd_offset_pgd(pgd_t *pgd, unsigned long address)
  * a shortcut which implies the use of the kernel's pgd, instead
  * of a process's
  */
+#ifndef pgd_offset_k
 #define pgd_offset_k(address)		pgd_offset(&init_mm, (address))
+#endif
 
 /*
  * In many cases it is known that a virtual address is mapped at PMD or PTE
-- 
2.26.2

