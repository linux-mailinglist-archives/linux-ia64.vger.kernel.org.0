Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC0A4D3567
	for <lists+linux-ia64@lfdr.de>; Fri, 11 Oct 2019 02:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbfJKANP (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 10 Oct 2019 20:13:15 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34113 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbfJKAND (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 10 Oct 2019 20:13:03 -0400
Received: by mail-pf1-f196.google.com with SMTP id b128so4970003pfa.1
        for <linux-ia64@vger.kernel.org>; Thu, 10 Oct 2019 17:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OvLPSIr20MO1GrkJ0OvwvGngd4/e51+GSaoElj9X+Gc=;
        b=Vo/YkX68H3JSVeYxOg0wgKZHM0DDpLq1uGIDRlC9At7IoYDSFTbfrL3kzgv//JSf1l
         wfMMq2ZZ1sw3ulG7OB/Al6Lb7yhUEHFwVbMy0hx6CDWOUEDVNEPAVOGo2TBJff56wZsX
         1wJpR43jEKVUBiVd5MS1y8q4VLWL+t/un7fCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OvLPSIr20MO1GrkJ0OvwvGngd4/e51+GSaoElj9X+Gc=;
        b=hDSJRUzw/3ob6lWkQ4WTFFpYcHzvo+3Ad36E+TCI7bfkuqOemk6XtP8EtRi97P0n35
         nNB9u1ECvkIf5duklG5HI5/JkGOkwngFvkV8ywWmv5vCpwspVlWQc7IJuVWgAmaYRP76
         Trcdu/X8UZZombVWI/8Ctb5cGZRaowFLTQw0GQLLs7fKwhAOWhCU4dqYyc8iU0SWMTJQ
         Qpkinu+G3FcqPEHaK6hFt5gQtKhNhEBXbQ5MSXtWZxwZMM7Rlvs+jNmnEkyFPUrXJeBO
         35jhIhGSf3oA0NL+8hrjDBc3d8l5+u0Sxm7Vo/hecwS8N2yr+5tnZ9Gp3b5Dfqv9b8eV
         yzDQ==
X-Gm-Message-State: APjAAAVYzkoDIEUF1VJNZcNIa9ZVtZVEjvTcIDgXEO0jW9VQKZTNpfGK
        dM4hF7d9G9U42OMTs03MoWKRGA==
X-Google-Smtp-Source: APXvYqwcXL9IUcA1NwWjkBG6ihgZ1mTQNQKZY+myfeizvcbcy9RQ9+vXBtLYoNyG3c9FkCNmz89Vqw==
X-Received: by 2002:a63:4383:: with SMTP id q125mr13830250pga.373.1570752781928;
        Thu, 10 Oct 2019 17:13:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v68sm8097683pfv.47.2019.10.10.17.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 17:12:56 -0700 (PDT)
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
Subject: [PATCH v2 24/29] powerpc: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 10 Oct 2019 17:06:04 -0700
Message-Id: <20191011000609.29728-25-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
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

