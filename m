Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD35418A4A
	for <lists+linux-ia64@lfdr.de>; Sun, 26 Sep 2021 19:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhIZROC (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 26 Sep 2021 13:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbhIZROB (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 26 Sep 2021 13:14:01 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9793AC061570
        for <linux-ia64@vger.kernel.org>; Sun, 26 Sep 2021 10:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=B7D3SI2kgtl9ZgToymEtR3AYQ3B0he8oO6nsKz7KnOQ=; b=Ddbon2ulCPvNeiuzMxDRY5FTCa
        lagmeMETA2C6Wo0a9qX4NHhiz+c7VIOV1cllTgN6wNHfQACzlzuYVXJDKyk4V0lr2Y5f2EXTlbJGx
        Xo2B55HigdOej75SQrYecRp2jdDwCv1EKOnAXDY5vU+WeKNNfSYmVsE/i0j+HSJJp1TM1UsvBLdKH
        LsJLihyDP3S/XwtHJ7nhWGw4NOyFHXlas2XreTrHpkbJv3o+lXGO7AcJIM/L2Ozft6a3i8zpK/tOL
        fHlDxeF1xX7rm8FRF2E6YjcA6tdSpoAj/JA7UFH6sZv7jdNdss+cEtxtZbaVPsdsceJpGqfVVgnay
        UXi1xtpw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mUXhR-000qsd-3o; Sun, 26 Sep 2021 17:12:25 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-ia64@vger.kernel.org,
        Petr Mladek <pmladek@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tony Luck <tony.luck@intel.com>,
        Chris Down <chris@chrisdown.name>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v2] ia64: don't do IA64_CMPXCHG_DEBUG without CONFIG_PRINTK
Date:   Sun, 26 Sep 2021 10:12:24 -0700
Message-Id: <20210926171224.27019-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

When CONFIG_PRINTK is not set, the CMPXCHG_BUGCHECK() macro calls
_printk(), but _printk() is a static inline function, not available
as an extern.
Since the purpose of the macro is to print the BUGCHECK info,
make this config option depend on PRINTK.

Fixes multiple occurrences of this build error:

../include/linux/printk.h:208:5: error: static declaration of '_printk' follows non-static declaration
  208 | int _printk(const char *s, ...)
      |     ^~~~~~~
In file included from ../arch/ia64/include/asm/cmpxchg.h:5,
../arch/ia64/include/uapi/asm/cmpxchg.h:146:28: note: previous declaration of '_printk' with type 'int(const char *, ...)'
  146 |                 extern int _printk(const char *fmt, ...);

Fixes: 85f8f7759e41 ("ia64: populate the cmpxchg header with appropriate code")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-ia64@vger.kernel.org
Cc: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Chris Down <chris@chrisdown.name>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
v2: correct the Fixes: commit info

 arch/ia64/Kconfig.debug |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210917.orig/arch/ia64/Kconfig.debug
+++ linux-next-20210917/arch/ia64/Kconfig.debug
@@ -39,7 +39,7 @@ config DISABLE_VHPT
 
 config IA64_DEBUG_CMPXCHG
 	bool "Turn on compare-and-exchange bug checking (slow!)"
-	depends on DEBUG_KERNEL
+	depends on DEBUG_KERNEL && PRINTK
 	help
 	  Selecting this option turns on bug checking for the IA-64
 	  compare-and-exchange instructions.  This is slow!  Itaniums
