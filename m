Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7189EE9150
	for <lists+linux-ia64@lfdr.de>; Tue, 29 Oct 2019 22:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbfJ2VOF (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 29 Oct 2019 17:14:05 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37178 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728592AbfJ2VOE (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 29 Oct 2019 17:14:04 -0400
Received: by mail-pl1-f196.google.com with SMTP id p13so8316287pll.4
        for <linux-ia64@vger.kernel.org>; Tue, 29 Oct 2019 14:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UBMCQcUOloL4FNQm5udB+snIcmDdRxu45Na8ZXgn6j0=;
        b=kdVHFkWUWfSKoiPKPgWKbAsFTrcW5JNBQhTGTF4q2deleiY3/8n0BF6eoXBERPq8mq
         MXvnqxBYuL7FPHWZ/R6H0s/W1xjZNZPEiLHYArhnUWssmjQ9IekX8pDgbayL/8UyYSTb
         kH2PTazTZLVUdMFc2ETjXJ8rIdmfptOgLDOBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UBMCQcUOloL4FNQm5udB+snIcmDdRxu45Na8ZXgn6j0=;
        b=k+ce3qTB/2qodfs15hgdLWyOP3Qq92/PpGIxEY7CvcVJAErO34To6brYwlxH+L928s
         Awr4o/yysVHb+U6MnzMSkVT1MrVYQtaoZCmr40BypoBmOkWoz5dlxV99tDa0vWjhpR4F
         3pM9De309AI797pI8TGIQz9fpvGrtArEJjxuRmYv5TEbHBn9Nbt6w7ghEpsU+9iyOS7L
         4c03w7KsXI6uMO6jQPoLBR5rfHRHlICg3YuyoPTp8v4oxiGHySa9UPUsx/RnQG+Qv/iz
         M2Z3LKMMfLFm9FgW0HaP9xfgIMFYTJVN2cuEmaPrnyqEu+JNdibgvQi5f8pNbvzMXemD
         7G6A==
X-Gm-Message-State: APjAAAXg40BUIIqxz9fqiWFfDft0z53YCBOQojtbv+9i9E4vcTQ0WP8o
        jshPQLAulJ/73i+HDhgc6PvBMhB8pfk=
X-Google-Smtp-Source: APXvYqxEU/jPSR344Zm3qUnGnizPxb8rt1UkEG6PtKOdviXqXNGWzTbgn7h13zjGLZsYob22VLKUOQ==
X-Received: by 2002:a17:902:bb8d:: with SMTP id m13mr785919pls.29.1572383641856;
        Tue, 29 Oct 2019 14:14:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z9sm135208pgs.46.2019.10.29.14.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:14:00 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Segher Boessenkool <segher@kernel.crashing.org>,
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
        Michal Simek <monstr@monstr.eu>
Subject: [PATCH v3 01/29] powerpc: Rename "notes" PT_NOTE to "note"
Date:   Tue, 29 Oct 2019 14:13:23 -0700
Message-Id: <20191029211351.13243-2-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

The Program Header identifiers are internal to the linker scripts. In
preparation for moving the NOTES segment declaration into RO_DATA,
standardize the identifier for the PT_NOTE entry to "note" as used by
all other architectures that emit PT_NOTE.

Note that there was discussion about changing all architectures to use
"notes" instead, but I prefer to avoid that at this time. Changing only
powerpc is the smallest change to standardize the entire kernel. And
while this standardization does use singular "note" for a section that
has more than one note in it, this is just an internal identifier. It
matches the ELF "PT_NOTE", and is 4 characters (like "text", and "data")
for pretty alignment. The more exposed macro, "NOTES", use the more
sensible plural wording.

Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vmlinux.lds.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 060a1acd7c6d..81e672654789 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -19,7 +19,7 @@ ENTRY(_stext)
 
 PHDRS {
 	kernel PT_LOAD FLAGS(7); /* RWX */
-	notes PT_NOTE FLAGS(0);
+	note PT_NOTE FLAGS(0);
 	dummy PT_NOTE FLAGS(0);
 
 	/* binutils < 2.18 has a bug that makes it misbehave when taking an
@@ -177,7 +177,7 @@ SECTIONS
 #endif
 	EXCEPTION_TABLE(0)
 
-	NOTES :kernel :notes
+	NOTES :kernel :note
 
 	/* The dummy segment contents for the bug workaround mentioned above
 	   near PHDRS.  */
-- 
2.17.1

