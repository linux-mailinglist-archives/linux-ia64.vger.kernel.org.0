Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 787D0553C1
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 17:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbfFYPwq (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 11:52:46 -0400
Received: from mout.web.de ([212.227.17.11]:46395 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfFYPwp (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 11:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561477957;
        bh=oo8VqA+XUeUPMo4nCcTJOzfIMK5oatMIi41/pPzoXR4=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=nfpc27b2yGyJd5LnL5WgxY5nbxD5cwX4Zhl7evf44f5j25c2H6lcjfNNXKWHiyKh+
         ctCOfowbDu/USay3GG6Qxdq0jkM9r4y3nMOSyC2blTwHLo9qrDM5EscIzwp7RmkQLX
         3Z3fk1jDfS1hgXdU0Ura70HanW+pwbV2tsHNepqA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.21] ([217.247.38.146]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MYNrh-1i23ZU03xR-00V7fI; Tue, 25
 Jun 2019 17:52:37 +0200
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
To:     Christoph Hellwig <hch@lst.de>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com, frank.scheiner@web.de
References: <20190625081825.GA31752@lst.de>
 <c5412a03-e3ce-eecd-737f-119c7d955ed3@web.de>
 <60d38f5f-4867-ee1d-783c-ae162e25bea9@web.de> <20190625103232.GA2132@lst.de>
 <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de> <20190625104702.GA2569@lst.de>
 <a2ab92b3-e89d-a610-91d1-5ea626be4995@web.de>
 <0f76468f-8648-62d8-68d2-455c74c19328@physik.fu-berlin.de>
 <20190625120024.GA3979@lst.de> <000348b4-0786-9ebc-e79e-28815fa9890c@web.de>
 <20190625144009.GA7281@lst.de>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <80470803-d475-815a-c95a-f9961fde5d97@web.de>
Date:   Tue, 25 Jun 2019 17:52:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625144009.GA7281@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CqOjPJjozYhZtbKldF1moxitdP9uj9hi75nqDgaxGgE52UZKxAf
 N2I4VHxnlx+3ZcbNONhzmXcxrM//3dQZesiMiwo8t7LFTOYyN3q4dP9OcgBYgyby6LoafEa
 Fbb6UgiCuDulUdXuP481AZ/Vn1ynbQoRgP6UIcll1DRZ9CQFQ0S/XYt+ZZ6tTR1a7adjhBY
 FHXuntMTapGO2xGliwYyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d4bkLlI+z24=:7t38/1TUWQMVtQibWeCf9J
 SgVLipsbS6/I/+KJf8CIYqQjLnHCy78fqDCh2nScq1EqZD4s+MmYBmOKVoEcnEElNRb2UfHhO
 1bsSGqzmUb98E+VOHQ5XBqSIhLds9+E6y97BpHPVCMydklTqC4cRCHc99gTo+JhnE/a6ovv+L
 kufVTSwRllg00XEJnnI5f2BDP1F8QpH1vW0x3nx8uH9Xx5SDDFSYItYna0aLMQYThHdJk6id4
 FaFrVyHFazHImvXcyM8BwpFeXXBAtb0RqvGtcxJdVRIvoR9DCZnGZfdX2wodCJcoeaf9SOFKr
 UjBdu9wW7Bti6may4OMYZc2G1N0A6ZGq5yjx5UCXTLg1H/yrqEzUgq/K8hh2bID35URXBKsUB
 vForghuW68yNyQ9GFIUuWK506rm/DfW0rw8ThxSVWVjOLP5pmt0/B5iAReSqAzTaUC0enMV90
 XfgAr76DK+tVl288ngiP541beWfEbw4OzYeCt6RpLt0I1r8ri7a7AhPoRAchpJRjqL/6HJp4D
 9gmV4DdItiqKf+dt7Xd1s+FE4xlsGRGXDt3YvHRaaJ8mgwqjnj/aCzMmenqF9IZn9TV47Ub06
 Py+IAPF7hVuIWYfiaXVcXbmkav9Q5qf06TZHaD7IMCQ9fAYSzQa9GrWhLpvbI//Mf6PpHzlNg
 3yxmw0poF479sbpDvt5O5/l4k6A73TeWiDJgJi0mgatTY5VY+IBKdPtIt+OE0573wKGRDC0xw
 S3CnTyRivtpdX7sKKMe52YwoBMPBjMEsR/LX5gl4ZlZtynf/ri1Fg3hZLYDW2lt4hfB3LMXzt
 wO4QweXOmTOA/p2AbZ1CbOymDqtWsq8EFCZPEqZD8mV2sPslx5VDNW2TAbLrXoSL+DFyz+WPR
 lXDbY3bo4JcKPoa/I7y492v2bt0FGrFEEOOVb/vLaBj/cLnkx9pfmF/gzSyPpQ+jJ7+948JI7
 1hIbI3sFFMscOhdkMH9cg+SkzLQ1ymn8uyCsFjAoFWtqAEUYUt6ozRaoQSjMW8W95kazpt1vG
 39gC2bFwxeJ4Zt7jw/aN2fo8QSSttm2Jh9Bi4smJ8zuB8FBA0cRZFxIWE0PnAtiOScwnjZcwo
 kB+kujZX3irKjgUHL9rSXteSl5Np+UjVIx2
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org



On 6/25/19 16:40, Christoph Hellwig wrote:
> Please try this patch instead of the previous one:
>
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 2c2772e9702a..3516a543450e 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -118,9 +118,10 @@ struct page *__dma_direct_alloc_pages(struct device=
 *dev, size_t size,
>   			page =3D NULL;
>   		}
>   	}
> -	if (!page)
> -		page =3D alloc_pages_node(dev_to_node(dev), gfp, page_order);
> -
> +	if (!page) {
> +		page =3D alloc_pages_node(local_memory_node(dev_to_node(dev)),
> +					gfp, page_order);
> +	}
>   	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
>   		__free_pages(page, page_order);
>   		page =3D NULL;
>

Took me a while as I lost two tries, because of two problems after which
the machine was no longer responsible, once during recompilation of the
changed files and once during installation of kernel modules.

This is what I saw, not sure if it is related to the changes or the
newer kernel version, but I can't remember seeing such messages before:

```
## 1st problem:

BUG: Bad page state in process kworker/u33:1  pfn:36304b
bad because of flags: 0x800(arch_1)

## 2nd problem:

BUG: Bad page state in process kworker/u32:5  pfn:3630f7
bad because of flags: 0x800(arch_1)
```

Using the v4.19.37 with the reverts mentioned in the initial mail I was
able to create the new kernel, install the kernel modules and build the
initramfs.

Using the third patch the resulting kernel sadly panics again:
```
Linux version 5.1.15-dirty (root@rx2800-i2) (gcc version 7.3.0 (Gentoo
7.3.0-r3 p1.4)) #3 SMP Tue Jun 25 17:41:55 CEST 2019
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

CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.1.15-dirty #3
Hardware name: hp Integrity rx2800 i2, BIOS 01.93 09/12/2012
psr : 00001210084a6010 ifs : 8000000000000207 ip  : [<a00000010017e591>]
    Not tainted (5.1.15-dirty)
ip is at local_memory_node+0x51/0xd0
unat: 0000000000000000 pfs : 0000000000000814 rsc : 0000000000000003
rnat: 4905ad66a46b1a31 bsps: 6330dc59462bf692 pr  : 000000000001aa55
ldrs: 0000000000000000 ccv : 000000038df5dd8b fpsr: 0009804c8a70433f
csd : 0000000000000000 ssd : 0000000000000000
b0  : a00000010010ea70 b6  : a00000010003a740 b7  : a0000001007fe9b0
f6  : 1003e00000000000164ff f7  : 1000fb27f800000000000
f8  : 1003e0000000000003480 f9  : 1003e000000000000000f
f10 : 1003e0000000000000400 f11 : 1003e0000000000003c00
r1  : a0000001015a9e80 r2  : e000000001519980 r3  : e000000001519988
r8  : 0000000000000008 r9  : e000000001519990 r10 : 0000000000000000
r11 : 0000000000001688 r12 : e000000d8339fd50 r13 : e000000d83398000
r14 : fffffffffffc04b8 r15 : 0000000000000000 r16 : ffffffffffffffff
r17 : ffffffffffffffff r18 : 0000000000ffffff r19 : e000000d80010180
r20 : fffffffffffd01b0 r21 : 0000000000000010 r22 : e0000000011101b0
r23 : 0000000000000001 r24 : e0000000011101bc r25 : 0000000000000001
r26 : 000000000000006c r27 : e000000d846679d0 r28 : e000000d846679c0
r29 : 0000000000000370 r30 : 0000000000000000 r31 : 0000000000000081

Call Trace:
  [<a000000100013820>] show_stack+0x40/0x90
                                 sp=3De000000d8339f9a0 bsp=3De000000d83399=
750
  [<a0000001000141a0>] show_regs+0x930/0x940
                                 sp=3De000000d8339fb70 bsp=3De000000d83399=
6e0
  [<a0000001000245e0>] die+0x1a0/0x2f0
                                 sp=3De000000d8339fb70 bsp=3De000000d83399=
6a0
  [<a00000010004bab0>] ia64_do_page_fault+0x7e0/0x9e0
                                 sp=3De000000d8339fb70 bsp=3De000000d83399=
610
  [<a00000010000c580>] ia64_leave_kernel+0x0/0x270
                                 sp=3De000000d8339fb80 bsp=3De000000d83399=
610
  [<a00000010017e590>] local_memory_node+0x50/0xd0
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
5d0
  [<a00000010010ea70>] __dma_direct_alloc_pages+0x150/0x340
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
550
  [<a00000010010ec90>] dma_direct_alloc_pages+0x30/0x170
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
510
  [<a00000010003a790>] arch_dma_alloc+0x30/0x50
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
4d0
  [<a00000010010ef30>] dma_direct_alloc+0x60/0xa0
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
490
  [<a00000010010c570>] dma_alloc_attrs+0x150/0x1e0
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
440
  [<a00000010010c670>] dmam_alloc_attrs+0x70/0x100
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
3e8
  [<a0000001009a9bb0>] ahci_port_start+0x2e0/0x4a0
                                 sp=3De000000d8339fd50 bsp=3De000000d83399=
3a0
  [<a000000100969480>] ata_host_start+0x300/0x460
                                 sp=3De000000d8339fd60 bsp=3De000000d83399=
340
  [<a0000001009758c0>] ata_host_activate+0x20/0x280
                                 sp=3De000000d8339fd60 bsp=3De000000d83399=
2e0
  [<a0000001009aa090>] ahci_host_activate+0x320/0x330
                                 sp=3De000000d8339fd60 bsp=3De000000d83399=
270
  [<a0000001009a3430>] ahci_init_one+0x1a70/0x1e10
                                 sp=3De000000d8339fd60 bsp=3De000000d83399=
1b8
  [<a0000001006df4d0>] local_pci_probe+0x90/0x140
                                 sp=3De000000d8339fdc0 bsp=3De000000d83399=
178
  [<a0000001006e09f0>] pci_device_probe+0x2f0/0x310
                                 sp=3De000000d8339fdc0 bsp=3De000000d83399=
140
  [<a00000010083a3a0>] really_probe+0x4a0/0x6b0
                                 sp=3De000000d8339fde0 bsp=3De000000d83399=
0d8
  [<a00000010083aa60>] driver_probe_device+0x1e0/0x1f0
                                 sp=3De000000d8339fde0 bsp=3De000000d83399=
0a0
  [<a00000010083af00>] device_driver_attach+0xb0/0x100
                                 sp=3De000000d8339fde0 bsp=3De000000d83399=
070
  [<a00000010083b130>] __driver_attach+0x1e0/0x1f0
                                 sp=3De000000d8339fde0 bsp=3De000000d83399=
040
  [<a0000001008363f0>] bus_for_each_dev+0xd0/0x130
                                 sp=3De000000d8339fde0 bsp=3De000000d83399=
000
  [<a0000001008394b0>] driver_attach+0x40/0x60
                                 sp=3De000000d8339fdf0 bsp=3De000000d83398=
fd8
  [<a000000100838880>] bus_add_driver+0x3b0/0x450
                                 sp=3De000000d8339fdf0 bsp=3De000000d83398=
f88
  [<a00000010083c090>] driver_register+0x220/0x2b0
                                 sp=3De000000d8339fdf0 bsp=3De000000d83398=
f60
  [<a0000001006deb50>] __pci_register_driver+0xa0/0xc0
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
  [<a000000100ddd680>] kernel_init+0x20/0x280
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

gdb shows the same like the last time for the "new" faulting address:

```
# gdb ./vmlinux
[...]
(gdb) l *(local_memory_node+0x51)
0xa00000010017e591 is in local_memory_node (./include/linux/mmzone.h:993).
988	 */
989	static __always_inline struct zoneref *next_zones_zonelist(struct
zoneref *z,
990						enum zone_type highest_zoneidx,
991						nodemask_t *nodes)
992	{
993		if (likely(!nodes && zonelist_zone_idx(z) <=3D highest_zoneidx))
994			return z;
995		return __next_zones_zonelist(z, highest_zoneidx, nodes);
996	}
997
```

Cheers,
Frank
