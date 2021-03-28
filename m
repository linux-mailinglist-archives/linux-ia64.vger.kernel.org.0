Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50EEA34BC4F
	for <lists+linux-ia64@lfdr.de>; Sun, 28 Mar 2021 14:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbhC1M0g (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 28 Mar 2021 08:26:36 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:48905 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229499AbhC1M0U (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Sun, 28 Mar 2021 08:26:20 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lQUUk-003x3t-VQ; Sun, 28 Mar 2021 14:26:19 +0200
Received: from dynamic-078-054-150-182.78.54.pool.telefonica.de ([78.54.150.182] helo=[192.168.1.10])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lQUUk-000V6U-Ou; Sun, 28 Mar 2021 14:26:18 +0200
Subject: Re: Current Linux kernels working on rx2800 again
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     debian-ia64 <debian-ia64@lists.debian.org>
Cc:     "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
References: <202ad1c0-e9d7-0cdd-d037-5258dfe3e378@physik.fu-berlin.de>
Message-ID: <36cea8b5-aee6-0540-a801-4da1a5449d31@physik.fu-berlin.de>
Date:   Sun, 28 Mar 2021 14:26:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <202ad1c0-e9d7-0cdd-d037-5258dfe3e378@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 78.54.150.182
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hello!

On 3/23/21 3:49 PM, John Paul Adrian Glaubitz wrote:
> I have tried a current kernel built from Linus' tree today on one of the
> BL860c blades we use as buildds in Debian and it turns out with just three
> fixes applied [1-3], the kernel works just fine:

Also confirmed to work on an RX2800-i2:

root@yttrium:~# dmesg | head -n20
[    0.000000] Linux version 5.12.0-rc4-00009-g3dc57918efb9 (root@lifshitz) (gcc (Debian 10.2.1-6+b1) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #3 SMP Sun Mar 28 11:12:39 UTC 2021
[    0.000000] efi: EFI v2.10 by HP
[    0.000000] efi: SALsystab=0xdfdd63a18 ESI=0xdfdd63f18 ACPI 2.0=0x3d3c4014 HCDP=0xdffff8798 SMBIOS=0x3d368000 
[    0.000000] PCDP: v3 at 0xdffff8798
[    0.000000] earlycon: uart8250 at I/O port 0x4000 (options '115200n8')
[    0.000000] printk: bootconsole [uart8250] enabled
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x000000003D3C4014 000024 (v02 HP    )
[    0.000000] ACPI: XSDT 0x000000003D3C4580 000124 (v01 HP     RX2800-2 00000001      01000013)
[    0.000000] ACPI: FACP 0x000000003D3BE000 0000F4 (v03 HP     RX2800-2 00000001 HP   00000001)
[    0.000000] ACPI BIOS Warning (bug): Invalid length for FADT/Pm1aEventBlock: 16, using default 32 (20210105/tbfadt-669)
[    0.000000] ACPI BIOS Warning (bug): Invalid length for FADT/Pm1aControlBlock: 32, using default 16 (20210105/tbfadt-669)
[    0.000000] ACPI: DSDT 0x000000003D3A4000 009E45 (v02 HP     RX2800-2 00000008 INTL 20061109)
[    0.000000] ACPI: FACS 0x000000003D3C0000 000040
[    0.000000] ACPI: FACS 0x000000003D3C0000 000040
[    0.000000] ACPI: APIC 0x000000003D3C2000 00010C (v01 HP     RX2800-2 00000001 HP   00000001)
[    0.000000] ACPI: SPCR 0x000000003D3BC000 000050 (v01 HP     RX2800-2 00000001 HP   00000001)
[    0.000000] ACPI: SRAT 0x000000003D3BA000 0001F8 (v02 HP     RX2800-2 00000001 HP   00000001)
[    0.000000] ACPI: SLIT 0x000000003D3B8000 00003C (v01 HP     RX2800-2 00000001 HP   00000001)
[    0.000000] ACPI: CPEP 0x000000003D3B6000 000034 (v01 HP     RX2800-2 00000001 HP   00000001)
root@yttrium:~#

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

