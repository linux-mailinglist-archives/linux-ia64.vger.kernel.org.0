Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAA2A51C808
	for <lists+linux-ia64@lfdr.de>; Thu,  5 May 2022 20:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384428AbiEESiD (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 5 May 2022 14:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354257AbiEEShG (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 5 May 2022 14:37:06 -0400
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B5F5DBE2;
        Thu,  5 May 2022 11:27:14 -0700 (PDT)
Received: from in01.mta.xmission.com ([166.70.13.51]:59294)
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1nmgC1-00GUiV-Jg; Thu, 05 May 2022 12:27:13 -0600
Received: from ip68-227-174-4.om.om.cox.net ([68.227.174.4]:37118 helo=localhost.localdomain)
        by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1nmgC0-002BtP-9P; Thu, 05 May 2022 12:27:13 -0600
From:   "Eric W. Biederman" <ebiederm@xmission.com>
To:     linux-kernel@vger.kernel.org
Cc:     rjw@rjwysocki.net, Oleg Nesterov <oleg@redhat.com>,
        mingo@kernel.org, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, mgorman@suse.de,
        bigeasy@linutronix.de, Will Deacon <will@kernel.org>,
        tj@kernel.org, linux-pm@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, linux-ia64@vger.kernel.org,
        "Eric W. Biederman" <ebiederm@xmission.com>
Date:   Thu,  5 May 2022 13:26:34 -0500
Message-Id: <20220505182645.497868-1-ebiederm@xmission.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <87a6bv6dl6.fsf_-_@email.froward.int.ebiederm.org>
References: <87a6bv6dl6.fsf_-_@email.froward.int.ebiederm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-XM-SPF: eid=1nmgC0-002BtP-9P;;;mid=<20220505182645.497868-1-ebiederm@xmission.com>;;;hst=in01.mta.xmission.com;;;ip=68.227.174.4;;;frm=ebiederm@xmission.com;;;spf=softfail
X-XM-AID: U2FsdGVkX1+sxj7RG91YT/pP21A3hNOLeyrzh/sWVtM=
X-SA-Exim-Connect-IP: 68.227.174.4
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=38 
X-Spam-Combo: ***;linux-kernel@vger.kernel.org
X-Spam-Relay-Country: 
X-Spam-Timing: total 636 ms - load_scoreonly_sql: 0.06 (0.0%),
        signal_user_changed: 9 (1.4%), b_tie_ro: 8 (1.2%), parse: 1.36 (0.2%),
        extract_message_metadata: 14 (2.2%), get_uri_detail_list: 2.7 (0.4%),
        tests_pri_-1000: 15 (2.4%), tests_pri_-950: 1.39 (0.2%),
        tests_pri_-900: 1.11 (0.2%), tests_pri_-90: 175 (27.5%), check_bayes:
        173 (27.3%), b_tokenize: 12 (1.9%), b_tok_get_all: 9 (1.4%),
        b_comp_prob: 2.6 (0.4%), b_tok_touch_all: 146 (22.9%), b_finish: 0.93
        (0.1%), tests_pri_0: 402 (63.2%), check_dkim_signature: 0.72 (0.1%),
        check_dkim_adsp: 2.7 (0.4%), poll_dns_idle: 0.94 (0.1%), tests_pri_10:
        2.2 (0.4%), tests_pri_500: 11 (1.7%), rewrite_mail: 0.00 (0.0%)
Subject: [PATCH v4 01/12] signal: Rename send_signal send_signal_locked
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Rename send_signal and __send_signal to send_signal_locked and
__send_signal_locked to make send_signal usable outside of
signal.c.

Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---
 include/linux/signal.h |  2 ++
 kernel/signal.c        | 24 ++++++++++++------------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/include/linux/signal.h b/include/linux/signal.h
index a6db6f2ae113..55605bdf5ce9 100644
--- a/include/linux/signal.h
+++ b/include/linux/signal.h
@@ -283,6 +283,8 @@ extern int do_send_sig_info(int sig, struct kernel_siginfo *info,
 extern int group_send_sig_info(int sig, struct kernel_siginfo *info,
 			       struct task_struct *p, enum pid_type type);
 extern int __group_send_sig_info(int, struct kernel_siginfo *, struct task_struct *);
+extern int send_signal_locked(int sig, struct kernel_siginfo *info,
+			      struct task_struct *p, enum pid_type type);
 extern int sigprocmask(int, sigset_t *, sigset_t *);
 extern void set_current_blocked(sigset_t *);
 extern void __set_current_blocked(const sigset_t *);
diff --git a/kernel/signal.c b/kernel/signal.c
index 30cd1ca43bcd..b0403197b0ad 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1071,8 +1071,8 @@ static inline bool legacy_queue(struct sigpending *signals, int sig)
 	return (sig < SIGRTMIN) && sigismember(&signals->signal, sig);
 }
 
-static int __send_signal(int sig, struct kernel_siginfo *info, struct task_struct *t,
-			enum pid_type type, bool force)
+static int __send_signal_locked(int sig, struct kernel_siginfo *info,
+				struct task_struct *t, enum pid_type type, bool force)
 {
 	struct sigpending *pending;
 	struct sigqueue *q;
@@ -1212,8 +1212,8 @@ static inline bool has_si_pid_and_uid(struct kernel_siginfo *info)
 	return ret;
 }
 
-static int send_signal(int sig, struct kernel_siginfo *info, struct task_struct *t,
-			enum pid_type type)
+int send_signal_locked(int sig, struct kernel_siginfo *info,
+		       struct task_struct *t, enum pid_type type)
 {
 	/* Should SIGKILL or SIGSTOP be received by a pid namespace init? */
 	bool force = false;
@@ -1245,7 +1245,7 @@ static int send_signal(int sig, struct kernel_siginfo *info, struct task_struct
 			force = true;
 		}
 	}
-	return __send_signal(sig, info, t, type, force);
+	return __send_signal_locked(sig, info, t, type, force);
 }
 
 static void print_fatal_signal(int signr)
@@ -1284,7 +1284,7 @@ __setup("print-fatal-signals=", setup_print_fatal_signals);
 int
 __group_send_sig_info(int sig, struct kernel_siginfo *info, struct task_struct *p)
 {
-	return send_signal(sig, info, p, PIDTYPE_TGID);
+	return send_signal_locked(sig, info, p, PIDTYPE_TGID);
 }
 
 int do_send_sig_info(int sig, struct kernel_siginfo *info, struct task_struct *p,
@@ -1294,7 +1294,7 @@ int do_send_sig_info(int sig, struct kernel_siginfo *info, struct task_struct *p
 	int ret = -ESRCH;
 
 	if (lock_task_sighand(p, &flags)) {
-		ret = send_signal(sig, info, p, type);
+		ret = send_signal_locked(sig, info, p, type);
 		unlock_task_sighand(p, &flags);
 	}
 
@@ -1347,7 +1347,7 @@ force_sig_info_to_task(struct kernel_siginfo *info, struct task_struct *t,
 	if (action->sa.sa_handler == SIG_DFL &&
 	    (!t->ptrace || (handler == HANDLER_EXIT)))
 		t->signal->flags &= ~SIGNAL_UNKILLABLE;
-	ret = send_signal(sig, info, t, PIDTYPE_PID);
+	ret = send_signal_locked(sig, info, t, PIDTYPE_PID);
 	spin_unlock_irqrestore(&t->sighand->siglock, flags);
 
 	return ret;
@@ -1567,7 +1567,7 @@ int kill_pid_usb_asyncio(int sig, int errno, sigval_t addr,
 
 	if (sig) {
 		if (lock_task_sighand(p, &flags)) {
-			ret = __send_signal(sig, &info, p, PIDTYPE_TGID, false);
+			ret = __send_signal_locked(sig, &info, p, PIDTYPE_TGID, false);
 			unlock_task_sighand(p, &flags);
 		} else
 			ret = -ESRCH;
@@ -2103,7 +2103,7 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
 	 * parent's namespaces.
 	 */
 	if (valid_signal(sig) && sig)
-		__send_signal(sig, &info, tsk->parent, PIDTYPE_TGID, false);
+		__send_signal_locked(sig, &info, tsk->parent, PIDTYPE_TGID, false);
 	__wake_up_parent(tsk, tsk->parent);
 	spin_unlock_irqrestore(&psig->siglock, flags);
 
@@ -2601,7 +2601,7 @@ static int ptrace_signal(int signr, kernel_siginfo_t *info, enum pid_type type)
 	/* If the (new) signal is now blocked, requeue it.  */
 	if (sigismember(&current->blocked, signr) ||
 	    fatal_signal_pending(current)) {
-		send_signal(signr, info, current, type);
+		send_signal_locked(signr, info, current, type);
 		signr = 0;
 	}
 
@@ -4793,7 +4793,7 @@ void kdb_send_sig(struct task_struct *t, int sig)
 			   "the deadlock.\n");
 		return;
 	}
-	ret = send_signal(sig, SEND_SIG_PRIV, t, PIDTYPE_PID);
+	ret = send_signal_locked(sig, SEND_SIG_PRIV, t, PIDTYPE_PID);
 	spin_unlock(&t->sighand->siglock);
 	if (ret)
 		kdb_printf("Fail to deliver Signal %d to process %d.\n",
-- 
2.35.3

