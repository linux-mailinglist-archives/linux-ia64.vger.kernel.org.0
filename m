Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41D68695B34
	for <lists+linux-ia64@lfdr.de>; Tue, 14 Feb 2023 08:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjBNHx0 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 14 Feb 2023 02:53:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbjBNHxI (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 14 Feb 2023 02:53:08 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B774020066
        for <linux-ia64@vger.kernel.org>; Mon, 13 Feb 2023 23:53:04 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so10889647wms.0
        for <linux-ia64@vger.kernel.org>; Mon, 13 Feb 2023 23:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DeOLRVEJw2sfJI9qGhq/0LGJxW9LKFzi0kTd/R8USc=;
        b=6En8tdEtEE2yL3ckaGlXW3X8IQF8Oidpm5CEN86wGeiTSRAoieRepn+r4rC5ddJwkT
         R7z+fNhI1jTwzCKC1qEthBZ7fy0C8HXkbpCrS0h8EKEvU+R1uQHwrcO5/Ir3XPZl0Cxi
         qvQrVaQw2cM+ZrnU7ySm4xsvlyMxy2SCR4WjRYH73U8D5COPFpkQbsk/KyNbZp+52EPE
         pxSn+Zf6U5s/1WbezYC7kxAfU3IlzhAkmUB3ryL/U0YPH8JDn8kDVh/7RVpooyefQALn
         5nTTBqhr5EASjx8oFrM02zf9aUd7huvqzvu7C822aHmXHbhXiBANbSxBOxQ2g99ZQuhx
         NDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DeOLRVEJw2sfJI9qGhq/0LGJxW9LKFzi0kTd/R8USc=;
        b=LeP9pnCZzPQwjRvlrnTqnQJCbxTCt6d96bJeL6h7Vdw0N1erAlfP3/N8ZSHQYAnTV3
         RtF59Wm6TazQwq36uHX0ZBMpBMa2IlfZhkr6OpK3aejlpO5znIYybvH1xLEILWsbuuKX
         4Z/tFNVLd7JZhnCvOZ9rzrpHtVNvSnilLOOQfPJETxgAcndhHT+IFNPlR1N63laiuiDL
         w5TxFLm9WFqAsIgIm7EOqpqOMWuuj56s99xzK3aG/SISiJWX7HU2R4Lx3vlyYcNHxGbP
         kKaNevz4+pNSndciQGT4oRL80uNel5zYmGtzOb9edGsqwuKhlha8qaJyH31ADYTBhtuj
         SY8g==
X-Gm-Message-State: AO0yUKXk2hQa9HWxUCeVIaVLVINVJnoODRgj6xDibpEFY8Zp/ZglWoVC
        b6kyKKWdEax4LgZg6jJPNBTa8g==
X-Google-Smtp-Source: AK7set98ypC2QKiebUDI9vIcpmaeqJoN5nCZYHjsCTsTkPxxmAu0Y14ja5TgZ/XhdzRBgxqEZEckPA==
X-Received: by 2002:a05:600c:4383:b0:3dc:d5b:5f73 with SMTP id e3-20020a05600c438300b003dc0d5b5f73mr1279751wmn.19.1676361183239;
        Mon, 13 Feb 2023 23:53:03 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600c364600b003df7b40f99fsm18631615wmq.11.2023.02.13.23.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:53:02 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
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
Cc:     Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
Date:   Tue, 14 Feb 2023 08:49:04 +0100
Message-Id: <20230214074925.228106-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
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
---
 arch/arm/include/asm/setup.h      | 1 +
 arch/arm/include/uapi/asm/setup.h | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/setup.h b/arch/arm/include/asm/setup.h
index ba0872a8dcda..8a1e4f804d1b 100644
--- a/arch/arm/include/asm/setup.h
+++ b/arch/arm/include/asm/setup.h
@@ -13,6 +13,7 @@
 
 #include <uapi/asm/setup.h>
 
+#define COMMAND_LINE_SIZE 1024
 
 #define __tag __used __section(".taglist.init")
 #define __tagtable(tag, fn) \
diff --git a/arch/arm/include/uapi/asm/setup.h b/arch/arm/include/uapi/asm/setup.h
index 25ceda63b284..87a4f4af28e1 100644
--- a/arch/arm/include/uapi/asm/setup.h
+++ b/arch/arm/include/uapi/asm/setup.h
@@ -17,8 +17,6 @@
 
 #include <linux/types.h>
 
-#define COMMAND_LINE_SIZE 1024
-
 /* The list ends with an ATAG_NONE node. */
 #define ATAG_NONE	0x00000000
 
-- 
2.37.2

