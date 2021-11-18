Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A497455E4D
	for <lists+linux-ia64@lfdr.de>; Thu, 18 Nov 2021 15:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbhKROjN (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 18 Nov 2021 09:39:13 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:39492 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbhKROiD (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 18 Nov 2021 09:38:03 -0500
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1637246101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ybizh0dFTmFhgm03cfZl5IUDDSi+7rqptEfhGzWwHfU=;
        b=ryReEdeCM0xk1uqq90z0flubhGxq9yk1U38cAlRavznv0Ko048fxNNSKKhXA2ca8zj9DHc
        w1D8AwkV59u2BbcHseUZWuz4xjtbPi3EJYG87P5j2gxP93tu9sEjlRYTttC+1oR//dP53O
        nHDUEuZUNUu4VmPJqqHBSk60gWiWoFMuZSOklip0mxwNCmnXeVLYsYEvsEZYTnQxajLFBZ
        3zRUybFEVyLl0QRu/Lhi8gEGODhtRrLFK6BFZQDNpsdWXZ4idcw+sUjlyyocBX/I3rvTHB
        UVVytJrdyJV++HPkL66QGyuiz/q9jwQ8m+U2yne2GRL9L2kkmKAiX7OdA3JYsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1637246101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ybizh0dFTmFhgm03cfZl5IUDDSi+7rqptEfhGzWwHfU=;
        b=xrAEJiGmFYmLvzrB6ZGy6cmsvFjmpZdkR9Is/F7sssMFfhazClZllXUNLK/nNrJaKVWTYf
        s2jn+T5rtaEOABDg==
To:     linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org
Cc:     Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 7/8] kernel/fork: Only cache the VMAP stack in finish_task_switch().
Date:   Thu, 18 Nov 2021 15:34:51 +0100
Message-Id: <20211118143452.136421-8-bigeasy@linutronix.de>
In-Reply-To: <20211118143452.136421-1-bigeasy@linutronix.de>
References: <20211118143452.136421-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

The task stack could be deallocated later in delayed_put_task_struct().
For fork()/exec() kind of workloads (say a shell script executing
several commands) it is important that the stack is released in
finish_task_switch() so that in VMAP_STACK case it can be cached and
reused in the new task.
If the free/caching is RCU-delayed then a new stack has to be allocated
because the cache is filled in batches of which only two stacks, out of
many, are recycled.

For PREEMPT_RT it would be good if the wake-up in vfree_atomic() could
be avoided in the scheduling path. Far worse are the other
free_thread_stack() implementations which invoke __free_pages()/
kmem_cache_free() with disabled preemption.

Introduce put_task_stack_sched() which is invoked from the
finish_task_switch() and only caches the VMAP stack. If the cache is
full or !CONFIG_VMAP_STACK is used than the stack is freed from
delayed_put_task_struct(). In the VMAP case this is another opportunity
to fill the cache.

The stack is finally released in delayed_put_task_struct() which means
that a valid stack reference can be held during its invocation. As such
there can be made no assumption whether the task_struct::stack pointer
can be freed if non-NULL.
Set the lowest bit of task_struct::stack if the stack was released via
put_task_stack_sched() and needs a final free in
delayed_put_task_struct(). If the bit is missing then a reference is
held and put_task_stack() will release it.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/sched/task_stack.h |  8 +++++
 kernel/exit.c                    |  1 +
 kernel/fork.c                    | 60 ++++++++++++++++++++++++++------
 kernel/sched/core.c              |  7 ++--
 4 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/include/linux/sched/task_stack.h b/include/linux/sched/task_st=
ack.h
index 892562ebbd3aa..ccd1336aa7f42 100644
--- a/include/linux/sched/task_stack.h
+++ b/include/linux/sched/task_stack.h
@@ -70,6 +70,7 @@ static inline void *try_get_task_stack(struct task_struct=
 *tsk)
 }
=20
 extern void put_task_stack(struct task_struct *tsk);
+extern void put_task_stack_sched(struct task_struct *tsk);
 #else
 static inline void *try_get_task_stack(struct task_struct *tsk)
 {
@@ -77,6 +78,13 @@ static inline void *try_get_task_stack(struct task_struc=
t *tsk)
 }
=20
 static inline void put_task_stack(struct task_struct *tsk) {}
+static inline void put_task_stack_sched(struct task_struct *tsk) {}
+#endif
+
+#ifdef CONFIG_ARCH_THREAD_STACK_ALLOCATOR
+static inline void task_stack_cleanup(struct task_struct *tsk) {}
+#else
+extern void task_stack_cleanup(struct task_struct *tsk);
 #endif
=20
 void exit_task_stack_account(struct task_struct *tsk);
diff --git a/kernel/exit.c b/kernel/exit.c
index 41236da175d56..383a56795e82a 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -171,6 +171,7 @@ static void delayed_put_task_struct(struct rcu_head *rh=
p)
 	kprobe_flush_task(tsk);
 	perf_event_delayed_put(tsk);
 	trace_sched_process_free(tsk);
+	task_stack_cleanup(tsk);
 	put_task_struct(tsk);
 }
=20
diff --git a/kernel/fork.c b/kernel/fork.c
index 257cd048359fd..0aa079e56e3b4 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -178,6 +178,16 @@ static inline void free_task_struct(struct task_struct=
 *tsk)
=20
 #ifndef CONFIG_ARCH_THREAD_STACK_ALLOCATOR
=20
+#define THREAD_STACK_DELAYED_FREE	1UL
+
+static void thread_stack_mark_delayed_free(struct task_struct *tsk)
+{
+	unsigned long val =3D (unsigned long)tsk->stack;
+
+	val |=3D THREAD_STACK_DELAYED_FREE;
+	WRITE_ONCE(tsk->stack, (void *)val);
+}
+
 /*
  * Allocate pages if THREAD_SIZE is >=3D PAGE_SIZE, otherwise use a
  * kmemcache based allocator.
@@ -293,7 +303,7 @@ static int alloc_thread_stack_node(struct task_struct *=
tsk, int node)
 	return 0;
 }
=20
-static void free_thread_stack(struct task_struct *tsk)
+static void free_thread_stack(struct task_struct *tsk, bool cache_only)
 {
 	int i;
=20
@@ -306,7 +316,12 @@ static void free_thread_stack(struct task_struct *tsk)
 		tsk->stack_vm_area =3D NULL;
 		return;
 	}
-	vfree_atomic(tsk->stack);
+	if (cache_only) {
+		thread_stack_mark_delayed_free(tsk);
+		return;
+	}
+
+	vfree(tsk->stack);
 	tsk->stack =3D NULL;
 	tsk->stack_vm_area =3D NULL;
 }
@@ -325,8 +340,12 @@ static int alloc_thread_stack_node(struct task_struct =
*tsk, int node)
 	return -ENOMEM;
 }
=20
-static void free_thread_stack(struct task_struct *tsk)
+static void free_thread_stack(struct task_struct *tsk, bool cache_only)
 {
+	if (cache_only) {
+		thread_stack_mark_delayed_free(tsk);
+		return;
+	}
 	__free_pages(virt_to_page(tsk->stack), THREAD_SIZE_ORDER);
 	tsk->stack =3D NULL;
 }
@@ -345,8 +364,12 @@ static int alloc_thread_stack_node(struct task_struct =
*tsk, int node)
 	return stack ? 0 : -ENOMEM;
 }
=20
-static void free_thread_stack(struct task_struct *tsk)
+static void free_thread_stack(struct task_struct *tsk, bool cache_only)
 {
+	if (cache_only) {
+		thread_stack_mark_delayed_free(tsk);
+		return;
+	}
 	kmem_cache_free(thread_stack_cache, tsk->stack);
 	tsk->stack =3D NULL;
 }
@@ -360,8 +383,19 @@ void thread_stack_cache_init(void)
 }
=20
 # endif /* THREAD_SIZE >=3D PAGE_SIZE || defined(CONFIG_VMAP_STACK) */
-#else /* CONFIG_ARCH_THREAD_STACK_ALLOCATOR */
=20
+void task_stack_cleanup(struct task_struct *tsk)
+{
+	unsigned long val =3D (unsigned long)tsk->stack;
+
+	if (!(val & THREAD_STACK_DELAYED_FREE))
+		return;
+
+	WRITE_ONCE(tsk->stack, (void *)(val & ~THREAD_STACK_DELAYED_FREE));
+	free_thread_stack(tsk, false);
+}
+
+#else /* CONFIG_ARCH_THREAD_STACK_ALLOCATOR */
 static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 {
 	unsigned long *stack;
@@ -461,19 +495,25 @@ void exit_task_stack_account(struct task_struct *tsk)
 	}
 }
=20
-static void release_task_stack(struct task_struct *tsk)
+static void release_task_stack(struct task_struct *tsk, bool cache_only)
 {
 	if (WARN_ON(READ_ONCE(tsk->__state) !=3D TASK_DEAD))
 		return;  /* Better to leak the stack than to free prematurely */
=20
-	free_thread_stack(tsk);
+	free_thread_stack(tsk, cache_only);
 }
=20
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 void put_task_stack(struct task_struct *tsk)
 {
 	if (refcount_dec_and_test(&tsk->stack_refcount))
-		release_task_stack(tsk);
+		release_task_stack(tsk, false);
+}
+
+void put_task_stack_sched(struct task_struct *tsk)
+{
+	if (refcount_dec_and_test(&tsk->stack_refcount))
+		release_task_stack(tsk, true);
 }
 #endif
=20
@@ -487,7 +527,7 @@ void free_task(struct task_struct *tsk)
 	 * The task is finally done with both the stack and thread_info,
 	 * so free both.
 	 */
-	release_task_stack(tsk);
+	release_task_stack(tsk, false);
 #else
 	/*
 	 * If the task had a separate stack allocation, it should be gone
@@ -989,7 +1029,7 @@ static struct task_struct *dup_task_struct(struct task=
_struct *orig, int node)
=20
 free_stack:
 	exit_task_stack_account(tsk);
-	free_thread_stack(tsk);
+	free_thread_stack(tsk, false);
 free_tsk:
 	free_task_struct(tsk);
 	return NULL;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 3c9b0fda64ac0..435f633f6f365 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4880,8 +4880,11 @@ static struct rq *finish_task_switch(struct task_str=
uct *prev)
 		if (prev->sched_class->task_dead)
 			prev->sched_class->task_dead(prev);
=20
-		/* Task is done with its stack. */
-		put_task_stack(prev);
+		/*
+		 * Cache only the VMAP stack. The final deallocation is in
+		 * delayed_put_task_struct.
+		 */
+		put_task_stack_sched(prev);
=20
 		put_task_struct_rcu_user(prev);
 	}
--=20
2.33.1

