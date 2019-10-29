Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 112D6E91D6
	for <lists+linux-ia64@lfdr.de>; Tue, 29 Oct 2019 22:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729904AbfJ2VUm (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 29 Oct 2019 17:20:42 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34668 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729951AbfJ2VUl (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 29 Oct 2019 17:20:41 -0400
Received: by mail-pg1-f196.google.com with SMTP id e4so6226593pgs.1
        for <linux-ia64@vger.kernel.org>; Tue, 29 Oct 2019 14:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=k/Yn81zcF5guunRscdaPnRGMjDCCToSR8PmADiJbxp0=;
        b=FVaO6aO8ILysBPp4TcG6DRYTfhP64yNYK1NJln6frp9324XMFNpgsYZUbnEC1/BcNI
         d3y6HNjxwiZHSQPSgHJiVtceb3/6J9fduGv+Jcn399jZBSVy0f+CKF1R0ijDo77jPqTY
         64QP9FbsaOR6pmLh7yAYTYiylPerHQmxnysFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=k/Yn81zcF5guunRscdaPnRGMjDCCToSR8PmADiJbxp0=;
        b=mPADLiMVw9M9UNSIRY6f2LvqVbPPUhZF33gg7m3RcMac3ibAC61KRWzPyHh8EhHPDi
         UXXfImaGNcLB6PZ6gdAPu2ViHAYpCGs8xR59q5EMokISichwa2/bM1KiIut1L95HosQg
         /TAKR1AekysDfnuO+3P7E/CqEvn6UeUuO3si2aCa4BXd3R43ypk6YPsQ86qAiYJ3PzrE
         1yY/4sEm25eCTC1lTAsEA9hiEbk1UgAY0V/fdgERshS6rIrZ4QZblzmuIZc1+CT/HkDH
         PUErUPlEaQWzH5ot+SR+yBifbYKk7L+GRf3mCoc/jbGLUu6jPSCCU9q+MarhKhvYNmFw
         42MA==
X-Gm-Message-State: APjAAAUHCv7ldnBbLPbD+kHrehU4v30a5E/fxU2+4xASUsW/a7Gp+6oy
        QBfIkfqPlke8XPp8+zRkbaNcoA==
X-Google-Smtp-Source: APXvYqzYc8Z7WdSN2lpbbY2148bXAcfqC0AwUdd9uxHNVkdGRvM/YKRGPHtsurX4YfIZG5rxXrNrPA==
X-Received: by 2002:a65:4247:: with SMTP id d7mr29666739pgq.107.1572384041015;
        Tue, 29 Oct 2019 14:20:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u10sm29783pjy.28.2019.10.29.14.20.36
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
Subject: [PATCH v3 23/29] parisc: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Tue, 29 Oct 2019 14:13:45 -0700
Message-Id: <20191029211351.13243-24-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/vmlinux.lds.S | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 12b3d7d5e9e4..53e29d88f99c 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -19,6 +19,7 @@
 				*(.data..vm0.pte)
 
 #define CC_USING_PATCHABLE_FUNCTION_ENTRY
+#define RO_EXCEPTION_TABLE_ALIGN	8
 
 #include <asm-generic/vmlinux.lds.h>
 
@@ -129,9 +130,6 @@ SECTIONS
 
 	RO_DATA(8)
 
-	/* RO because of BUILDTIME_EXTABLE_SORT */
-	EXCEPTION_TABLE(8)
-
 	/* unwind info */
 	.PARISC.unwind : {
 		__start___unwind = .;
-- 
2.17.1

