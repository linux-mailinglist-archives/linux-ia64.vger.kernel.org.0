Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E733069AF
	for <lists+linux-ia64@lfdr.de>; Thu, 28 Jan 2021 02:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhA1BJr (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 27 Jan 2021 20:09:47 -0500
Received: from condef-05.nifty.com ([202.248.20.70]:42124 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbhA1BHb (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 27 Jan 2021 20:07:31 -0500
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-05.nifty.com with ESMTP id 10S109kL032536;
        Thu, 28 Jan 2021 10:00:09 +0900
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 10S0pjIp024172;
        Thu, 28 Jan 2021 09:52:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIp024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611795132;
        bh=xnCcs8cQeR65mYxAXRygpHq8fmY2l/DPGOA0eURTtGA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VQa61D2eVbJw2ph1el2FGgGaJxIZhTCwKDjS93z6VreXDeEVdv1BIWZ319QP+f9Rg
         RaGoFRLKQreVHJMFk/1iHmEVehSzqHFRnbMsQA6XCN/iQHushaVrs0CcY3RrPWmqss
         B8DKCI6QCjC/JXg8fggksARVTZ/O/2J/vJxJyBB+zihDlB3oRMCZAJrCmE+Ewx0zxE
         +VxlLoy0jMAJsjcYLb7KVf29RVO2GY7ryj7hLajKflcY9MshzRU3/uZwU7L4vCgdrJ
         OxtMwM2QAyL4gW4ghKiR/OAFq19C0s+CcBoxczjPb1vSrE4YsxbUO88QK9pX1ff8on
         CTed2kNOJhqJQ==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-arch@vger.kernel.org, x86@kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 20/27] sh: syscalls: switch to generic syscalltbl.sh
Date:   Thu, 28 Jan 2021 09:51:02 +0900
Message-Id: <20210128005110.2613902-21-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210128005110.2613902-1-masahiroy@kernel.org>
References: <20210128005110.2613902-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

As of v5.11-rc1, 12 architectures duplicate similar shell scripts in
order to generate syscall table headers. My goal is to unify them into
the single scripts/syscalltbl.sh.

This commit converts sh to use scripts/syscalltbl.sh.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/sh/kernel/syscalls/Makefile      |  7 ++----
 arch/sh/kernel/syscalls/syscalltbl.sh | 32 ---------------------------
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 arch/sh/kernel/syscalls/syscalltbl.sh

diff --git a/arch/sh/kernel/syscalls/Makefile b/arch/sh/kernel/syscalls/Makefile
index 1c42d2d2926d..6610130c67bc 100644
--- a/arch/sh/kernel/syscalls/Makefile
+++ b/arch/sh/kernel/syscalls/Makefile
@@ -7,7 +7,7 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 
 syscall := $(srctree)/$(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
-systbl := $(srctree)/$(src)/syscalltbl.sh
+systbl := $(srctree)/scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'	\
@@ -16,10 +16,7 @@ quiet_cmd_syshdr = SYSHDR  $@
 		   '$(syshdr_offset_$(basetarget))'
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) '$(systbl)' '$<' '$@'	\
-		   '$(systbl_abis_$(basetarget))'		\
-		   '$(systbl_abi_$(basetarget))'		\
-		   '$(systbl_offset_$(basetarget))'
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
 
 $(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
diff --git a/arch/sh/kernel/syscalls/syscalltbl.sh b/arch/sh/kernel/syscalls/syscalltbl.sh
deleted file mode 100644
index 904b8e6e625d..000000000000
--- a/arch/sh/kernel/syscalls/syscalltbl.sh
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-out="$2"
-my_abis=`echo "($3)" | tr ',' '|'`
-my_abi="$4"
-offset="$5"
-
-emit() {
-	t_nxt="$1"
-	t_nr="$2"
-	t_entry="$3"
-
-	while [ $t_nxt -lt $t_nr ]; do
-		printf "__SYSCALL(%s,sys_ni_syscall)\n" "${t_nxt}"
-		t_nxt=$((t_nxt+1))
-	done
-	printf "__SYSCALL(%s,%s)\n" "${t_nxt}" "${t_entry}"
-}
-
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-	nxt=0
-	if [ -z "$offset" ]; then
-		offset=0
-	fi
-
-	while read nr abi name entry ; do
-		emit $((nxt+offset)) $((nr+offset)) $entry
-		nxt=$((nr+1))
-	done
-) > "$out"
-- 
2.27.0

