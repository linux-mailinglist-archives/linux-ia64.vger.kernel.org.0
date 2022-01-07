Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF07487026
	for <lists+linux-ia64@lfdr.de>; Fri,  7 Jan 2022 03:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344420AbiAGCGU (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 6 Jan 2022 21:06:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344622AbiAGCGT (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 6 Jan 2022 21:06:19 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE886C061245
        for <linux-ia64@vger.kernel.org>; Thu,  6 Jan 2022 18:06:18 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id l10-20020a17090a384a00b001b22190e075so10478605pjf.3
        for <linux-ia64@vger.kernel.org>; Thu, 06 Jan 2022 18:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/lrDPbQs3KHJCrVcWUo6pV+dyvz8Zpq7B3I12E0rmrA=;
        b=ncxlH7LFooYor/lSSUKywmyYBjGAdx95GaBg30qU4tINiQu0CLRTaKkRAu+u9fZ3bu
         Aty15dmC8MgSb8OCEaLVvilpvfPq1Flpo60JUZc7KPoAgTTsSBBi7ATQshWXFtwhxBTB
         q1QcQJ6Fl1HUMYrrQCrEt/SIa6tQkNfAXm6rIq9g3wOvaXoVc+ufDR3pOUlJaFCr8LWk
         DJEOLforxpnFHwjoo/SnEPNhBrhhNTRsvxgkg3GYsS1sozKqRKwZTBMgm1SDos7SQab6
         GeLEkCC+FCfk9GUGvGlsmnZy+xC5Ky8jICDdvTvXz5L4KSCBJT1Oq9G0Z+brpQjk850p
         tOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/lrDPbQs3KHJCrVcWUo6pV+dyvz8Zpq7B3I12E0rmrA=;
        b=QPbMKMKCB6LFzB8//lptj2o+E6NsUvpSWhXbYNd5WYuRGk2iujNQGp811yIaa/ruxc
         SZ1SkR3fscgu8iCSW+kRW/T4r6/epij66HryrFL7MBuhZ7tD+OQ/NDSUYUUW64jcwGb6
         mpDj5qviY0rPyZXlgRh47/DmkQXh9Faj+83/+32QNOdhz5Ieynmm+N+myH22g7e/DkSn
         ii93EdniNw4yPlemDwIN9tFe9zypJrvWjmfXtyXHWxxlwuGzEK6yzSg50vhggfNvvzwK
         ORGnMKWCsA07PyhSqgqicmNW5XhDeW2oj3tTDFm/bd2+shsczYlgvcn0YTy3A66w7/Vd
         rChA==
X-Gm-Message-State: AOAM5327EBE35LGiM6qcYvwse8wIJ91ye411tb62dH4rCqfSG4zzkdp6
        bLSd1Ix4ITFPU2v/BSQYwXdWgrFoHg==
X-Google-Smtp-Source: ABdhPJweZm8W9S+PbvmIugvPfuqncrVJ8JzxdFQ+cr9wlKUiOkqJAGAVPpWbZjruw9IwfVRDCMQHmw==
X-Received: by 2002:a17:902:b908:b0:149:f6e8:7e0e with SMTP id bf8-20020a170902b90800b00149f6e87e0emr4415282plb.138.1641521178263;
        Thu, 06 Jan 2022 18:06:18 -0800 (PST)
Received: from piliu.users.ipa.redhat.com ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id o1sm3394030pjr.4.2022.01.06.18.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 18:06:17 -0800 (PST)
From:   Pingfan Liu <kernelfans@gmail.com>
To:     linux-ia64@vger.kernel.org
Cc:     Pingfan Liu <kernelfans@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Kees Cook <keescook@chromium.org>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 1/3] ia64: kexec: fix the primary cpu passed to smp_shutdown_nonboot_cpus()
Date:   Fri,  7 Jan 2022 10:05:06 +0800
Message-Id: <20220107020508.9778-1-kernelfans@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

kernel_kexec()->migrate_to_reboot_cpu() has already pinned the reboot
thread on either reboot_cpu or the first online cpu.

So machine_shutdown() should pass smp_processor_id() as the primary cpu
to smp_shutdown_nonboot_cpus().

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Jens Axboe <axboe@kernel.dk>
To: linux-ia64@vger.kernel.org
---
 arch/ia64/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index 834df24a88f1..88ca3f587783 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -575,7 +575,7 @@ cpu_halt (void)
 
 void machine_shutdown(void)
 {
-	smp_shutdown_nonboot_cpus(reboot_cpu);
+	smp_shutdown_nonboot_cpus(smp_processor_id());
 
 #ifdef CONFIG_KEXEC
 	kexec_disable_iosapic();
-- 
2.31.1

