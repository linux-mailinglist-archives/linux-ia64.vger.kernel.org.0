Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B906E91C1
	for <lists+linux-ia64@lfdr.de>; Tue, 29 Oct 2019 22:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbfJ2VUf (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 29 Oct 2019 17:20:35 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37829 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729288AbfJ2VUe (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 29 Oct 2019 17:20:34 -0400
Received: by mail-pf1-f193.google.com with SMTP id u9so3456pfn.4
        for <linux-ia64@vger.kernel.org>; Tue, 29 Oct 2019 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zkQRciK9mkrlSR6uxFsvjRswhc34+65nZ5EFVAGwQNE=;
        b=OT6Bg1lwC9BgCPm4rshensSgeFlVA9rsXs7DneW7qlK4COjqiDZfzJlwEnUsw0ndzg
         7OlU1CFW21fcf6eEhN9CjdJHaNcMdDpPKpuJT/ADgQMFfGMLcXWO74t21PFZRJHFpnqp
         xUOjVNPPFhABmfh6UvzbnvtwsYLRpChZ5bAS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zkQRciK9mkrlSR6uxFsvjRswhc34+65nZ5EFVAGwQNE=;
        b=ZzNF8wUk+HyqdA9ZB7LGtLGSLJv5BLitp6EoLSGJdh8Os2J4nnBheylj+O8Oj5lRpy
         2po0USwspxGa1834MdeS7i+m95dh3tq+lj1qD5fkLpjXEiNyeHXkoEnD1PxMj9qAI6mL
         5YELKBOX/09zWwX9f9WnfYsd1WrFolPehPvG67ljNakygJpBefVfLYLIOJ8RSDM0Wygz
         JuQkm2ef2vi9uK1UnBkR9bf3br/a+7E0i6KGT0Ow3FKFEQXHjcsyF8UmUahrTJ2ZIQaw
         sl0dsshHG1FuGsuQTkYxu2WExMPgr4c3QBdRCwd14v7v4dFwO+IC7IYc1JIjCdA3P3YB
         ewCQ==
X-Gm-Message-State: APjAAAWPREzwGbyvvOtuIAgEDNIizGFLkeJRKeErGfnnQWOnWfrVrotg
        B4SMBkJXgvQh0fqVsSXcSrXwzw==
X-Google-Smtp-Source: APXvYqzgHSbr71WtU2uD7eID82s/2JfBvoDXdBNTCeGS1sZq6cmXG05yPiu3ymW6JJe84UPYZH6mkg==
X-Received: by 2002:a63:495b:: with SMTP id y27mr29706814pgk.438.1572384034053;
        Tue, 29 Oct 2019 14:20:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k9sm48893pfk.72.2019.10.29.14.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:20:32 -0700 (PDT)
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
Subject: [PATCH v3 20/29] h8300: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Tue, 29 Oct 2019 14:13:42 -0700
Message-Id: <20191029211351.13243-21-keescook@chromium.org>
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
 arch/h8300/kernel/vmlinux.lds.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/h8300/kernel/vmlinux.lds.S b/arch/h8300/kernel/vmlinux.lds.S
index 2ac7bdcd2fe0..6b1afc2f9b68 100644
--- a/arch/h8300/kernel/vmlinux.lds.S
+++ b/arch/h8300/kernel/vmlinux.lds.S
@@ -1,4 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
+#define RO_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
@@ -37,7 +40,6 @@ SECTIONS
 #endif
 	_etext = . ;
 	}
-	EXCEPTION_TABLE(16)
 	RO_DATA(4)
 	ROMEND = .;
 #if defined(CONFIG_ROMKERNEL)
-- 
2.17.1

