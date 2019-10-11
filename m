Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D849BD3530
	for <lists+linux-ia64@lfdr.de>; Fri, 11 Oct 2019 02:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbfJKAGY (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 10 Oct 2019 20:06:24 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36217 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbfJKAGX (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 10 Oct 2019 20:06:23 -0400
Received: by mail-pf1-f194.google.com with SMTP id y22so4947022pfr.3
        for <linux-ia64@vger.kernel.org>; Thu, 10 Oct 2019 17:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ObCdg+imqB9G1d842Lgck/VSTqVGl2xoAH4cm4FkKow=;
        b=crQ1Wv7yU8u6QDGlDwBktMC8ID6kd2jR2ktjlIEg9lNMaYkSGp+vVyfOhN5n/bbb4w
         tpNmt7wW87sAgB/gHBbhR1BwKIxx8HWLuqxVFsB9sj+yjEeBVLxwYKqP8+nT6ULOb4qs
         C5n7z+PSjnqWQlNXFQHms0qNFflOzMMUW6V2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ObCdg+imqB9G1d842Lgck/VSTqVGl2xoAH4cm4FkKow=;
        b=N1yIr7Itoq95BYVbjWp11ctXjAPUD4sxXglUMw4zg8EZRJmGC5IZSyTZtNjKLX/6t7
         uva1+mu3n1bU/9d+CM80oIm3pEgaj9tL3wVg0gJDEXYUojJ+bDkNkrhgon2NIOlmd1Sa
         JdFh9txShjigyNvYOVCLG7LfrwsFXt9pP2KJ7FkWxDrr5Tdwkk1Cty3mHv+Qd2L966cA
         KpgdYzG/Vm76KqML9kermb9aeD5aFC3dU5Vk/rg5a2sV7eiBWVWKhvhbJX1N/nDtokYe
         pp13A2fzzZQAlkiyjE+ux0PbsIivcazjZzDJqzZ0/SXIgeClq+SfhrgXLgcMvo5h+i1B
         SdrQ==
X-Gm-Message-State: APjAAAVR9Z8iOiAy93jGa/jfp8lYgerJOJKtoewtllLxG0BYS6EBq58+
        IR91qxLrm3hgNsz3VXwPvAjr0A==
X-Google-Smtp-Source: APXvYqx+lfPTpnvfcuRRBeqTz2GN8uCmPc7RnUYQGVmNn2nMH+aP0xZQtQocoZFSsUHXgigJlUoJog==
X-Received: by 2002:a63:fb0a:: with SMTP id o10mr13787560pgh.258.1570752382982;
        Thu, 10 Oct 2019 17:06:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k23sm9231444pgi.49.2019.10.10.17.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 17:06:20 -0700 (PDT)
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
Subject: [PATCH v2 03/29] powerpc: Rename PT_LOAD identifier "kernel" to "text"
Date:   Thu, 10 Oct 2019 17:05:43 -0700
Message-Id: <20191011000609.29728-4-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

In preparation for moving NOTES into RO_DATA, rename the linker script
internal identifier for the PT_LOAD Program Header from "kernel" to
"text" to match other architectures.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kernel/vmlinux.lds.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index a3c8492b2b19..e184a63aa5b0 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -18,7 +18,7 @@
 ENTRY(_stext)
 
 PHDRS {
-	kernel PT_LOAD FLAGS(7); /* RWX */
+	text PT_LOAD FLAGS(7); /* RWX */
 	note PT_NOTE FLAGS(0);
 }
 
@@ -63,7 +63,7 @@ SECTIONS
 #else /* !CONFIG_PPC64 */
 		HEAD_TEXT
 #endif
-	} :kernel
+	} :text
 
 	__head_end = .;
 
@@ -112,7 +112,7 @@ SECTIONS
 		__got2_end = .;
 #endif /* CONFIG_PPC32 */
 
-	} :kernel
+	} :text
 
 	. = ALIGN(ETEXT_ALIGN_SIZE);
 	_etext = .;
@@ -163,9 +163,9 @@ SECTIONS
 #endif
 	EXCEPTION_TABLE(0)
 
-	NOTES :kernel :note
+	NOTES :text :note
 	/* Restore program header away from PT_NOTE. */
-	.dummy : { *(.dummy) } :kernel
+	.dummy : { *(.dummy) } :text
 
 /*
  * Init sections discarded at runtime
@@ -180,7 +180,7 @@ SECTIONS
 #ifdef CONFIG_PPC64
 		*(.tramp.ftrace.init);
 #endif
-	} :kernel
+	} :text
 
 	/* .exit.text is discarded at runtime, not link time,
 	 * to deal with references from __bug_table
-- 
2.17.1

