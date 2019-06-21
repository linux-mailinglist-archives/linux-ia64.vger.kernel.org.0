Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90EB24EFD7
	for <lists+linux-ia64@lfdr.de>; Fri, 21 Jun 2019 22:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfFUUIS (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 21 Jun 2019 16:08:18 -0400
Received: from mout.web.de ([212.227.17.12]:34791 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725992AbfFUUIR (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Fri, 21 Jun 2019 16:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561147687;
        bh=x37eV/DjQWtp+9hDRGg5GDsYWqLKR91bmziu0Kbev2o=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=OqMJB1Kk1la/cQl08XrQgjk8Kgdhug6ofAFv6HIYfvaX8Z8nAv/ApSofv9AWsO3IC
         hW3N407QiGojCH0IXIACfIw8sar3MclHtfuCvEEIOhgjAufqApMKqOtAlmCv6kSad3
         XCHRp/0wYyxTBR1YVASPxMUldC1aDru/Tx+HsX1w=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.21] ([217.247.35.165]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LtWo4-1id5YB0bDg-010wFW; Fri, 21
 Jun 2019 22:08:07 +0200
To:     linux-ia64@vger.kernel.org
Cc:     hch@lst.de, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
From:   Frank Scheiner <frank.scheiner@web.de>
Subject: Kernel problem on rx2800 i2
Message-ID: <f3d9d882-dd22-1782-6ec8-c88cb1880a83@web.de>
Date:   Fri, 21 Jun 2019 22:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:celdED8/8tYjMbthwe2B5dS8zNhH2SH3xbMdth3EdndplqmKPZ9
 55sw/WiZlIS89jUDFYqhGE35Ztj1JZDqLTMbKi1g0ygwYm8Ca5TdbnofEJrIlTtjgjgnApp
 FKw+1hvEGs4YhJHN8ZVKMM4dLdQqtz0ndmcaBhukkiwTcwIWPUljIKSK+xlm1iUym16Jy0T
 MNUnD94d0JL34+tuP13tQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PUPewziai8g=:0zZ5iEuxg2qXf7UBhYrroE
 tWxDb7db8EvwspKD3mxRgwphirDgBrq3+5ffFQnYv8rj6XDnwwdx7IkKSaldVXL/qsSIIzPZz
 4vK/27vocZaVAtWDFZffeQJeRKHKBBsgpmv3IbTgqV3QZkJfRitR5vb9MJgRadVtlHzAMmoRH
 0pNHGG47A9Dr5QChfwJiCAFWcLIvhH6yQvB5CClS7K/btpLhxeR/AvfSgVfMH2OCIRO5BUoYy
 SQUZG44WvilaeAxnMBBM26k03v4QmTRJCeAyMbYtmQda4W3L/Sovaz6zd5eNE1NiUAi0mVbMu
 OdasFaprq2gdwh5x1NNBD1WXlmNc7ENtbJ3EnLoZVidiQhXJ049OIpZRXrhYwF7lF/JiIHgdZ
 9/Er1pcgX1NJT0VWI2G+TMKkv3EwpKgVhUo0ShyRWwrZWRzlVoQ7U530AvG9+Nwaeoi1f0JKL
 bf3xwWDkuNw7AgYlWCJFlyPlsI263Jc0q0enZRxQ9oOpnIvReX69kyM56hmjW2wBPNz5LfVUh
 6++jZUA4m+WCLG5Yt5PVfM6TENqOxcHSG/UpvfTtZ1kac49kOSXVLHR760WWP0ueN95PUnlZ7
 R6sWHB90Pr3nyLlyxZz2ucMhhQPHEN23VbADTaqpVWWxj//vQ3dgmim7ZalIIADKyASjFfIJU
 kTnYaZduoTsYifM6eYJ4cXd1ZYyvHkVnx7KAxK4Llxhp5Izm6j1IPA+lB//jNtRFYIUprFdXo
 wlEXmtZEPJLJJs9luvi7I9KmBORnXk++LW7BC/mdScAP2wgeiBtRMgIZaeGKZSIla7Mmrn/EJ
 0JIb/bLbOx4Qa6PKG1bF04VEEPbgRy4EYBr7C4wYqD6eNyheOe9ksubDbTr2WHV8bU3onThxG
 uHuz+sjoQwoPbSYgqEPO7B2OOAGx/Bs4275nWgmQrA0gBSOqYbAlIA20Tec4AHsWni56cC1IT
 laKYsE6izZNNt0b1yFZt+PPXvjDw9CqS29rEj/c24zuQpFb5wooelW/Zmn53AS5MFW1b8opKS
 cDJIWB/rXIl8+aCgJYwuu26ExFqRPGOkh4iFE9zM9e1KQW6TclRdIHiNwc3ZAiwnOw==
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi there,

recent testing of a Debian v4.19.37 kernel showed a problem on my rx2800
i2 happening during kernel boot:

```
[    0.000000] Linux version 4.19.0-5-itanium
(debian-kernel@lists.debian.org) (gcc version 8.3.0 (Debian
8.3.0-10~ia64.1)) #1 SMP Debian 4.19.37-3 (2019-05-18)
[    0.000000] EFI v2.10 by HP:
[    0.000000] efi:  SALsystab=3D0x6fdd63a18  ACPI 2.0=3D0x3d3c4014
HCDP=3D0x6ffff8798  SMBIOS=3D0x3d368000
[    0.000000] booting generic kernel on platform dig
[    0.000000] PCDP: v3 at 0x6ffff8798
[    0.000000] earlycon: uart8250 at I/O port 0x4000 (options '115200n8')
[    0.000000] bootconsole [uart8250] enabled
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x000000003D3C4014 000024 (v02 HP    )
[    0.000000] ACPI: XSDT 0x000000003D3C4580 000124 (v01 HP     RX2800-2
00000001      01000013)
[...]
[   13.993718] Unpacking initramfs...
[...]
[   22.655630] Run /init as init process
[   22.818930] SCSI subsystem initialized
[   22.844653] ACPI: bus type USB registered
[   22.878940] HP HPSA Driver (v 3.4.20-125)
[   22.930628] usbcore: registered new interface driver usbfs
[   23.072034] usbcore: registered new interface driver hub
[   23.072925] hpsa 0000:01:00.0: Logical aborts not supported
[   23.150942] usbcore: registered new device driver usb
[   23.231690] hpsa 0000:01:00.0: HP SSD Smart Path aborts not supported
[   23.306942] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   23.417101] systemd-udevd[115]: NaT consumption 2216203124768 [1]
[   23.488663] ehci-pci: EHCI PCI platform driver
[   23.490942] uhci_hcd: USB Universal Host Controller Interface driver
[   23.420927] Modules linked in: uhci_hcd(+) ehci_pci(+) ehci_hcd
hpsa(+) scsi_transport_sas usbcore scsi_mod usb_common
[   23.420927]
[   23.420927] CPU: 6 PID: 115 Comm: systemd-udevd Not tainted
4.19.0-5-itanium #1 Debian 4.19.37-3
[   23.420927] Hardware name: hp Integrity rx2800 i2, BIOS 01.93 09/12/201=
2
[   23.420927] psr : 0000121008026010 ifs : 8000000000002046 ip  :
[<a0000001002af041>]    Not tainted (4.19.0-5-itanium Debian 4.19.37-3)
[   23.420927] ip is at __alloc_pages_nodemask+0x261/0x20c0
[   23.420927] unat: 0000000000000000 pfs : 0000000000000793 rsc :
0000000000000003
[   23.420927] rnat: 0000000000000000 bsps: 0000000000000000 pr  :
85aaa9a99a6a6659
[   23.420927] ldrs: 0000000000000000 ccv : 0000000000000000 fpsr:
0009804c8a70433f
[   23.420927] csd : 0000000000000000 ssd : 0000000000000000
[   23.420927] b0  : a0000001001710e0 b6  : a0000001003948c0 b7  :
a0000001000469c0
[   23.420927] f6  : 10012bffff00000000000 f7  : 1003e00000000000bffff
[   23.420927] f8  : 1003e0000000000003fc0 f9  : 1003effffffffffffffab
[   23.420927] f10 : 10016818d087e7cd81a78 f11 : 1003e000000000000002a
[   23.420927] r1  : a0000001015d6ba0 r2  : a0000001013643c8 r3  :
fffffffffffc04b8
[   23.420927] r8  : 0000000000001440 r9  : e000000001507708 r10 :
0000000000000008
[   23.420927] r11 : ffffffffffd8d818 r12 : e000000682fcfbd0 r13 :
e000000682fc8000
[   23.420927] r14 : a0000001013643b8 r15 : ffffffffffd8d828 r16 :
00000000007fffff
[   23.420927] r17 : 0000000000000008 r18 : 0000000000000000 r19 :
e000000001507710
[   23.420927] r20 : 0000000000000000 r21 : 0000000000002500 r22 :
0000000000000000
[   23.420927] r23 : 0000000000000000 r24 : 0000000000000000 r25 :
0000000000000000
[   23.420927] r26 : 0000000000000000 r27 : 0000000000000000 r28 :
e000000682fc87b0
[   23.420927] r29 : 0000000000200000 r30 : 0000000000000000 r31 :
0000000000000000
[   23.420927]
[   23.420927] Call Trace:
[   23.420927]  [<a000000100014bd0>] show_stack+0x90/0xc0
[   23.420927]                                 sp=3De000000682fcf790
bsp=3De000000682fc9c80
[   23.420927]  [<a0000001000152d0>] show_regs+0x6d0/0xa00
[   23.420927]                                 sp=3De000000682fcf960
bsp=3De000000682fc9c10
[   23.420927]  [<a000000100029330>] die+0x1b0/0x460
[   23.420927]                                 sp=3De000000682fcf980
bsp=3De000000682fc9bc8
[   23.420927]  [<a000000100e75100>] ia64_fault+0x5a0/0xf60
[   23.420927]                                 sp=3De000000682fcf980
bsp=3De000000682fc9b70
[   23.420927]  [<a00000010000c9c0>] ia64_leave_kernel+0x0/0x270
[   23.420927]                                 sp=3De000000682fcfa00
bsp=3De000000682fc9b70
[   23.420927]  [<a0000001002af040>] __alloc_pages_nodemask+0x260/0x20c0
[   23.420927]                                 sp=3De000000682fcfbd0
bsp=3De000000682fc9938
[   23.420927]  [<a0000001001710e0>] dma_direct_alloc+0x140/0x2e0
[   23.420927]                                 sp=3De000000682fcfc40
bsp=3De000000682fc98c0
[   23.420927]  [<a000000100173910>] swiotlb_alloc+0x50/0x2e0
[   23.420927]                                 sp=3De000000682fcfc40
bsp=3De000000682fc9868
```

The machine doesn't continue boot afterwards. The machine boots fine
with a 4.14.x with Gentoo patches but also no later minor kernel version
with Gentoo patches works on it. With some testing I could limit the
Linux versions, between which the problematic change could have been
introduced, to 4.15.x and 4.16.x. Bisecting between tag v4.15.18 (good)
and tag v4.16-rc1 (bad) pointed to commit
543cea9accd9804307541cb93d3ed7ec94b07237 ([1]) as first bad commit.

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?i=
d=3D543cea9accd9804307541cb93d3ed7ec94b07237

The kernel messages with problematic kernels from the bisecting process
look different to the ones from the above shown v4.19.37 from Debian thoug=
h:

```
Linux version 4.15.0-rc7-00047-g543cea9accd9-dirty (root@rx2800-i2) (gcc
version 7.3.0 (Gentoo 7.3.0-r3 p1.4)) #1 SMP Thu Jun 13 22:16:30 CEST 2019
EFI v2.10 by HP:
efi:  SALsystab=3D0xdfdd63a18  ACPI 2.0=3D0x3d3c4014  HCDP=3D0xdffff8798
SMBIOS=3D0x3d368000
booting generic kernel on platform dig
PCDP: v3 at 0xdffff8798
earlycon: uart8250 at I/O port 0x4000 (options '115200n8')
bootconsole [uart8250] enabled
ACPI: Early table checksum verification disabled
ACPI: RSDP 0x000000003D3C4014 000024 (v02 HP    )
ACPI: XSDT 0x000000003D3C4580 000124 (v01 HP     RX2800-2 00000001
01000013)
[...]
Trying to unpack rootfs image as initramfs...
[...]
Loading Adaptec I2O RAID: Version 2.4 Build 5go
Detecting Adaptec I2O RAID controllers...
ahci 0000:00:1f.2: AHCI 0001.0200 32 slots 6 ports 3 Gbps 0x3f impl SATA
mode
ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum part ccc ems
Unable to handle kernel NULL pointer dereference (address 0000000000001688=
)
swapper/0[1]: Oops 11012296146944 [1]
Modules linked in:

CPU: 0 PID: 1 Comm: swapper/0 Not tainted
4.15.0-rc7-00047-g543cea9accd9-dirty #1
Hardware name: hp Integrity rx2800 i2, BIOS 01.93 09/12/2012
psr : 00001210084a6010 ifs : 8000000000001734 ip  : [<a000000100180401>]
    Not tainted (4.15.0-rc7-00047-g543cea9accd9-dirty)
ip is at __alloc_pages_nodemask+0x1a1/0x1670
unat: 0000000000000000 pfs : 0000000000001734 rsc : 0000000000000003
rnat: 000000038c5ad78d bsps: 000000000001003e pr  : 565595a66aa65799
ldrs: 0000000000000000 ccv : 000000032e40a799 fpsr: 0009804c8a70433f
csd : 0000000000000000 ssd : 0000000000000000
b0  : a0000001001802c0 b6  : a000000100050b50 b7  : a0000001007e83d0
f6  : 1003e0000000000000000 f7  : 1003e00000000000164ff
f8  : 1003e0000000000000f00 f9  : 1003e000000000000000f
f10 : 1003e0000000000000400 f11 : 1003e0000000000003c00
r1  : a00000010155edc0 r2  : a0000001012b5e90 r3  : 0000000001ffffff
r8  : 0000000000001680 r9  : 0000000000250015 r10 : e000000001519980
r11 : e000000001519988 r12 : e000000d8334fcf0 r13 : e000000d83348000
r14 : ffffffffffd570d0 r15 : 0000000000000008 r16 : e000000001519990
r17 : 0000000000000000 r18 : 0000000000001680 r19 : 0000000000000000
r20 : 0000000000000000 r21 : 0000000000000000 r22 : 0000000000000000
r23 : 0000000000000000 r24 : ffffffffffd570c0 r25 : a0000001012b5e80
r26 : 0000000000000000 r27 : 0000000000000000 r28 : 0000000000001688
r29 : 0000000000000358 r30 : 0000000000000000 r31 : 0000000000000081

Call Trace:
  [<a000000100013760>] show_stack+0x40/0x90
                                 sp=3De000000d8334f8c0 bsp=3De000000d83349=
890
  [<a0000001000140e0>] show_regs+0x930/0x940
                                 sp=3De000000d8334fa90 bsp=3De000000d83349=
820
  [<a00000010003a7d0>] die+0x1a0/0x2f0
                                 sp=3De000000d8334fa90 bsp=3De000000d83349=
7d8
  [<a000000100063140>] ia64_do_page_fault+0x830/0xa30
                                 sp=3De000000d8334fa90 bsp=3De000000d83349=
740
  [<a00000010000c400>] ia64_leave_kernel+0x0/0x270
                                 sp=3De000000d8334fb20 bsp=3De000000d83349=
740
  [<a000000100180400>] __alloc_pages_nodemask+0x1a0/0x1670
                                 sp=3De000000d8334fcf0 bsp=3De000000d83349=
598
  [<a000000100d70100>] dma_direct_alloc+0x170/0x470
                                 sp=3De000000d8334fd50 bsp=3De000000d83349=
518
  [<a0000001006a8770>] swiotlb_alloc+0x50/0x90
                                 sp=3De000000d8334fd50 bsp=3De000000d83349=
4d8
  [<a00000010083abd0>] dmam_alloc_coherent+0x250/0x2c0
                                 sp=3De000000d8334fd50 bsp=3De000000d83349=
488
  [<a0000001009990c0>] ahci_port_start+0x2f0/0x4b0
                                 sp=3De000000d8334fd50 bsp=3De000000d83349=
440
  [<a000000100958490>] ata_host_start+0x310/0x470
                                 sp=3De000000d8334fd60 bsp=3De000000d83349=
3d0
  [<a000000100964a70>] ata_host_activate+0x20/0x290
                                 sp=3De000000d8334fd60 bsp=3De000000d83349=
370
  [<a000000100999570>] ahci_host_activate+0x2f0/0x300
                                 sp=3De000000d8334fd60 bsp=3De000000d83349=
300
  [<a0000001009923d0>] ahci_init_one+0x1580/0x20b0
                                 sp=3De000000d8334fd60 bsp=3De000000d83349=
258
  [<a0000001006d0610>] local_pci_probe+0x90/0x150
                                 sp=3De000000d8334fdc0 bsp=3De000000d83349=
218
  [<a0000001006d1a30>] pci_device_probe+0x2f0/0x310
                                 sp=3De000000d8334fdc0 bsp=3De000000d83349=
1d8
  [<a0000001008229f0>] driver_probe_device+0x520/0x720
                                 sp=3De000000d8334fde0 bsp=3De000000d83349=
170
  [<a000000100822d10>] __driver_attach+0x120/0x190
                                 sp=3De000000d8334fde0 bsp=3De000000d83349=
140
  [<a00000010081ec00>] bus_for_each_dev+0x120/0x140
                                 sp=3De000000d8334fde0 bsp=3De000000d83349=
100
  [<a000000100821bf0>] driver_attach+0x40/0x60
                                 sp=3De000000d8334fdf0 bsp=3De000000d83349=
0e0
  [<a0000001008211b0>] bus_add_driver+0x400/0x4a0
                                 sp=3De000000d8334fdf0 bsp=3De000000d83349=
090
  [<a000000100823fc0>] driver_register+0x240/0x2d0
                                 sp=3De000000d8334fdf0 bsp=3De000000d83349=
068
  [<a0000001006cfde0>] __pci_register_driver+0xa0/0xc0
                                 sp=3De000000d8334fdf0 bsp=3De000000d83349=
038
  [<a0000001010ecdb0>] ahci_pci_driver_init+0x50/0x70
                                 sp=3De000000d8334fdf0 bsp=3De000000d83349=
020
  [<a00000010000a950>] do_one_initcall+0x290/0x2a0
                                 sp=3De000000d8334fdf0 bsp=3De000000d83348=
fe0
  [<a0000001010a1c10>] kernel_init_freeable+0x400/0x430
                                 sp=3De000000d8334fe30 bsp=3De000000d83348=
f78
  [<a000000100d93860>] kernel_init+0x20/0x280
                                 sp=3De000000d8334fe30 bsp=3De000000d83348=
f58
  [<a00000010000c1f0>] call_payload+0x50/0x80
                                 sp=3De000000d8334fe30 bsp=3De000000d83348=
f40
Disabling lock debugging due to kernel taint
Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b

=2D--[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=3D0x0000000b
```

...but because of the result below - spoiler: a v4.19.37 kernel working
on my rx2800 i2 - I assume they're created by the very same issue.

Starting at tag v4.19.37 I then reverted the following commits:

* cf65a0f6f6ff7631ba0ac0513a14ca5b65320d80 [2]

* 16e73adbca76fd18733278cb688b0ddb4cad162c [3]

* 9d37c094dacda531ac3e529dd4dd139e3c0b7811 [4]

* 4fac8076df854aa4ddb8acbf6cce9d337300219e [5]

* 543cea9accd9804307541cb93d3ed7ec94b07237 [6]

...and compiled a kernel using the localmodconfig target to create a
minimal config. The resulting kernel booted fine on my rx2800 i2:

```
Linux version 4.19.37-00005-g55bd603c2590-dirty (root@rx2800-i2) (gcc
version 7.3.0 (Gentoo 7.3.0-r3 p1.4)) #1 SMP Thu Jun 20 23:58:57 CEST 2019
EFI v2.10 by HP:
efi:  SALsystab=3D0xdfdd63a18  ACPI 2.0=3D0x3d3c4014  HCDP=3D0xdffff8798
SMBIOS=3D0x3d368000
booting generic kernel on platform dig
PCDP: v3 at 0xdffff8798
earlycon: uart8250 at I/O port 0x4000 (options '115200n8')
bootconsole [uart8250] enabled
ACPI: Early table checksum verification disabled
ACPI: RSDP 0x000000003D3C4014 000024 (v02 HP    )
ACPI: XSDT 0x000000003D3C4580 000124 (v01 HP     RX2800-2 00000001
01000013)
[...]
  * Starting sshd ...
  [ ok ]
  * Starting local ...
  [ ok ]


This is rx2800-i2[...] (Linux ia64 4.19.37-00005-g55bd603c2590-dirty)
20:49:42
```

[2]:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?i=
d=3Dcf65a0f6f6ff7631ba0ac0513a14ca5b65320d80

[3]:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?i=
d=3D16e73adbca76fd18733278cb688b0ddb4cad162c

[4]:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?i=
d=3D9d37c094dacda531ac3e529dd4dd139e3c0b7811

[5]:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?i=
d=3D4fac8076df854aa4ddb8acbf6cce9d337300219e

[6]:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?i=
d=3D543cea9accd9804307541cb93d3ed7ec94b07237

****

Please note:

* that I'm always using the "ia64: fix ptrace" patch ([7]) in addition,
as I'm compiling with gcc 7.3.0 on Gentoo;

[7]: https://lore.kernel.org/patchwork/patch/884685/

* that the original problem only shows on my rx2800 i2 and not on my
other ia64 gear (rx4640 with Madison, rx2620 with Montecito and rx2660
with Montvale), so could be related to the different system architecture
of the Tukwila based rx2800 i2 (UMA =3D> NUMA IIC);

I just now tried to compile a more recent v5.2-rc5 kernel with the above
commits reverted, but that fails. There seem to have been further
changes made since v4.19.37 for which I would still need to find the
respective commits to revert. But I assume this work could be unneeded
for a further examination of the problem, so I don't follow this for
now. If it is needed please let me know.

James Clarke already had an idea what could be involved in this issue.
Maybe he can give his assessment.

If you want me to try a patch for a specific Linux version, please let
me know. The same if you need further information from me.

Cheers
Frank
