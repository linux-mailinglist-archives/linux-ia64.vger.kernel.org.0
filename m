Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCF61AF4A2
	for <lists+linux-ia64@lfdr.de>; Sat, 18 Apr 2020 22:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbgDRUUP (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 18 Apr 2020 16:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728436AbgDRUUN (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Sat, 18 Apr 2020 16:20:13 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593B1C061A10
        for <linux-ia64@vger.kernel.org>; Sat, 18 Apr 2020 13:20:13 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f13so7132968wrm.13
        for <linux-ia64@vger.kernel.org>; Sat, 18 Apr 2020 13:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YcAGMtuF0rhY5/CwFkS6y19jwNr4v/OVvU1ZdxXAJXI=;
        b=FES+oZNEIEsmmj51DKeJqushAlZRr7Qyhs0t52CNC/JtFGiRCkDZ1lrdgRDBoJVdmC
         uGKLXTsyQQAq/CTc7N89gZUjzQmKHQAJYlnGzfgfxTEDzIPDzXPKtDLKs+KdlfyCciPV
         JprcrR1IEcHrnnVKyaq4btYzWjf9Ad6Ki/jZfMm6BnrIpGx4l82mc/etx8k5Rn+5oe7R
         F8us6C+qDk92IRvLz6UOxtTgfh4CLKYbMC0vf2tinG+xBd9UXsWHEEeKyBehVT8ZIIcp
         fPzI68Et5QjrOlwu3Ys2d3571063Vjr2fVU+bKHh7/YRKu+w9JOeP7R+krablit5g9EB
         n8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YcAGMtuF0rhY5/CwFkS6y19jwNr4v/OVvU1ZdxXAJXI=;
        b=tjkQtJlBp9FHK3LGo8KiP6X9FcdPTQTDlPprHEozfrAMUWZxoixEPanFtXjxP+b2BJ
         0xWp4LnZGVDJ9AeNo8aSJze1gcSO5Ovwfg10SNytxJed0hFWHdb14ZBEtJt3oaBC/2rU
         fkbxq9cmMqneAHuhQHv7t4aOwRnRFvHvurRip0enmq+B/dc0ecN0U1GvDrQW++6cG7Om
         s32LqeIG9bgPz18uT1EGVcH84g3/5RqCxotGoNrplGrHrlM2okQrhIL9zr+cMMsG4fQB
         QBpEcl1cWeOo9/nOl5Woo+ZpU2AtGpTx+j1Ekt57ZlP9BkTDyjDbsFE5vyhkUp5MNe4T
         tFdA==
X-Gm-Message-State: AGi0PubayFYRad5GKS3dNfX80pRgBL8VGuOJbvesaO9XqGqbCxA4fJ/5
        /f7uu2uvig9EYn1YnLhjEm+Hpg==
X-Google-Smtp-Source: APiQypJE1L+v+FBvyz+zKGSwkl8f3+Jyj0m1yDLkX+uEjYV6Y2Q10HvgN4fmJxgHa6iZZhsQhuJaMg==
X-Received: by 2002:a5d:6785:: with SMTP id v5mr10009583wru.376.1587241212065;
        Sat, 18 Apr 2020 13:20:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id m1sm31735255wro.64.2020.04.18.13.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 13:20:11 -0700 (PDT)
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
Subject: [PATCHv3 16/50] ia64: Add show_stack_loglvl()
Date:   Sat, 18 Apr 2020 21:19:10 +0100
Message-Id: <20200418201944.482088-17-dima@arista.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418201944.482088-1-dima@arista.com>
References: <20200418201944.482088-1-dima@arista.com>
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
index 332c6dfe7333..913d9a01cbf9 100644
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
2.26.0

