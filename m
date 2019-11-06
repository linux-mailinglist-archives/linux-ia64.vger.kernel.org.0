Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40B9FF0C70
	for <lists+linux-ia64@lfdr.de>; Wed,  6 Nov 2019 04:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387754AbfKFDHK (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 5 Nov 2019 22:07:10 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34311 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387724AbfKFDHJ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 5 Nov 2019 22:07:09 -0500
Received: by mail-pg1-f193.google.com with SMTP id e4so16137501pgs.1
        for <linux-ia64@vger.kernel.org>; Tue, 05 Nov 2019 19:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=boh/NJIo4FlpqhXcE0zFNMsc81zEd1oPhJDHew3kpDg=;
        b=WVt6cu9BD+oeG8ZJ8Tdw1e2sAStW+2Dg+JeN+GDP7OvBQNTHcYY2WHyUjeXZjbl6xA
         8hLNTS3dn1G9efjjSXeAdtpLX03PSZaWhhzR/Hs/yNHNEbqOT62750AofI1zmM2HQ5Bn
         nysgmPWQ1CHVeU7dOZhTnfHZQY75j6dCdMbWsIe3hR4dXo+9TvkxKtYOUmuoGcjo4rWj
         jTSxrBRUTRTvz4+bj90wP3kPyib2LFOYGzyBA3R7OAx0cp/612QcHys6SydA+GGP4zPB
         A/3BcJ1jQik2tPyqsHcVosb8LXAGjBo0yNjyvhuXUOrA/kh2aNKCPY8uLBBhA+/DrH+H
         jb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=boh/NJIo4FlpqhXcE0zFNMsc81zEd1oPhJDHew3kpDg=;
        b=JdvMCIBylVzQYHTdlzOUP9TWKuajZnxFu9MwAHZDEqttMp6Aae1Exb+Gfaztmp+2wo
         yW+tW827lsPoPbmFtewzN421IZhebdJ6NeX+3nJJPm4m2Y2IonoCzDgdtbICZEZwA5pq
         kOeK94tvSSrxU3y+izuSP25tD1b6hMLeP0VTreLG9wyh57KDel8qzC+n1nu9hPimujKv
         zJ8IpUHqUPxS37Yf1+z2D69/+xzsbI6jGkIvTBXDFnYlkd4SY/GNAtLqgWusEvL4WCb+
         T4X4zGUMoHCa1sNkiWNSsV+XJ5nyPsI6Sro+WjlnUfg+DVHLWjYCnhAczFAXyz9vao6w
         fwiQ==
X-Gm-Message-State: APjAAAUGQDO0WNeLr4Uhc9tWL33K2+KKm/z2mwqjZ5BLXgSl2AxJpzvT
        mYI+dfCodA09dSmFOWX5a2Xgcw==
X-Google-Smtp-Source: APXvYqyy+i+KXAH8t6+6Pcp40E8ULaf25Np2v6PVLpf7xN+QmAEIKBjU781YNki6Tgl57x8fufoGlw==
X-Received: by 2002:a17:90a:fb8f:: with SMTP id cp15mr591161pjb.3.1573009628769;
        Tue, 05 Nov 2019 19:07:08 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id k24sm19570487pgl.6.2019.11.05.19.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:07:07 -0800 (PST)
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
Subject: [PATCH 15/50] ia64: Pass log level as arg into ia64_do_show_stack()
Date:   Wed,  6 Nov 2019 03:05:06 +0000
Message-Id: <20191106030542.868541-16-dima@arista.com>
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

Add log level argument to ia64_do_show_stack() as a preparation to
introduce show_stack_loglvl().
Also, make ia64_do_show_stack() static as it's not used outside.

Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: linux-ia64@vger.kernel.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/ia64/include/asm/ptrace.h |  1 -
 arch/ia64/kernel/process.c     | 13 +++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/ia64/include/asm/ptrace.h b/arch/ia64/include/asm/ptrace.h
index 7ff574d56429..b3aa46090101 100644
--- a/arch/ia64/include/asm/ptrace.h
+++ b/arch/ia64/include/asm/ptrace.h
@@ -114,7 +114,6 @@ static inline long regs_return_value(struct pt_regs *regs)
   struct task_struct;			/* forward decl */
   struct unw_frame_info;		/* forward decl */
 
-  extern void ia64_do_show_stack (struct unw_frame_info *, void *);
   extern unsigned long ia64_get_user_rbs_end (struct task_struct *, struct pt_regs *,
 					      unsigned long *);
   extern long ia64_peek (struct task_struct *, struct switch_stack *, unsigned long,
diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index 968b5f33e725..0526cc51ff0b 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -64,12 +64,13 @@ EXPORT_SYMBOL(boot_option_idle_override);
 void (*pm_power_off) (void);
 EXPORT_SYMBOL(pm_power_off);
 
-void
+static void
 ia64_do_show_stack (struct unw_frame_info *info, void *arg)
 {
 	unsigned long ip, sp, bsp;
+	const char *loglvl = arg;
 
-	printk("\nCall Trace:\n");
+	printk("%s\nCall Trace:\n", loglvl);
 	do {
 		unw_get_ip(info, &ip);
 		if (ip == 0)
@@ -77,9 +78,9 @@ ia64_do_show_stack (struct unw_frame_info *info, void *arg)
 
 		unw_get_sp(info, &sp);
 		unw_get_bsp(info, &bsp);
-		printk(" [<%016lx>] %pS\n"
+		printk("%s [<%016lx>] %pS\n"
 			 "                                sp=%016lx bsp=%016lx\n",
-			 ip, (void *)ip, sp, bsp);
+			 loglvl, ip, (void *)ip, sp, bsp);
 	} while (unw_unwind(info) >= 0);
 }
 
@@ -87,12 +88,12 @@ void
 show_stack (struct task_struct *task, unsigned long *sp)
 {
 	if (!task)
-		unw_init_running(ia64_do_show_stack, NULL);
+		unw_init_running(ia64_do_show_stack, (void *)KERN_DEFAULT);
 	else {
 		struct unw_frame_info info;
 
 		unw_init_from_blocked_task(&info, task);
-		ia64_do_show_stack(&info, NULL);
+		ia64_do_show_stack(&info, (void *)KERN_DEFAULT);
 	}
 }
 
-- 
2.23.0

