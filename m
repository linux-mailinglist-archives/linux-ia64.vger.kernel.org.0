Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 206F552646
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 10:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbfFYIQd (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 04:16:33 -0400
Received: from mout.web.de ([217.72.192.78]:59129 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727984AbfFYIQd (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 04:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561450583;
        bh=NBPZfsr8+TzjIyovCs3Kj4buTNvhoiRNzPGSwSKjhGw=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=BDQdyofJwJmXPju7+AjUVpOtwvGk4O2aKoKC6C86Yp52U+qNug2NvXz14AL1pl6Bt
         zYtDWEWc7UWUW1cwSfjs9Z/r8ILyak6bThL1frA2fcJ2OgOWbUYCVtYgU8XlQ3xKyE
         llqkCgQflBLpusgTVYfM6YeWWPBBLrjapOYQVdH0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.21] ([217.247.38.146]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MKZy7-1hh4Km0f5j-001vMP; Tue, 25
 Jun 2019 10:16:23 +0200
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
From:   Frank Scheiner <frank.scheiner@web.de>
To:     Christoph Hellwig <hch@lst.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com, frank.scheiner@web.de
References: <f3d9d882-dd22-1782-6ec8-c88cb1880a83@web.de>
 <1d62aadd-67b6-da13-53cc-4b5213de8937@physik.fu-berlin.de>
 <20190625064218.GA29841@lst.de>
 <7f701503-7bd3-28bf-d7e6-d52d3fd168ee@physik.fu-berlin.de>
 <20190625065003.GA29883@lst.de>
 <87311b3d-748d-57e1-21cc-89774bf71a4a@physik.fu-berlin.de>
 <20190625065905.GA30073@lst.de> <5939b8fa-8f3b-fa30-aeb0-d19c6baf89da@web.de>
Message-ID: <cce09bfe-0179-4ce7-4488-09c66b968628@web.de>
Date:   Tue, 25 Jun 2019 10:16:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5939b8fa-8f3b-fa30-aeb0-d19c6baf89da@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4iFJSgQX+Tet0wzpchxvSiZ8OzzjL9xNockQWkCqNlZb5bNYPE+
 bGjnWF+g14X8EwFqtdB0jQlQzB/sRj6YIueul2syOtUcgcFWg8NTX8aOl0D92C+BC629+Qf
 Cp5aE+H7veqZI4zfk24pxI+iZldRIfjC5iLnTriQoDMOS1aDoXCheFmStuCB7MDJox32Ot+
 18P+ZGlUbV0olWdGrsUnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yiiHYNS6AmQ=:Kou2gZl3AfLPMHI5RX8aLk
 pdKIheXc4XK6nOW5wmX5Gxm8orljVL2t8q8I/9fTUUeAaseKlXNlaK+bEUj+hVBouxQFmm6T2
 X5NyIuy50gEYsaOhmRF3pagji6vxxbMaABphRp2MwzRBDq90NQ7lmxQJBTGsglE849VOumyak
 05N+n0TnAf9AD3kdOG4Xubolm+2X7CIRkSUjPNBFl2dr4O9qqBNAcUY6HhwF2h3cxsURHnXDp
 WzOYfJ1f9VbKMQTEZWV4T3MHfGGV05nGEru1XH3CQUmtF2BNwSj7Xr0h5SRlyR/3fOHR4pQnW
 HLGd2HPehPzbTJNA85Y8U4jLTgN0yWZcnw4eZJ201sR1MdV8UXovF8nBA18nuOCnnEYBTOI+B
 UgCusAMuXXzGuDQBwJBSjtT6OBpsAYvnQ306IzIRbJCjOEQOcwqQT38UlIPhBRs9bsz/MA9Fx
 TC9rwxydFrPo2OLYXs+S0Pw8OChw1ST6icwN7JQ7WUChjYmoxWXCmkO5kewekPCo5iHCzhGpJ
 1lNJUx1Ue2ovYNZp3yrR91YfZr3ZsAqnzywt4LsBYqaTE6bumeAhbFOopM/ClrXRZqscsZoFW
 dSR9CLPC4crcPAxYql2Q71mmfTWGphhcofVLE7/as9qeNEacYBnHLF7SmfshLK/yurTeW0vCB
 Ky7r7+u1r3A0apt5ZsdhWISul0aQWjqHwdXbDDDeepiHJoyKgWJZUngwtHIC1zbjwaa0D32x/
 xuyU+/CvwcbGzz7mE/kP9XDwJX7gnIbKjvvvwu5fbCp0D6nGyfLo1AXk/9bqh55csUbknuNz4
 2GdmqMuMREiyj3NT7GNc9bkVlKREpSxJB9OH/StCMc5sh23+wnIABYABTUXO+BK/r4Pud7YAg
 8vHGO7DHLES5lgqU25tJ35QFUwO67VP07hH5tNWT4zxs/3YQHH5KIdb/gKHrzIjUaJJVDpQIM
 LileTLTkZIjR5xZLMEMOI+nXcSAB44+Qcp4h9XgyFHuP1TS4im9HYdaXzwJLxkCOytXUem/cu
 udAafQfNryoiTEf9TWurA8MGxl3gyDXMh4Rn70LHY02xgV+ZQ3+QW8WY3b18yLVh2g==
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 6/25/19 09:26, Frank Scheiner wrote:
> On 6/25/19 08:59, Christoph Hellwig wrote:
>> On Tue, Jun 25, 2019 at 08:54:11AM +0200, John Paul Adrian Glaubitz
>> wrote:
>>> Okay, thanks. I'll whip up a patch for Frank to test.
>>
>> The one below should do it, but from looking at the ia64 zone
>> initialization I'm not sure this will be the culprit.
>>
>> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
>> index 2c2772e9702a..3e802f4580b3 100644
>> --- a/kernel/dma/direct.c
>> +++ b/kernel/dma/direct.c
>> @@ -82,9 +82,7 @@ static gfp_t __dma_direct_optimal_gfp_mask(struct
>> device *dev, u64 dma_mask,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*phys_mask <=3D DMA_BIT_MASK(ARCH_ZO=
NE_DMA_BITS))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return GFP_DMA;
>> -=C2=A0=C2=A0=C2=A0 if (*phys_mask <=3D DMA_BIT_MASK(32))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return GFP_DMA32;
>> -=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 return GFP_DMA32;
>> =C2=A0 }
>> =C2=A0 static bool dma_coherent_ok(struct device *dev, phys_addr_t phys=
,
>> size_t size)
>>
>
> Ok, will apply that to the most recent non-rc kernel source and give it
> a try. Should take about 45 mins or so.

Looks like this patch is not enough or not related, a kernel v5.1.15
with that patch applied yields the following:

```
Linux version 5.1.15-dirty (root@rx2800-i2) (gcc version 7.3.0 (Gentoo
7.3.0-r3 p1.4)) #1 SMP Tue Jun 25 09:59:06 CEST 2019
EFI v2.10 by HP:
efi:  SALsystab=3D0xdfdd63a18  ACPI 2.0=3D0x3d3c4014  HCDP=3D0xdffff8798
SMBIOS=3D0x3d368000
booting generic kernel on platform dig
PCDP: v3 at 0xdffff8798
earlycon: uart8250 at I/O port 0x4000 (options '115200n8')
printk: bootconsole [uart8250] enabled
ACPI: Early table checksum verification disabled
ACPI: RSDP 0x000000003D3C4014 000024 (v02 HP    )
ACPI: XSDT 0x000000003D3C4580 000124 (v01 HP     RX2800-2 00000001
01000013)
[...]
Trying to unpack rootfs image as initramfs...
[...]
Detecting Adaptec I2O RAID controllers...
ahci 0000:00:1f.2: AHCI 0001.0200 32 slots 6 ports 3 Gbps 0x3f impl SATA
mode
ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum part ccc ems
Unable to handle kernel NULL pointer dereference (address 0000000000001688=
)
swapper/0[1]: Oops 11012296146944 [1]
Modules linked in:

CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.1.15-dirty #1
Hardware name: hp Integrity rx2800 i2, BIOS 01.93 09/12/2012
psr : 00001210084a6010 ifs : 8000000000001734 ip  : [<a00000010017b901>]
    Not tainted (5.1.15-dirty)
ip is at __alloc_pages_nodemask+0x281/0x17a0
unat: 0000000000000000 pfs : 0000000000001734 rsc : 0000000000000003
rnat: 00000003d8598c41 bsps: 000000000001003e pr  : 0000000000011269
ldrs: 0000000000000000 ccv : 000000038d5f0ad4 fpsr: 0009804c8a70433f
csd : 0000000000000000 ssd : 0000000000000000
b0  : a00000010017b8c0 b6  : a00000010003a740 b7  : a0000001007fe990
f6  : 1003e0000000000000000 f7  : 1000fb27f800000000000
f8  : 1003e0000000000003480 f9  : 1003e000000000000000f
f10 : 1003e0000000000000400 f11 : 1003e0000000000003c00
r1  : a0000001015a9e80 r2  : a000000101339e94 r3  : 00000000007fffff
r8  : 0000000000001680 r9  : 0000000000002500 r10 : fffffffffffc04b8
r11 : e000000001519980 r12 : e000000d8339fce0 r13 : e000000d83398000
r14 : ffffffffffd90014 r15 : 0000000000000001 r16 : 0000000000000008
r17 : e000000001519990 r18 : 0000000000001680 r19 : 0000000000000000
r20 : 0000000000000000 r21 : 0000000000000000 r22 : 0000000000000000
r23 : 0000000000000000 r24 : ffffffffffd90000 r25 : a000000101339e80
r26 : 0000000000000000 r27 : 0000000000000000 r28 : 0000000000000000
r29 : 0000000000001688 r30 : 0000000000000000 r31 : 0000000000000081

Call Trace:
  [<a000000100013820>] show_stack+0x40/0x90
                                 sp=3De000000d8339f930 bsp=3De000000d83399=
8c0
  [<a0000001000141a0>] show_regs+0x930/0x940
                                 sp=3De000000d8339fb00 bsp=3De000000d83399=
850
  [<a0000001000245e0>] die+0x1a0/0x2f0
                                 sp=3De000000d8339fb00 bsp=3De000000d83399=
810
  [<a00000010004bab0>] ia64_do_page_fault+0x7e0/0x9e0
                                 sp=3De000000d8339fb00 bsp=3De000000d83399=
778
  [<a00000010000c580>] ia64_leave_kernel+0x0/0x270
                                 sp=3De000000d8339fb10 bsp=3De000000d83399=
778
  [<a00000010017b900>] __alloc_pages_nodemask+0x280/0x17a0
                                 sp=3De000000d8339fce0 bsp=3De000000d83399=
5d0
  [<a00000010010eab0>] __dma_direct_alloc_pages+0x190/0x320
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
550
  [<a00000010010ec70>] dma_direct_alloc_pages+0x30/0x170
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
510
  [<a00000010003a790>] arch_dma_alloc+0x30/0x50
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
4d0
  [<a00000010010ef10>] dma_direct_alloc+0x60/0xa0
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
490
  [<a00000010010c570>] dma_alloc_attrs+0x150/0x1e0
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
440
  [<a00000010010c670>] dmam_alloc_attrs+0x70/0x100
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
3e8
  [<a0000001009a9b90>] ahci_port_start+0x2e0/0x4a0
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
3a0
  [<a000000100969460>] ata_host_start+0x300/0x460
                                 sp=3De000000d8339fd60 bsp=3De000000d83399=
340
  [<a0000001009758a0>] ata_host_activate+0x20/0x280
                                 sp=3De000000d8339fd60 bsp=3De000000d83399=
2e0
  [<a0000001009aa070>] ahci_host_activate+0x320/0x330
                                 sp=3De000000d8339fd60 bsp=3De000000d83399=
270
  [<a0000001009a3410>] ahci_init_one+0x1a70/0x1e10
                                 sp=3De000000d8339fd60 bsp=3De000000d83399=
1b8
  [<a0000001006df4b0>] local_pci_probe+0x90/0x140
                                 sp=3De000000d8339fdc0 bsp=3De000000d83399=
178
  [<a0000001006e09d0>] pci_device_probe+0x2f0/0x310
                                 sp=3De000000d8339fdc0 bsp=3De000000d83399=
140
  [<a00000010083a380>] really_probe+0x4a0/0x6b0
                                 sp=3De000000d8339fde0 bsp=3De000000d83399=
0d8
  [<a00000010083aa40>] driver_probe_device+0x1e0/0x1f0
                                 sp=3De000000d8339fde0 bsp=3De000000d83399=
0a0
  [<a00000010083aee0>] device_driver_attach+0xb0/0x100
                                 sp=3De000000d8339fde0 bsp=3De000000d83399=
070
  [<a00000010083b110>] __driver_attach+0x1e0/0x1f0
                                 sp=3De000000d8339fde0 bsp=3De000000d83399=
040
  [<a0000001008363d0>] bus_for_each_dev+0xd0/0x130
                                 sp=3De000000d8339fde0 bsp=3De000000d83399=
000
  [<a000000100839490>] driver_attach+0x40/0x60
                                 sp=3De000000d8339fdf0 bsp=3De000000d83398=
fd8
  [<a000000100838860>] bus_add_driver+0x3b0/0x450
                                 sp=3De000000d8339fdf0 bsp=3De000000d83398=
f88
  [<a00000010083c070>] driver_register+0x220/0x2b0
                                 sp=3De000000d8339fdf0 bsp=3De000000d83398=
f60
  [<a0000001006deb30>] __pci_register_driver+0xa0/0xc0
                                 sp=3De000000d8339fdf0 bsp=3De000000d83398=
f30
  [<a0000001011442d0>] ahci_pci_driver_init+0x50/0x70
                                 sp=3De000000d8339fdf0 bsp=3De000000d83398=
f18
  [<a00000010000a7d0>] do_one_initcall+0x100/0x2c0
                                 sp=3De000000d8339fdf0 bsp=3De000000d83398=
ee0
  [<a0000001010f9cc0>] kernel_init_freeable+0x410/0x470
                                 sp=3De000000d8339fe30 bsp=3De000000d83398=
e78
  [<a000000100ddd660>] kernel_init+0x20/0x280
                                 sp=3De000000d8339fe30 bsp=3De000000d83398=
e58
  [<a00000010000c370>] call_payload+0x50/0x80
                                 sp=3De000000d8339fe30 bsp=3De000000d83398=
e40
Disabling lock debugging due to kernel taint
Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b
=2D--[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=3D0x0000000b ]---
```

During compilation I noticed the following messages:

```
[...]
   CC      arch/ia64/kernel/dma-mapping.o
In file included from ./include/linux/cpumask.h:12:0,
                  from ./include/linux/rcupdate.h:31,
                  from ./include/linux/rculist.h:11,
                  from ./include/linux/pid.h:5,
                  from ./include/linux/sched.h:14,
                  from kernel/sched/sched.h:5,
                  from kernel/sched/core.c:8:
In function =E2=80=98bitmap_zero=E2=80=99,
     inlined from =E2=80=98cpumask_clear=E2=80=99 at ./include/linux/cpuma=
sk.h:390:2,
     inlined from =E2=80=98get_mmu_context=E2=80=99 at
./arch/ia64/include/asm/mmu_context.h:92:3,
     inlined from =E2=80=98activate_context=E2=80=99 at
./arch/ia64/include/asm/mmu_context.h:170:11,
     inlined from =E2=80=98activate_mm=E2=80=99 at
./arch/ia64/include/asm/mmu_context.h:194:2,
     inlined from =E2=80=98idle_task_exit=E2=80=99 at kernel/sched/core.c:=
5575:3:
./include/linux/bitmap.h:218:2: warning: =E2=80=98memset=E2=80=99 writing =
8 bytes into a
region of size 0 overflows the destination [-Wstringop-overflow=3D]
   memset(dst, 0, len);
   ^~~~~~~~~~~~~~~~~~~
[...]
```

...though I can't say if I haven't seen this before, as I didn't check
the whole make output if it exited with 0.

Cheers,
Frank
