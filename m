Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38AC6E9156
	for <lists+linux-ia64@lfdr.de>; Tue, 29 Oct 2019 22:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729391AbfJ2VOJ (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 29 Oct 2019 17:14:09 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44062 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729072AbfJ2VOJ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 29 Oct 2019 17:14:09 -0400
Received: by mail-pf1-f195.google.com with SMTP id q26so6896649pfn.11
        for <linux-ia64@vger.kernel.org>; Tue, 29 Oct 2019 14:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j9O9o67lY/P6wlTEjsCX8aHvBVVSD/zx23uzcL5Y/Qk=;
        b=YmH7JoRcIpuxHSBEzuyBZcI2cXlEocfRSYinjuQggynP+Yn5Bn4zkxrvfy7jAIlUuJ
         3z/TlcEeTvA6xOI+hfOAcAJs7nBEtgLlKKNYCzlXJEj1NFiiqMvLbkPYxAWyblfxS+ij
         cYtL8PEwHkOICPVjXRXFQwTlPFkJBooeg3rsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j9O9o67lY/P6wlTEjsCX8aHvBVVSD/zx23uzcL5Y/Qk=;
        b=CIh7Wsl4+LPoFRPWhl4FR8Ymd7MOkYQQZ9Wuc52NgcIW093SoMmjXYEXXPzIpdwABt
         WwRguEpf6hpQjcZPwDVBCY9D9oJadcIqprjhxnwhu5iVOzoiN7grCO6zXlbXoV4UIl+a
         ZK5ZX8oXBRSWEqkMwHk8NxLDHC09mt9ETy8TXVN43R0nUzEm0+X2zFGW0+KBPpiNAPV8
         oPhIpVg4g50XPcpY/fugAETDFfBuisCbn9008CpbzPL7wltm2zgLlbWB8851UiK1eDZl
         2qR72zY7TbeS0dnG/licES/qR67Gke7052FuORpJ8ZITGc+UtVMqP4wxRUtJ6FIoOnAt
         Upbw==
X-Gm-Message-State: APjAAAUAf91ttntkdGW/7m+v0BmOY4IRCbWZnwBub5iFf+TKDupO1UwE
        qrSVbFPyg8Y/JwvTKWOyj14nmA==
X-Google-Smtp-Source: APXvYqwjW3Si7/tNLiB0yWdzOESspeMKg8ZGEJduGjpXWpuGODoydLiyAFH5fAhzQLyONbMAITVrtg==
X-Received: by 2002:a63:b5b:: with SMTP id a27mr30641499pgl.262.1572383648493;
        Tue, 29 Oct 2019 14:14:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y8sm134824pgs.34.2019.10.29.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:14:04 -0700 (PDT)
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
Subject: [PATCH v3 06/29] s390: Move RO_DATA into "text" PT_LOAD Program Header
Date:   Tue, 29 Oct 2019 14:13:28 -0700
Message-Id: <20191029211351.13243-7-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

In preparation for moving NOTES into RO_DATA, move RO_DATA back into the
"text" PT_LOAD Program Header, as done with other architectures. The
"data" PT_LOAD now starts with the writable data section.

Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Heiko Carstens <heiko.carstens@de.ibm.com>
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

