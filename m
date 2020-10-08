Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3701E28798E
	for <lists+linux-ia64@lfdr.de>; Thu,  8 Oct 2020 18:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731566AbgJHQAh (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 8 Oct 2020 12:00:37 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:36217 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731586AbgJHPyJ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 8 Oct 2020 11:54:09 -0400
Received: from localhost.localdomain ([192.30.34.233]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M7KKA-1kIpyQ2KzM-007kBr; Thu, 08 Oct 2020 17:47:15 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        Philip Blundell <philb@gnu.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/13] Clean up legacy clock tick users
Date:   Thu,  8 Oct 2020 17:46:38 +0200
Message-Id: <20201008154651.1901126-1-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ToCg0sXzfof6vBLW0FBjjVXywAK/gLyirWECWdzB4HS8Fcsvfc3
 KICej28tXkzfQ4JRGwmkABm7jfD+Q1lU1BJw7T0Lwpe5f+9kcKbUsHe20Hl/PaNGaJm7f64
 vzJ+b6TvkgNmTNmKF4q0otuZPBYaKl04cVbqXwwhtpd4LjYBTPzdyr5BMwVWRMEtd03OY9O
 9R1EBRW62aNmSfzzkZ7hQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5QYMpuw53a0=:Nmr8l2BrS2cX0i7XGyxDvn
 RWWj3d3Ux7W86vGYC9RQ0cJZqa9eGcdgxkhsum1ZRlitSAow5UUl2pHX9sIznxToUmbwxsjvY
 yHdEJj75uCeh1XZhmVXb84ZWSPvxO1PVk6i0TMksKBV3HyKltd8J7Ah+pORnPW2mknLleHpMn
 wKQD/R1bTox6YmCapGdYiPw7aDa4LnkeTzS/qYP1ksSsl9SIC/8mad1AoohjwHPWc/HwuVRQ4
 nz9z6/6QGpXpey91l/qBc4OIexy8ATGeIzUs1JRZM7kFCDzGMtk03O7SOnc8a4psUZObUBchs
 8hTi2Q3UmZL2v2nS5TsYw9TWBFfNoTY4Z0oo9sqJbrULnN+JPcueoiZj0UTUHVETPH643Sy1O
 B884UhnB6EBCU+knBABsoXRZHF95KnaOMsrjKjjdxku0kZUAv/+ExMVtsB3B32Cjvo7raO+n8
 BVCVzR5gNW70SXdWLodu88AIYcxkJ6wafgleKKdDnYOY+MfMZ9oHk8eovPnxth6/QN1b7eoB5
 pJtmmKDIDjFDUTvVwYLSWy/IHy/dJPionuKh/lWyKEdzJmW2b9U8CHsR/dSZA4GkZQ+i4B1Gg
 XEXG7Ekc5S1UnlPxDoNlpSAjSRLT7Q6S9p8Lp1jdHfUxck3IjZeUTSiztN1KlM7Z5bfXLU8Xh
 Hb/YnrIeSEYj+t0qPC0ZkTNDAQC/qQX/piMqofdO7ZOKByAxggyCfSt8WltH7j9M8LNZ7e1T8
 UMGRA37vfDl+FVLp0c6x6TjIELKvcgHRFhG4HtSzu7qDQOG5yfuTlZUFQHj9UQ6zw/tJd5ZRa
 OH5lEx1f99gBfKgPZAW1FxTF3ziPKz0Z9q0UH+WFgwGc5o8ASf3srsUmvQ8Fs2TM4CGbKrh
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

When I created the patch removing CONFIG_ARCH_GETTIMEOFFSET,
I also had a look at CONFIG_GENERIC_CLOCKEVENTS, which is
selected by most, but not all, platforms today, each of the
ones that lack it doing the timer tick slightly differently.

The cleanups here make the old platforms a bit more
consistent, in multiple ways:

- rather than selecting GENERIC_CLOCKEVENTS on modern
  platforms, select LEGACY_TIMER_TICK on the old ones.

- Hide some more of the internal implementation and only
  provide a single common entry point for the timer tick,
  which also makes the behavior more consistent.

- Remove the m68k and arm specific infrastructure pieces
  and call the common helper directly from each timer
  interrupt function.

I tested the series on m68k with the qemu q800 target
platform, both with the legacy_timer_tick() implementation
and after converting that to a periodic clockevent driver.

     Arnd

Arnd Bergmann (13):
  timekeeping: add CONFIG_LEGACY_TIMER_TICK
  ia64: convert to legacy_timer_tick
  ARM: rpc: use legacy_timer_tick
  parisc: use legacy_timer_tick
  m68k: coldfire: use legacy_timer_tick()
  m68k: split heartbeat out of timer function
  m68k: sun3/sun3c: use legacy_timer_tick
  m68k: m68328: use legacy_timer_tick()
  m68k: change remaining timers to legacy_timer_tick
  m68k: remove timer_interrupt() function
  timekeeping: remove xtime_update
  timekeeping: default GENERIC_CLOCKEVENTS to enabled
  [RFC] m68k: mac: convert to generic clockevent

 .../time/clockevents/arch-support.txt         |  8 ++--
 arch/alpha/Kconfig                            |  1 -
 arch/arc/Kconfig                              |  1 -
 arch/arm/Kconfig                              | 13 +-----
 arch/arm/include/asm/mach/time.h              |  2 -
 arch/arm/kernel/time.c                        | 14 ------
 arch/arm/mach-rpc/time.c                      |  2 +-
 arch/arm64/Kconfig                            |  1 -
 arch/arm64/Kconfig.platforms                  |  1 -
 arch/c6x/Kconfig                              |  1 -
 arch/csky/Kconfig                             |  1 -
 arch/h8300/Kconfig                            |  1 -
 arch/hexagon/Kconfig                          |  1 -
 arch/ia64/Kconfig                             |  1 +
 arch/ia64/kernel/time.c                       | 36 ++++++---------
 arch/m68k/68000/timers.c                      |  7 ++-
 arch/m68k/Kconfig.cpu                         | 34 +++++++++++---
 arch/m68k/Kconfig.machine                     | 15 +++++++
 arch/m68k/amiga/config.c                      | 11 +++--
 arch/m68k/apollo/config.c                     | 11 +++--
 arch/m68k/atari/config.c                      |  2 +-
 arch/m68k/atari/time.c                        |  9 ++--
 arch/m68k/bvme6000/config.c                   |  9 ++--
 arch/m68k/coldfire/Makefile                   | 32 ++++++++------
 arch/m68k/coldfire/pit.c                      |  2 +-
 arch/m68k/coldfire/sltimers.c                 |  8 ++--
 arch/m68k/coldfire/timers.c                   |  8 ++--
 arch/m68k/hp300/time.c                        |  8 ++--
 arch/m68k/hp300/time.h                        |  2 +-
 arch/m68k/include/asm/machdep.h               | 12 +++--
 arch/m68k/kernel/setup_mm.c                   |  2 +-
 arch/m68k/kernel/setup_no.c                   |  2 +-
 arch/m68k/kernel/time.c                       | 18 ++------
 arch/m68k/mac/config.c                        |  6 +--
 arch/m68k/mac/via.c                           | 44 +++++++++++++++----
 arch/m68k/mvme147/config.c                    |  9 ++--
 arch/m68k/mvme16x/config.c                    |  9 ++--
 arch/m68k/q40/config.c                        |  2 +-
 arch/m68k/q40/q40ints.c                       | 10 ++---
 arch/m68k/sun3/config.c                       |  4 +-
 arch/m68k/sun3/sun3ints.c                     |  3 +-
 arch/m68k/sun3x/time.c                        |  5 +--
 arch/m68k/sun3x/time.h                        |  2 +-
 arch/microblaze/Kconfig                       |  1 -
 arch/mips/Kconfig                             |  1 -
 arch/nds32/Kconfig                            |  1 -
 arch/nios2/Kconfig                            |  1 -
 arch/openrisc/Kconfig                         |  1 -
 arch/parisc/Kconfig                           |  2 +-
 arch/parisc/kernel/time.c                     |  9 ++--
 arch/powerpc/Kconfig                          |  1 -
 arch/riscv/Kconfig                            |  1 -
 arch/s390/Kconfig                             |  1 -
 arch/sh/Kconfig                               |  1 -
 arch/sparc/Kconfig                            |  1 -
 arch/um/Kconfig                               |  1 -
 arch/x86/Kconfig                              |  1 -
 arch/xtensa/Kconfig                           |  1 -
 include/linux/timekeeping.h                   |  5 +--
 kernel/time/Kconfig                           |  9 +++-
 kernel/time/Makefile                          |  1 +
 kernel/time/tick-legacy.c                     | 37 ++++++++++++++++
 kernel/time/timekeeping.c                     | 16 -------
 kernel/time/timekeeping.h                     |  1 +
 64 files changed, 242 insertions(+), 221 deletions(-)
 create mode 100644 kernel/time/tick-legacy.c

Cc: Russell King <linux@armlinux.org.uk>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>
Cc: Philip Blundell <philb@gnu.org>
Cc: Joshua Thompson <funaho@jurai.org>
Cc: Sam Creasey <sammy@sammy.net>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-arm-kernel@lists.infradead.org

-- 
2.27.0

