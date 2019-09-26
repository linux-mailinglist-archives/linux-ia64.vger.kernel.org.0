Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B02DBF8B3
	for <lists+linux-ia64@lfdr.de>; Thu, 26 Sep 2019 20:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbfIZSFY (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 26 Sep 2019 14:05:24 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45874 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbfIZSFY (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 26 Sep 2019 14:05:24 -0400
Received: by mail-pf1-f196.google.com with SMTP id y72so2239493pfb.12
        for <linux-ia64@vger.kernel.org>; Thu, 26 Sep 2019 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2XFXeoGzN1a69pdrls3Beu9JzTpe303VvDFe7zacy8U=;
        b=g+0oLVAqgoC2ew3EG5pLyiK4x/TqojlpwWAAFR+n2zcKEHaA+12gz1WCbQcTKhnK8V
         du7myxKhRoFz8Vn350c/04sX/0q1TmPiCjT+hhJhaVb0xaMcrKAjrM6bAOhht8bRTLF/
         Rvlu7BrJq+bmPv67tsPaw4XYg0FUkK7Uc3Zrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2XFXeoGzN1a69pdrls3Beu9JzTpe303VvDFe7zacy8U=;
        b=fIGdiepukUnZj9uj2jHH6mM8atZ1ceNAZgL2fdnavpvoWr+AvDFtzbJU2teREQ6E6J
         enC+4NDZEgIYMUDypiUIMWZz4sH/a0ChYQZWMxZKZy5IgtWFUFallgYFI6kWjPCeQJw8
         bUj6YIPO7wQ0WfUIK91u4503t5JP85VWyO3Z5qryUghuFIPNTt9jOKMQjDrwgdKWnJTH
         7JwZOHnnIcjlsBhfC459/2itcpxC5Cln9ED+1WAhMnQgs/2chlSAS31PbaQriWO+VbX8
         nF/VHHESOjvQGGXB5npqdIRca7FWeptn32IafwF+NHhJQfZECA/FSnTvQq8pZipTy+oe
         17pA==
X-Gm-Message-State: APjAAAW/TXk29d7PTfzlLoPOHMlgWqe4vbgNbSlQbtaouHykayln/WkI
        4ZReacK7XzkwvKozvMb4glKO/w==
X-Google-Smtp-Source: APXvYqz61iDdqBAe+eZrQT2tMeg7B3FlHieVQyDUPoWyOaOfAOoRrb/ef7ZJD9oTwPZs33YIQXx+4w==
X-Received: by 2002:a63:ff4a:: with SMTP id s10mr4691464pgk.166.1569521122354;
        Thu, 26 Sep 2019 11:05:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v44sm8488912pgn.17.2019.09.26.11.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 11:05:20 -0700 (PDT)
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
Subject: [PATCH 22/29] microblaze: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 26 Sep 2019 10:55:55 -0700
Message-Id: <20190926175602.33098-23-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

The EXCEPTION_TABLE is read-only, so collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/microblaze/kernel/vmlinux.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/microblaze/kernel/vmlinux.lds.S b/arch/microblaze/kernel/vmlinux.lds.S
index b8efb08204a1..abe5ff0f3773 100644
--- a/arch/microblaze/kernel/vmlinux.lds.S
+++ b/arch/microblaze/kernel/vmlinux.lds.S
@@ -11,6 +11,8 @@
 OUTPUT_ARCH(microblaze)
 ENTRY(microblaze_start)
 
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm/page.h>
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/thread_info.h>
@@ -52,7 +54,6 @@ SECTIONS {
 
 	. = ALIGN(16);
 	RO_DATA(4096)
-	EXCEPTION_TABLE(16)
 
 	/*
 	 * sdata2 section can go anywhere, but must be word aligned
-- 
2.17.1

