Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05CBFBF870
	for <lists+linux-ia64@lfdr.de>; Thu, 26 Sep 2019 19:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbfIZR4Y (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 26 Sep 2019 13:56:24 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38905 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbfIZR4X (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 26 Sep 2019 13:56:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id x10so1963929pgi.5
        for <linux-ia64@vger.kernel.org>; Thu, 26 Sep 2019 10:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ct25FYY49pcH025DailB6pbS1DlS4bIVNf04cXZx2wM=;
        b=NeoCDK86mT/W24oE5rtmJouGfsbTTEGkoSxTx4KF4CSxjsSlvFZN3J9odBOQnvlXiP
         iUyNYZOgnvxnrzhYkrDgkrU0+SzkX/L29uWuoGEThELn/fWhiKJEA65hwXsy3koRBZjm
         4+HnR9f+RjX0Rbvz5f8d8QfWgEFoMfVNcSBHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ct25FYY49pcH025DailB6pbS1DlS4bIVNf04cXZx2wM=;
        b=KUWP9RjSJF9KUT1ea6Mbxwy4hANi+ypcwm+NmxWZuymj7YyWyfJcWh+qWFh1DJ6sdl
         hkuvdIiiOacL7YpERK7EtWBlA3NCfElZSN5ND6BucrwDs4I+rVZjE4Qfqu/CNHjTW45P
         YeuL5tXmuC88wVKlEmMQ2wpvVon29A63K2kkW4GbQ7KIbRVzSjVnIvbqCGOheGk/Pp07
         UJpNPxhYXlyHh78GOWYHrSW4iFIRRsJWt9LxI46HdSJBefT1ro8COkY1vFpTwVWzDaXI
         cyFaQU7DGLkynQ4Smie3JcOVr/OFlB2AdN4nWcXrXA7pC30bVXJ2J6o3iOTX1VRnPayM
         WRuA==
X-Gm-Message-State: APjAAAUuKbLnZjcU6haNF/5mJNGL+v2ll/haP9JAbOlPvyzdIg0rYwqG
        GXZv7N6edVfdzYUs+f+Ur/Ctaw==
X-Google-Smtp-Source: APXvYqwCE1BZTT9Hh90UUQnKWrAcK2jHTYm7yifQDk8oKb7icUZpadcMBDqMvGH5nif/lmL5cmzvdg==
X-Received: by 2002:a63:186:: with SMTP id 128mr4612810pgb.157.1569520583020;
        Thu, 26 Sep 2019 10:56:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e10sm4090474pfh.77.2019.09.26.10.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 10:56:21 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, x86@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/29] s390: Move RO_DATA into "text" PT_LOAD Program Header
Date:   Thu, 26 Sep 2019 10:55:39 -0700
Message-Id: <20190926175602.33098-7-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

In preparation for moving NOTES into RO_DATA, this moves RO_DATA back
into the "text" PT_LOAD Program Header, as done with other
architectures. The "data" PT_LOAD now starts with the writable data
section.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/s390/kernel/vmlinux.lds.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index 7e0eb4020917..13294fef473e 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -52,7 +52,7 @@ SECTIONS
 
 	NOTES :text :note
 
-	.dummy : { *(.dummy) } :data
+	.dummy : { *(.dummy) } :text
 
 	RO_DATA_SECTION(PAGE_SIZE)
 
@@ -64,7 +64,7 @@ SECTIONS
 	.data..ro_after_init : {
 		 *(.data..ro_after_init)
 		JUMP_TABLE_DATA
-	}
+	} :data
 	EXCEPTION_TABLE(16)
 	. = ALIGN(PAGE_SIZE);
 	__end_ro_after_init = .;
-- 
2.17.1

