Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D89F0D3577
	for <lists+linux-ia64@lfdr.de>; Fri, 11 Oct 2019 02:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfJKANB (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 10 Oct 2019 20:13:01 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40641 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbfJKANB (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 10 Oct 2019 20:13:01 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so4948326pfb.7
        for <linux-ia64@vger.kernel.org>; Thu, 10 Oct 2019 17:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Wn91QvvOWXGcdAukdBFPOsAS+V9wjbJFfxE/dszqFsM=;
        b=TKF/H7IXE7UJDzb3rMUleub9owN4KR+Kc5MridCe/6j0nlzZqoEI/zttKy0QHihDrJ
         2ZeHmtUNHexo6bQLRtT0gDvTipRD0K5TGW8Q7FVWpvhcmLBUGnPT1TySO+nYDUITKTZu
         3WNoDW0bVMFt0uCMT6eBCSnH00RkY54ViUTLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Wn91QvvOWXGcdAukdBFPOsAS+V9wjbJFfxE/dszqFsM=;
        b=dGFjh/NXwDZlxlayNmMNWXb7K2a5k7waF9q+k0O75/MHXZfd5GDLQmFvui2P6k/Byi
         IsGwOcrfJ/NdYV4DAUGjU5Lnktk8ob3c+AtAqjn3/fxwUAcD7+U3UrWs6UZc/QH1VrNH
         ocZfVAXVKGrZpIMNLEQ0TMZFrNO244JbBURGPnxaV/RU4cYXIUnHXY/uLiYTtPEky1wN
         bXOdkJEdrSlg5v072MTd7p8NnZf0Il6MF0ZqhIcEiJc8hkQcOLDxhEA4TfS+QhiGAIPc
         5LeBs2NmfHXwLMLyi3ybfY2AneifTXuDu4ULiZvVQ069SbgSV//eHSaadNvhJI80oC7E
         4hWg==
X-Gm-Message-State: APjAAAWbk9l2OsIwukh5RYvDsmKlfVANrk/So64Gttjz21M6yu1q55Ro
        DwyqwbZCwbjPuRcIPXbyEUoAuw==
X-Google-Smtp-Source: APXvYqwhzx8QmNWMryCruzS69inQpCD817u3s0gzfMeJwk1Bb2iOQgca7Hto534MUkNuyGvUJAkyfA==
X-Received: by 2002:a17:90a:ff0f:: with SMTP id ce15mr14913883pjb.14.1570752780484;
        Thu, 10 Oct 2019 17:13:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y144sm7993803pfb.188.2019.10.10.17.12.54
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
Subject: [PATCH v2 29/29] x86: Use INT3 instead of NOP for linker fill bytes
Date:   Thu, 10 Oct 2019 17:06:09 -0700
Message-Id: <20191011000609.29728-30-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Instead of using 0x90 (NOP) to fill bytes between functions, which makes
it easier to sloppily target functions in function pointer overwrite
attacks, fill with 0xCC (INT3) to force a trap. Also drop the space
between "=" and the value to better match the binutils documentation
https://sourceware.org/binutils/docs/ld/Output-Section-Fill.html#Output-Section-Fill

Example "objdump -d" before:

...
ffffffff810001e0 <start_cpu0>:
ffffffff810001e0:       48 8b 25 e1 b1 51 01    mov 0x151b1e1(%rip),%rsp        # ffffffff8251b3c8 <initial_stack>
ffffffff810001e7:       e9 d5 fe ff ff          jmpq   ffffffff810000c1 <secondary_startup_64+0x91>
ffffffff810001ec:       90                      nop
ffffffff810001ed:       90                      nop
ffffffff810001ee:       90                      nop
ffffffff810001ef:       90                      nop

ffffffff810001f0 <__startup_64>:
...

After:

...
ffffffff810001e0 <start_cpu0>:
ffffffff810001e0:       48 8b 25 41 79 53 01    mov 0x1537941(%rip),%rsp        # ffffffff82537b28 <initial_stack>
ffffffff810001e7:       e9 d5 fe ff ff          jmpq   ffffffff810000c1 <secondary_startup_64+0x91>
ffffffff810001ec:       cc                      int3
ffffffff810001ed:       cc                      int3
ffffffff810001ee:       cc                      int3
ffffffff810001ef:       cc                      int3

ffffffff810001f0 <__startup_64>:
...

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index b06d6e1188de..3a1a819da137 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -144,7 +144,7 @@ SECTIONS
 		*(.text.__x86.indirect_thunk)
 		__indirect_thunk_end = .;
 #endif
-	} :text = 0x9090
+	} :text =0xcccc
 
 	/* End of text section, which should occupy whole number of pages */
 	_etext = .;
-- 
2.17.1

