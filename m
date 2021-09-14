Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D9840B19A
	for <lists+linux-ia64@lfdr.de>; Tue, 14 Sep 2021 16:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234906AbhINOnS (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 14 Sep 2021 10:43:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:36356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233800AbhINOmQ (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 14 Sep 2021 10:42:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 261CE610E6;
        Tue, 14 Sep 2021 14:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631630459;
        bh=yeRFeUd/KgyJTDNVp6FsHy8WEdLmP7WisOVoh49povE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qK/36IdUOUBStuyacLxhjlBQAP9Kz8x1/gYmQFxDS+obRsQDSKiBU2Zmyuy/t5W8b
         01pMxs3+RhVcmlnqTq8Rkx+5Q2x+ZRWM+rW/TBd7v9lkX9kGyiwDllAC4UV22CLPED
         aBI1N/GM8a0igfuG2utiMcmQsO+2UiGCB6TLu3W0dSuqLemPtGJP0ryGdnonVTVX32
         HqirJXjUWDvdP8SU+sOL8bcqjh5Vrk1HjtGCL1NAXx/U2oeYrY29RaGEvgMJiCwQtj
         X+HXhEVFv5kWEaRUNE3RvUjEUY46k4aBNwKsgUlw0a2JimrY466L0EBXeWvAfkYoKB
         m3lg/7rVxzs2Q==
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
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        Paul McKenney <paulmck@kernel.org>
Subject: [PATCH -tip v11 15/27] kprobes: treewide: Make it harder to refer kretprobe_trampoline directly
Date:   Tue, 14 Sep 2021 23:40:54 +0900
Message-Id: <163163045446.489837.14510577516938803097.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <163163030719.489837.2236069935502195491.stgit@devnote2>
References: <163163030719.489837.2236069935502195491.stgit@devnote2>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Since now there is kretprobe_trampoline_addr() for referring the
address of kretprobe trampoline code, we don't need to access
kretprobe_trampoline directly.

Make it harder to refer by renaming it to __kretprobe_trampoline().

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 arch/arc/include/asm/kprobes.h                |    2 +-
 arch/arc/kernel/kprobes.c                     |   11 ++++++-----
 arch/arm/probes/kprobes/core.c                |    6 +++---
 arch/arm64/include/asm/kprobes.h              |    2 +-
 arch/arm64/kernel/probes/kprobes.c            |    2 +-
 arch/arm64/kernel/probes/kprobes_trampoline.S |    4 ++--
 arch/csky/include/asm/kprobes.h               |    2 +-
 arch/csky/kernel/probes/kprobes.c             |    2 +-
 arch/csky/kernel/probes/kprobes_trampoline.S  |    4 ++--
 arch/ia64/kernel/kprobes.c                    |    8 ++++----
 arch/mips/kernel/kprobes.c                    |   12 ++++++------
 arch/parisc/kernel/kprobes.c                  |    4 ++--
 arch/powerpc/include/asm/kprobes.h            |    2 +-
 arch/powerpc/kernel/kprobes.c                 |   16 ++++++++--------
 arch/powerpc/kernel/optprobes.c               |    2 +-
 arch/powerpc/kernel/stacktrace.c              |    2 +-
 arch/riscv/include/asm/kprobes.h              |    2 +-
 arch/riscv/kernel/probes/kprobes.c            |    2 +-
 arch/riscv/kernel/probes/kprobes_trampoline.S |    4 ++--
 arch/s390/include/asm/kprobes.h               |    2 +-
 arch/s390/kernel/kprobes.c                    |   10 +++++-----
 arch/s390/kernel/stacktrace.c                 |    2 +-
 arch/sh/include/asm/kprobes.h                 |    2 +-
 arch/sh/kernel/kprobes.c                      |   10 +++++-----
 arch/sparc/include/asm/kprobes.h              |    2 +-
 arch/sparc/kernel/kprobes.c                   |   10 +++++-----
 arch/x86/kernel/kprobes/core.c                |   18 +++++++++---------
 include/linux/kprobes.h                       |    4 ++--
 kernel/trace/trace_output.c                   |    2 +-
 29 files changed, 76 insertions(+), 75 deletions(-)

diff --git a/arch/arc/include/asm/kprobes.h b/arch/arc/include/asm/kprobes.h
index 2134721dce44..de1566e32cb8 100644
--- a/arch/arc/include/asm/kprobes.h
+++ b/arch/arc/include/asm/kprobes.h
@@ -46,7 +46,7 @@ struct kprobe_ctlblk {
 };
 
 int kprobe_fault_handler(struct pt_regs *regs, unsigned long cause);
-void kretprobe_trampoline(void);
+void __kretprobe_trampoline(void);
 void trap_is_kprobe(unsigned long address, struct pt_regs *regs);
 #else
 #define trap_is_kprobe(address, regs)
diff --git a/arch/arc/kernel/kprobes.c b/arch/arc/kernel/kprobes.c
index 3cee75c87f97..e71d64119d71 100644
--- a/arch/arc/kernel/kprobes.c
+++ b/arch/arc/kernel/kprobes.c
@@ -363,8 +363,9 @@ int __kprobes kprobe_exceptions_notify(struct notifier_block *self,
 
 static void __used kretprobe_trampoline_holder(void)
 {
-	__asm__ __volatile__(".global kretprobe_trampoline\n"
-			     "kretprobe_trampoline:\n" "nop\n");
+	__asm__ __volatile__(".global __kretprobe_trampoline\n"
+			     "__kretprobe_trampoline:\n"
+			     "nop\n");
 }
 
 void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
@@ -375,7 +376,7 @@ void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
 	ri->fp = NULL;
 
 	/* Replace the return addr with trampoline addr */
-	regs->blink = (unsigned long)&kretprobe_trampoline;
+	regs->blink = (unsigned long)&__kretprobe_trampoline;
 }
 
 static int __kprobes trampoline_probe_handler(struct kprobe *p,
@@ -390,7 +391,7 @@ static int __kprobes trampoline_probe_handler(struct kprobe *p,
 }
 
 static struct kprobe trampoline_p = {
-	.addr = (kprobe_opcode_t *) &kretprobe_trampoline,
+	.addr = (kprobe_opcode_t *) &__kretprobe_trampoline,
 	.pre_handler = trampoline_probe_handler
 };
 
@@ -402,7 +403,7 @@ int __init arch_init_kprobes(void)
 
 int __kprobes arch_trampoline_kprobe(struct kprobe *p)
 {
-	if (p->addr == (kprobe_opcode_t *) &kretprobe_trampoline)
+	if (p->addr == (kprobe_opcode_t *) &__kretprobe_trampoline)
 		return 1;
 
 	return 0;
diff --git a/arch/arm/probes/kprobes/core.c b/arch/arm/probes/kprobes/core.c
index 08098ed6f035..67ce7eb8f285 100644
--- a/arch/arm/probes/kprobes/core.c
+++ b/arch/arm/probes/kprobes/core.c
@@ -373,7 +373,7 @@ int __kprobes kprobe_exceptions_notify(struct notifier_block *self,
  * for kretprobe handlers which should normally be interested in r0 only
  * anyway.
  */
-void __naked __kprobes kretprobe_trampoline(void)
+void __naked __kprobes __kretprobe_trampoline(void)
 {
 	__asm__ __volatile__ (
 		"stmdb	sp!, {r0 - r11}		\n\t"
@@ -389,7 +389,7 @@ void __naked __kprobes kretprobe_trampoline(void)
 		: : : "memory");
 }
 
-/* Called from kretprobe_trampoline */
+/* Called from __kretprobe_trampoline */
 static __used __kprobes void *trampoline_handler(struct pt_regs *regs)
 {
 	return (void *)kretprobe_trampoline_handler(regs, (void *)regs->ARM_fp);
@@ -402,7 +402,7 @@ void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
 	ri->fp = (void *)regs->ARM_fp;
 
 	/* Replace the return addr with trampoline addr. */
-	regs->ARM_lr = (unsigned long)&kretprobe_trampoline;
+	regs->ARM_lr = (unsigned long)&__kretprobe_trampoline;
 }
 
 int __kprobes arch_trampoline_kprobe(struct kprobe *p)
diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kprobes.h
index 5d38ff4a4806..05cd82eeca13 100644
--- a/arch/arm64/include/asm/kprobes.h
+++ b/arch/arm64/include/asm/kprobes.h
@@ -39,7 +39,7 @@ void arch_remove_kprobe(struct kprobe *);
 int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
 int kprobe_exceptions_notify(struct notifier_block *self,
 			     unsigned long val, void *data);
-void kretprobe_trampoline(void);
+void __kretprobe_trampoline(void);
 void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
 
 #endif /* CONFIG_KPROBES */
diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index f627a12984a8..e7ad6da980e8 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -411,7 +411,7 @@ void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
 	ri->fp = (void *)kernel_stack_pointer(regs);
 
 	/* replace return addr (x30) with trampoline */
-	regs->regs[30] = (long)&kretprobe_trampoline;
+	regs->regs[30] = (long)&__kretprobe_trampoline;
 }
 
 int __kprobes arch_trampoline_kprobe(struct kprobe *p)
diff --git a/arch/arm64/kernel/probes/kprobes_trampoline.S b/arch/arm64/kernel/probes/kprobes_trampoline.S
index 288a84e253cc..520ee8711db1 100644
--- a/arch/arm64/kernel/probes/kprobes_trampoline.S
+++ b/arch/arm64/kernel/probes/kprobes_trampoline.S
@@ -61,7 +61,7 @@
 	ldp x28, x29, [sp, #S_X28]
 	.endm
 
-SYM_CODE_START(kretprobe_trampoline)
+SYM_CODE_START(__kretprobe_trampoline)
 	sub sp, sp, #PT_REGS_SIZE
 
 	save_all_base_regs
@@ -79,4 +79,4 @@ SYM_CODE_START(kretprobe_trampoline)
 	add sp, sp, #PT_REGS_SIZE
 	ret
 
-SYM_CODE_END(kretprobe_trampoline)
+SYM_CODE_END(__kretprobe_trampoline)
diff --git a/arch/csky/include/asm/kprobes.h b/arch/csky/include/asm/kprobes.h
index b647bbde4d6d..55267cbf5204 100644
--- a/arch/csky/include/asm/kprobes.h
+++ b/arch/csky/include/asm/kprobes.h
@@ -41,7 +41,7 @@ void arch_remove_kprobe(struct kprobe *p);
 int kprobe_fault_handler(struct pt_regs *regs, unsigned int trapnr);
 int kprobe_breakpoint_handler(struct pt_regs *regs);
 int kprobe_single_step_handler(struct pt_regs *regs);
-void kretprobe_trampoline(void);
+void __kretprobe_trampoline(void);
 void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
 
 #endif /* CONFIG_KPROBES */
diff --git a/arch/csky/kernel/probes/kprobes.c b/arch/csky/kernel/probes/kprobes.c
index 784c5aba7f66..42920f25e73c 100644
--- a/arch/csky/kernel/probes/kprobes.c
+++ b/arch/csky/kernel/probes/kprobes.c
@@ -394,7 +394,7 @@ void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
 {
 	ri->ret_addr = (kprobe_opcode_t *)regs->lr;
 	ri->fp = NULL;
-	regs->lr = (unsigned long) &kretprobe_trampoline;
+	regs->lr = (unsigned long) &__kretprobe_trampoline;
 }
 
 int __kprobes arch_trampoline_kprobe(struct kprobe *p)
diff --git a/arch/csky/kernel/probes/kprobes_trampoline.S b/arch/csky/kernel/probes/kprobes_trampoline.S
index b1fe3af24f03..ba48ad04a847 100644
--- a/arch/csky/kernel/probes/kprobes_trampoline.S
+++ b/arch/csky/kernel/probes/kprobes_trampoline.S
@@ -4,7 +4,7 @@
 
 #include <abi/entry.h>
 
-ENTRY(kretprobe_trampoline)
+ENTRY(__kretprobe_trampoline)
 	SAVE_REGS_FTRACE
 
 	mov	a0, sp /* pt_regs */
@@ -16,4 +16,4 @@ ENTRY(kretprobe_trampoline)
 
 	RESTORE_REGS_FTRACE
 	rts
-ENDPROC(kretprobe_trampoline)
+ENDPROC(__kretprobe_trampoline)
diff --git a/arch/ia64/kernel/kprobes.c b/arch/ia64/kernel/kprobes.c
index 44c84c20b626..1a7bab1c5d7c 100644
--- a/arch/ia64/kernel/kprobes.c
+++ b/arch/ia64/kernel/kprobes.c
@@ -392,7 +392,7 @@ static void __kprobes set_current_kprobe(struct kprobe *p,
 	__this_cpu_write(current_kprobe, p);
 }
 
-void kretprobe_trampoline(void)
+void __kretprobe_trampoline(void)
 {
 }
 
@@ -414,7 +414,7 @@ void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
 	ri->fp = NULL;
 
 	/* Replace the return addr with trampoline addr */
-	regs->b0 = (unsigned long)dereference_function_descriptor(kretprobe_trampoline);
+	regs->b0 = (unsigned long)dereference_function_descriptor(__kretprobe_trampoline);
 }
 
 /* Check the instruction in the slot is break */
@@ -897,14 +897,14 @@ static struct kprobe trampoline_p = {
 int __init arch_init_kprobes(void)
 {
 	trampoline_p.addr =
-		dereference_function_descriptor(kretprobe_trampoline);
+		dereference_function_descriptor(__kretprobe_trampoline);
 	return register_kprobe(&trampoline_p);
 }
 
 int __kprobes arch_trampoline_kprobe(struct kprobe *p)
 {
 	if (p->addr ==
-		dereference_function_descriptor(kretprobe_trampoline))
+		dereference_function_descriptor(__kretprobe_trampoline))
 		return 1;
 
 	return 0;
diff --git a/arch/mips/kernel/kprobes.c b/arch/mips/kernel/kprobes.c
index b33bd2498651..6c7f3b143fdc 100644
--- a/arch/mips/kernel/kprobes.c
+++ b/arch/mips/kernel/kprobes.c
@@ -460,14 +460,14 @@ static void __used kretprobe_trampoline_holder(void)
 		/* Keep the assembler from reordering and placing JR here. */
 		".set noreorder\n\t"
 		"nop\n\t"
-		".global kretprobe_trampoline\n"
-		"kretprobe_trampoline:\n\t"
+		".global __kretprobe_trampoline\n"
+		"__kretprobe_trampoline:\n\t"
 		"nop\n\t"
 		".set pop"
 		: : : "memory");
 }
 
-void kretprobe_trampoline(void);
+void __kretprobe_trampoline(void);
 
 void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
 				      struct pt_regs *regs)
@@ -476,7 +476,7 @@ void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
 	ri->fp = NULL;
 
 	/* Replace the return addr with trampoline addr */
-	regs->regs[31] = (unsigned long)kretprobe_trampoline;
+	regs->regs[31] = (unsigned long)__kretprobe_trampoline;
 }
 
 /*
@@ -496,14 +496,14 @@ static int __kprobes trampoline_probe_handler(struct kprobe *p,
 
 int __kprobes arch_trampoline_kprobe(struct kprobe *p)
 {
-	if (p->addr == (kprobe_opcode_t *)kretprobe_trampoline)
+	if (p->addr == (kprobe_opcode_t *)__kretprobe_trampoline)
 		return 1;
 
 	return 0;
 }
 
 static struct kprobe trampoline_p = {
-	.addr = (kprobe_opcode_t *)kretprobe_trampoline,
+	.addr = (kprobe_opcode_t *)__kretprobe_trampoline,
 	.pre_handler = trampoline_probe_handler
 };
 
diff --git a/arch/parisc/kernel/kprobes.c b/arch/parisc/kernel/kprobes.c
index 4a35ac6e2ca2..e2bdb5a5f93e 100644
--- a/arch/parisc/kernel/kprobes.c
+++ b/arch/parisc/kernel/kprobes.c
@@ -175,7 +175,7 @@ int __kprobes parisc_kprobe_ss_handler(struct pt_regs *regs)
 	return 1;
 }
 
-void kretprobe_trampoline(void)
+void __kretprobe_trampoline(void)
 {
 	asm volatile("nop");
 	asm volatile("nop");
@@ -217,6 +217,6 @@ int __kprobes arch_trampoline_kprobe(struct kprobe *p)
 int __init arch_init_kprobes(void)
 {
 	trampoline_p.addr = (kprobe_opcode_t *)
-		dereference_function_descriptor(kretprobe_trampoline);
+		dereference_function_descriptor(__kretprobe_trampoline);
 	return register_kprobe(&trampoline_p);
 }
diff --git a/arch/powerpc/include/asm/kprobes.h b/arch/powerpc/include/asm/kprobes.h
index 4fc0e15e23a5..bab364152b29 100644
--- a/arch/powerpc/include/asm/kprobes.h
+++ b/arch/powerpc/include/asm/kprobes.h
@@ -51,7 +51,7 @@ extern kprobe_opcode_t optprobe_template_end[];
 #define flush_insn_slot(p)	do { } while (0)
 #define kretprobe_blacklist_size 0
 
-void kretprobe_trampoline(void);
+void __kretprobe_trampoline(void);
 extern void arch_remove_kprobe(struct kprobe *p);
 
 /* Architecture specific copy of original instruction */
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 43c77142a262..86d77ff056a6 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -237,7 +237,7 @@ void arch_prepare_kretprobe(struct kretprobe_instance *ri, struct pt_regs *regs)
 	ri->fp = NULL;
 
 	/* Replace the return addr with trampoline addr */
-	regs->link = (unsigned long)kretprobe_trampoline;
+	regs->link = (unsigned long)__kretprobe_trampoline;
 }
 NOKPROBE_SYMBOL(arch_prepare_kretprobe);
 
@@ -403,12 +403,12 @@ NOKPROBE_SYMBOL(kprobe_handler);
  * 	- When the probed function returns, this probe
  * 		causes the handlers to fire
  */
-asm(".global kretprobe_trampoline\n"
-	".type kretprobe_trampoline, @function\n"
-	"kretprobe_trampoline:\n"
+asm(".global __kretprobe_trampoline\n"
+	".type __kretprobe_trampoline, @function\n"
+	"__kretprobe_trampoline:\n"
 	"nop\n"
 	"blr\n"
-	".size kretprobe_trampoline, .-kretprobe_trampoline\n");
+	".size __kretprobe_trampoline, .-__kretprobe_trampoline\n");
 
 /*
  * Called when the probe at kretprobe trampoline is hit
@@ -427,7 +427,7 @@ static int trampoline_probe_handler(struct kprobe *p, struct pt_regs *regs)
 	 * as it is used to determine the return address from the trap.
 	 * For (2), since nip is not honoured with optprobes, we instead setup
 	 * the link register properly so that the subsequent 'blr' in
-	 * kretprobe_trampoline jumps back to the right instruction.
+	 * __kretprobe_trampoline jumps back to the right instruction.
 	 *
 	 * For nip, we should set the address to the previous instruction since
 	 * we end up emulating it in kprobe_handler(), which increments the nip
@@ -543,7 +543,7 @@ int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
 NOKPROBE_SYMBOL(kprobe_fault_handler);
 
 static struct kprobe trampoline_p = {
-	.addr = (kprobe_opcode_t *) &kretprobe_trampoline,
+	.addr = (kprobe_opcode_t *) &__kretprobe_trampoline,
 	.pre_handler = trampoline_probe_handler
 };
 
@@ -554,7 +554,7 @@ int __init arch_init_kprobes(void)
 
 int arch_trampoline_kprobe(struct kprobe *p)
 {
-	if (p->addr == (kprobe_opcode_t *)&kretprobe_trampoline)
+	if (p->addr == (kprobe_opcode_t *)&__kretprobe_trampoline)
 		return 1;
 
 	return 0;
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 325ba544883c..ce1903064031 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -56,7 +56,7 @@ static unsigned long can_optimize(struct kprobe *p)
 	 * has a 'nop' instruction, which can be emulated.
 	 * So further checks can be skipped.
 	 */
-	if (p->addr == (kprobe_opcode_t *)&kretprobe_trampoline)
+	if (p->addr == (kprobe_opcode_t *)&__kretprobe_trampoline)
 		return addr + sizeof(kprobe_opcode_t);
 
 	/*
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 9e4a4a7af380..a2443d61728e 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -155,7 +155,7 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
 		 * Mark stacktraces with kretprobed functions on them
 		 * as unreliable.
 		 */
-		if (ip == (unsigned long)kretprobe_trampoline)
+		if (ip == (unsigned long)__kretprobe_trampoline)
 			return -EINVAL;
 #endif
 
diff --git a/arch/riscv/include/asm/kprobes.h b/arch/riscv/include/asm/kprobes.h
index 9ea9b5ec3113..217ef89f22b9 100644
--- a/arch/riscv/include/asm/kprobes.h
+++ b/arch/riscv/include/asm/kprobes.h
@@ -40,7 +40,7 @@ void arch_remove_kprobe(struct kprobe *p);
 int kprobe_fault_handler(struct pt_regs *regs, unsigned int trapnr);
 bool kprobe_breakpoint_handler(struct pt_regs *regs);
 bool kprobe_single_step_handler(struct pt_regs *regs);
-void kretprobe_trampoline(void);
+void __kretprobe_trampoline(void);
 void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
 
 #endif /* CONFIG_KPROBES */
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 62d477cf11da..e6e950b7cf32 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -355,7 +355,7 @@ void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
 {
 	ri->ret_addr = (kprobe_opcode_t *)regs->ra;
 	ri->fp = NULL;
-	regs->ra = (unsigned long) &kretprobe_trampoline;
+	regs->ra = (unsigned long) &__kretprobe_trampoline;
 }
 
 int __kprobes arch_trampoline_kprobe(struct kprobe *p)
diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.S b/arch/riscv/kernel/probes/kprobes_trampoline.S
index 6e85d021e2a2..7bdb09ded39b 100644
--- a/arch/riscv/kernel/probes/kprobes_trampoline.S
+++ b/arch/riscv/kernel/probes/kprobes_trampoline.S
@@ -75,7 +75,7 @@
 	REG_L x31, PT_T6(sp)
 	.endm
 
-ENTRY(kretprobe_trampoline)
+ENTRY(__kretprobe_trampoline)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 	save_all_base_regs
 
@@ -90,4 +90,4 @@ ENTRY(kretprobe_trampoline)
 	addi sp, sp, PT_SIZE_ON_STACK
 
 	ret
-ENDPROC(kretprobe_trampoline)
+ENDPROC(__kretprobe_trampoline)
diff --git a/arch/s390/include/asm/kprobes.h b/arch/s390/include/asm/kprobes.h
index 09cdb632a490..5eb722c984e4 100644
--- a/arch/s390/include/asm/kprobes.h
+++ b/arch/s390/include/asm/kprobes.h
@@ -70,7 +70,7 @@ struct kprobe_ctlblk {
 };
 
 void arch_remove_kprobe(struct kprobe *p);
-void kretprobe_trampoline(void);
+void __kretprobe_trampoline(void);
 
 int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
 int kprobe_exceptions_notify(struct notifier_block *self,
diff --git a/arch/s390/kernel/kprobes.c b/arch/s390/kernel/kprobes.c
index 5fa86e54f129..c505c0ee5f47 100644
--- a/arch/s390/kernel/kprobes.c
+++ b/arch/s390/kernel/kprobes.c
@@ -242,7 +242,7 @@ void arch_prepare_kretprobe(struct kretprobe_instance *ri, struct pt_regs *regs)
 	ri->fp = NULL;
 
 	/* Replace the return addr with trampoline addr */
-	regs->gprs[14] = (unsigned long) &kretprobe_trampoline;
+	regs->gprs[14] = (unsigned long) &__kretprobe_trampoline;
 }
 NOKPROBE_SYMBOL(arch_prepare_kretprobe);
 
@@ -334,8 +334,8 @@ NOKPROBE_SYMBOL(kprobe_handler);
  */
 static void __used kretprobe_trampoline_holder(void)
 {
-	asm volatile(".global kretprobe_trampoline\n"
-		     "kretprobe_trampoline: bcr 0,0\n");
+	asm volatile(".global __kretprobe_trampoline\n"
+		     "__kretprobe_trampoline: bcr 0,0\n");
 }
 
 /*
@@ -509,7 +509,7 @@ int kprobe_exceptions_notify(struct notifier_block *self,
 NOKPROBE_SYMBOL(kprobe_exceptions_notify);
 
 static struct kprobe trampoline = {
-	.addr = (kprobe_opcode_t *) &kretprobe_trampoline,
+	.addr = (kprobe_opcode_t *) &__kretprobe_trampoline,
 	.pre_handler = trampoline_probe_handler
 };
 
@@ -520,6 +520,6 @@ int __init arch_init_kprobes(void)
 
 int arch_trampoline_kprobe(struct kprobe *p)
 {
-	return p->addr == (kprobe_opcode_t *) &kretprobe_trampoline;
+	return p->addr == (kprobe_opcode_t *) &__kretprobe_trampoline;
 }
 NOKPROBE_SYMBOL(arch_trampoline_kprobe);
diff --git a/arch/s390/kernel/stacktrace.c b/arch/s390/kernel/stacktrace.c
index 101477b3e263..b7bb1981e9ee 100644
--- a/arch/s390/kernel/stacktrace.c
+++ b/arch/s390/kernel/stacktrace.c
@@ -46,7 +46,7 @@ int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
 		 * Mark stacktraces with kretprobed functions on them
 		 * as unreliable.
 		 */
-		if (state.ip == (unsigned long)kretprobe_trampoline)
+		if (state.ip == (unsigned long)__kretprobe_trampoline)
 			return -EINVAL;
 #endif
 
diff --git a/arch/sh/include/asm/kprobes.h b/arch/sh/include/asm/kprobes.h
index 6171682f7798..eeba83e0a7d2 100644
--- a/arch/sh/include/asm/kprobes.h
+++ b/arch/sh/include/asm/kprobes.h
@@ -26,7 +26,7 @@ typedef insn_size_t kprobe_opcode_t;
 struct kprobe;
 
 void arch_remove_kprobe(struct kprobe *);
-void kretprobe_trampoline(void);
+void __kretprobe_trampoline(void);
 
 /* Architecture specific copy of original instruction*/
 struct arch_specific_insn {
diff --git a/arch/sh/kernel/kprobes.c b/arch/sh/kernel/kprobes.c
index 8e76a35e6e33..aed1ea8e2c2f 100644
--- a/arch/sh/kernel/kprobes.c
+++ b/arch/sh/kernel/kprobes.c
@@ -207,7 +207,7 @@ void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
 	ri->fp = NULL;
 
 	/* Replace the return addr with trampoline addr */
-	regs->pr = (unsigned long)kretprobe_trampoline;
+	regs->pr = (unsigned long)__kretprobe_trampoline;
 }
 
 static int __kprobes kprobe_handler(struct pt_regs *regs)
@@ -293,13 +293,13 @@ static int __kprobes kprobe_handler(struct pt_regs *regs)
  */
 static void __used kretprobe_trampoline_holder(void)
 {
-	asm volatile (".globl kretprobe_trampoline\n"
-		      "kretprobe_trampoline:\n\t"
+	asm volatile (".globl __kretprobe_trampoline\n"
+		      "__kretprobe_trampoline:\n\t"
 		      "nop\n");
 }
 
 /*
- * Called when we hit the probe point at kretprobe_trampoline
+ * Called when we hit the probe point at __kretprobe_trampoline
  */
 int __kprobes trampoline_probe_handler(struct kprobe *p, struct pt_regs *regs)
 {
@@ -442,7 +442,7 @@ int __kprobes kprobe_exceptions_notify(struct notifier_block *self,
 }
 
 static struct kprobe trampoline_p = {
-	.addr = (kprobe_opcode_t *)&kretprobe_trampoline,
+	.addr = (kprobe_opcode_t *)&__kretprobe_trampoline,
 	.pre_handler = trampoline_probe_handler
 };
 
diff --git a/arch/sparc/include/asm/kprobes.h b/arch/sparc/include/asm/kprobes.h
index bfcaa6326c20..06c2bc767ef7 100644
--- a/arch/sparc/include/asm/kprobes.h
+++ b/arch/sparc/include/asm/kprobes.h
@@ -24,7 +24,7 @@ do { 	flushi(&(p)->ainsn.insn[0]);	\
 	flushi(&(p)->ainsn.insn[1]);	\
 } while (0)
 
-void kretprobe_trampoline(void);
+void __kretprobe_trampoline(void);
 
 /* Architecture specific copy of original instruction*/
 struct arch_specific_insn {
diff --git a/arch/sparc/kernel/kprobes.c b/arch/sparc/kernel/kprobes.c
index 401534236c2e..535c7b35cb59 100644
--- a/arch/sparc/kernel/kprobes.c
+++ b/arch/sparc/kernel/kprobes.c
@@ -440,7 +440,7 @@ void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
 
 	/* Replace the return addr with trampoline addr */
 	regs->u_regs[UREG_RETPC] =
-		((unsigned long)kretprobe_trampoline) - 8;
+		((unsigned long)__kretprobe_trampoline) - 8;
 }
 
 /*
@@ -465,13 +465,13 @@ static int __kprobes trampoline_probe_handler(struct kprobe *p,
 
 static void __used kretprobe_trampoline_holder(void)
 {
-	asm volatile(".global kretprobe_trampoline\n"
-		     "kretprobe_trampoline:\n"
+	asm volatile(".global __kretprobe_trampoline\n"
+		     "__kretprobe_trampoline:\n"
 		     "\tnop\n"
 		     "\tnop\n");
 }
 static struct kprobe trampoline_p = {
-	.addr = (kprobe_opcode_t *) &kretprobe_trampoline,
+	.addr = (kprobe_opcode_t *) &__kretprobe_trampoline,
 	.pre_handler = trampoline_probe_handler
 };
 
@@ -482,7 +482,7 @@ int __init arch_init_kprobes(void)
 
 int __kprobes arch_trampoline_kprobe(struct kprobe *p)
 {
-	if (p->addr == (kprobe_opcode_t *)&kretprobe_trampoline)
+	if (p->addr == (kprobe_opcode_t *)&__kretprobe_trampoline)
 		return 1;
 
 	return 0;
diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 0c59ef5971de..79cd23dba5b5 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -809,7 +809,7 @@ void arch_prepare_kretprobe(struct kretprobe_instance *ri, struct pt_regs *regs)
 	ri->fp = sara;
 
 	/* Replace the return addr with trampoline addr */
-	*sara = (unsigned long) &kretprobe_trampoline;
+	*sara = (unsigned long) &__kretprobe_trampoline;
 }
 NOKPROBE_SYMBOL(arch_prepare_kretprobe);
 
@@ -1019,9 +1019,9 @@ NOKPROBE_SYMBOL(kprobe_int3_handler);
  */
 asm(
 	".text\n"
-	".global kretprobe_trampoline\n"
-	".type kretprobe_trampoline, @function\n"
-	"kretprobe_trampoline:\n"
+	".global __kretprobe_trampoline\n"
+	".type __kretprobe_trampoline, @function\n"
+	"__kretprobe_trampoline:\n"
 	/* We don't bother saving the ss register */
 #ifdef CONFIG_X86_64
 	"	pushq %rsp\n"
@@ -1045,14 +1045,14 @@ asm(
 	"	popfl\n"
 #endif
 	"	ret\n"
-	".size kretprobe_trampoline, .-kretprobe_trampoline\n"
+	".size __kretprobe_trampoline, .-__kretprobe_trampoline\n"
 );
-NOKPROBE_SYMBOL(kretprobe_trampoline);
-STACK_FRAME_NON_STANDARD(kretprobe_trampoline);
+NOKPROBE_SYMBOL(__kretprobe_trampoline);
+STACK_FRAME_NON_STANDARD(__kretprobe_trampoline);
 
 
 /*
- * Called from kretprobe_trampoline
+ * Called from __kretprobe_trampoline
  */
 __used __visible void *trampoline_handler(struct pt_regs *regs)
 {
@@ -1061,7 +1061,7 @@ __used __visible void *trampoline_handler(struct pt_regs *regs)
 #ifdef CONFIG_X86_32
 	regs->gs = 0;
 #endif
-	regs->ip = (unsigned long)&kretprobe_trampoline;
+	regs->ip = (unsigned long)&__kretprobe_trampoline;
 	regs->orig_ax = ~0UL;
 
 	return (void *)kretprobe_trampoline_handler(regs, &regs->sp);
diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index 96f5df93e36e..b6b2370f4a4c 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -188,14 +188,14 @@ extern void arch_prepare_kretprobe(struct kretprobe_instance *ri,
 				   struct pt_regs *regs);
 extern int arch_trampoline_kprobe(struct kprobe *p);
 
-void kretprobe_trampoline(void);
+void __kretprobe_trampoline(void);
 /*
  * Since some architecture uses structured function pointer,
  * use dereference_function_descriptor() to get real function address.
  */
 static nokprobe_inline void *kretprobe_trampoline_addr(void)
 {
-	return dereference_kernel_function_descriptor(kretprobe_trampoline);
+	return dereference_kernel_function_descriptor(__kretprobe_trampoline);
 }
 
 /* If the trampoline handler called from a kprobe, use this version */
diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index c2ca40e8595b..5a5949c659d0 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -349,7 +349,7 @@ EXPORT_SYMBOL_GPL(trace_output_call);
 #ifdef CONFIG_KRETPROBES
 static inline const char *kretprobed(const char *name)
 {
-	static const char tramp_name[] = "kretprobe_trampoline";
+	static const char tramp_name[] = "__kretprobe_trampoline";
 	int size = sizeof(tramp_name);
 
 	if (strncmp(tramp_name, name, size) == 0)

