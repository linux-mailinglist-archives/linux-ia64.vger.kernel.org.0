Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286AA29F0F5
	for <lists+linux-ia64@lfdr.de>; Thu, 29 Oct 2020 17:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgJ2QPK (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 29 Oct 2020 12:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgJ2QPC (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 29 Oct 2020 12:15:02 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D02AC0613CF
        for <linux-ia64@vger.kernel.org>; Thu, 29 Oct 2020 09:15:02 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id n5so3603710ile.7
        for <linux-ia64@vger.kernel.org>; Thu, 29 Oct 2020 09:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=89gVg8cd0IQxuIKJoArlxuVDHaXxRJdwosnxMVGQKDQ=;
        b=RRBeDUy1mq1x1SBlgef4PBAhFA+4kNIpaWkmOV2vttgVYR+H5XBXhg/JaOH771KazL
         lncFpnvgxk/NSifwSY/JsT/ClOamjmutsv6faBGV0N7z8FKMG5pjCJDEJk8QpAKnmfIZ
         czSrE2offNnkvu2kVYafP1aHPm+lgNlZISURDs8lGF8fjqlAWEd+nW9oKbmsFTEgM42W
         SnSb6zlLoQ9Ny21HYZ0nZ/ceAE/iqEygixHHQJ80F/3e1ZCcw4FzfYfGohW4XkqyUmTl
         KvaBOclj9CZDWw5ZGsHp8S3tsg6xi6v+kwBULqrjyF0x9PKoESEOR9cbk1SzknxIAHE3
         VV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=89gVg8cd0IQxuIKJoArlxuVDHaXxRJdwosnxMVGQKDQ=;
        b=Ejv0FpLcR9NvnpdsX0si59z/KdAurbvjB/lDYa4sekeYI7rxl4BGZ1sXKQBy185dKB
         kQHAguSKpXXBKdTBvqq+xtbVFb5GjvfI+7Qfg9pjqNY5Wm4siLMtU0MOmq1Eg3hVhotC
         9e8RMzLGjGvSjOMWt1uENp1llLCP9B2BPBEFlBjxHyXSa85apDPIrP8re4hZZpKcM0TU
         vyXnxREZxmMezh2BW04IIIAFstztxjL2cIO4nH5VOyjraoh8Ep0/gIY2BgMZ4fTWoBOI
         84CsIom7F8EzbwORycVZ02f6N7YwNxDxYzLUCkrKHu7OlQf251eynISzgm2DCqjcpUkC
         OLxQ==
X-Gm-Message-State: AOAM533H0r9ru9hoEPI3+8RdPRxD0g/anTfoeLJuhi4cVpfXcXJQiuxl
        H0VpDLnJat5scRg7ao71wU2tX0ncjpiSNA==
X-Google-Smtp-Source: ABdhPJxZBhvv9IOuP7CTUf7WiFpkEfC2abbhh+SYjQe6QooiHApxCAq71Ssm55r56T6aEOZpbUOAKA==
X-Received: by 2002:a05:6e02:1348:: with SMTP id k8mr3612378ilr.306.1603988101333;
        Thu, 29 Oct 2020 09:15:01 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id m9sm806701ioc.15.2020.10.29.09.15.00
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:15:00 -0700 (PDT)
To:     linux-ia64@vger.kernel.org
From:   Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] ia64: add support for TIF_NOTIFY_SIGNAL
Message-ID: <d3a2aa1e-0fae-1d3f-519f-d32adc608c38@kernel.dk>
Date:   Thu, 29 Oct 2020 10:15:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Wire up TIF_NOTIFY_SIGNAL handling for ia64.

Cc: linux-ia64@vger.kernel.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---

5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
for details:

https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/

As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
as that will enable a set of cleanups once all of them support it. I'm
happy carrying this patch if need be, or it can be funelled through the
arch tree. Let me know.

 arch/ia64/include/asm/thread_info.h | 4 +++-
 arch/ia64/kernel/process.c          | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/ia64/include/asm/thread_info.h b/arch/ia64/include/asm/thread_info.h
index 64a1011f6812..759d7d68a5f2 100644
--- a/arch/ia64/include/asm/thread_info.h
+++ b/arch/ia64/include/asm/thread_info.h
@@ -104,6 +104,7 @@ struct thread_info {
 #define TIF_SYSCALL_AUDIT	3	/* syscall auditing active */
 #define TIF_SINGLESTEP		4	/* restore singlestep on return to user mode */
 #define TIF_NOTIFY_RESUME	6	/* resumption notification requested */
+#define TIF_NOTIFY_SIGNAL	7	/* signal notification exist */
 #define TIF_MEMDIE		17	/* is terminating due to OOM killer */
 #define TIF_MCA_INIT		18	/* this task is processing MCA or INIT */
 #define TIF_DB_DISABLED		19	/* debug trap disabled for fsyscall */
@@ -115,6 +116,7 @@ struct thread_info {
 #define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
 #define _TIF_SYSCALL_TRACEAUDIT	(_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT|_TIF_SINGLESTEP)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
+#define _TIF_SIGNAL_NOTIFY	(1 << TIF_SIGNAL_NOTIFY)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
 #define _TIF_MCA_INIT		(1 << TIF_MCA_INIT)
@@ -124,7 +126,7 @@ struct thread_info {
 
 /* "work to do on user-return" bits */
 #define TIF_ALLWORK_MASK	(_TIF_SIGPENDING|_TIF_NOTIFY_RESUME|_TIF_SYSCALL_AUDIT|\
-				 _TIF_NEED_RESCHED|_TIF_SYSCALL_TRACE)
+				 _TIF_NEED_RESCHED|_TIF_SYSCALL_TRACE|_TIF_NOTIFY_SIGNAL)
 /* like TIF_ALLWORK_BITS but sans TIF_SYSCALL_TRACE or TIF_SYSCALL_AUDIT */
 #define TIF_WORK_MASK		(TIF_ALLWORK_MASK&~(_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT))
 
diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index 6b61a703bcf5..0e0146daa88d 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -171,7 +171,8 @@ do_notify_resume_user(sigset_t *unused, struct sigscratch *scr, long in_syscall)
 	}
 
 	/* deal with pending signal delivery */
-	if (test_thread_flag(TIF_SIGPENDING)) {
+	if (test_thread_flag(TIF_SIGPENDING) ||
+	    test_thread_flags(TIF_NOTIFY_SIGNAL)) {
 		local_irq_enable();	/* force interrupt enable */
 		ia64_do_signal(scr, in_syscall);
 	}
-- 
2.29.0

-- 
Jens Axboe

