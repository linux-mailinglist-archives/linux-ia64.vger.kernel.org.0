Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD21D34F9
	for <lists+linux-ia64@lfdr.de>; Fri, 11 Oct 2019 02:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbfJKAGw (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 10 Oct 2019 20:06:52 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41962 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbfJKAGg (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 10 Oct 2019 20:06:36 -0400
Received: by mail-pg1-f196.google.com with SMTP id t3so4686111pga.8
        for <linux-ia64@vger.kernel.org>; Thu, 10 Oct 2019 17:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MEsYo+M8tYJs19WnuB4vdd58NV32mqrr8UAWRisKZTU=;
        b=Cke1k+WoV3d4y7UYLwGR6Cccr6ntETV7w4A+pAdyCIZxanwHXq4EPnvgyBzqAj40+x
         LiPrWoEPAyegIEPYdAPySyJ4W/aeyE2yAl3to28d7+EqgEkXRjB2PlBmPUXFz9yU7bX0
         btdMvXUw872LvztOLh6mK1NAcmtdiy6tXBqrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MEsYo+M8tYJs19WnuB4vdd58NV32mqrr8UAWRisKZTU=;
        b=E7wbQ/kw8H+HWu6IUEYSw0QYdfcus74qJXOCmnf6bUAJNwxmHqgku+yEBsMDOQ2j4r
         FONYR/MP5h0rRKaDzyrV92C+EP2nESor3fqW/B6WvJRu0GHxnnA8uoWVib9Rxq0C5YN+
         1bNA2X+JH4ykC8R+lyZQs4aKVFK9hg+dT61QfWCLpAsIBpQq1QmWx0Lss0AiMkcUlhrY
         E0mZGAdd9OKam+DIIFeJ+9OfF3NxaFs93BMurGNhyBbe7Th7YTaKtUq7/RVAmD2Iuxax
         U6KZmuOagtBvn094+G4C/yMoouNcCOFrao7yT4fx+QpYZ61UEfwFAEXshO4eqzHQ4+9K
         Ha4g==
X-Gm-Message-State: APjAAAWzmCfugQyTSZGno4EmJfQZ1+0gOuWDsStScP7HeEy8/5r3dPga
        5VSPT1+vsGq7jv1Aw6OaJXNOSw==
X-Google-Smtp-Source: APXvYqzt84R7YNxqDtZOc2Oqf/NMK/JV4QC0qvTQklX1v+jaEWwrU8bF8lAwLpkYEhqywmtQWhwmNQ==
X-Received: by 2002:aa7:8691:: with SMTP id d17mr13279534pfo.218.1570752395513;
        Thu, 10 Oct 2019 17:06:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y28sm7193083pfq.48.2019.10.10.17.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 17:06:32 -0700 (PDT)
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
Subject: [PATCH v2 15/29] x86: Actually use _etext for end of text segment
Date:   Thu, 10 Oct 2019 17:05:55 -0700
Message-Id: <20191011000609.29728-16-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Various calculations are using the end of the exception table (which
does not need to be executable) as the end of the text segment. Instead,
in preparation for moving the exception table into RO_DATA, move _etext
after the exception table and update the calculations.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/include/asm/sections.h | 1 -
 arch/x86/kernel/vmlinux.lds.S   | 7 +++----
 arch/x86/mm/init_64.c           | 6 +++---
 arch/x86/mm/pti.c               | 2 +-
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/sections.h b/arch/x86/include/asm/sections.h
index 71b32f2570ab..036c360910c5 100644
--- a/arch/x86/include/asm/sections.h
+++ b/arch/x86/include/asm/sections.h
@@ -6,7 +6,6 @@
 #include <asm/extable.h>
 
 extern char __brk_base[], __brk_limit[];
-extern struct exception_table_entry __stop___ex_table[];
 extern char __end_rodata_aligned[];
 
 #if defined(CONFIG_X86_64)
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 41362e90142d..a1a758e25b2b 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -143,15 +143,14 @@ SECTIONS
 		*(.text.__x86.indirect_thunk)
 		__indirect_thunk_end = .;
 #endif
-
-		/* End of text section */
-		_etext = .;
 	} :text = 0x9090
 
 	EXCEPTION_TABLE(16)
 
-	/* .text should occupy whole number of pages */
+	/* End of text section, which should occupy whole number of pages */
+	_etext = .;
 	. = ALIGN(PAGE_SIZE);
+
 	X86_ALIGN_RODATA_BEGIN
 	RO_DATA(PAGE_SIZE)
 	X86_ALIGN_RODATA_END
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index a6b5c653727b..26299e9ce6da 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1263,7 +1263,7 @@ int kernel_set_to_readonly;
 void set_kernel_text_rw(void)
 {
 	unsigned long start = PFN_ALIGN(_text);
-	unsigned long end = PFN_ALIGN(__stop___ex_table);
+	unsigned long end = PFN_ALIGN(_etext);
 
 	if (!kernel_set_to_readonly)
 		return;
@@ -1282,7 +1282,7 @@ void set_kernel_text_rw(void)
 void set_kernel_text_ro(void)
 {
 	unsigned long start = PFN_ALIGN(_text);
-	unsigned long end = PFN_ALIGN(__stop___ex_table);
+	unsigned long end = PFN_ALIGN(_etext);
 
 	if (!kernel_set_to_readonly)
 		return;
@@ -1301,7 +1301,7 @@ void mark_rodata_ro(void)
 	unsigned long start = PFN_ALIGN(_text);
 	unsigned long rodata_start = PFN_ALIGN(__start_rodata);
 	unsigned long end = (unsigned long) &__end_rodata_hpage_align;
-	unsigned long text_end = PFN_ALIGN(&__stop___ex_table);
+	unsigned long text_end = PFN_ALIGN(&_etext);
 	unsigned long rodata_end = PFN_ALIGN(&__end_rodata);
 	unsigned long all_end;
 
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index 7f2140414440..44a9f068eee0 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -574,7 +574,7 @@ static void pti_clone_kernel_text(void)
 	 */
 	unsigned long start = PFN_ALIGN(_text);
 	unsigned long end_clone  = (unsigned long)__end_rodata_aligned;
-	unsigned long end_global = PFN_ALIGN((unsigned long)__stop___ex_table);
+	unsigned long end_global = PFN_ALIGN((unsigned long)_etext);
 
 	if (!pti_kernel_image_global_ok())
 		return;
-- 
2.17.1

