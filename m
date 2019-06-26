Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8895B56E85
	for <lists+linux-ia64@lfdr.de>; Wed, 26 Jun 2019 18:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfFZQP5 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 26 Jun 2019 12:15:57 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:54999 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725958AbfFZQP5 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Wed, 26 Jun 2019 12:15:57 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.85)
          with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id <1hgAaP-003VV1-Qm>; Wed, 26 Jun 2019 18:15:53 +0200
Received: from p5b13a8c2.dip0.t-ipconnect.de ([91.19.168.194] helo=[192.168.178.40])
          by inpost2.zedat.fu-berlin.de (Exim 4.85)
          with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id <1hgAaP-001Ehl-Ef>; Wed, 26 Jun 2019 18:15:53 +0200
Subject: Re: Kernel problem on rx2800 i2
To:     Christoph Hellwig <hch@lst.de>,
        Frank Scheiner <frank.scheiner@web.de>
Cc:     linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com, Michael Karcher <mkarcher@zedat.fu-berlin.de>
References: <f3d9d882-dd22-1782-6ec8-c88cb1880a83@web.de>
 <20190626155856.GA8413@lst.de>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Openpgp: preference=signencrypt
Autocrypt: addr=glaubitz@physik.fu-berlin.de; keydata=
 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
 scOkTAZQGVpD/8AaLH4v1w==
Message-ID: <b997082b-176f-7c0c-1328-0d22fbfd3916@physik.fu-berlin.de>
Date:   Wed, 26 Jun 2019 18:15:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190626155856.GA8413@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: 91.19.168.194
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi!

I'm CC'ing Michael Karcher, who is really good at tracking down
such bugs.

Adrian

On 6/26/19 5:58 PM, Christoph Hellwig wrote:
> I'm running out of luck trying to understand the issue with the
> zone list.  Adding the ia64 mailing list in addition to Tony
> to see if someone can figure out how a alloc_pages_node for the
> node stored in an AHCI PCIe pci_dev could cause an oops in the
> zonelist lookup.
> 
> On Fri, Jun 21, 2019 at 10:08:06PM +0200, Frank Scheiner wrote:
>> Hi there,
>>
>> recent testing of a Debian v4.19.37 kernel showed a problem on my rx2800
>> i2 happening during kernel boot:
>>
>> ```
>> [    0.000000] Linux version 4.19.0-5-itanium
>> (debian-kernel@lists.debian.org) (gcc version 8.3.0 (Debian
>> 8.3.0-10~ia64.1)) #1 SMP Debian 4.19.37-3 (2019-05-18)
>> [    0.000000] EFI v2.10 by HP:
>> [    0.000000] efi:  SALsystab=0x6fdd63a18  ACPI 2.0=0x3d3c4014
>> HCDP=0x6ffff8798  SMBIOS=0x3d368000
>> [    0.000000] booting generic kernel on platform dig
>> [    0.000000] PCDP: v3 at 0x6ffff8798
>> [    0.000000] earlycon: uart8250 at I/O port 0x4000 (options '115200n8')
>> [    0.000000] bootconsole [uart8250] enabled
>> [    0.000000] ACPI: Early table checksum verification disabled
>> [    0.000000] ACPI: RSDP 0x000000003D3C4014 000024 (v02 HP    )
>> [    0.000000] ACPI: XSDT 0x000000003D3C4580 000124 (v01 HP     RX2800-2
>> 00000001      01000013)
>> [...]
>> [   13.993718] Unpacking initramfs...
>> [...]
>> [   22.655630] Run /init as init process
>> [   22.818930] SCSI subsystem initialized
>> [   22.844653] ACPI: bus type USB registered
>> [   22.878940] HP HPSA Driver (v 3.4.20-125)
>> [   22.930628] usbcore: registered new interface driver usbfs
>> [   23.072034] usbcore: registered new interface driver hub
>> [   23.072925] hpsa 0000:01:00.0: Logical aborts not supported
>> [   23.150942] usbcore: registered new device driver usb
>> [   23.231690] hpsa 0000:01:00.0: HP SSD Smart Path aborts not supported
>> [   23.306942] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
>> [   23.417101] systemd-udevd[115]: NaT consumption 2216203124768 [1]
>> [   23.488663] ehci-pci: EHCI PCI platform driver
>> [   23.490942] uhci_hcd: USB Universal Host Controller Interface driver
>> [   23.420927] Modules linked in: uhci_hcd(+) ehci_pci(+) ehci_hcd
>> hpsa(+) scsi_transport_sas usbcore scsi_mod usb_common
>> [   23.420927]
>> [   23.420927] CPU: 6 PID: 115 Comm: systemd-udevd Not tainted
>> 4.19.0-5-itanium #1 Debian 4.19.37-3
>> [   23.420927] Hardware name: hp Integrity rx2800 i2, BIOS 01.93 09/12/2012
>> [   23.420927] psr : 0000121008026010 ifs : 8000000000002046 ip  :
>> [<a0000001002af041>]    Not tainted (4.19.0-5-itanium Debian 4.19.37-3)
>> [   23.420927] ip is at __alloc_pages_nodemask+0x261/0x20c0
>> [   23.420927] unat: 0000000000000000 pfs : 0000000000000793 rsc :
>> 0000000000000003
>> [   23.420927] rnat: 0000000000000000 bsps: 0000000000000000 pr  :
>> 85aaa9a99a6a6659
>> [   23.420927] ldrs: 0000000000000000 ccv : 0000000000000000 fpsr:
>> 0009804c8a70433f
>> [   23.420927] csd : 0000000000000000 ssd : 0000000000000000
>> [   23.420927] b0  : a0000001001710e0 b6  : a0000001003948c0 b7  :
>> a0000001000469c0
>> [   23.420927] f6  : 10012bffff00000000000 f7  : 1003e00000000000bffff
>> [   23.420927] f8  : 1003e0000000000003fc0 f9  : 1003effffffffffffffab
>> [   23.420927] f10 : 10016818d087e7cd81a78 f11 : 1003e000000000000002a
>> [   23.420927] r1  : a0000001015d6ba0 r2  : a0000001013643c8 r3  :
>> fffffffffffc04b8
>> [   23.420927] r8  : 0000000000001440 r9  : e000000001507708 r10 :
>> 0000000000000008
>> [   23.420927] r11 : ffffffffffd8d818 r12 : e000000682fcfbd0 r13 :
>> e000000682fc8000
>> [   23.420927] r14 : a0000001013643b8 r15 : ffffffffffd8d828 r16 :
>> 00000000007fffff
>> [   23.420927] r17 : 0000000000000008 r18 : 0000000000000000 r19 :
>> e000000001507710
>> [   23.420927] r20 : 0000000000000000 r21 : 0000000000002500 r22 :
>> 0000000000000000
>> [   23.420927] r23 : 0000000000000000 r24 : 0000000000000000 r25 :
>> 0000000000000000
>> [   23.420927] r26 : 0000000000000000 r27 : 0000000000000000 r28 :
>> e000000682fc87b0
>> [   23.420927] r29 : 0000000000200000 r30 : 0000000000000000 r31 :
>> 0000000000000000
>> [   23.420927]
>> [   23.420927] Call Trace:
>> [   23.420927]  [<a000000100014bd0>] show_stack+0x90/0xc0
>> [   23.420927]                                 sp=e000000682fcf790
>> bsp=e000000682fc9c80
>> [   23.420927]  [<a0000001000152d0>] show_regs+0x6d0/0xa00
>> [   23.420927]                                 sp=e000000682fcf960
>> bsp=e000000682fc9c10
>> [   23.420927]  [<a000000100029330>] die+0x1b0/0x460
>> [   23.420927]                                 sp=e000000682fcf980
>> bsp=e000000682fc9bc8
>> [   23.420927]  [<a000000100e75100>] ia64_fault+0x5a0/0xf60
>> [   23.420927]                                 sp=e000000682fcf980
>> bsp=e000000682fc9b70
>> [   23.420927]  [<a00000010000c9c0>] ia64_leave_kernel+0x0/0x270
>> [   23.420927]                                 sp=e000000682fcfa00
>> bsp=e000000682fc9b70
>> [   23.420927]  [<a0000001002af040>] __alloc_pages_nodemask+0x260/0x20c0
>> [   23.420927]                                 sp=e000000682fcfbd0
>> bsp=e000000682fc9938
>> [   23.420927]  [<a0000001001710e0>] dma_direct_alloc+0x140/0x2e0
>> [   23.420927]                                 sp=e000000682fcfc40
>> bsp=e000000682fc98c0
>> [   23.420927]  [<a000000100173910>] swiotlb_alloc+0x50/0x2e0
>> [   23.420927]                                 sp=e000000682fcfc40
>> bsp=e000000682fc9868
>> ```
>>
>> The machine doesn't continue boot afterwards. The machine boots fine
>> with a 4.14.x with Gentoo patches but also no later minor kernel version
>> with Gentoo patches works on it. With some testing I could limit the
>> Linux versions, between which the problematic change could have been
>> introduced, to 4.15.x and 4.16.x. Bisecting between tag v4.15.18 (good)
>> and tag v4.16-rc1 (bad) pointed to commit
>> 543cea9accd9804307541cb93d3ed7ec94b07237 ([1]) as first bad commit.
>>
>> [1]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=543cea9accd9804307541cb93d3ed7ec94b07237
>>
>> The kernel messages with problematic kernels from the bisecting process
>> look different to the ones from the above shown v4.19.37 from Debian though:
>>
>> ```
>> Linux version 4.15.0-rc7-00047-g543cea9accd9-dirty (root@rx2800-i2) (gcc
>> version 7.3.0 (Gentoo 7.3.0-r3 p1.4)) #1 SMP Thu Jun 13 22:16:30 CEST 2019
>> EFI v2.10 by HP:
>> efi:  SALsystab=0xdfdd63a18  ACPI 2.0=0x3d3c4014  HCDP=0xdffff8798
>> SMBIOS=0x3d368000
>> booting generic kernel on platform dig
>> PCDP: v3 at 0xdffff8798
>> earlycon: uart8250 at I/O port 0x4000 (options '115200n8')
>> bootconsole [uart8250] enabled
>> ACPI: Early table checksum verification disabled
>> ACPI: RSDP 0x000000003D3C4014 000024 (v02 HP    )
>> ACPI: XSDT 0x000000003D3C4580 000124 (v01 HP     RX2800-2 00000001
>> 01000013)
>> [...]
>> Trying to unpack rootfs image as initramfs...
>> [...]
>> Loading Adaptec I2O RAID: Version 2.4 Build 5go
>> Detecting Adaptec I2O RAID controllers...
>> ahci 0000:00:1f.2: AHCI 0001.0200 32 slots 6 ports 3 Gbps 0x3f impl SATA
>> mode
>> ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum part ccc ems
>> Unable to handle kernel NULL pointer dereference (address 0000000000001688)
>> swapper/0[1]: Oops 11012296146944 [1]
>> Modules linked in:
>>
>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted
>> 4.15.0-rc7-00047-g543cea9accd9-dirty #1
>> Hardware name: hp Integrity rx2800 i2, BIOS 01.93 09/12/2012
>> psr : 00001210084a6010 ifs : 8000000000001734 ip  : [<a000000100180401>]
>>    Not tainted (4.15.0-rc7-00047-g543cea9accd9-dirty)
>> ip is at __alloc_pages_nodemask+0x1a1/0x1670
>> unat: 0000000000000000 pfs : 0000000000001734 rsc : 0000000000000003
>> rnat: 000000038c5ad78d bsps: 000000000001003e pr  : 565595a66aa65799
>> ldrs: 0000000000000000 ccv : 000000032e40a799 fpsr: 0009804c8a70433f
>> csd : 0000000000000000 ssd : 0000000000000000
>> b0  : a0000001001802c0 b6  : a000000100050b50 b7  : a0000001007e83d0
>> f6  : 1003e0000000000000000 f7  : 1003e00000000000164ff
>> f8  : 1003e0000000000000f00 f9  : 1003e000000000000000f
>> f10 : 1003e0000000000000400 f11 : 1003e0000000000003c00
>> r1  : a00000010155edc0 r2  : a0000001012b5e90 r3  : 0000000001ffffff
>> r8  : 0000000000001680 r9  : 0000000000250015 r10 : e000000001519980
>> r11 : e000000001519988 r12 : e000000d8334fcf0 r13 : e000000d83348000
>> r14 : ffffffffffd570d0 r15 : 0000000000000008 r16 : e000000001519990
>> r17 : 0000000000000000 r18 : 0000000000001680 r19 : 0000000000000000
>> r20 : 0000000000000000 r21 : 0000000000000000 r22 : 0000000000000000
>> r23 : 0000000000000000 r24 : ffffffffffd570c0 r25 : a0000001012b5e80
>> r26 : 0000000000000000 r27 : 0000000000000000 r28 : 0000000000001688
>> r29 : 0000000000000358 r30 : 0000000000000000 r31 : 0000000000000081
>>
>> Call Trace:
>>  [<a000000100013760>] show_stack+0x40/0x90
>>                                 sp=e000000d8334f8c0 bsp=e000000d83349890
>>  [<a0000001000140e0>] show_regs+0x930/0x940
>>                                 sp=e000000d8334fa90 bsp=e000000d83349820
>>  [<a00000010003a7d0>] die+0x1a0/0x2f0
>>                                 sp=e000000d8334fa90 bsp=e000000d833497d8
>>  [<a000000100063140>] ia64_do_page_fault+0x830/0xa30
>>                                 sp=e000000d8334fa90 bsp=e000000d83349740
>>  [<a00000010000c400>] ia64_leave_kernel+0x0/0x270
>>                                 sp=e000000d8334fb20 bsp=e000000d83349740
>>  [<a000000100180400>] __alloc_pages_nodemask+0x1a0/0x1670
>>                                 sp=e000000d8334fcf0 bsp=e000000d83349598
>>  [<a000000100d70100>] dma_direct_alloc+0x170/0x470
>>                                 sp=e000000d8334fd50 bsp=e000000d83349518
>>  [<a0000001006a8770>] swiotlb_alloc+0x50/0x90
>>                                 sp=e000000d8334fd50 bsp=e000000d833494d8
>>  [<a00000010083abd0>] dmam_alloc_coherent+0x250/0x2c0
>>                                 sp=e000000d8334fd50 bsp=e000000d83349488
>>  [<a0000001009990c0>] ahci_port_start+0x2f0/0x4b0
>>                                 sp=e000000d8334fd50 bsp=e000000d83349440
>>  [<a000000100958490>] ata_host_start+0x310/0x470
>>                                 sp=e000000d8334fd60 bsp=e000000d833493d0
>>  [<a000000100964a70>] ata_host_activate+0x20/0x290
>>                                 sp=e000000d8334fd60 bsp=e000000d83349370
>>  [<a000000100999570>] ahci_host_activate+0x2f0/0x300
>>                                 sp=e000000d8334fd60 bsp=e000000d83349300
>>  [<a0000001009923d0>] ahci_init_one+0x1580/0x20b0
>>                                 sp=e000000d8334fd60 bsp=e000000d83349258
>>  [<a0000001006d0610>] local_pci_probe+0x90/0x150
>>                                 sp=e000000d8334fdc0 bsp=e000000d83349218
>>  [<a0000001006d1a30>] pci_device_probe+0x2f0/0x310
>>                                 sp=e000000d8334fdc0 bsp=e000000d833491d8
>>  [<a0000001008229f0>] driver_probe_device+0x520/0x720
>>                                 sp=e000000d8334fde0 bsp=e000000d83349170
>>  [<a000000100822d10>] __driver_attach+0x120/0x190
>>                                 sp=e000000d8334fde0 bsp=e000000d83349140
>>  [<a00000010081ec00>] bus_for_each_dev+0x120/0x140
>>                                 sp=e000000d8334fde0 bsp=e000000d83349100
>>  [<a000000100821bf0>] driver_attach+0x40/0x60
>>                                 sp=e000000d8334fdf0 bsp=e000000d833490e0
>>  [<a0000001008211b0>] bus_add_driver+0x400/0x4a0
>>                                 sp=e000000d8334fdf0 bsp=e000000d83349090
>>  [<a000000100823fc0>] driver_register+0x240/0x2d0
>>                                 sp=e000000d8334fdf0 bsp=e000000d83349068
>>  [<a0000001006cfde0>] __pci_register_driver+0xa0/0xc0
>>                                 sp=e000000d8334fdf0 bsp=e000000d83349038
>>  [<a0000001010ecdb0>] ahci_pci_driver_init+0x50/0x70
>>                                 sp=e000000d8334fdf0 bsp=e000000d83349020
>>  [<a00000010000a950>] do_one_initcall+0x290/0x2a0
>>                                 sp=e000000d8334fdf0 bsp=e000000d83348fe0
>>  [<a0000001010a1c10>] kernel_init_freeable+0x400/0x430
>>                                 sp=e000000d8334fe30 bsp=e000000d83348f78
>>  [<a000000100d93860>] kernel_init+0x20/0x280
>>                                 sp=e000000d8334fe30 bsp=e000000d83348f58
>>  [<a00000010000c1f0>] call_payload+0x50/0x80
>>                                 sp=e000000d8334fe30 bsp=e000000d83348f40
>> Disabling lock debugging due to kernel taint
>> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>>
>> ---[ end Kernel panic - not syncing: Attempted to kill init!
>> exitcode=0x0000000b
>> ```
>>
>> ...but because of the result below - spoiler: a v4.19.37 kernel working
>> on my rx2800 i2 - I assume they're created by the very same issue.
>>
>> Starting at tag v4.19.37 I then reverted the following commits:
>>
>> * cf65a0f6f6ff7631ba0ac0513a14ca5b65320d80 [2]
>>
>> * 16e73adbca76fd18733278cb688b0ddb4cad162c [3]
>>
>> * 9d37c094dacda531ac3e529dd4dd139e3c0b7811 [4]
>>
>> * 4fac8076df854aa4ddb8acbf6cce9d337300219e [5]
>>
>> * 543cea9accd9804307541cb93d3ed7ec94b07237 [6]
>>
>> ...and compiled a kernel using the localmodconfig target to create a
>> minimal config. The resulting kernel booted fine on my rx2800 i2:
>>
>> ```
>> Linux version 4.19.37-00005-g55bd603c2590-dirty (root@rx2800-i2) (gcc
>> version 7.3.0 (Gentoo 7.3.0-r3 p1.4)) #1 SMP Thu Jun 20 23:58:57 CEST 2019
>> EFI v2.10 by HP:
>> efi:  SALsystab=0xdfdd63a18  ACPI 2.0=0x3d3c4014  HCDP=0xdffff8798
>> SMBIOS=0x3d368000
>> booting generic kernel on platform dig
>> PCDP: v3 at 0xdffff8798
>> earlycon: uart8250 at I/O port 0x4000 (options '115200n8')
>> bootconsole [uart8250] enabled
>> ACPI: Early table checksum verification disabled
>> ACPI: RSDP 0x000000003D3C4014 000024 (v02 HP    )
>> ACPI: XSDT 0x000000003D3C4580 000124 (v01 HP     RX2800-2 00000001
>> 01000013)
>> [...]
>>  * Starting sshd ...
>>  [ ok ]
>>  * Starting local ...
>>  [ ok ]
>>
>>
>> This is rx2800-i2[...] (Linux ia64 4.19.37-00005-g55bd603c2590-dirty)
>> 20:49:42
>> ```
>>
>> [2]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=cf65a0f6f6ff7631ba0ac0513a14ca5b65320d80
>>
>> [3]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=16e73adbca76fd18733278cb688b0ddb4cad162c
>>
>> [4]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9d37c094dacda531ac3e529dd4dd139e3c0b7811
>>
>> [5]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=4fac8076df854aa4ddb8acbf6cce9d337300219e
>>
>> [6]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=543cea9accd9804307541cb93d3ed7ec94b07237
>>
>> ****
>>
>> Please note:
>>
>> * that I'm always using the "ia64: fix ptrace" patch ([7]) in addition,
>> as I'm compiling with gcc 7.3.0 on Gentoo;
>>
>> [7]: https://lore.kernel.org/patchwork/patch/884685/
>>
>> * that the original problem only shows on my rx2800 i2 and not on my
>> other ia64 gear (rx4640 with Madison, rx2620 with Montecito and rx2660
>> with Montvale), so could be related to the different system architecture
>> of the Tukwila based rx2800 i2 (UMA => NUMA IIC);
>>
>> I just now tried to compile a more recent v5.2-rc5 kernel with the above
>> commits reverted, but that fails. There seem to have been further
>> changes made since v4.19.37 for which I would still need to find the
>> respective commits to revert. But I assume this work could be unneeded
>> for a further examination of the problem, so I don't follow this for
>> now. If it is needed please let me know.
>>
>> James Clarke already had an idea what could be involved in this issue.
>> Maybe he can give his assessment.
>>
>> If you want me to try a patch for a specific Linux version, please let
>> me know. The same if you need further information from me.
>>
>> Cheers
>> Frank
> ---end quoted text---
> 

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
