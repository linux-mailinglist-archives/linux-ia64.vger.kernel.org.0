Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 602C0714115
	for <lists+linux-ia64@lfdr.de>; Mon, 29 May 2023 00:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjE1Wq3 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 28 May 2023 18:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjE1Wq2 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 28 May 2023 18:46:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C4A3B9
        for <linux-ia64@vger.kernel.org>; Sun, 28 May 2023 15:46:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E894C60BEE
        for <linux-ia64@vger.kernel.org>; Sun, 28 May 2023 22:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51061C433D2
        for <linux-ia64@vger.kernel.org>; Sun, 28 May 2023 22:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685313986;
        bh=VDX4Ee53SnesAdbldnVksOYlAN3O1PI+HY87H5R2XwM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K51al30WceQlhfRIOh28oz5DDyuJw66qEB9kKX3YvD9d4vsR9wAqAIXCLWmjVDlCV
         BeOCz16EceqeHMV6ZdNjC8GcXTLXlaNPIFd1+w8/0YvHUQs83YOe7wzmPKfXROLacF
         NfSNy1ockfrtctuyjpBqkqKmTr1vqF0wOWE5+hRQ3mEEvJu8M70wJt49VclZmzk8Z7
         xZguwvIMVTJ6c8r67FI1MzODBFMROertyHMrm6aYLQTruV3R42K+iy766W+PEfWprB
         5mYPjq2c5smCeKzBYHEvbBYIcfry/2cR8rMgYl2c0/1P10dgI+kRliWVk74TbvNOoU
         FxqTG1glw0FOw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f122ff663eso2884835e87.2
        for <linux-ia64@vger.kernel.org>; Sun, 28 May 2023 15:46:26 -0700 (PDT)
X-Gm-Message-State: AC+VfDze+dN+YzhjTsiOLgDVMmpjT67tQGVKjXWR0fbv/WQ55+UWR1Z3
        YvOus0RVn2A1+HzJgmoZ9GyY0MLRa1WY36l5bOY=
X-Google-Smtp-Source: ACHHUZ594+DnI6vPvFVMOFWw7uzkpxKrxnrLXhgRSQkkOmsV8ARn6a8sHSQBAUAWTFSeO7VNP9Td9QKzA3rM9Hu3tWg=
X-Received: by 2002:ac2:53a6:0:b0:4f4:b138:e998 with SMTP id
 j6-20020ac253a6000000b004f4b138e998mr3161365lfh.68.1685313984349; Sun, 28 May
 2023 15:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de> <ZHErssbUSbSznTVA@bombadil.infradead.org>
 <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
 <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de> <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
 <b2b47c19-d527-fbd2-1666-801f173b6174@web.de> <CAHk-=wjDQZ8snU__Y8qJ8M5H--1FtAwNq-oHKmY4CJuomWPvDw@mail.gmail.com>
 <CAPhsuW7Gcd7hkrD6RtBdJDMdVnaN8Bv_kVNdpyccUiuD-TqYDw@mail.gmail.com>
 <ea6bb10a-f830-1a9f-19b1-07269a073876@web.de> <42e4fbe4-2b4d-4f9a-222f-1d14d4836da3@web.de>
In-Reply-To: <42e4fbe4-2b4d-4f9a-222f-1d14d4836da3@web.de>
From:   Song Liu <song@kernel.org>
Date:   Sun, 28 May 2023 15:46:12 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5VdZiLwAax1Ax3OVD=Kp2y2i-U9Ap3LS3jY6jz59Nawg@mail.gmail.com>
Message-ID: <CAPhsuW5VdZiLwAax1Ax3OVD=Kp2y2i-U9Ap3LS3jY6jz59Nawg@mail.gmail.com>
Subject: Re: Boot regression in Linux v6.4-rc3
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>, linux-ia64@vger.kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Sun, May 28, 2023 at 1:10=E2=80=AFAM Frank Scheiner <frank.scheiner@web.=
de> wrote:
>
> Hi again,
>
> On 28.05.23 09:30, Frank Scheiner wrote:
> > [...]
> > Thanks, that patch (as -patch4 on top of v6.4-rc3) fixes the boot
> > regression for me on the rx2620:
> >
> > [...]
> >
> > Great! I'll give it a try on my rx2800-i2, too, but assume it wil work
> > there, too.
>
> Indeed, -patch4 also makes it work on the rx2800-i2:

Thanks for running the test!

I will send the official patch.

Thanks,
Song

>
> ```
> ELILO v3.16 for EFI/IA-64
> ..
> Uncompressing Linux... done
> Loading file AC10027B.initrd.img...done
> [    0.000000] Linux version
> 6.4.0-rc3-44c026a73be8038f03dbdeef028b642880cf1511-patch4 (root@x4270)
> (ia64-linux-gcc (GCC) 12.2.0, GNU ld (GNU Binutils) 2.39) #1 SMP Sun May
> 28 09:08:44 CEST 2023
> [    0.000000] efi: EFI v2.1 by HP
> [    0.000000] efi: SALsystab=3D0xdfdd63a18 ESI=3D0xdfdd63f18 ACPI
> 2.0=3D0x3d3c4014 HCDP=3D0xdffff8798 SMBIOS=3D0x3d368000
> [    0.000000] PCDP: v3 at 0xdffff8798
> [    0.000000] earlycon: uart8250 at I/O port 0x4000 (options '115200n8')
> [    0.000000] printk: bootconsole [uart8250] enabled
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x000000003D3C4014 000024 (v02 HP    )
> [    0.000000] ACPI: XSDT 0x000000003D3C4580 000124 (v01 HP     RX2800-2
> 00000001      01000013)
> [...]
> [   36.649531] Run /init as init process
> Loading, please wait...
> Starting systemd-udevd version 252.6-1
> [   36.865635] pps_core: LinuxPPS API ver. 1 registered
> [   36.869321] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
> Rodolfo Giometti <giometti@linux.it>
> [   36.885025] PTP clock support registered
> [   36.910852] ACPI: bus type USB registered
> [   36.918198] usbcore: registered new interface driver usbfs
> [   36.924762] usbcore: registered new interface driver hub
> [   36.922133] igb: Intel(R) Gigabit Ethernet Network Driver
> [   36.931386] usbcore: registered new device driver usb
> [   36.938149] igb: Copyright (c) 2007-2014 Intel Corporation.
> [...]
> [  OK  ] Finished apt-daily-upgrade=E2=80=A6 apt upgrade and clean activi=
ties.
>
> Debian GNU/Linux 12 rx2800-i2 -
>
> rx2800-i2 login:
> ```
>
> I'll try to test this on other machines (rx4640 w/Madison, rx2660
> w/Montecito/Montvale, rx6600 w/Montvale) as well, starting on Tuesday if
> possible.
>
> ****
>
> There is an issue - only for the rx2800-i2 - seemingly related to it's
> PCIe NIC(s) and MSIs, but this is already there in 6.3.x (see first part
> of [1]) and **not related to the problem of this thread (AFAICT)** and -
> more important - doesn't affect operation: The machine is working
> diskless using one of those interfaces so it can't be that bad. I'll
> look into bisecting that issue as well.
>
> [1]: https://lists.debian.org/debian-ia64/2023/05/msg00010.html
>
> Cheers,
> Frank
