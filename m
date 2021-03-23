Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6B63461D5
	for <lists+linux-ia64@lfdr.de>; Tue, 23 Mar 2021 15:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbhCWOta (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 23 Mar 2021 10:49:30 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:40943 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232413AbhCWOtL (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 23 Mar 2021 10:49:11 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lOiLF-0011lR-MF; Tue, 23 Mar 2021 15:49:09 +0100
Received: from p57bd9564.dip0.t-ipconnect.de ([87.189.149.100] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lOiLF-0044C6-GD; Tue, 23 Mar 2021 15:49:09 +0100
To:     debian-ia64 <debian-ia64@lists.debian.org>
Cc:     "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Current Linux kernels working on rx2800 again
Message-ID: <202ad1c0-e9d7-0cdd-d037-5258dfe3e378@physik.fu-berlin.de>
Date:   Tue, 23 Mar 2021 15:49:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.149.100
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi!

I have tried a current kernel built from Linus' tree today on one of the
BL860c blades we use as buildds in Debian and it turns out with just three
fixes applied [1-3], the kernel works just fine:

root@lenz:~# dmesg|head -n20
[    0.000000] Linux version 5.12.0-rc4-00007-g572c09e775f7 (root@lenz) (gcc (Debian 10.2.1-6+b1) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #2 SMP Tue Mar 23 14:29:21 UTC 2021
[    0.000000] efi: EFI v2.30 by HP
[    0.000000] efi: SALsystab=0xffdbff918 ESI=0xffdbffe18 ACPI 2.0=0x391a8014 HCDP=0xfffff8f18 SMBIOS=0x3914a000 
[    0.000000] PCDP: v3 at 0xfffff8f18
[    0.000000] earlycon: uart8250 at I/O port 0x2320 (options '115200n8')
[    0.000000] printk: bootconsole [uart8250] enabled
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000391A8014 000024 (v02 HP    )
[    0.000000] ACPI: XSDT 0x00000000391A8580 000124 (v01 HP     BL860C-4 00000001      01000013)
[    0.000000] ACPI: FACP 0x00000000391A2000 0000F4 (v03 HP     BL860C-4 00000001 HP   00000001)
[    0.000000] ACPI BIOS Warning (bug): Invalid length for FADT/Pm1aEventBlock: 16, using default 32 (20210105/tbfadt-669)
[    0.000000] ACPI BIOS Warning (bug): Invalid length for FADT/Pm1aControlBlock: 32, using default 16 (20210105/tbfadt-669)
[    0.000000] ACPI: DSDT 0x0000000039188000 009FFD (v02 HP     BL860C-4 00000008 INTL 20061109)
[    0.000000] ACPI: FACS 0x00000000391A4000 000040
[    0.000000] ACPI: FACS 0x00000000391A4000 000040
[    0.000000] ACPI: APIC 0x00000000391A6000 0001CC (v01 HP     BL860C-4 00000001 HP   00000001)
[    0.000000] ACPI: SPCR 0x00000000391A0000 000050 (v01 HP     BL860C-4 00000001 HP   00000001)
[    0.000000] ACPI: SRAT 0x000000003919E000 000348 (v02 HP     BL860C-4 00000001 HP   00000001)
[    0.000000] ACPI: SLIT 0x000000003919C000 00003C (v01 HP     BL860C-4 00000001 HP   00000001)
[    0.000000] ACPI: CPEP 0x000000003919A000 000034 (v01 HP     BL860C-4 00000001 HP   00000001)
root@lenz:~#

The previously reported regression [4] has magically fixed itself.

Once the patches [1-3] have been merged - in one form or another - we just need to
fix the issue Ben Hutchings reported for zstd compression [5] and we can build and
use regular Debian distribution kernels on all ia64 machines again.

Adrian

> [1] https://marc.info/?l=linux-scsi&m=161558808505479&w=2
> [2] https://marc.info/?l=linux-ia64&m=161579831530508&w=2
> [3] https://marc.info/?l=linux-ia64&m=161607290522459&w=2
> [4] https://marc.info/?l=linux-ia64&m=156144480821712&w=2
> [5] https://marc.info/?l=linux-ia64&m=160002668711603&w=2

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
