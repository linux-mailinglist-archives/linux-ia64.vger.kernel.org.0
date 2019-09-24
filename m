Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBCDBD1F8
	for <lists+linux-ia64@lfdr.de>; Tue, 24 Sep 2019 20:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437139AbfIXSpg (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 24 Sep 2019 14:45:36 -0400
Received: from mga09.intel.com ([134.134.136.24]:51455 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437132AbfIXSpg (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 24 Sep 2019 14:45:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 11:45:35 -0700
X-IronPort-AV: E=Sophos;i="5.64,545,1559545200"; 
   d="scan'208";a="193527573"
Received: from agluck-desk2.sc.intel.com ([10.3.52.68])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 11:45:34 -0700
From:   Tony Luck <tony.luck@intel.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        Fenghua Yu <fenghua.yu@intel.com>
Subject: [PATCH: Linus, please apply] ia64: Fix some warnings introduced in merge window
Date:   Tue, 24 Sep 2019 11:45:34 -0700
Message-Id: <20190924184534.7592-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

arch/ia64/kernel/irq_ia64.c:586:1: warning: no return statement in function returning non-void [-Wr
eturn-type]
arch/ia64/mm/contig.c:111:6: warning: unused variable 'rc' [-Wunused-variable]
arch/ia64/mm/discontig.c:189:39: warning: unused variable 'rc' [-Wunused-variable]

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/ia64/kernel/irq_ia64.c | 1 +
 arch/ia64/mm/contig.c       | 1 -
 arch/ia64/mm/discontig.c    | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/ia64/kernel/irq_ia64.c b/arch/ia64/kernel/irq_ia64.c
index f10208478131..8e91c86e8072 100644
--- a/arch/ia64/kernel/irq_ia64.c
+++ b/arch/ia64/kernel/irq_ia64.c
@@ -583,6 +583,7 @@ void ia64_process_pending_intr(void)
 static irqreturn_t dummy_handler (int irq, void *dev_id)
 {
 	BUG();
+	return IRQ_NONE;
 }
 
 static struct irqaction ipi_irqaction = {
diff --git a/arch/ia64/mm/contig.c b/arch/ia64/mm/contig.c
index db09a693f094..5b00dc3898e1 100644
--- a/arch/ia64/mm/contig.c
+++ b/arch/ia64/mm/contig.c
@@ -108,7 +108,6 @@ setup_per_cpu_areas(void)
 	struct pcpu_group_info *gi;
 	unsigned int cpu;
 	ssize_t static_size, reserved_size, dyn_size;
-	int rc;
 
 	ai = pcpu_alloc_alloc_info(1, num_possible_cpus());
 	if (!ai)
diff --git a/arch/ia64/mm/discontig.c b/arch/ia64/mm/discontig.c
index 219fc640414b..4f33f6e7e206 100644
--- a/arch/ia64/mm/discontig.c
+++ b/arch/ia64/mm/discontig.c
@@ -186,7 +186,7 @@ void __init setup_per_cpu_areas(void)
 	unsigned long base_offset;
 	unsigned int cpu;
 	ssize_t static_size, reserved_size, dyn_size;
-	int node, prev_node, unit, nr_units, rc;
+	int node, prev_node, unit, nr_units;
 
 	ai = pcpu_alloc_alloc_info(MAX_NUMNODES, nr_cpu_ids);
 	if (!ai)
-- 
2.20.1

