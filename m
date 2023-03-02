Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B22826A7DEB
	for <lists+linux-ia64@lfdr.de>; Thu,  2 Mar 2023 10:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjCBJjD (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 2 Mar 2023 04:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjCBJjB (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 2 Mar 2023 04:39:01 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D4F38E88
        for <linux-ia64@vger.kernel.org>; Thu,  2 Mar 2023 01:38:48 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so1742464wms.1
        for <linux-ia64@vger.kernel.org>; Thu, 02 Mar 2023 01:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677749927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2urgpMO2KVxl6lplPPVxnOzeLpIAncQaLe3J6thpyW4=;
        b=PIQBVis/eCZwrjnEm3UchoPAwrLAxQo8LeBswck20022oG1kRdlDV/slA4zZyYTNe8
         heys8AwaMW0d2H39RYAdasZSaYwfxS9ZsI4rI8ysRKgEN+Qlw5akvxEGyZBxK3ZToJa5
         C/ow6qrB9k8PM2BQ3LcXjU3gNu9Xrzf9K0AgVkXKHE7VxTRCjPl4cHxq2DN23F5p91Jd
         jfZBNgeeX6rbxglOe4yiBaiE5O9KT3GvEJjC2T+Jkba3USz5B6rwc/jBwSq1y7pgHmYU
         tRwBfE1Fiy9t9YtdNqaRXN7+EPus5Le4eU8S+S5DBThh4HLY1wDC6UZNa9X47ZqF8ceK
         THMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677749927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2urgpMO2KVxl6lplPPVxnOzeLpIAncQaLe3J6thpyW4=;
        b=obx7N8djgdCy4OFFEvs4TW/WiXvW/8x0u4JlHFtpBCoUynz7VuqXmgSZCjrzTFoK9M
         YYkH9GTO7VTcYqo9wQ1ynsOEKHxmk5aBHjQEV8yxKZl1HD3BA6KDsVVOMLZ+J8bxWg/J
         RhmE+CjyLKbqMwmR85umxc2AppkPSsFvs2Bc5yCIlZ+9zgyLCfzA1F5u/T8wMRwMcdwk
         0BMUV5Uj6kbaUO9cuAqrw0qUpXGbpjWib8GH/co680PS/sUgGo/A1BfzQoN8/KV/vBfM
         el1TS2moZOFQQV7hUjE+SCX/jljmz+K7I+RN5YSqoJT7mq/zCP0ZHI6zJqejCBtzukgE
         mxAA==
X-Gm-Message-State: AO0yUKWEeKbLUytmH+4TZJMdj7/5oWcR+1xeOzM5OY6ANZNZ4Xkg54/k
        L4fIM4Rt5dNkb/c53wvADPLEYw==
X-Google-Smtp-Source: AK7set8oHbNygBzt6W0addU+vytnwYPbfGJKv/ey/v/+peloy8qf6kGz0Nh2z+vcesYMnit2/ORc3g==
X-Received: by 2002:a05:600c:1c8e:b0:3ea:f873:13aa with SMTP id k14-20020a05600c1c8e00b003eaf87313aamr8083072wms.40.1677749927246;
        Thu, 02 Mar 2023 01:38:47 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l35-20020a05600c1d2300b003e6dcd562a6sm2554811wms.28.2023.03.02.01.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:38:46 -0800 (PST)
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
Subject: [PATCH v4 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
Date:   Thu,  2 Mar 2023 10:35:18 +0100
Message-Id: <20230302093539.372962-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
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
Reviewed-by: Russell King (Oracle) <linux@armlinux.org.uk>
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

