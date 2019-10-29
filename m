Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32B56E91D0
	for <lists+linux-ia64@lfdr.de>; Tue, 29 Oct 2019 22:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbfJ2VUk (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 29 Oct 2019 17:20:40 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45391 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729906AbfJ2VUk (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 29 Oct 2019 17:20:40 -0400
Received: by mail-pl1-f194.google.com with SMTP id y24so8294972plr.12
        for <linux-ia64@vger.kernel.org>; Tue, 29 Oct 2019 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OvLPSIr20MO1GrkJ0OvwvGngd4/e51+GSaoElj9X+Gc=;
        b=MubpaUS4tHoReayETOIOWs+UpyMNXi3+g7N+ywDFi9zOzhpG5+ZUItxnBn6YjbZqXh
         paBOw3W55VS7rZu51ahUmY0fFJgtBFJYJ3pn22Ptz7nrtHG22uqdhr4XUVK2RZm1oi58
         oDEHrfa53FOnH3TQxpTEFg+lMs4RonQkU3kjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OvLPSIr20MO1GrkJ0OvwvGngd4/e51+GSaoElj9X+Gc=;
        b=phDfoApRogg6/W6kohB1eyUvpk0vvKPnl8sdbiHOlCnhioL4XeL6GvVa4UUCmjnxnO
         OcSX9rACJYvg9PQQSODfGVKNLXgZqQx1UDoTLKqPq4g60KAkfD1DEPo9BfzXaWAkm8yE
         yHI6symY0efhltaYzW/IcODupMO1TQBCHN6CQXglb/gWywAe9hL0KV9Rtp4854gYIeLj
         2ueQmUeuAZ3p+/zyg2oj6oEybSl+G8MT0rCPMbt6dB3hswvXFXAW643CN5JzkHJTvZR6
         8bOMy6Hr8TPd/qh8g2e/GRkDzaocRd+7ukJlsB7GRXi1vi+5FGiksHcJ3yjisBK1Z3Zk
         GgjQ==
X-Gm-Message-State: APjAAAXJ+J9VZvcRPH3WINRmYSHQEAQRdD9xcTgFoZlQWLSLZr9CWm7o
        GK9Di2w7hecl0dghsFperfFfew==
X-Google-Smtp-Source: APXvYqzV95hY+aVbWcx6HzxeaR6KOCXs7TBX7sOZo1MRJwttiLadHkvLLgsv0irLF7laDVGp9UyK9Q==
X-Received: by 2002:a17:902:bd06:: with SMTP id p6mr759011pls.120.1572384039491;
        Tue, 29 Oct 2019 14:20:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o20sm58329pfp.16.2019.10.29.14.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:20:38 -0700 (PDT)
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
Subject: [PATCH v3 24/29] powerpc: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Tue, 29 Oct 2019 14:13:46 -0700
Message-Id: <20191029211351.13243-25-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 4e7cec088c8b..8834220036a5 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -7,6 +7,7 @@
 
 #define BSS_FIRST_SECTIONS *(.bss.prominit)
 #define EMITS_PT_NOTE
+#define RO_EXCEPTION_TABLE_ALIGN	0
 
 #include <asm/page.h>
 #include <asm-generic/vmlinux.lds.h>
@@ -162,7 +163,6 @@ SECTIONS
 		__stop__btb_flush_fixup = .;
 	}
 #endif
-	EXCEPTION_TABLE(0)
 
 /*
  * Init sections discarded at runtime
-- 
2.17.1

