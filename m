Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2266ABAE0
	for <lists+linux-ia64@lfdr.de>; Mon,  6 Mar 2023 11:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjCFKID (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 6 Mar 2023 05:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjCFKIA (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 6 Mar 2023 05:08:00 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC472411B
        for <linux-ia64@vger.kernel.org>; Mon,  6 Mar 2023 02:07:49 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso7753191wmi.4
        for <linux-ia64@vger.kernel.org>; Mon, 06 Mar 2023 02:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N41roIOXT8wjs7zjADqaDZNesaRyOk1MrM7jTwSq5FQ=;
        b=LVao0iO1Sl3DmyJ0lwVU4twuicig8Om++dq8VswsbLPwSKJDUetHVKfihWnbAWQv0x
         ImHuStiWtzJxemlAxcABAiE835r/k/myIDbQeoZLjDuvQthY6/3ESFmUMPcwhFCIAB11
         f1zfU7NW2WGz5MT5ZNFBIdT8Uoaiv5m8seywbGygVRi2hlcxU0zfrxOi5+FUNH81Om/e
         AvQt32TW/lCVlWRQ8Dk6xYyLtXHVhUrn0y78tz3cI+xWx2HNyrVPq1hvQR/tE454Sedg
         XVWPvjZraFH11YVRfel3JXBcrCzQ/GPVlET5sg1V6hsha0uYzJuA2RqpRp7dMToU47LZ
         4nZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N41roIOXT8wjs7zjADqaDZNesaRyOk1MrM7jTwSq5FQ=;
        b=jG//AF5qeqpbRNGUYUbSBVmHsxtRTIeAk9eDLBQJSEkF7RO4dC2PyPQ9+IdtHI0+f9
         1jbF+5IiyFhsT/KkxsGKme6ifF9gc06MYIWn7zv8oHKbxW20RLg60G7r+/2I5VHBnMBJ
         +1IPtWTImKpHhklQkY7MNd7wl/bamnm6OI34OOgk4b3K47thJQx47WqQ1unvpVbiGBwJ
         3YxmPtxBAgMODkP5O2x/x1vFErKh1z/i4iWs4sH2g7KoyDuUJJ0W87mZflMB4hT7NmFd
         LcBMVuFeRi9rL3CKFCMjJaggYYW6ekKObAbY5Op5WLF/ICbrbMfgfDHLgcBSjLHOCRwG
         ZWVA==
X-Gm-Message-State: AO0yUKV9OBu3JyggPoH1yOjgZDEQIPwPfG+jU95Mpi0AWJk2O4cXpjax
        QNwVoeNEGkROgb6pNbQRCZQgfw==
X-Google-Smtp-Source: AK7set/9eiRJPPWXw4gzdjZ9KwO/JaDyEd97qx+9/YcLMHFR5HgOivreh1k8TEHdb6h1nuiHfC9sUg==
X-Received: by 2002:a05:600c:444a:b0:3e0:6c4:6a38 with SMTP id v10-20020a05600c444a00b003e006c46a38mr516849wmn.33.1678097267819;
        Mon, 06 Mar 2023 02:07:47 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n8-20020a05600c304800b003e21f01c426sm9667577wmh.9.2023.03.06.02.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:07:47 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 02/26] arm64: Remove COMMAND_LINE_SIZE from uapi
Date:   Mon,  6 Mar 2023 11:04:44 +0100
Message-Id: <20230306100508.1171812-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/setup.h      | 3 ++-
 arch/arm64/include/uapi/asm/setup.h | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index f4af547ef54c..7ca70f883cee 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -4,8 +4,9 @@
 #define __ARM64_ASM_SETUP_H
 
 #include <linux/string.h>
+#include <linux/types.h>
 
-#include <uapi/asm/setup.h>
+#define COMMAND_LINE_SIZE	2048
 
 void *get_early_fdt_ptr(void);
 void early_fdt_map(u64 dt_phys);
diff --git a/arch/arm64/include/uapi/asm/setup.h b/arch/arm64/include/uapi/asm/setup.h
index 5d703888f351..f9f51e5925aa 100644
--- a/arch/arm64/include/uapi/asm/setup.h
+++ b/arch/arm64/include/uapi/asm/setup.h
@@ -22,6 +22,4 @@
 
 #include <linux/types.h>
 
-#define COMMAND_LINE_SIZE	2048
-
 #endif
-- 
2.37.2

