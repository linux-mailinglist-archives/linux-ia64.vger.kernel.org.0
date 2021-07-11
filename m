Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEA53C3CFE
	for <lists+linux-ia64@lfdr.de>; Sun, 11 Jul 2021 15:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233141AbhGKNjY (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 11 Jul 2021 09:39:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:49396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232958AbhGKNjY (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Sun, 11 Jul 2021 09:39:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 877496135A;
        Sun, 11 Jul 2021 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626010597;
        bh=b5f2P/y2shO+S47LUkQKIDybO3DPdanNyRLlemEbyJM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=caekR189PKIstoeKujHSup+/3u8ywOrsAxgjA5reE/d+vDo9pH6VsB0QV+z66GhWd
         EzBg7ntprVxBZtAxFJh0Dw349o7syliE7z5zzwt4NOyIsF/teMJMKz9KnwXfCjTsfr
         3if33a9zq2j3B7C57AvZu5qEpzPKQ8jdXrVPzKCdmUVpFOyZHP/5h35EatCWTEVccW
         X06amSC7HV/Zv5lkJEpMho8VLXo54kWKHdoYgA68SHVjDNI22bB5G0a70+eWx4hlUW
         HKAi0GOJTjdfeycTjvrGQ+R7o7+/PXTTU80tY7yKoTEruhVk3YyYDgBVkeUMk3wjPT
         uKuV6X2rtXO8Q==
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@kernel.org>
Cc:     X86 ML <x86@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
        Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org,
        bpf@vger.kernel.org, kuba@kernel.org, mingo@redhat.com,
        ast@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>, kernel-team@fb.com,
        yhs@fb.com, linux-ia64@vger.kernel.org,
        Abhishek Sagar <sagar.abhishek@gmail.com>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>
Subject: [PATCH -tip v9 11/14] x86/kprobes: Push a fake return address at kretprobe_trampoline
Date:   Sun, 11 Jul 2021 22:36:34 +0900
Message-Id: <162601059412.1318837.9231631060694942403.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <162601048053.1318837.1550594515476777588.stgit@devnote2>
References: <162601048053.1318837.1550594515476777588.stgit@devnote2>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Change __kretprobe_trampoline() to push the address of the
__kretprobe_trampoline() as a fake return address at the bottom
of the stack frame. This fake return address will be replaced
with the correct return address in the trampoline_handler().

With this change, the ORC unwinder can check whether the return
address is modified by kretprobes or not.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
Tested-by: Andrii Nakryiko <andrii@kernel.org>
Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 Changes in v9:
  - Update changelog and comment.
  - Remove unneeded type casting.
---
 arch/x86/kernel/kprobes/core.c |   34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index d1436d7463fd..7e1111c19605 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -1022,28 +1022,33 @@ asm(
 	".global __kretprobe_trampoline\n"
 	".type __kretprobe_trampoline, @function\n"
 	"__kretprobe_trampoline:\n"
-	/* We don't bother saving the ss register */
 #ifdef CONFIG_X86_64
-	"	pushq %rsp\n"
+	/* Push a fake return address to tell the unwinder it's a kretprobe. */
+	"	pushq $__kretprobe_trampoline\n"
 	UNWIND_HINT_FUNC
+	/* Save the 'sp - 8', this will be fixed later. */
+	"	pushq %rsp\n"
 	"	pushfq\n"
 	SAVE_REGS_STRING
 	"	movq %rsp, %rdi\n"
 	"	call trampoline_handler\n"
-	/* Replace saved sp with true return address. */
-	"	movq %rax, 19*8(%rsp)\n"
 	RESTORE_REGS_STRING
+	/* In trampoline_handler(), 'regs->flags' is copied to 'regs->sp'. */
+	"	addq $8, %rsp\n"
 	"	popfq\n"
 #else
-	"	pushl %esp\n"
+	/* Push a fake return address to tell the unwinder it's a kretprobe. */
+	"	pushl $__kretprobe_trampoline\n"
 	UNWIND_HINT_FUNC
+	/* Save the 'sp - 4', this will be fixed later. */
+	"	pushl %esp\n"
 	"	pushfl\n"
 	SAVE_REGS_STRING
 	"	movl %esp, %eax\n"
 	"	call trampoline_handler\n"
-	/* Replace saved sp with true return address. */
-	"	movl %eax, 15*4(%esp)\n"
 	RESTORE_REGS_STRING
+	/* In trampoline_handler(), 'regs->flags' is copied to 'regs->sp'. */
+	"	addl $4, %esp\n"
 	"	popfl\n"
 #endif
 	"	ret\n"
@@ -1063,8 +1068,10 @@ STACK_FRAME_NON_STANDARD_FP(__kretprobe_trampoline);
 /*
  * Called from __kretprobe_trampoline
  */
-__used __visible void *trampoline_handler(struct pt_regs *regs)
+__used __visible void trampoline_handler(struct pt_regs *regs)
 {
+	unsigned long *frame_pointer;
+
 	/* fixup registers */
 	regs->cs = __KERNEL_CS;
 #ifdef CONFIG_X86_32
@@ -1072,8 +1079,17 @@ __used __visible void *trampoline_handler(struct pt_regs *regs)
 #endif
 	regs->ip = (unsigned long)&__kretprobe_trampoline;
 	regs->orig_ax = ~0UL;
+	regs->sp += sizeof(long);
+	frame_pointer = &regs->sp + 1;
+
+	/* Replace fake return address with real one. */
+	*frame_pointer = kretprobe_trampoline_handler(regs, frame_pointer);
 
-	return (void *)kretprobe_trampoline_handler(regs, &regs->sp);
+	/*
+	 * Copy FLAGS to 'pt_regs::sp' so that __kretprobe_trapmoline()
+	 * can do RET right after POPF.
+	 */
+	regs->sp = regs->flags;
 }
 NOKPROBE_SYMBOL(trampoline_handler);
 

