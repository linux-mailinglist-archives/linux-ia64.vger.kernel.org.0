Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA8E695BE3
	for <lists+linux-ia64@lfdr.de>; Tue, 14 Feb 2023 09:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbjBNIEB (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 14 Feb 2023 03:04:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbjBNIDr (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 14 Feb 2023 03:03:47 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C411211E2
        for <linux-ia64@vger.kernel.org>; Tue, 14 Feb 2023 00:03:22 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id k3so7078439wrv.5
        for <linux-ia64@vger.kernel.org>; Tue, 14 Feb 2023 00:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWYHj4zorz+dwOxhMMH91bCZKZH71c0fjl4K1DE3I7g=;
        b=27dlS2aO0uft324x+5s1DeYbloYz3UgO5DgO75VDlplQxxBVeI64VkQzc+Byd8Fu/Z
         Xka03pnhW1NbtoFStNpUrISXlzzG/TAk7uTdioQtnWEclNcJ56F+eb2Buf+CDzsIjDBa
         wGPYMfPCSoPjGcXzx0cPQO4ARszV05IlnyXN6LVlv1T7gx5cyxtQC9Ss7sDVmmmsdRGg
         FC1qBiRgVJKFMTOWAF531BXN8fSAKHBnrY8Sk1F7aCe9PVMMmxdr3HlQ8X9W+zrUSBJb
         J6C2ybiNqsD6i+accbqJBNvWRrnbVBq1PXgtShoItYGXBi77TYgeSR0F2epforxZmM0s
         AR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWYHj4zorz+dwOxhMMH91bCZKZH71c0fjl4K1DE3I7g=;
        b=YPqLseeee0YgAqHIQ1JmbskfqY2iXpgkzlKnsQ8PIkKt0YHY+U1aNd1Zyap1NtPn/N
         WGQhozVXhZZhilXmS7i7We1egq+Qo7goj54UNi5iNZoEdarRd6N0NgzxFx27SBvlZlsX
         GAEABEGB5MtedhhPu0DPakX+khyS/MhVZdR4Fe7Kh/MkJt+HKIHjDsLNDfzEigDaK4Ym
         Fz1Y95i7c0M2Ni1uhuKKEDgeVvI620GzraS6fOytKXGlb6Hz7Tey2oA1LjtCQ9DgwDOh
         1wKWpp8n90NS56nDrwwBOWwg7Yv/e2z9wo8njAaSNBHAOhkNXakeOWKVJpMwq+9DbNLZ
         sxDg==
X-Gm-Message-State: AO0yUKXPqrP1yP0mKZZzaROcst9IxK1Jbygwx+bwAUdV4wiwZRGI0V4L
        t3WaWy1P4O6iOCPXhLsffDe7UQ==
X-Google-Smtp-Source: AK7set+16HUKFeQRbMq4B+hriqCT9+7bWN18GPL4d51zKSI423HCnDqYe0sW8FBEL0We84v1KhSO4g==
X-Received: by 2002:adf:e54e:0:b0:2bf:c09a:c60e with SMTP id z14-20020adfe54e000000b002bfc09ac60emr1259998wrm.2.1676361800528;
        Tue, 14 Feb 2023 00:03:20 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d67c2000000b002c53f6c7599sm11635424wrw.29.2023.02.14.00.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:03:20 -0800 (PST)
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
Subject: [PATCH v3 13/24] alpha: Remove empty <uapi/asm/setup.h>
Date:   Tue, 14 Feb 2023 08:49:14 +0100
Message-Id: <20230214074925.228106-14-alexghiti@rivosinc.com>
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

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/alpha/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/alpha/include/uapi/asm/setup.h

diff --git a/arch/alpha/include/uapi/asm/setup.h b/arch/alpha/include/uapi/asm/setup.h
deleted file mode 100644
index 9b3b5ba39b1d..000000000000
--- a/arch/alpha/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI__ALPHA_SETUP_H
-#define _UAPI__ALPHA_SETUP_H
-
-#endif /* _UAPI__ALPHA_SETUP_H */
-- 
2.37.2

