Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8551859AA15
	for <lists+linux-ia64@lfdr.de>; Sat, 20 Aug 2022 02:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244409AbiHTAcK (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 19 Aug 2022 20:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245060AbiHTAcG (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 19 Aug 2022 20:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60242DFB41
        for <linux-ia64@vger.kernel.org>; Fri, 19 Aug 2022 17:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660955524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Dh+PWmIZNKVOdS1VsEMPeNAUNQbcLyXNRAVVz00b5KY=;
        b=fyeItrhnrmFuSz7QjtlQUP6fDmTtqQzeqtXQ4KzwkUIb+sNmpx3HkjA7QM0LTR9VpnksZq
        Mlf24XqWB5ShSTwpCk1ZMQgJ9GqeCMaiy/FsZQxrjIj8D+neAzW2GGEpgfU74TnFOUMhj+
        builcKfMKXcyZ0OhJUKM9jg4Aj8V+Tc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-s332wpH9M8q5qGNK9vpMAA-1; Fri, 19 Aug 2022 20:32:03 -0400
X-MC-Unique: s332wpH9M8q5qGNK9vpMAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0047F101A54E;
        Sat, 20 Aug 2022 00:32:03 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (ovpn-12-17.pek2.redhat.com [10.72.12.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A0F8F4010E3C;
        Sat, 20 Aug 2022 00:31:58 +0000 (UTC)
From:   Baoquan He <bhe@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org, hch@infradead.org,
        agordeev@linux.ibm.com, wangkefeng.wang@huawei.com,
        linux-arm-kernel@lists.infradead.org, Baoquan He <bhe@redhat.com>,
        linux-ia64@vger.kernel.org
Subject: [PATCH v2 06/11] ia64: mm: Convert to GENERIC_IOREMAP
Date:   Sat, 20 Aug 2022 08:31:20 +0800
Message-Id: <20220820003125.353570-7-bhe@redhat.com>
In-Reply-To: <20220820003125.353570-1-bhe@redhat.com>
References: <20220820003125.353570-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Add hooks arch_ioremap() and arch_iounmap() for ia64's special
operation when ioremap() and iounmap(), then ioremap_cache() is
converted to use ioremap_prot() from GENERIC_IOREMAP.

The old ioremap_uc() is kept and add its macro definittion.

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: linux-ia64@vger.kernel.org
---
 arch/ia64/Kconfig          |  1 +
 arch/ia64/include/asm/io.h | 26 ++++++++++++--------
 arch/ia64/mm/ioremap.c     | 50 +++++++++-----------------------------
 3 files changed, 28 insertions(+), 49 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 26ac8ea15a9e..1ca18be5dc30 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -45,6 +45,7 @@ config IA64
 	select GENERIC_IRQ_LEGACY
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select GENERIC_IOMAP
+	select GENERIC_IOREMAP
 	select GENERIC_SMP_IDLE_THREAD
 	select ARCH_TASK_STRUCT_ON_STACK
 	select ARCH_TASK_STRUCT_ALLOCATOR
diff --git a/arch/ia64/include/asm/io.h b/arch/ia64/include/asm/io.h
index ce66dfc0e719..d90a4c551de2 100644
--- a/arch/ia64/include/asm/io.h
+++ b/arch/ia64/include/asm/io.h
@@ -247,17 +247,23 @@ static inline void outsl(unsigned long port, const void *src,
 
 # ifdef __KERNEL__
 
-extern void __iomem * ioremap(unsigned long offset, unsigned long size);
-extern void __iomem * ioremap_uc(unsigned long offset, unsigned long size);
-extern void iounmap (volatile void __iomem *addr);
-static inline void __iomem * ioremap_cache (unsigned long phys_addr, unsigned long size)
-{
-	return ioremap(phys_addr, size);
-}
-#define ioremap ioremap
-#define ioremap_cache ioremap_cache
+/*
+ * I/O memory mapping functions.
+ */
+void __iomem *
+arch_ioremap(phys_addr_t *paddr, size_t size, unsigned long *prot_val);
+#define arch_ioremap arch_ioremap
+
+int arch_iounmap(void __iomem *addr);
+#define arch_iounmap arch_iounmap
+
+#define _PAGE_IOREMAP pgprot_val(PAGE_KERNEL)
+
+#define ioremap_cache(addr, size)  \
+	ioremap_prot((addr), (size), pgprot_val(PAGE_KERNEL))
+
+void __iomem *ioremap_uc(unsigned long offset, unsigned long size);
 #define ioremap_uc ioremap_uc
-#define iounmap iounmap
 
 /*
  * String version of IO memory access ops:
diff --git a/arch/ia64/mm/ioremap.c b/arch/ia64/mm/ioremap.c
index 55fd3eb753ff..8a085fc660e3 100644
--- a/arch/ia64/mm/ioremap.c
+++ b/arch/ia64/mm/ioremap.c
@@ -30,15 +30,12 @@ early_ioremap (unsigned long phys_addr, unsigned long size)
 }
 
 void __iomem *
-ioremap (unsigned long phys_addr, unsigned long size)
+arch_ioremap(phys_addr_t *paddr, size_t size, unsigned long *prot_val)
 {
-	void __iomem *addr;
-	struct vm_struct *area;
-	unsigned long offset;
-	pgprot_t prot;
-	u64 attr;
+	phys_addr_t phys_addr = *paddr;
 	unsigned long gran_base, gran_size;
 	unsigned long page_base;
+	u64 attr;
 
 	/*
 	 * For things in kern_memmap, we must use the same attribute
@@ -69,35 +66,18 @@ ioremap (unsigned long phys_addr, unsigned long size)
 	page_base = phys_addr & PAGE_MASK;
 	size = PAGE_ALIGN(phys_addr + size) - page_base;
 	if (efi_mem_attribute(page_base, size) & EFI_MEMORY_WB) {
-		prot = PAGE_KERNEL;
-
-		/*
-		 * Mappings have to be page-aligned
-		 */
-		offset = phys_addr & ~PAGE_MASK;
-		phys_addr &= PAGE_MASK;
-
-		/*
-		 * Ok, go for it..
-		 */
-		area = get_vm_area(size, VM_IOREMAP);
-		if (!area)
-			return NULL;
-
-		area->phys_addr = phys_addr;
-		addr = (void __iomem *) area->addr;
-		if (ioremap_page_range((unsigned long) addr,
-				(unsigned long) addr + size, phys_addr, prot)) {
-			vunmap((void __force *) addr);
-			return NULL;
-		}
-
-		return (void __iomem *) (offset + (char __iomem *)addr);
+		return NULL;
 	}
 
 	return __ioremap_uc(phys_addr);
 }
-EXPORT_SYMBOL(ioremap);
+
+int arch_iounmap(void __iomem *addr)
+{
+	if (REGION_NUMBER(addr) != RGN_GATE)
+		return -EINVAL;
+	return 0;
+}
 
 void __iomem *
 ioremap_uc(unsigned long phys_addr, unsigned long size)
@@ -113,11 +93,3 @@ void
 early_iounmap (volatile void __iomem *addr, unsigned long size)
 {
 }
-
-void
-iounmap (volatile void __iomem *addr)
-{
-	if (REGION_NUMBER(addr) == RGN_GATE)
-		vunmap((void *) ((unsigned long) addr & PAGE_MASK));
-}
-EXPORT_SYMBOL(iounmap);
-- 
2.34.1

