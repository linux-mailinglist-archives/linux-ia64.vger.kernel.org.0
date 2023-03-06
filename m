Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFCA96ABCB3
	for <lists+linux-ia64@lfdr.de>; Mon,  6 Mar 2023 11:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjCFKaT (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 6 Mar 2023 05:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjCFKaA (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 6 Mar 2023 05:30:00 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA8525E0E
        for <linux-ia64@vger.kernel.org>; Mon,  6 Mar 2023 02:29:28 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id g3so8246438wri.6
        for <linux-ia64@vger.kernel.org>; Mon, 06 Mar 2023 02:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmLKiksCQWpb8pBE2OLabJaA2XG8R+RFDp99qqlcago=;
        b=5lMnafqDVn4Pwua1gl1+Z/hrLR1KiOZ4aDTU9h1LTTfuvcUFjn3C/+t52jy7P1x+Ym
         OfWYJlKnihXay+UBlyCeQk9vjujxeYx8IuA8mpztNG56Ev8wMLyObS/lDKXo6xBoOkse
         aMhgGdrbqixdaCHpkIBrHp1TSwOa+KycL0uu7T2njGRXL1KldM9TNTRwckHZbQNCOW4H
         rrzCeBaaI8SaYXkUqvjru5sipPQtP1824NJFNt50JQFeZx44wKL0e1aJ4k+Rl/ei7z8o
         Zbz1rkF9/k2UYhkcckCqPpxDhn9HBY3OsYFG/jW0gfE65sr2BFuZWGPZwJm8lIBH1ahX
         qFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmLKiksCQWpb8pBE2OLabJaA2XG8R+RFDp99qqlcago=;
        b=SczXO1WBfK28gQqSlU3YfqZuWHUSYgQyy/BFKvRmnt7SHePY+Ryzdr6BDraPCTO+ry
         FCSEupAZU4A03dgtIi1TE8gycaLq+gpuglpMrzaDKfhyvv+NvK2/MRkbb/4L7mGX+rfQ
         CBhEf6jXXuR7xqsADQWMlOJeO8K9rpI3kQtBDrKVpqQbew9Rs8tB3bZEomPa7EizfxcJ
         URjfD20mJ0vqnQMiN19MH+eH7dkpif5/Y3lASLmyxHg/bCu7QntxyfwK92LVXcxtBe4C
         WEEBcQtLxsmdexMGgEXewsT6lg3XNga5tHAv/JAyPkFMQOkZohZoa4peCuGvHeeRraye
         K8Sg==
X-Gm-Message-State: AO0yUKWxk9RZ99emto887mnFzMQJ3GDBq8CECwknzW8kqz9yH6tcgYse
        kc9+5hFo8z3BkoinMGBFgdFY3g==
X-Google-Smtp-Source: AK7set+w1F6Ljk7yHQuqpnBHaGFm+xYS45sHy7JWrhtYeCUZnjELa6ZyHknt3JcZixXScaI2KT3guQ==
X-Received: by 2002:a5d:6e02:0:b0:2c6:e827:21c1 with SMTP id h2-20020a5d6e02000000b002c6e82721c1mr6098136wrz.50.1678098563332;
        Mon, 06 Mar 2023 02:29:23 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d608c000000b002c552c6c8c2sm9558106wrt.87.2023.03.06.02.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:29:23 -0800 (PST)
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
Subject: [PATCH v5 23/26] powerpc: Remove empty <uapi/asm/setup.h>
Date:   Mon,  6 Mar 2023 11:05:05 +0100
Message-Id: <20230306100508.1171812-24-alexghiti@rivosinc.com>
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

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/powerpc/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/powerpc/include/uapi/asm/setup.h

diff --git a/arch/powerpc/include/uapi/asm/setup.h b/arch/powerpc/include/uapi/asm/setup.h
deleted file mode 100644
index f2ca747aa45b..000000000000
--- a/arch/powerpc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_ASM_POWERPC_SETUP_H
-#define _UAPI_ASM_POWERPC_SETUP_H
-
-#endif /* _UAPI_ASM_POWERPC_SETUP_H */
-- 
2.37.2

