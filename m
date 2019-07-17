Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9EA46B34C
	for <lists+linux-ia64@lfdr.de>; Wed, 17 Jul 2019 03:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfGQB3W (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 16 Jul 2019 21:29:22 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34850 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfGQB3T (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 16 Jul 2019 21:29:19 -0400
Received: by mail-pg1-f195.google.com with SMTP id s1so3995163pgr.2
        for <linux-ia64@vger.kernel.org>; Tue, 16 Jul 2019 18:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding:cc:from:to;
        bh=Zt2cGhW98jjWE3OdliFocFdkTeCj4B287sEGZ0SpTug=;
        b=LRzFJFoIhdEmL95807L32ZJIuoUYPRnejcM4WZZAS5I0UeznU/mAzk5GHoafmOmsHO
         IM1q2PeVsvlEPnevADzvUbNh7W588och2Rq5fZ7FuM8MS5EZgdQu/E3L+BqIYSfN2XU/
         fS7NBtFCaQBxI26WtshKHqrbJwSXRxg0DRH2E+7ihFfC5kinDvs9QAQl4LeKl3WMrLal
         EZk+GjuTQmWvWRkiN6fD0Uh9EK++IoK7hPKkpfs3WJ+9PYY0m//oOKVgI1hVB+8KwfWp
         /ROJj7wU7v2lVN33h5c47bRwWtpAubgsifHDAD3lPqVXVzkWPuUCHQEfzucJpkMLwZmo
         z7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:cc:from:to;
        bh=Zt2cGhW98jjWE3OdliFocFdkTeCj4B287sEGZ0SpTug=;
        b=CF8q1uqij9WVQt/BllcOV25sfbGbdt7a2sHpgZBitdWazfsZKDSMrUrJO/W/CuvGxp
         2Ugt0LVOTYekXw8eGK+LJye3xUulr8l8EliQEUo0KyiEKOX/XYVtVnURngV7deFEFZcO
         +zMOuR6JOiClJNoZrp6vJGN4VQzAf3lLMWoMWfGooeI0Cwm1SJxNlM764Yt7uiB9PeP2
         K0s5sPVSKO3W7NWs1hfSpHMxZShNVU3e4NBv4Jsv95Nqcjy25lTA/cfFnbSFk9FQCsev
         +fjIn7EZFlNSixKQd5SI0f6GZmlOmfI3TVuQzjJ7p9QXv68bGuQAWhqWiBq5dFPO3VOS
         6O+w==
X-Gm-Message-State: APjAAAWybrIELNAxV1ydRTUS9xXdLKW7uZ3oe7EjOSZM5sBZjQ8pQnhH
        3g3BqaTbPynXi5FQeyT5jddkuw==
X-Google-Smtp-Source: APXvYqxMG1qk1WTJLj8KetMfpnmMGNIO6J68LTkGZfygoiTvSJog6FgoAv0IrheBQXCx4vxGr6+m3Q==
X-Received: by 2002:a63:e5a:: with SMTP id 26mr36209824pgo.3.1563326958663;
        Tue, 16 Jul 2019 18:29:18 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id i3sm23567398pfo.138.2019.07.16.18.29.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 18:29:17 -0700 (PDT)
Subject: [PATCH v2 4/4] tools: Add fchmodat4
Date:   Tue, 16 Jul 2019 18:27:19 -0700
Message-Id: <20190717012719.5524-5-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190717012719.5524-1-palmer@sifive.com>
References: <20190717012719.5524-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
        linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        tony.luck@intel.com, fenghua.yu@intel.com, geert@linux-m68k.org,
        monstr@monstr.eu, ralf@linux-mips.org, paul.burton@mips.com,
        jhogan@kernel.org, James.Bottomley@HansenPartnership.com,
        deller@gmx.de, benh@kernel.crashing.org, paulus@samba.org,
        mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, ysato@users.sourceforge.jp,
        dalias@libc.org, davem@davemloft.net, luto@kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        peterz@infradead.org, acme@kernel.org,
        alexander.shishkin@linux.intel.com, jolsa@redhat.com,
        namhyung@kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        dhowells@redhat.com, firoz.khan@linaro.org, stefan@agner.ch,
        schwidefsky@de.ibm.com, axboe@kernel.dk, christian@brauner.io,
        hare@suse.com, deepa.kernel@gmail.com, tycho@tycho.ws,
        kim.phillips@arm.com, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
From:   Palmer Dabbelt <palmer@sifive.com>
To:     viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

I'm not sure why it's necessary to add this explicitly to tools/ as well
as arch/, but there were a few instances of fspick in here so I blindly
added fchmodat4 in the same fashion.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 tools/include/uapi/asm-generic/unistd.h           | 4 +++-
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
index a87904daf103..36232ea94956 100644
--- a/tools/include/uapi/asm-generic/unistd.h
+++ b/tools/include/uapi/asm-generic/unistd.h
@@ -844,9 +844,11 @@ __SYSCALL(__NR_fsconfig, sys_fsconfig)
 __SYSCALL(__NR_fsmount, sys_fsmount)
 #define __NR_fspick 433
 __SYSCALL(__NR_fspick, sys_fspick)
+#define __NR_fchmodat4 434
+__SYSCALL(__NR_fchmodat4, sys_fchmodat4)
 
 #undef __NR_syscalls
-#define __NR_syscalls 434
+#define __NR_syscalls 435
 
 /*
  * 32 bit systems traditionally used different
diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
index b4e6f9e6204a..b92d5b195e66 100644
--- a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
@@ -355,6 +355,7 @@
 431	common	fsconfig		__x64_sys_fsconfig
 432	common	fsmount			__x64_sys_fsmount
 433	common	fspick			__x64_sys_fspick
+434	common	fchmodat4		__x64_sys_fchmodat4
 
 #
 # x32-specific system call numbers start at 512 to avoid cache impact
-- 
2.21.0

