Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBA126159E
	for <lists+linux-ia64@lfdr.de>; Tue,  8 Sep 2020 18:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732055AbgIHQxj (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 8 Sep 2020 12:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732013AbgIHQs0 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 8 Sep 2020 12:48:26 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8A1C0613ED;
        Tue,  8 Sep 2020 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=TOuK17Qk/+RG9JjoEmfIADHhINI7uNmAb+uCmwE91Tw=; b=D4AuLALwzhRy1wljBYiNycgxHo
        +kgKhfuA45r5cDUlfP4Zxmk7hl46xjUqUYQ08/XEuVrPhLNR+m9fc3LLYK7sQLVHJStepQ98TTrXg
        ulKpsXTAjsIed5VsguPQNR+Ie4Es5SCflf9lrOHHLoUGt+ebNzEICokfGgUvgfCJ/b7b+daZvAO/y
        iwveR3Zhph5HbEXBNJuF7q0CGY1WB0JUBHcJ/MSzETqWSPKLIILjnBrpDayHl1BVJBiuSr+k7FJbb
        DvKNCBMQ8iF+t51AHecgRNINv1mxwqbSSnGQUAs+xbt+9CXz6glhEbGQsj/L9ISHOh/vfsgnvOM3G
        WpQIqJTA==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kFgmx-0001T4-Ae; Tue, 08 Sep 2020 16:48:11 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 09/12] dma-direct: remove __dma_to_phys
Date:   Tue,  8 Sep 2020 18:47:55 +0200
Message-Id: <20200908164758.3177341-10-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200908164758.3177341-1-hch@lst.de>
References: <20200908164758.3177341-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

There is no harm in just always clearing the SME encryption bit, while
significantly simplifying the interface.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/dma-direct.h      |  2 +-
 arch/mips/bmips/dma.c                  |  2 +-
 arch/mips/cavium-octeon/dma-octeon.c   |  2 +-
 arch/mips/include/asm/dma-direct.h     |  2 +-
 arch/mips/loongson2ef/fuloong-2e/dma.c |  2 +-
 arch/mips/loongson2ef/lemote-2f/dma.c  |  2 +-
 arch/mips/loongson64/dma.c             |  2 +-
 arch/mips/pci/pci-ar2315.c             |  2 +-
 arch/mips/pci/pci-xtalk-bridge.c       |  2 +-
 arch/mips/sgi-ip32/ip32-dma.c          |  2 +-
 arch/powerpc/include/asm/dma-direct.h  |  2 +-
 include/linux/dma-direct.h             | 14 +++++---------
 kernel/dma/direct.c                    |  6 +-----
 13 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-direct.h
index 7c3001a6a775bf..a8cee87a93e8ab 100644
--- a/arch/arm/include/asm/dma-direct.h
+++ b/arch/arm/include/asm/dma-direct.h
@@ -8,7 +8,7 @@ static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return pfn_to_dma(dev, __phys_to_pfn(paddr)) + offset;
 }
 
-static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
+static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 {
 	unsigned int offset = dev_addr & ~PAGE_MASK;
 	return __pfn_to_phys(dma_to_pfn(dev, dev_addr)) + offset;
diff --git a/arch/mips/bmips/dma.c b/arch/mips/bmips/dma.c
index df56bf4179e347..ba2a5d33dfd3fa 100644
--- a/arch/mips/bmips/dma.c
+++ b/arch/mips/bmips/dma.c
@@ -52,7 +52,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t pa)
 	return pa;
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	struct bmips_dma_range *r;
 
diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
index 14ea680d180e07..388b13ba2558c2 100644
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -177,7 +177,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return paddr;
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
 {
 #ifdef CONFIG_PCI
 	if (dev && dev_is_pci(dev))
diff --git a/arch/mips/include/asm/dma-direct.h b/arch/mips/include/asm/dma-direct.h
index 14e352651ce946..8e178651c638c2 100644
--- a/arch/mips/include/asm/dma-direct.h
+++ b/arch/mips/include/asm/dma-direct.h
@@ -3,6 +3,6 @@
 #define _MIPS_DMA_DIRECT_H 1
 
 dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr);
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr);
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr);
 
 #endif /* _MIPS_DMA_DIRECT_H */
diff --git a/arch/mips/loongson2ef/fuloong-2e/dma.c b/arch/mips/loongson2ef/fuloong-2e/dma.c
index e122292bf6660a..83fadeb3fd7d56 100644
--- a/arch/mips/loongson2ef/fuloong-2e/dma.c
+++ b/arch/mips/loongson2ef/fuloong-2e/dma.c
@@ -6,7 +6,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return paddr | 0x80000000;
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	return dma_addr & 0x7fffffff;
 }
diff --git a/arch/mips/loongson2ef/lemote-2f/dma.c b/arch/mips/loongson2ef/lemote-2f/dma.c
index abf0e39d7e4696..302b43a14eee74 100644
--- a/arch/mips/loongson2ef/lemote-2f/dma.c
+++ b/arch/mips/loongson2ef/lemote-2f/dma.c
@@ -6,7 +6,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return paddr | 0x80000000;
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	if (dma_addr > 0x8fffffff)
 		return dma_addr;
diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
index dbfe6e82fddd1c..b3dc5d0bd2b113 100644
--- a/arch/mips/loongson64/dma.c
+++ b/arch/mips/loongson64/dma.c
@@ -13,7 +13,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return ((nid << 44) ^ paddr) | (nid << node_id_offset);
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
 {
 	/* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
 	 * Loongson-3's 48bit address space and embed it into 40bit */
diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
index 490953f515282a..d88395684f487d 100644
--- a/arch/mips/pci/pci-ar2315.c
+++ b/arch/mips/pci/pci-ar2315.c
@@ -175,7 +175,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return paddr + ar2315_dev_offset(dev);
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	return dma_addr - ar2315_dev_offset(dev);
 }
diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index 9b3cc775c55e05..f1b37f32b55395 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -33,7 +33,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return bc->baddr + paddr;
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	return dma_addr & ~(0xffUL << 56);
 }
diff --git a/arch/mips/sgi-ip32/ip32-dma.c b/arch/mips/sgi-ip32/ip32-dma.c
index fa7b17cb53853e..160317294d97a9 100644
--- a/arch/mips/sgi-ip32/ip32-dma.c
+++ b/arch/mips/sgi-ip32/ip32-dma.c
@@ -27,7 +27,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return dma_addr;
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	phys_addr_t paddr = dma_addr & RAM_OFFSET_MASK;
 
diff --git a/arch/powerpc/include/asm/dma-direct.h b/arch/powerpc/include/asm/dma-direct.h
index abc154d784b078..95b09313d2a4cf 100644
--- a/arch/powerpc/include/asm/dma-direct.h
+++ b/arch/powerpc/include/asm/dma-direct.h
@@ -7,7 +7,7 @@ static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return paddr + dev->archdata.dma_offset;
 }
 
-static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
+static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
 {
 	return daddr - dev->archdata.dma_offset;
 }
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 20eceb2e4f91f8..f00e262ab6b154 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -24,11 +24,12 @@ static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return dev_addr - ((dma_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
 }
 
-static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
+static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 {
-	phys_addr_t paddr = (phys_addr_t)dev_addr;
+	phys_addr_t paddr = (phys_addr_t)dev_addr +
+		((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
 
-	return paddr + ((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
+	return __sme_clr(paddr);
 }
 #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 
@@ -44,7 +45,7 @@ static inline bool force_dma_unencrypted(struct device *dev)
 /*
  * If memory encryption is supported, phys_to_dma will set the memory encryption
  * bit in the DMA address, and dma_to_phys will clear it.  The raw __phys_to_dma
- * and __dma_to_phys versions should only be used on non-encrypted memory for
+ * version should only be used on non-encrypted memory for
  * special occasions like DMA coherent buffers.
  */
 static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
@@ -52,11 +53,6 @@ static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return __sme_set(__phys_to_dma(dev, paddr));
 }
 
-static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
-{
-	return __sme_clr(__dma_to_phys(dev, daddr));
-}
-
 static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
 		bool is_ram)
 {
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 57a6e7d7cf8f16..bfb479c8a370fa 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -48,11 +48,6 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
 {
 	u64 dma_limit = min_not_zero(dma_mask, dev->bus_dma_limit);
 
-	if (force_dma_unencrypted(dev))
-		*phys_limit = __dma_to_phys(dev, dma_limit);
-	else
-		*phys_limit = dma_to_phys(dev, dma_limit);
-
 	/*
 	 * Optimistically try the zone that the physical address mask falls
 	 * into first.  If that returns memory that isn't actually addressable
@@ -61,6 +56,7 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
 	 * Note that GFP_DMA32 and GFP_DMA are no ops without the corresponding
 	 * zones.
 	 */
+	*phys_limit = dma_to_phys(dev, dma_limit);
 	if (*phys_limit <= DMA_BIT_MASK(zone_dma_bits))
 		return GFP_DMA;
 	if (*phys_limit <= DMA_BIT_MASK(32))
-- 
2.28.0

