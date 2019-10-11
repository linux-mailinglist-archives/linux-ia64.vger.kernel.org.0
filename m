Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3D5D34D5
	for <lists+linux-ia64@lfdr.de>; Fri, 11 Oct 2019 02:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfJKAG0 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 10 Oct 2019 20:06:26 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36434 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbfJKAG0 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 10 Oct 2019 20:06:26 -0400
Received: by mail-pg1-f196.google.com with SMTP id 23so4704423pgk.3
        for <linux-ia64@vger.kernel.org>; Thu, 10 Oct 2019 17:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9QIZQEEx86BzYrPbnl0U6tW2XkUfCUBHfootbZQ3f/s=;
        b=h/B19WCkyL+xymsA4HFl8hqcGsybKIgVl1/uhhhVSgPKYo6NP7vZ5rRibvBcc9cHi0
         dKUj61YWLvd6Paq9o21PGCwAwApZ0KSVPAqMWPWlFGYXaNSsjI/dS7B2W11htDcOzgnE
         DitiicKTEnEB0ngjDQf+AmKVkG49ZOcGoE0gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9QIZQEEx86BzYrPbnl0U6tW2XkUfCUBHfootbZQ3f/s=;
        b=PR3dwpPMZn0OXhz2JrkVBA4Bs37DKOwabH8ZVPTm9vEPPgGeXPu9VSW3wWEW9jlido
         pITkv/Y4PBP3XMRdvG1xFa8EfFSSsLQ7yFQafNajhLZzyg5DZfLcrDXyWOS0qt4zAQP3
         FhsUk43umPQnPmlwwbUm0g+zonZ3XeSXeJW7jszP5J54Eu8ULKMQ9QeXbQEqN+quKlmc
         JJpbHrYm6PMGwDR8rVGaN5ht/9z+Cr4wLsngxTYjQ9WXOtXvQCAh7J4XiWGsROwnLekb
         u/2CLnx6nd0M6NKp9wzRNk+Wg7KQRN2CMmgapb+BKw7FAc2TT3b+cEHqRk0PI5eUgd8i
         pK5Q==
X-Gm-Message-State: APjAAAUXNYgKPt156S1bQOYeUOlVWmQCGm/UKOSnO3jRnpd/ZXjCDLHp
        17pTpRRPiK8P7tGBgVCAhzMgbg==
X-Google-Smtp-Source: APXvYqx4W7fel1DIaEF8YA2JM9DuPiq7TPvvITPEvxb/fDK3Ll5VL5/FYyAVhRaQT1eulT76dS3lTQ==
X-Received: by 2002:a62:3387:: with SMTP id z129mr13444661pfz.185.1570752385625;
        Thu, 10 Oct 2019 17:06:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 127sm8449250pfw.6.2019.10.10.17.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 17:06:24 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, x86@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/29] ia64: Rename PT_LOAD identifier "code" to "text"
Date:   Thu, 10 Oct 2019 17:05:45 -0700
Message-Id: <20191011000609.29728-6-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

In preparation for moving NOTES into RO_DATA, rename the linker script
internal identifier for the PT_LOAD Program Header from "code" to "text"
to match other architectures.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/ia64/kernel/vmlinux.lds.S | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index d9d4e21107cd..2c4f23c390ad 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -13,7 +13,7 @@ ENTRY(phys_start)
 jiffies = jiffies_64;
 
 PHDRS {
-	code   PT_LOAD;
+	text   PT_LOAD;
 	percpu PT_LOAD;
 	data   PT_LOAD;
 	note   PT_NOTE;
@@ -36,7 +36,7 @@ SECTIONS {
 	phys_start = _start - LOAD_OFFSET;
 
 	code : {
-	} :code
+	} :text
 	. = KERNEL_START;
 
 	_text = .;
@@ -68,9 +68,9 @@ SECTIONS {
 	/*
 	 * Read-only data
 	 */
-	NOTES :code :note       /* put .notes in text and mark in PT_NOTE  */
+	NOTES :text :note       /* put .notes in text and mark in PT_NOTE  */
 	code_continues : {
-	} : code               /* switch back to regular program...  */
+	} :text                /* switch back to regular program...  */
 
 	EXCEPTION_TABLE(16)
 
@@ -102,9 +102,9 @@ SECTIONS {
 		__start_unwind = .;
 		*(.IA_64.unwind*)
 		__end_unwind = .;
-	} :code :unwind
+	} :text :unwind
 	code_continues2 : {
-	} : code
+	} :text
 
 	RODATA
 
@@ -214,7 +214,7 @@ SECTIONS {
 	_end = .;
 
 	code : {
-	} :code
+	} :text
 
 	STABS_DEBUG
 	DWARF_DEBUG
-- 
2.17.1

