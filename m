Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2EDD3538
	for <lists+linux-ia64@lfdr.de>; Fri, 11 Oct 2019 02:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbfJKAHb (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 10 Oct 2019 20:07:31 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41943 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727504AbfJKAGY (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 10 Oct 2019 20:06:24 -0400
Received: by mail-pg1-f193.google.com with SMTP id t3so4685840pga.8
        for <linux-ia64@vger.kernel.org>; Thu, 10 Oct 2019 17:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7MxClQbH59XRrbTRajW1Gh8uACzcU2+htsVcXyM7D1g=;
        b=TBJeuKMY2z8zTRQ1bFw/ImZS5YFoYQAHk+uSCJMry9jQKOeGheQ5i7gXGHU01GWcTB
         uOgoFqPErAXZia+mP12x9qnkRfY1Ys9PjUB5SmB5We4kWHLZQ5n99yhQi0dIKcFUZu6/
         hILLkVhE9upOn1PuRtaesOlh4SL00TV9kLm5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7MxClQbH59XRrbTRajW1Gh8uACzcU2+htsVcXyM7D1g=;
        b=m2q+T3ie+qq+5XCJE/jDfT1tNPVXQalQ0f+SrijkRiZd3A/m1+fBZVuAmEWaIDUyKl
         VhI3Xde0/K7a00PjikyYnEKM9Q1IPnpcEcRy2bueyJ3wxiyDN3R0Vr7LkV53C0/i/khL
         +/C//AZ+uoP3TH/Xm6ok+lVrIADkc8ybpwvZpFsDkFm5mDq0f739tKYZ+qOLIyRB2qSW
         oqap1CHD3KipOaSij6tolfDQAADToS7pd3bIB6Q6qPwusU6soFLE9XtsAoI3BWwkVQC0
         igiborRHhQ2i+0lJQpjSt51QwPkJ14/glHU05CAnKVf1oVlgr12/CB7srvlSjkyORFLs
         P6fQ==
X-Gm-Message-State: APjAAAXZksj1a1IZU21RezXgJEZhZ51zO5hw37FQpzpeAVA5/VP6Y0T7
        L99cIKhzmmHQn0vM2QuAGfVFOw==
X-Google-Smtp-Source: APXvYqwg7IWyK5GALjp45zOGgCtbjryTtA5MoWvVIZiHDTE9GJEt+Ue8rYJCs4VD37qrCGGbQgqtBg==
X-Received: by 2002:a62:5bc1:: with SMTP id p184mr12930072pfb.180.1570752383534;
        Thu, 10 Oct 2019 17:06:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d5sm5372814pjw.31.2019.10.10.17.06.19
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
Subject: [PATCH v2 04/29] alpha: Rename PT_LOAD identifier "kernel" to "text"
Date:   Thu, 10 Oct 2019 17:05:44 -0700
Message-Id: <20191011000609.29728-5-keescook@chromium.org>
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
 arch/alpha/kernel/vmlinux.lds.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index c4b5ceceab52..781090cacc96 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -8,7 +8,7 @@
 OUTPUT_FORMAT("elf64-alpha")
 OUTPUT_ARCH(alpha)
 ENTRY(__start)
-PHDRS { kernel PT_LOAD; note PT_NOTE; }
+PHDRS { text PT_LOAD; note PT_NOTE; }
 jiffies = jiffies_64;
 SECTIONS
 {
@@ -27,14 +27,14 @@ SECTIONS
 		LOCK_TEXT
 		*(.fixup)
 		*(.gnu.warning)
-	} :kernel
+	} :text
 	swapper_pg_dir = SWAPPER_PGD;
 	_etext = .;	/* End of text section */
 
-	NOTES :kernel :note
+	NOTES :text :note
 	.dummy : {
 		*(.dummy)
-	} :kernel
+	} :text
 
 	RODATA
 	EXCEPTION_TABLE(16)
-- 
2.17.1

