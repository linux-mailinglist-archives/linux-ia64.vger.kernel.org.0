Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77E0C5242FD
	for <lists+linux-ia64@lfdr.de>; Thu, 12 May 2022 05:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243950AbiELDGi (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 11 May 2022 23:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244622AbiELDGg (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 11 May 2022 23:06:36 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21CD437A9F
        for <linux-ia64@vger.kernel.org>; Wed, 11 May 2022 20:06:36 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id n18so3654896plg.5
        for <linux-ia64@vger.kernel.org>; Wed, 11 May 2022 20:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q3LXYtg8ORAB5uik5Rjyr3/UH71sa9rEUO3WBOMkdVU=;
        b=C0mVnW5JgPlXhJECR44/UGE9jXccGtfJv3MlhLbc0hNz+D0xl/7xWgwuK9N0QC2PQT
         p/uEJmCRH3J5U3sPHjdg0/rVqbm3A9KFkIRqkpkuKPXblJaOo9HknUeHjA6bgtasSJKq
         Jcw8NGfwEGy/KzGjbTBWAayh3yBU72ufAnzhLXsUkNfgzrqQPA0Qnp+UgQYVF3UPd+4h
         FiNJ/Buq1TtGCdDFO46zm6GkewkuNS6YYiVi3rmCnZwGqn7r0hqM9574sd3VbvGN5n+n
         3N0uJ3bBojCB/I7UqlXPgHiyy64ecohWddN0lDd1dX1/ca9BjQY2hS4WCD0ibWU/Cbpv
         2DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q3LXYtg8ORAB5uik5Rjyr3/UH71sa9rEUO3WBOMkdVU=;
        b=BPEoYwjDHhtOwmdOnyJmOyjbzjMms/jjew9gdVpX490G6wBK0p5wAdnr41vHA4owJB
         S7hTwQUP+VfXBA2gLNcWP8orq8U/OfAI7g2HL6WpXXzpm7vIJwIFFF/5RPP78ZuI5rvZ
         nTlif5vCj+fWJlSFAZ8AhGcYg2JmGKejTlt2dFBzhPktCjXw+HWkgE4N++StQe0MBvUl
         JyOvtK7kTEnlEmwPtWGgJTiN4w2usZ2W2QIV3pTHWuyW7HZbENQ4wo0vQZD/M3MlZrgB
         PktmK+ce07za4sjiCO9lhqdQQnxpf+FqQEFKc374qUWSkKnCSOpkYKo+mD3wWyJ7Ol61
         DwUQ==
X-Gm-Message-State: AOAM5303sqwcV3FOlakdEWprJDbzCEwFWqnoH7py1Jfxw/tRQhf2EC/5
        rRPpyzbGQD8zumOT6VVLC3U7o0Elxg==
X-Google-Smtp-Source: ABdhPJzSDvbkoRVDLCCgjydodd9Q9J7F42xQBw5F3TLbBv+zEF/cBpxaXThnznWvvl1zamBJDHaz6g==
X-Received: by 2002:a17:903:292:b0:15f:171:e794 with SMTP id j18-20020a170903029200b0015f0171e794mr21024775plr.107.1652324795402;
        Wed, 11 May 2022 20:06:35 -0700 (PDT)
Received: from piliu.users.ipa.redhat.com ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id e13-20020aa7980d000000b0050dc762815bsm2488162pfl.53.2022.05.11.20.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 20:06:34 -0700 (PDT)
From:   Pingfan Liu <kernelfans@gmail.com>
To:     linux-ia64@vger.kernel.org
Cc:     Pingfan Liu <kernelfans@gmail.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Baokun Li <libaokun1@huawei.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        kexec@lists.infradead.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kees Cook <keescook@chromium.org>,
        Jens Axboe <axboe@kernel.dk>,
        Russell King <linux@armlinux.org.uk>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCHv4 0/2] cpu/hotplug: Keep cpu hotplug disabled until the rebooting cpu is stable
Date:   Thu, 12 May 2022 11:06:17 +0800
Message-Id: <20220512030619.13426-1-kernelfans@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

For the architectures (arm/arm64/ia64/riscv), which relies on the cpu
hot-removing mechanism to implement "kexec -e", it is important to
ensure that the rebooting happens on a valid online cpu. And this logic
should have been guaranteed in migrate_to_reboot_cpu().

But the current code has either contradict (resolved by [2/2]) or
redundancy (resolved by [1/2]) about the logic.


V3 -> V4:
Fix the cpu hotplug enable before kexec-rebooting in powerpc.
Improve commit log and the code's note.

V2 -> V3:
Taking in [2/2], which also has problem with the valid rebooting
cpu. (I had sent three patches for different arches. But maybe it is
better to collapse them into one and collect acks from different arches'
maintainers )

Cc: Eric Biederman <ebiederm@xmission.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vincent Donnefort <vincent.donnefort@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>
Cc: Baokun Li <libaokun1@huawei.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: kexec@lists.infradead.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Jens Axboe <axboe@kernel.dk>
To: linux-ia64@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>
Cc: Guenter Roeck <linux@roeck-us.net>

Pingfan Liu (2):
  cpu/hotplug: Keep cpu hotplug disabled until the rebooting cpu is
    stable
  cpu/hotplug: Remove the input parameter primary_cpu of
    smp_shutdown_nonboot_cpus()

 arch/arm/kernel/reboot.c          |  2 +-
 arch/arm64/kernel/process.c       |  2 +-
 arch/ia64/kernel/process.c        |  2 +-
 arch/powerpc/kexec/core_64.c      |  1 +
 arch/riscv/kernel/machine_kexec.c |  2 +-
 include/linux/cpu.h               |  4 ++--
 kernel/cpu.c                      | 14 +++++++-------
 kernel/kexec_core.c               | 11 +++++------
 8 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.31.1

