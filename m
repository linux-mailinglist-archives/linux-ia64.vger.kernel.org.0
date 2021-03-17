Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5DED33E4A0
	for <lists+linux-ia64@lfdr.de>; Wed, 17 Mar 2021 02:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhCQBAO (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 16 Mar 2021 21:00:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:40782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231379AbhCQA7q (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 16 Mar 2021 20:59:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3DE564FCB;
        Wed, 17 Mar 2021 00:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615942785;
        bh=Iq5FXPDhFOfOwScZYi6m5AIIwfnC4IBfoCPjd3956Ms=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oFHpCuxnJBAS7vXewIXbvuwOd6Yd72SSrsBZ/B3EFe1NCxv2LfiXGgX07EjZI3Nnf
         iZQAFk9BgPVehCCDH/w830D+N6f+85+kB3w+E2his18xzii/j5dDbkZd6IB+FSS26Z
         1lY4AC/sfCxxZmBgLxBCeZ+4dNH8IbzXu+/sYtp4QafAkaZ66qy+GMxcEE+yP6w0uc
         4R39sd+TK3l0NnxLgqxSB4gxdGkdSA6PYlF9vbqoZYIOmRy/G6nrcJcDOHcYLEYhEg
         OV1yRmCPXqpqZ0YvW9nlKmQYEVWWOctJsXWrkqm6MzgdYFEO9Ec7aHZELj0hLSfjnx
         N2CgRcg4P73Hg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sergei Trofimovich <slyfox@gentoo.org>,
        "Dmitry V . Levin" <ldv@altlinux.org>,
        Oleg Nesterov <oleg@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-ia64@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 20/21] ia64: fix ia64_syscall_get_set_arguments() for break-based syscalls
Date:   Tue, 16 Mar 2021 20:59:19 -0400
Message-Id: <20210317005920.726931-20-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210317005920.726931-1-sashal@kernel.org>
References: <20210317005920.726931-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

From: Sergei Trofimovich <slyfox@gentoo.org>

[ Upstream commit 0ceb1ace4a2778e34a5414e5349712ae4dc41d85 ]

In https://bugs.gentoo.org/769614 Dmitry noticed that
`ptrace(PTRACE_GET_SYSCALL_INFO)` does not work for syscalls called via
glibc's syscall() wrapper.

ia64 has two ways to call syscalls from userspace: via `break` and via
`eps` instructions.

The difference is in stack layout:

1. `eps` creates simple stack frame: no locals, in{0..7} == out{0..8}
2. `break` uses userspace stack frame: may be locals (glibc provides
   one), in{0..7} == out{0..8}.

Both work fine in syscall handling cde itself.

But `ptrace(PTRACE_GET_SYSCALL_INFO)` uses unwind mechanism to
re-extract syscall arguments but it does not account for locals.

The change always skips locals registers. It should not change `eps`
path as kernel's handler already enforces locals=0 and fixes `break`.

Tested on v5.10 on rx3600 machine (ia64 9040 CPU).

Link: https://lkml.kernel.org/r/20210221002554.333076-1-slyfox@gentoo.org
Link: https://bugs.gentoo.org/769614
Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
Reported-by: Dmitry V. Levin <ldv@altlinux.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/ia64/kernel/ptrace.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/ia64/kernel/ptrace.c b/arch/ia64/kernel/ptrace.c
index 427cd565fd61..799400287cda 100644
--- a/arch/ia64/kernel/ptrace.c
+++ b/arch/ia64/kernel/ptrace.c
@@ -2147,27 +2147,39 @@ static void syscall_get_set_args_cb(struct unw_frame_info *info, void *data)
 {
 	struct syscall_get_set_args *args = data;
 	struct pt_regs *pt = args->regs;
-	unsigned long *krbs, cfm, ndirty;
+	unsigned long *krbs, cfm, ndirty, nlocals, nouts;
 	int i, count;
 
 	if (unw_unwind_to_user(info) < 0)
 		return;
 
+	/*
+	 * We get here via a few paths:
+	 * - break instruction: cfm is shared with caller.
+	 *   syscall args are in out= regs, locals are non-empty.
+	 * - epsinstruction: cfm is set by br.call
+	 *   locals don't exist.
+	 *
+	 * For both cases argguments are reachable in cfm.sof - cfm.sol.
+	 * CFM: [ ... | sor: 17..14 | sol : 13..7 | sof : 6..0 ]
+	 */
 	cfm = pt->cr_ifs;
+	nlocals = (cfm >> 7) & 0x7f; /* aka sol */
+	nouts = (cfm & 0x7f) - nlocals; /* aka sof - sol */
 	krbs = (unsigned long *)info->task + IA64_RBS_OFFSET/8;
 	ndirty = ia64_rse_num_regs(krbs, krbs + (pt->loadrs >> 19));
 
 	count = 0;
 	if (in_syscall(pt))
-		count = min_t(int, args->n, cfm & 0x7f);
+		count = min_t(int, args->n, nouts);
 
+	/* Iterate over outs. */
 	for (i = 0; i < count; i++) {
+		int j = ndirty + nlocals + i + args->i;
 		if (args->rw)
-			*ia64_rse_skip_regs(krbs, ndirty + i + args->i) =
-				args->args[i];
+			*ia64_rse_skip_regs(krbs, j) = args->args[i];
 		else
-			args->args[i] = *ia64_rse_skip_regs(krbs,
-				ndirty + i + args->i);
+			args->args[i] = *ia64_rse_skip_regs(krbs, j);
 	}
 
 	if (!args->rw) {
-- 
2.30.1

