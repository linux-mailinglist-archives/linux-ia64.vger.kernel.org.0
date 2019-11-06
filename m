Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3046F0C71
	for <lists+linux-ia64@lfdr.de>; Wed,  6 Nov 2019 04:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387780AbfKFDHN (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 5 Nov 2019 22:07:13 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44052 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387753AbfKFDHN (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 5 Nov 2019 22:07:13 -0500
Received: by mail-pg1-f194.google.com with SMTP id f19so7014756pgk.11
        for <linux-ia64@vger.kernel.org>; Tue, 05 Nov 2019 19:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dpUGho02FroZqV6HXW0Qyb5qfjXUEDBHxzb8cp33DnY=;
        b=fdbYtnnrlqBVQPRWvemv5Sot7Idqj4/QKXAvf57L3HbRJZtw4S70u30fc5FPW/Q6BC
         iQ7oEoc7IsRToDIr0FiSmqr5esRWV1N5eqSa+ryOh7MUly4D2P3l+NSW39jHVfzzeodz
         xm3PHLfJByqqhTfEDFrnDg6OxkiCwwXSvHVtuxxoW/vZ7q+IpVHvln6/WcRle2E6iAeY
         IY7xOR3YudSYnDkTGrbNCrVaeudqrtpiJx/bjJdwmMm8W95MjbdL8eTDSX/+eEXrJ1Pl
         dExWt8NYfjNpd+CaqTnoitgga4vIWd8kIlSfoqEGu51LwPGVKQNBDyf1YFQqSdaepKm1
         PoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dpUGho02FroZqV6HXW0Qyb5qfjXUEDBHxzb8cp33DnY=;
        b=o2wI9A1+Y/LR/3sQOEkzlJbs0CcMX/VRbKL6ryY29LevA1zdK1AakQT2KiokP23IJS
         GSNtp9hI1gxAD1cNNDfgiKdrSeXu7qQr+0xSflOLGHR+4qAZ0nUL42Z/mzPKV/YvqYDX
         zh3jAiGTyRyMxJkWkPjCVB3IcezsGAYUwZtkREwrcyKTylUZQk/jjpwGAa1CxyhSPmPu
         UZ/+G6lo1mAkLsiPHnAfLMIySI6wU/caVQi4uf8Lav/zuIT+DYfZQnfYIGHrQdGxKTt8
         Ild6u+C/4wSI8fbsGcRde4gYvePUlBC2IKagGu4oFuTYJINad2hGrsCQzL9hU72FzUjq
         6TaQ==
X-Gm-Message-State: APjAAAW//KE0rUzbzY5scBA0Ni0TSdbIhQxDkGifTMcNQX/1MgQvWZ4H
        wSedXWnRLrD5pK/s7/8Gk8pGvQ==
X-Google-Smtp-Source: APXvYqxNiBWvjDDGSYHXNdKN4fxI7jr6zUOAdZ23F0mAGwWRFARdYeTBYcOy6LClQ8Kmqqw0pChmLQ==
X-Received: by 2002:a63:d405:: with SMTP id a5mr184786pgh.79.1573009632450;
        Tue, 05 Nov 2019 19:07:12 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id k24sm19570487pgl.6.2019.11.05.19.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:07:11 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org
Subject: [PATCH 16/50] ia64: Add show_stack_loglvl()
Date:   Wed,  6 Nov 2019 03:05:07 +0000
Message-Id: <20191106030542.868541-17-dima@arista.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Currently, the log-level of show_stack() depends on a platform
realization. It creates situations where the headers are printed with
lower log level or higher than the stacktrace (depending on
a platform or user).

Furthermore, it forces the logic decision from user to an architecture
side. In result, some users as sysrq/kdb/etc are doing tricks with
temporary rising console_loglevel while printing their messages.
And in result it not only may print unwanted messages from other CPUs,
but also omit printing at all in the unlucky case where the printk()
was deferred.

Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
an easier approach than introducing more printk buffers.
Also, it will consolidate printings with headers.

Introduce show_stack_loglvl(), that eventually will substitute
show_stack().

Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: linux-ia64@vger.kernel.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/ia64/kernel/process.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index 0526cc51ff0b..b0eeb19bdd8d 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -85,18 +85,25 @@ ia64_do_show_stack (struct unw_frame_info *info, void *arg)
 }
 
 void
-show_stack (struct task_struct *task, unsigned long *sp)
+show_stack_loglvl (struct task_struct *task, unsigned long *sp,
+		   const char *loglvl)
 {
 	if (!task)
-		unw_init_running(ia64_do_show_stack, (void *)KERN_DEFAULT);
+		unw_init_running(ia64_do_show_stack, (void *)loglvl);
 	else {
 		struct unw_frame_info info;
 
 		unw_init_from_blocked_task(&info, task);
-		ia64_do_show_stack(&info, (void *)KERN_DEFAULT);
+		ia64_do_show_stack(&info, (void *)loglvl);
 	}
 }
 
+void
+show_stack (struct task_struct *task, unsigned long *sp)
+{
+	show_stack_loglvl(task, sp, KERN_DEFAULT);
+}
+
 void
 show_regs (struct pt_regs *regs)
 {
-- 
2.23.0

