Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48CEB7AABEF
	for <lists+linux-ia64@lfdr.de>; Fri, 22 Sep 2023 10:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbjIVIG4 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 22 Sep 2023 04:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbjIVIGt (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 22 Sep 2023 04:06:49 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 957BE10C7;
        Fri, 22 Sep 2023 01:06:42 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id B20121F461;
        Fri, 22 Sep 2023 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695370000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KHF/W/f0dOZYIYwlPsxSzo9QHH8IkLe18p7CX6Kd8Ro=;
        b=Z1K+KQQqZwpNsdpTMawdeTax0BKqk5Xx87LaEK3Y70mcCtO9GhNT9n3ClqIdMOKGgxfxbE
        OX4TLP411fPLmwTqtD8ai9mD3Suabdggwgc82pIaNdbMX8jvzbJ9fL2BJxplYXcO65A1Fl
        IkpmCEXPxopBArIiixC/Cplgw52j3jU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695370000;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KHF/W/f0dOZYIYwlPsxSzo9QHH8IkLe18p7CX6Kd8Ro=;
        b=VHTdxsCvDmNrjLOI19AnRicmZPyUX+sTugt22wv8EaZrJ9XECRRxpL2j6YQMfZ2wVcj9lZ
        HP/xonpcuWUOgSAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7428A13597;
        Fri, 22 Sep 2023 08:06:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id sDtsGxBLDWXuMQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 22 Sep 2023 08:06:40 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        arnd@arndb.de, deller@gmx.de, javierm@redhat.com
Cc:     linuxppc-dev@lists.ozlabs.org, linux-fbdev@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 4/5] arch/powerpc: Remove file parameter from phys_mem_access_prot code
Date:   Fri, 22 Sep 2023 10:04:58 +0200
Message-ID: <20230922080636.26762-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230922080636.26762-1-tzimmermann@suse.de>
References: <20230922080636.26762-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Remove 'file' parameter from struct machdep_calls.phys_mem_access_prot
and its implementation in pci_phys_mem_access_prot(). The file is not
used on PowerPC. By removing it, a later patch can simplify fbdev's
mmap code, which uses phys_mem_access_prot() on PowerPC.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/asm/book3s/pgtable.h | 10 ++++++++--
 arch/powerpc/include/asm/machdep.h        |  3 +--
 arch/powerpc/include/asm/nohash/pgtable.h | 10 ++++++++--
 arch/powerpc/include/asm/pci.h            |  4 +---
 arch/powerpc/kernel/pci-common.c          |  3 +--
 arch/powerpc/mm/mem.c                     |  8 ++++----
 6 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/include/asm/book3s/pgtable.h
index d18b748ea3ae0..84e36a5726417 100644
--- a/arch/powerpc/include/asm/book3s/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/pgtable.h
@@ -20,9 +20,15 @@ extern void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 				 pte_t *ptep, pte_t entry, int dirty);
 
+extern pgprot_t __phys_mem_access_prot(unsigned long pfn, unsigned long size,
+				       pgprot_t vma_prot);
+
 struct file;
-extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-				     unsigned long size, pgprot_t vma_prot);
+static inline pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
+					    unsigned long size, pgprot_t vma_prot)
+{
+	return __phys_mem_access_prot(pfn, size, vma_prot);
+}
 #define __HAVE_PHYS_MEM_ACCESS_PROT
 
 void __update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 933465ed4c432..d31a5ec1550d4 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -106,8 +106,7 @@ struct machdep_calls {
 	int		(*pci_get_legacy_ide_irq)(struct pci_dev *dev, int channel);
 
 	/* Get access protection for /dev/mem */
-	pgprot_t	(*phys_mem_access_prot)(struct file *file,
-						unsigned long pfn,
+	pgprot_t	(*phys_mem_access_prot)(unsigned long pfn,
 						unsigned long size,
 						pgprot_t vma_prot);
 
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index a6caaaab6f922..90366b0b3ad9a 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -246,9 +246,15 @@ extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long addre
 
 #define pgprot_writecombine pgprot_noncached_wc
 
+extern pgprot_t __phys_mem_access_prot(unsigned long pfn, unsigned long size,
+				       pgprot_t vma_prot);
+
 struct file;
-extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-				     unsigned long size, pgprot_t vma_prot);
+static inline pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
+					    unsigned long size, pgprot_t vma_prot)
+{
+	return __phys_mem_access_prot(pfn, size, vma_prot);
+}
 #define __HAVE_PHYS_MEM_ACCESS_PROT
 
 #ifdef CONFIG_HUGETLB_PAGE
diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
index 289f1ec85bc54..34ed4d51c546b 100644
--- a/arch/powerpc/include/asm/pci.h
+++ b/arch/powerpc/include/asm/pci.h
@@ -104,9 +104,7 @@ extern void of_scan_pci_bridge(struct pci_dev *dev);
 extern void of_scan_bus(struct device_node *node, struct pci_bus *bus);
 extern void of_rescan_bus(struct device_node *node, struct pci_bus *bus);
 
-struct file;
-extern pgprot_t	pci_phys_mem_access_prot(struct file *file,
-					 unsigned long pfn,
+extern pgprot_t	pci_phys_mem_access_prot(unsigned long pfn,
 					 unsigned long size,
 					 pgprot_t prot);
 
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index e88d7c9feeec3..73f12a17e572e 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -521,8 +521,7 @@ int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct *vma)
  * PCI device, it tries to find the PCI device first and calls the
  * above routine
  */
-pgprot_t pci_phys_mem_access_prot(struct file *file,
-				  unsigned long pfn,
+pgprot_t pci_phys_mem_access_prot(unsigned long pfn,
 				  unsigned long size,
 				  pgprot_t prot)
 {
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 8b121df7b08f8..03aadf657d15a 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -34,18 +34,18 @@ unsigned long long memory_limit;
 unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
 
-pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-			      unsigned long size, pgprot_t vma_prot)
+pgprot_t __phys_mem_access_prot(unsigned long pfn, unsigned long size,
+				pgprot_t vma_prot)
 {
 	if (ppc_md.phys_mem_access_prot)
-		return ppc_md.phys_mem_access_prot(file, pfn, size, vma_prot);
+		return ppc_md.phys_mem_access_prot(pfn, size, vma_prot);
 
 	if (!page_is_ram(pfn))
 		vma_prot = pgprot_noncached(vma_prot);
 
 	return vma_prot;
 }
-EXPORT_SYMBOL(phys_mem_access_prot);
+EXPORT_SYMBOL(__phys_mem_access_prot);
 
 #ifdef CONFIG_MEMORY_HOTPLUG
 static DEFINE_MUTEX(linear_mapping_mutex);
-- 
2.42.0

