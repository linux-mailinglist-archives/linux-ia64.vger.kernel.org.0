Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 354D15ED530
	for <lists+linux-ia64@lfdr.de>; Wed, 28 Sep 2022 08:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbiI1Gmw (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 28 Sep 2022 02:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbiI1Gl6 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 28 Sep 2022 02:41:58 -0400
Received: from conuserg-08.nifty.com (conuserg-08.nifty.com [210.131.2.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1E01D05E0;
        Tue, 27 Sep 2022 23:41:54 -0700 (PDT)
Received: from zoe.. (133-32-182-133.west.xps.vectant.ne.jp [133.32.182.133]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 28S6e0G9004120;
        Wed, 28 Sep 2022 15:40:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 28S6e0G9004120
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1664347209;
        bh=ZH9B9GLn1QpV0HvmQtr5Na/EeHUXAOG5jwJoV2sRUOk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LXREac42ecbunylv8eHPu7VSrlvxzMCNsrRxzXMEptfo32vPENb6qBHDr18EkPUbZ
         jSvWaVeDVRTUXXxOAHtMRAowlCngyvAza5F/CdepHRWShBXlAkWF5UiS2xE+Ok/Iyt
         Ko0YZ8ZSWf+ZVULZ/vZcNdIWziDTMoWNdtyO29z39e7/wGgCeYd5ia9tEJWHyvwzeJ
         98OZjrHesd69F9shnQ3v2cxA/cGBYlCHQ1xTPDD2Y4HY1bxygvD0OWpK5nvSQFyqxM
         dOl/nlZpqd8T6iHiqKlMmdxr4oDMLdoOTL88Gjy3TcpMkT+aIQC6BI/ycLD5nkvQhR
         ry5tljC7FeEyg==
X-Nifty-SrcIP: [133.32.182.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nicolas Pitre <npitre@baylibre.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Subject: [PATCH v3 8/8] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS without recursion
Date:   Wed, 28 Sep 2022 15:39:47 +0900
Message-Id: <20220928063947.299333-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928063947.299333-1-masahiroy@kernel.org>
References: <20220928063947.299333-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

When CONFIG_TRIM_UNUSED_KSYMS is enabled, Kbuild recursively traverses
the directory tree to determine which EXPORT_SYMBOL to trim. If an
EXPORT_SYMBOL turns out to be unused by anyone, Kbuild begins the
second traverse, where some source files are recompiled with their
EXPORT_SYMBOL() tuned into a no-op.

Linus stated a negative opinion about this slowness in commits:

 - 5cf0fd591f2e ("Kbuild: disable TRIM_UNUSED_KSYMS option")
 - a555bdd0c58c ("Kbuild: enable TRIM_UNUSED_KSYMS again, with some guarding")

We can do this better now. The final data structures of EXPORT_SYMBOL
are generated by the modpost stage, so modpost can selectively emit
KSYMTAB entries that are really used by modules.

Commit 2cce989f8461 ("kbuild: unify two modpost invocations") is another
ground-work to do this in a one-pass algorithm. With the list of modules,
modpost sets sym->used if it is used by a module. modpost emits KSYMTAB
only for symbols with sym->used==true.

BTW, Nicolas explained why the trimming was implemented with recursion:

  https://lore.kernel.org/all/2o2rpn97-79nq-p7s2-nq5-8p83391473r@syhkavp.arg/

Actually, we never achieved that level of optimization where the chain
reaction of trimming comes into play because:

 - CONFIG_LTO_CLANG cannot remove any unused symbols
 - CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is enabled only for vmlinux,
   but not modules

If deeper trimming is required, we need to revisit this, but I guess
that is unlikely to happen.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3:
  - Some cleanups

Changes in v2:
  - New patch

 .gitignore                  |  1 -
 Makefile                    | 19 +---------
 include/linux/export.h      | 41 ---------------------
 scripts/Makefile.build      |  7 ----
 scripts/Makefile.modpost    |  8 +++-
 scripts/adjust_autoksyms.sh | 73 -------------------------------------
 scripts/basic/fixdep.c      |  3 +-
 scripts/gen_autoksyms.sh    | 62 -------------------------------
 scripts/gen_ksymdeps.sh     | 30 ---------------
 scripts/mod/modpost.c       | 54 ++++++++++++++++++++++++---
 scripts/remove-stale-files  |  2 +
 11 files changed, 61 insertions(+), 239 deletions(-)
 delete mode 100755 scripts/adjust_autoksyms.sh
 delete mode 100755 scripts/gen_autoksyms.sh
 delete mode 100755 scripts/gen_ksymdeps.sh

diff --git a/.gitignore b/.gitignore
index 265959544978..a9b44cd36066 100644
--- a/.gitignore
+++ b/.gitignore
@@ -103,7 +103,6 @@ modules.order
 #
 /include/config/
 /include/generated/
-/include/ksym/
 /arch/*/include/generated/
 
 # stgit generated dirs
diff --git a/Makefile b/Makefile
index 79488f155fae..31dcde4c7fc5 100644
--- a/Makefile
+++ b/Makefile
@@ -1120,28 +1120,13 @@ endif
 export KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
-# Recurse until adjust_autoksyms.sh is satisfied
-PHONY += autoksyms_recursive
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 # For the kernel to actually contain only the needed exported symbols,
 # we have to build modules as well to determine what those symbols are.
 # (this can be evaluated only once include/config/auto.conf has been included)
 KBUILD_MODULES := 1
-
-autoksyms_recursive: $(build-dir) modules.order
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
-	  "$(MAKE) -f $(srctree)/Makefile autoksyms_recursive"
 endif
 
-autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
-
-quiet_cmd_autoksyms_h = GEN     $@
-      cmd_autoksyms_h = mkdir -p $(dir $@); \
-			$(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@
-
-$(autoksyms_h):
-	$(call cmd,autoksyms_h)
-
 # '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
 quiet_cmd_ar_vmlinux.a = AR      $@
       cmd_ar_vmlinux.a = \
@@ -1154,7 +1139,7 @@ vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
 	$(call if_changed,ar_vmlinux.a)
 
 PHONY += vmlinux_o
-vmlinux_o: autoksyms_recursive vmlinux.a $(KBUILD_VMLINUX_LIBS)
+vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_o
 
 vmlinux.o modules.builtin.modinfo modules.builtin: vmlinux_o
@@ -1191,7 +1176,7 @@ scripts: scripts_basic scripts_dtc
 PHONY += prepare archprepare
 
 archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
-	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h \
+	asm-generic $(version_h) include/generated/utsrelease.h \
 	include/generated/compile.h include/generated/autoconf.h remove-stale-files
 
 prepare0: archprepare
diff --git a/include/linux/export.h b/include/linux/export.h
index 0c71577cf8bb..d9fb1ebb535c 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -63,47 +63,6 @@ extern struct module __this_module;
  */
 #define __EXPORT_SYMBOL(sym, sec, ns)
 
-#elif defined(CONFIG_TRIM_UNUSED_KSYMS)
-
-#include <generated/autoksyms.h>
-
-/*
- * For fine grained build dependencies, we want to tell the build system
- * about each possible exported symbol even if they're not actually exported.
- * We use a symbol pattern __ksym_marker_<symbol> that the build system filters
- * from the $(NM) output (see scripts/gen_ksymdeps.sh). These symbols are
- * discarded in the final link stage.
- */
-
-#ifdef __ASSEMBLY__
-
-#define __ksym_marker(sym)					\
-	.section ".discard.ksym","a" ;				\
-__ksym_marker_##sym: ;						\
-	.previous
-
-#else
-
-#define __ksym_marker(sym)	\
-	static int __ksym_marker_##sym[0] __section(".discard.ksym") __used
-
-#endif
-
-#define __EXPORT_SYMBOL(sym, sec, ns)					\
-	__ksym_marker(sym);						\
-	__cond_export_sym(sym, sec, ns, __is_defined(__KSYM_##sym))
-#define __cond_export_sym(sym, sec, ns, conf)				\
-	___cond_export_sym(sym, sec, ns, conf)
-#define ___cond_export_sym(sym, sec, ns, enabled)			\
-	__cond_export_sym_##enabled(sym, sec, ns)
-#define __cond_export_sym_1(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
-
-#ifdef __GENKSYMS__
-#define __cond_export_sym_0(sym, sec, ns) __GENKSYMS_EXPORT_SYMBOL(sym)
-#else
-#define __cond_export_sym_0(sym, sec, ns) /* nothing */
-#endif
-
 #else
 
 #define __EXPORT_SYMBOL(sym, sec, ns)	___EXPORT_SYMBOL(sym, sec, ns)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4c1d0bd1bc03..64f652b03d29 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -218,16 +218,10 @@ is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(basetar
 
 $(obj)/%.o: objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
 
-ifdef CONFIG_TRIM_UNUSED_KSYMS
-cmd_gen_ksymdeps = \
-	$(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
-endif
-
 cmd_check_local_export = $(srctree)/scripts/check-local-export $@
 
 define rule_cc_o_c
 	$(call cmd_and_fixdep,cc_o_c)
-	$(call cmd,gen_ksymdeps)
 	$(call cmd,check_local_export)
 	$(call cmd,checksrc)
 	$(call cmd,checkdoc)
@@ -238,7 +232,6 @@ endef
 
 define rule_as_o_S
 	$(call cmd_and_fixdep,as_o_S)
-	$(call cmd,gen_ksymdeps)
 	$(call cmd,check_local_export)
 	$(call cmd,gen_objtooldep)
 	$(call cmd,gen_symversions_S)
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 7740ce3b29e8..555b9e741a01 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -86,6 +86,12 @@ output-symdump := $(if $(vmlinux.o-if-present), Module.symvers, modules-only.sym
 missing-input := $(filter-out $(vmlinux.o-if-present),vmlinux.o)
 endif
 
+ifdef CONFIG_TRIM_UNUSED_KSYMS
+ksym-wl := $(CONFIG_UNUSED_KSYMS_WHITELIST)
+ksym-wl := $(if $(filter-out /%, $(ksym-wl)),$(srctree)/)$(ksym-wl)
+modpost-args += -t $(addprefix -W, $(ksym-wl))
+endif
+
 else
 
 # set src + obj - they may be used in the modules's Makefile
@@ -122,7 +128,7 @@ quiet_cmd_modpost = MODPOST $@
 	sed 's/ko$$/o/' $(or $(modorder-if-needed), /dev/null) | $(MODPOST) $(modpost-args) $(vmlinux.o-if-present) -T -
 
 targets += $(output-symdump)
-$(output-symdump): $(modorder-if-needed) $(vmlinux.o-if-present) $(moudle.symvers-if-present) $(MODPOST) FORCE
+$(output-symdump): $(modorder-if-needed) $(vmlinux.o-if-present) $(moudle.symvers-if-present) $(MODPOST) $(ksym-wl) FORCE
 	$(call if_changed,modpost)
 
 __modpost: $(output-symdump)
diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
deleted file mode 100755
index f1b5ac818411..000000000000
--- a/scripts/adjust_autoksyms.sh
+++ /dev/null
@@ -1,73 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0-only
-
-# Script to update include/generated/autoksyms.h and dependency files
-#
-# Copyright:	(C) 2016  Linaro Limited
-# Created by:	Nicolas Pitre, January 2016
-#
-
-# Update the include/generated/autoksyms.h file.
-#
-# For each symbol being added or removed, the corresponding dependency
-# file's timestamp is updated to force a rebuild of the affected source
-# file. All arguments passed to this script are assumed to be a command
-# to be exec'd to trigger a rebuild of those files.
-
-set -e
-
-cur_ksyms_file="include/generated/autoksyms.h"
-new_ksyms_file="include/generated/autoksyms.h.tmpnew"
-
-info() {
-	if [ "$quiet" != "silent_" ]; then
-		printf "  %-7s %s\n" "$1" "$2"
-	fi
-}
-
-info "CHK" "$cur_ksyms_file"
-
-# Use "make V=1" to debug this script.
-case "$KBUILD_VERBOSE" in
-*1*)
-	set -x
-	;;
-esac
-
-# Generate a new symbol list file
-$CONFIG_SHELL $srctree/scripts/gen_autoksyms.sh --modorder "$new_ksyms_file"
-
-# Extract changes between old and new list and touch corresponding
-# dependency files.
-changed=$(
-count=0
-sort "$cur_ksyms_file" "$new_ksyms_file" | uniq -u |
-sed -n 's/^#define __KSYM_\(.*\) 1/\1/p' |
-while read sympath; do
-	if [ -z "$sympath" ]; then continue; fi
-	depfile="include/ksym/${sympath}"
-	mkdir -p "$(dirname "$depfile")"
-	touch "$depfile"
-	# Filesystems with coarse time precision may create timestamps
-	# equal to the one from a file that was very recently built and that
-	# needs to be rebuild. Let's guard against that by making sure our
-	# dep files are always newer than the first file we created here.
-	while [ ! "$depfile" -nt "$new_ksyms_file" ]; do
-		touch "$depfile"
-	done
-	echo $((count += 1))
-done | tail -1 )
-changed=${changed:-0}
-
-if [ $changed -gt 0 ]; then
-	# Replace the old list with tne new one
-	old=$(grep -c "^#define __KSYM_" "$cur_ksyms_file" || true)
-	new=$(grep -c "^#define __KSYM_" "$new_ksyms_file" || true)
-	info "KSYMS" "symbols: before=$old, after=$new, changed=$changed"
-	info "UPD" "$cur_ksyms_file"
-	mv -f "$new_ksyms_file" "$cur_ksyms_file"
-	# Then trigger a rebuild of affected source files
-	exec $@
-else
-	rm -f "$new_ksyms_file"
-fi
diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 2328f9a641da..e7db12140d87 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -243,8 +243,7 @@ static void *read_file(const char *filename)
 /* Ignore certain dependencies */
 static int is_ignored_file(const char *s, int len)
 {
-	return str_ends_with(s, len, "include/generated/autoconf.h") ||
-	       str_ends_with(s, len, "include/generated/autoksyms.h");
+	return str_ends_with(s, len, "include/generated/autoconf.h");
 }
 
 /*
diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
deleted file mode 100755
index 653fadbad302..000000000000
--- a/scripts/gen_autoksyms.sh
+++ /dev/null
@@ -1,62 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0-only
-
-# Create an autoksyms.h header file from the list of all module's needed symbols
-# as recorded in *.usyms files and the user-provided symbol whitelist.
-
-set -e
-
-# Use "make V=1" to debug this script.
-case "$KBUILD_VERBOSE" in
-*1*)
-	set -x
-	;;
-esac
-
-read_modorder=
-
-if [ "$1" = --modorder ]; then
-	shift
-	read_modorder=1
-fi
-
-output_file="$1"
-
-needed_symbols=
-
-# Special case for modversions (see modpost.c)
-if grep -q "^CONFIG_MODVERSIONS=y$" include/config/auto.conf; then
-	needed_symbols="$needed_symbols module_layout"
-fi
-
-ksym_wl=$(sed -n 's/^CONFIG_UNUSED_KSYMS_WHITELIST=\(.*\)$/\1/p' include/config/auto.conf)
-if [ -n "$ksym_wl" ]; then
-	[ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
-	if [ ! -f "$ksym_wl" ] || [ ! -r "$ksym_wl" ]; then
-		echo "ERROR: '$ksym_wl' whitelist file not found" >&2
-		exit 1
-	fi
-fi
-
-# Generate a new ksym list file with symbols needed by the current
-# set of modules.
-cat > "$output_file" << EOT
-/*
- * Automatically generated file; DO NOT EDIT.
- */
-
-EOT
-
-{
-	[ -n "${read_modorder}" ] && sed 's/ko$/usyms/' modules.order | xargs cat
-	echo "$needed_symbols"
-	[ -n "$ksym_wl" ] && cat "$ksym_wl"
-} | sed -e 's/ /\n/g' | sed -n -e '/^$/!p' |
-# Remove the dot prefix for ppc64; symbol names with a dot (.) hold entry
-# point addresses.
-sed -e 's/^\.//' |
-sort -u |
-# Ignore __this_module. It's not an exported symbol, and will be resolved
-# when the final .ko's are linked.
-grep -v '^__this_module$' |
-sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
diff --git a/scripts/gen_ksymdeps.sh b/scripts/gen_ksymdeps.sh
deleted file mode 100755
index 8ee533f33659..000000000000
--- a/scripts/gen_ksymdeps.sh
+++ /dev/null
@@ -1,30 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-set -e
-
-# List of exported symbols
-#
-# If the object has no symbol, $NM warns 'no symbols'.
-# Suppress the stderr.
-# TODO:
-#   Use -q instead of 2>/dev/null when we upgrade the minimum version of
-#   binutils to 2.37, llvm to 13.0.0.
-ksyms=$($NM $1 2>/dev/null | sed -n 's/.*__ksym_marker_\(.*\)/\1/p')
-
-if [ -z "$ksyms" ]; then
-	exit 0
-fi
-
-echo
-echo "ksymdeps_$1 := \\"
-
-for s in $ksyms
-do
-	printf '    $(wildcard include/ksym/%s) \\\n' "$s"
-done
-
-echo
-echo "$1: \$(ksymdeps_$1)"
-echo
-echo "\$(ksymdeps_$1):"
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 90733664a602..1e9eba0a6cec 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -34,6 +34,9 @@ static bool warn_unresolved;
 
 static int sec_mismatch_count;
 static bool sec_mismatch_warn_only = true;
+/* Trim EXPORT_SYMBOLs that are unused by in-tree modules */
+static bool trim_unused_exports;
+
 /* ignore missing files */
 static bool ignore_missing_files;
 /* If set to 1, only warn (instead of error) about missing ns imports */
@@ -216,6 +219,7 @@ struct symbol {
 	bool weak;
 	bool is_func;
 	bool is_gpl_only;	/* exported by EXPORT_SYMBOL_GPL */
+	bool used;		/* there exists a user of this symbol */
 	char name[];
 };
 
@@ -1872,6 +1876,7 @@ static void check_exports(struct module *mod)
 			continue;
 		}
 
+		exp->used = true;
 		s->module = exp->module;
 		s->crc_valid = exp->crc_valid;
 		s->crc = exp->crc;
@@ -1895,6 +1900,23 @@ static void check_exports(struct module *mod)
 	}
 }
 
+static void handle_white_list_exports(const char *white_list)
+{
+	char *buf, *p, *name;
+
+	buf = read_text_file(white_list);
+	p = buf;
+
+	while ((name = strsep(&p, "\n"))) {
+		struct symbol *sym = find_symbol(name);
+
+		if (sym)
+			sym->used = true;
+	}
+
+	free(buf);
+}
+
 static void check_modname_len(struct module *mod)
 {
 	const char *mod_name;
@@ -1965,10 +1987,14 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 
 	/* generate struct for exported symbols */
 	buf_printf(buf, "\n");
-	list_for_each_entry(sym, &mod->exported_symbols, list)
+	list_for_each_entry(sym, &mod->exported_symbols, list) {
+		if (trim_unused_exports && !sym->used)
+			continue;
+
 		buf_printf(buf, "KSYMTAB_%s(%s, \"%s\", \"%s\");\n",
 			   sym->is_func ? "FUNC" : "DATA", sym->name,
 			   sym->is_gpl_only ? "_gpl" : "", sym->namespace);
+	}
 
 	if (!modversions)
 		return;
@@ -1976,6 +2002,9 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 	/* record CRCs for exported symbols */
 	buf_printf(buf, "\n");
 	list_for_each_entry(sym, &mod->exported_symbols, list) {
+		if (trim_unused_exports && !sym->used)
+			continue;
+
 		if (!sym->crc_valid)
 			warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n"
 			     "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
@@ -2139,9 +2168,6 @@ static void write_mod_c_file(struct module *mod)
 	char fname[PATH_MAX];
 	int ret;
 
-	check_modname_len(mod);
-	check_exports(mod);
-
 	add_header(&buf, mod);
 	add_exported_symbols(&buf, mod);
 	add_versions(&buf, mod);
@@ -2275,12 +2301,13 @@ int main(int argc, char **argv)
 {
 	struct module *mod;
 	char *missing_namespace_deps = NULL;
+	char *unused_exports_white_list = NULL;
 	char *dump_write = NULL, *files_source = NULL;
 	int opt;
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:mntT:tW:o:awENd:")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2305,6 +2332,12 @@ int main(int argc, char **argv)
 		case 'T':
 			files_source = optarg;
 			break;
+		case 't':
+			trim_unused_exports = true;
+			break;
+		case 'W':
+			unused_exports_white_list = optarg;
+			break;
 		case 'w':
 			warn_unresolved = true;
 			break;
@@ -2334,6 +2367,17 @@ int main(int argc, char **argv)
 	if (files_source)
 		read_symbols_from_files(files_source);
 
+	list_for_each_entry(mod, &modules, list) {
+		if (mod->from_dump || mod->is_vmlinux)
+			continue;
+
+		check_modname_len(mod);
+		check_exports(mod);
+	}
+
+	if (unused_exports_white_list)
+		handle_white_list_exports(unused_exports_white_list);
+
 	list_for_each_entry(mod, &modules, list) {
 		if (mod->from_dump)
 			continue;
diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
index ccadfa3afb2b..d2009eda270a 100755
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@ -47,3 +47,5 @@ rm -f arch/riscv/purgatory/kexec-purgatory.c
 rm -f scripts/extract-cert
 
 rm -f arch/x86/purgatory/kexec-purgatory.c
+
+rm -rf include/ksym
-- 
2.34.1

