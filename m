Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C12E712521
	for <lists+linux-ia64@lfdr.de>; Fri, 26 May 2023 12:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjEZKz7 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 26 May 2023 06:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbjEZKz5 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 26 May 2023 06:55:57 -0400
Received: from mout.web.de (mout.web.de [212.227.15.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F46101
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 03:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1685098516; i=frank.scheiner@web.de;
        bh=aXWISxEiDC+DjH2mPgfGImpFYTHyblIH1G06DiZ+K84=;
        h=X-UI-Sender-Class:Date:From:Subject:To:Cc;
        b=CLfIAgYDU+EC8YFjpNjsPFgnmTyiwn672pT+rqBoNAUBriu4IFNE3inaAMoaHRwaw
         7byCqvjEnh4qy9860V9zrphmc8vLOkFy47xDazyhul0IKeI8AGSPwYZ9m4pk0QFdDR
         5D+v2o473nK+LIbhvVpJZ3iaK5HpDy6cEV73Cphlwswi28R40qCBD1uJfADbXf2Sev
         dimpQvCwj7Q6YEacRv4bzFL0ZaYtzgEgXO1dlJF8vYUxWj7o4A6yHCcla6N0HpCX5s
         NoX49Z0O4Pdb4G9yT7Dt0A1LnxWcoyuXPz+47AiwBTnMLb6q0HltgarRI6szFxQkli
         uZSyqCEhP0vZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([79.200.217.234]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MDvDU-1puq8W0YNA-00ACGJ; Fri, 26
 May 2023 12:55:16 +0200
Message-ID: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
Date:   Fri, 26 May 2023 12:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From:   Frank Scheiner <frank.scheiner@web.de>
Subject: Boot regression in Linux v6.4-rc3
To:     linux-ia64@vger.kernel.org, song@kernel.org, mcgrof@kernel.org
Cc:     debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zis7zdOroEGr3iLVGEVK1Qp/uF3vUtuk2t9xX4IJKIfV5goROKL
 IXZ2fdXfti1ThRhgirlRyWTLVLmSLoBwU+1p8eKPNTu0oz78y5y/mPEBxq5oWJcW6devqJ+
 Hw1eji+t9lz5e0XdSS+xDkPIjv0fJY9FTirQabShCFWC0Q/leE5tRvZrVG3+no1XhYTy587
 IgDnglcvU2oKCo1/J62oQ==
UI-OutboundReport: notjunk:1;M01:P0:HlCr9wLKjHo=;/8Oxn8B4yNEGt8IYkZ8OnEDXkMY
 jU3yuLeNdclXAcpE32djg7byIkbV1ELy+ShsGEDsjPgUo+x+4+W04Nil9KIs8y8VBIOx9jD51
 z0VHdD2xas+eSaXJ+u1pd1ce7/Tnl+zo717TTvmoQnkikl+53d1DQVx2jEiZs288L866ygwbo
 ffUsVwCZ5L95YzUy+RDGYNwUVUZOz20GalOfKEOTNSQgcx3QEUA5Z/w7DrjWxW1Ksa5UPeSbm
 rhctMWYxaaeMWKQ11TQ76YlfgNmp0tERNKu2UcGDX7ACZ/8mo6EEWeQSFHvTLka4pqTFRk932
 bu7ZK7x7+s6sTufcNDoxLvxySMN1s0Ddgl5J6OBYrXi8kwnRMHz3uAdnaW5/3nyUqpT1D4xKS
 4sobSS5/SC6xR5Mr5giqywuxASzSr0ZB0ev//6SvlGLLJdyq+q2gIcwU+G4hjlw5HrfhxuYwx
 rZhr4Dv99NiRGuPLhX41NNqCJ6JDh2sWK5Zi25sVFiU9eqtiY5XGyLoBExhEWdTRiiNFxB8AV
 1sJTpBjW7sWdy103RmW17XYOjP5jTlp4IWGASCfZz53E+AGvwKgIvoZQ4+IjRFc/WUk+m+++/
 j7g+hJtfDKeujreV3k/Q7BSmD7FhXoPX/sSBtECcxIJrk6ufDvk0LLUxZyMnY9OmmDwV3V7ca
 z6GS6O+J2yXVox/FS6qbDE7cyQdbyolTY05G+Tw58nTNHgwicK5maWYtb8uUZAueH/4s5ql11
 Y1S2NS+0NkkJXbFYhf63FLSxKJU8/I+ChDV0QEHrSDL+xAGToZ92FvSBArDjJbwQVsvJQ3CWR
 Q+W/k7wgnAw6altw7cSFHINowYvF1RYNlJlp2E11VDWUayLBJn1esLD3PkuxA/T13z5+VP1VY
 n5YJ6F4pXGEwH62u9kAzSVhNSvaIuIdHkZq2EbNy7MBhPHduteAaW9azvUKBeDVUVsRPI+jBx
 u5ujmPrsqOzWB3H7YVzrnYQBscY=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Dear all,

there is a boot regression in effect in Linux v6.4-rc3 that affects at
least:

* rx2620 (w/2 x Montecito and zx1)
* rx2800-i2 (w/1 x Tukwila)

...(see second part of [1] and following posts for more details, [2] and
[3] for the respective logs), example here:

```
ELILO v3.16 for EFI/IA-64
..
Uncompressing Linux... done
Loading file AC100221.initrd.img...done
[    0.000000] Linux version 6.4.0-rc3 (root@x4270) (ia64-linux-gcc
(GCC) 12.2.0, GNU ld (GNU Binutils) 2.39) #1 SMP Thu May 25 15:52:20
CEST 2023
[    0.000000] efi: EFI v1.1 by HP
[    0.000000] efi: SALsystab=3D0x3ee7a000 ACPI 2.0=3D0x3fe2a000
ESI=3D0x3ee7b000 SMBIOS=3D0x3ee7c000 HCDP=3D0x3fe28000
[    0.000000] PCDP: v3 at 0x3fe28000
[    0.000000] earlycon: uart8250 at MMIO 0x00000000f4050000 (options
'9600n8')
[    0.000000] printk: bootconsole [uart8250] enabled
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x000000003FE2A000 000028 (v02 HP    )
[    0.000000] ACPI: XSDT 0x000000003FE2A02C 0000CC (v01 HP     rx2620
00000000 HP   00000000)
[...]
[    3.793350] Run /init as init process
Loading, please wait...
Starting systemd-udevd version 252.6-1
[    3.951100] ------------[ cut here ]------------
[    3.951100] WARNING: CPU: 6 PID: 140 at kernel/module/main.c:1547
__layout_sections+0x370/0x3c0
[    3.949512] Unable to handle kernel paging request at virtual address
1000000000000000
[    3.951100] Modules linked in:
[    3.951100] CPU: 6 PID: 140 Comm: (udev-worker) Not tainted 6.4.0-rc3 #=
1
[    3.956161] (udev-worker)[142]: Oops 11003706212352 [1]
[    3.951774] Hardware name: hp server rx2620                   , BIOS
04.29
11/30/2007
[    3.951774]
[    3.951774] Call Trace:
[    3.958339] Unable to handle kernel paging request at virtual address
1000000000000000
[    3.956161] Modules linked in:
[    3.951774]  [<a0000001000156d0>] show_stack.part.0+0x30/0x60
[    3.951774]                                 sp=3De000000183a67b20
bsp=3De000000183a61628
[    3.956161]
[    3.956161]
```

[1]: https://lists.debian.org/debian-ia64/2023/05/msg00010.html

[2]: https://pastebin.com/SAUKbG7Z

[3]: https://pastebin.com/v1TTB2x3

With the needed modules compiled into the kernel the rx2620 (only tested
there yet) boots correctly, though for v6.4-rc2 with kernel oopses (with
similar content), for v6.4-rc3 actually w/o kernel oopses.

According to bisecting between:

GOOD: `cec24b8b6bb841a19b5c5555b600a511a8988100` and

BAD: `b6a7828502dc769e1a5329027bc5048222fa210a` (already in effect there)

...the problem was introduced with:

```
root@x4270:/usr/src/linux-on-ramdisk# git bisect bad
ac3b43283923440900b4f36ca5f9f0b1ca43b70e is the first bad commit
commit ac3b43283923440900b4f36ca5f9f0b1ca43b70e
Author: Song Liu <song@kernel.org>
Date:   Mon Feb 6 16:28:02 2023 -0800

     module: replace module_layout with module_memory

     module_layout manages different types of memory (text, data,
rodata, etc.)
     in one allocation, which is problematic for some reasons:

     1. It is hard to enable CONFIG_STRICT_MODULE_RWX.
     2. It is hard to use huge pages in modules (and not break strict rwx)=
.
     3. Many archs uses module_layout for arch-specific data, but it is no=
t
        obvious how these data are used (are they RO, RX, or RW?)

     Improve the scenario by replacing 2 (or 3) module_layout per module
with
     up to 7 module_memory per module:

             MOD_TEXT,
             MOD_DATA,
             MOD_RODATA,
             MOD_RO_AFTER_INIT,
             MOD_INIT_TEXT,
             MOD_INIT_DATA,
             MOD_INIT_RODATA,

     and allocating them separately. This adds slightly more entries to
     mod_tree (from up to 3 entries per module, to up to 7 entries per
     module). However, this at most adds a small constant overhead to
     __module_address(), which is expected to be fast.

     Various archs use module_layout for different data. These data are pu=
t
     into different module_memory based on their location in module_layout=
.
     IOW, data that used to go with text is allocated with
MOD_MEM_TYPE_TEXT;
     data that used to go with data is allocated with MOD_MEM_TYPE_DATA,
etc.

     module_memory simplifies quite some of the module code. For example,
     ARCH_WANTS_MODULES_DATA_IN_VMALLOC is a lot cleaner, as it just uses =
a
     different allocator for the data. kernel/module/strict_rwx.c is also
     much cleaner with module_memory.

     Signed-off-by: Song Liu <song@kernel.org>
     Cc: Luis Chamberlain <mcgrof@kernel.org>
     Cc: Thomas Gleixner <tglx@linutronix.de>
     Cc: Peter Zijlstra <peterz@infradead.org>
     Cc: Guenter Roeck <linux@roeck-us.net>
     Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
     Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
     Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
     Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
     Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

  arch/arc/kernel/unwind.c        |  12 +-
  arch/arm/kernel/module-plts.c   |   9 +-
  arch/arm64/kernel/module-plts.c |  13 +-
  arch/ia64/kernel/module.c       |  24 +--
  arch/mips/kernel/vpe.c          |  11 +-
  arch/parisc/kernel/module.c     |  51 ++----
  arch/powerpc/kernel/module_32.c |   7 +-
  arch/s390/kernel/module.c       |  26 +--
  arch/x86/kernel/callthunks.c    |   4 +-
  arch/x86/kernel/module.c        |   4 +-
  include/linux/module.h          |  89 +++++++---
  kernel/module/internal.h        |  40 ++---
  kernel/module/kallsyms.c        |  58 ++++---
  kernel/module/kdb.c             |  17 +-
  kernel/module/main.c            | 375
++++++++++++++++++++--------------------
  kernel/module/procfs.c          |  16 +-
  kernel/module/strict_rwx.c      |  99 ++---------
  kernel/module/tree_lookup.c     |  39 ++---
  18 files changed, 427 insertions(+), 467 deletions(-)

root@x4270:/usr/src/linux-on-ramdisk# git bisect log
git bisect start
# status: waiting for both good and bad commits
# good: [cec24b8b6bb841a19b5c5555b600a511a8988100] Merge tag
'char-misc-6.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect good cec24b8b6bb841a19b5c5555b600a511a8988100
# status: waiting for bad commit, 1 good commit known
# bad: [b6a7828502dc769e1a5329027bc5048222fa210a] Merge tag
'modules-6.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux
git bisect bad b6a7828502dc769e1a5329027bc5048222fa210a
# bad: [3f0dedc39039a75670817a1afffa77b6cee077cb] dmaengine: remove
MODULE_LICENSE in non-modules
git bisect bad 3f0dedc39039a75670817a1afffa77b6cee077cb
# bad: [b10addf37bbcaee66672eb54c15532266c8daea6] module: add
symbol-name to pr_debug Absolute symbol
git bisect bad b10addf37bbcaee66672eb54c15532266c8daea6
# bad: [85e6f61c134f111232d27d3f63667c1bccbbc12d] module: move early
sanity checks into a helper
git bisect bad 85e6f61c134f111232d27d3f63667c1bccbbc12d
# bad: [05777499a81298ef7e4a5e32a6f744f1f937a80c] ARM: dyndbg: allow
including dyndbg.h in decompressor
git bisect bad 05777499a81298ef7e4a5e32a6f744f1f937a80c
# bad: [efaa2496bae66f0a78efa60d9b73ceef5ec63d79] module: fix MIPS
module_layout -> module_memory
git bisect bad efaa2496bae66f0a78efa60d9b73ceef5ec63d79
# bad: [9e07f161717ab8e8ac1206bf82546511e24cbb7b] module: Remove the
unused function within
git bisect bad 9e07f161717ab8e8ac1206bf82546511e24cbb7b
# bad: [ac3b43283923440900b4f36ca5f9f0b1ca43b70e] module: replace
module_layout with module_memory
git bisect bad ac3b43283923440900b4f36ca5f9f0b1ca43b70e
# first bad commit: [ac3b43283923440900b4f36ca5f9f0b1ca43b70e] module:
replace module_layout with module_memory
```

...and merged with commit `b6a7828502dc769e1a5329027bc5048222fa210a`:

```
commit b6a7828502dc769e1a5329027bc5048222fa210a
Merge: d06f5a3f7140 8660484ed1cf
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Apr 27 16:36:55 2023 -0700

     Merge tag 'modules-6.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux

     Pull module updates from Luis Chamberlain:
      "The summary of the changes for this pull requests is:

        - Song Liu's new struct module_memory replacement

        - Nick Alcock's MODULE_LICENSE() removal for non-modules

        - My cleanups and enhancements to reduce the areas where we vmallo=
c
          module memory for duplicates, and the respective debug code whic=
h
          proves the remaining vmalloc pressure comes from userspace.
[...]
```

Could someone have a look into this, please?

Cheers,
Frank

P.S.
There is also a bug for this specific commit:

```
kmemleaks on ac3b43283923 ("module: replace module_layout with
module_memory")
```

...on [4], reported on 2023-04-03, but I don't know if its content is
related to the problems on ia64.

[4]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217296
