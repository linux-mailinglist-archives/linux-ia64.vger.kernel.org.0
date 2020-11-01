Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92462A1FE7
	for <lists+linux-ia64@lfdr.de>; Sun,  1 Nov 2020 18:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbgKARFi (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 1 Nov 2020 12:05:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:39340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727024AbgKARFh (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Sun, 1 Nov 2020 12:05:37 -0500
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8AD7E2222F;
        Sun,  1 Nov 2020 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604250336;
        bh=zMhqm8rA573QnfAHp47KPpfQjEAK86ZwGGp3h7Y8/nM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ACW/GF0oeifYG5DUM8yF2CNpSzi0UkgF2Bo2MpTBtn8pgt6p7Wrv1TVShSnsY4kZu
         G1DEcqa7kLV3tQ4NpDXFjygFEQIDGGIHacXYPKO/PhGdzm/ZdawiYECLU9P9aQSRx3
         0JoyLIsUDdlSn9jb3p0lIRqN6R6B+qoPqqLHVIUc=
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexey Dobriyan <adobriyan@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>, Meelis Roos <mroos@linux.ee>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mm@kvack.org, linux-snps-arc@lists.infradead.org
Subject: [PATCH v2 05/13] ia64: split virtual map initialization out of paging_init()
Date:   Sun,  1 Nov 2020 19:04:46 +0200
Message-Id: <20201101170454.9567-6-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201101170454.9567-1-rppt@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

For both FLATMEM and DISCONTIGMEM/SPARSEMEM the virtual map initialization
is spread over paging_init() for no good reason.

Split out the bits related to virtual map initialization to a helper
functions, one for FLATMEM and another for !FLATMEM configurations.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/ia64/mm/contig.c    | 34 ++++++++++++++++++++--------------
 arch/ia64/mm/discontig.c | 37 ++++++++++++++++++++-----------------
 2 files changed, 40 insertions(+), 31 deletions(-)

diff --git a/arch/ia64/mm/contig.c b/arch/ia64/mm/contig.c
index 2491aaeca90c..ba81d8cb0059 100644
--- a/arch/ia64/mm/contig.c
+++ b/arch/ia64/mm/contig.c
@@ -166,21 +166,8 @@ find_memory (void)
 	alloc_per_cpu_data();
 }
 
-/*
- * Set up the page tables.
- */
-
-void __init
-paging_init (void)
+static void __init virtual_map_init(void)
 {
-	unsigned long max_dma;
-	unsigned long max_zone_pfns[MAX_NR_ZONES];
-
-	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
-	max_dma = virt_to_phys((void *) MAX_DMA_ADDRESS) >> PAGE_SHIFT;
-	max_zone_pfns[ZONE_DMA32] = max_dma;
-	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
-
 #ifdef CONFIG_VIRTUAL_MEM_MAP
 	efi_memmap_walk(find_largest_hole, (u64 *)&max_gap);
 	if (max_gap < LARGE_GAP) {
@@ -206,6 +193,25 @@ paging_init (void)
 		printk("Virtual mem_map starts at 0x%p\n", mem_map);
 	}
 #endif /* !CONFIG_VIRTUAL_MEM_MAP */
+}
+
+/*
+ * Set up the page tables.
+ */
+
+void __init
+paging_init (void)
+{
+	unsigned long max_dma;
+	unsigned long max_zone_pfns[MAX_NR_ZONES];
+
+	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
+	max_dma = virt_to_phys((void *) MAX_DMA_ADDRESS) >> PAGE_SHIFT;
+	max_zone_pfns[ZONE_DMA32] = max_dma;
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+
+	virtual_map_init();
+
 	free_area_init(max_zone_pfns);
 	zero_page_memmap_ptr = virt_to_page(ia64_imva(empty_zero_page));
 }
diff --git a/arch/ia64/mm/discontig.c b/arch/ia64/mm/discontig.c
index f41dcf75887b..c7311131156e 100644
--- a/arch/ia64/mm/discontig.c
+++ b/arch/ia64/mm/discontig.c
@@ -584,6 +584,25 @@ void call_pernode_memory(unsigned long start, unsigned long len, void *arg)
 	}
 }
 
+static void __init virtual_map_init(void)
+{
+#ifdef CONFIG_VIRTUAL_MEM_MAP
+	int node;
+
+	VMALLOC_END -= PAGE_ALIGN(ALIGN(max_low_pfn, MAX_ORDER_NR_PAGES) *
+		sizeof(struct page));
+	vmem_map = (struct page *) VMALLOC_END;
+	efi_memmap_walk(create_mem_map_page_table, NULL);
+	printk("Virtual mem_map starts at 0x%p\n", vmem_map);
+
+	for_each_online_node(node) {
+		unsigned long pfn_offset = mem_data[node].min_pfn;
+
+		NODE_DATA(node)->node_mem_map = vmem_map + pfn_offset;
+	}
+#endif
+}
+
 /**
  * paging_init - setup page tables
  *
@@ -593,29 +612,13 @@ void call_pernode_memory(unsigned long start, unsigned long len, void *arg)
 void __init paging_init(void)
 {
 	unsigned long max_dma;
-	unsigned long pfn_offset = 0;
-	int node;
 	unsigned long max_zone_pfns[MAX_NR_ZONES];
 
 	max_dma = virt_to_phys((void *) MAX_DMA_ADDRESS) >> PAGE_SHIFT;
 
 	sparse_init();
 
-#ifdef CONFIG_VIRTUAL_MEM_MAP
-	VMALLOC_END -= PAGE_ALIGN(ALIGN(max_low_pfn, MAX_ORDER_NR_PAGES) *
-		sizeof(struct page));
-	vmem_map = (struct page *) VMALLOC_END;
-	efi_memmap_walk(create_mem_map_page_table, NULL);
-	printk("Virtual mem_map starts at 0x%p\n", vmem_map);
-#endif
-
-	for_each_online_node(node) {
-		pfn_offset = mem_data[node].min_pfn;
-
-#ifdef CONFIG_VIRTUAL_MEM_MAP
-		NODE_DATA(node)->node_mem_map = vmem_map + pfn_offset;
-#endif
-	}
+	virtual_map_init();
 
 	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
 	max_zone_pfns[ZONE_DMA32] = max_dma;
-- 
2.28.0

