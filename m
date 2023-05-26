Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20017712B09
	for <lists+linux-ia64@lfdr.de>; Fri, 26 May 2023 18:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237149AbjEZQuQ (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 26 May 2023 12:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237116AbjEZQuP (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 26 May 2023 12:50:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4081B5
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 09:50:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CFC1B6517D
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 16:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4069EC433A0
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 16:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685119812;
        bh=5tVcDZjXfkIcWdX0H1HyX7HxFKy3pBF7dEoig5JS+f0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fHZXc+7ZwQOAvTsMUz2xUYM49flhGucWKL/PGiabJ5EBs5zylfdAgWOR1cKUTK3IH
         D/wUlMTMSzx1gwjEevBaX990iEHYL71sQjZywijgsD3P2+Mok32z1VNzP7BZ5Wqzq7
         Bkys59C26a0XWb1E+1Z/uBdb+MS8dRLfRjlZO2s5PqMwaeFzNj4VRHK8QdbL2W7483
         PFn3F1WaFrQ9+bNV3i8BNJSQqLE3SZK3NpXMC/9E68uq/trKp+7fEuqYwIAbuLkhlv
         zul7xrdHmRb52EaRxwuj5A/SC/MX9IzAGcttTmlZj2eKp7cVLKjkPyuwzr0DiZu17V
         YqSzgB7jFn6Xw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2af290cf9b7so9190781fa.3
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 09:50:12 -0700 (PDT)
X-Gm-Message-State: AC+VfDyPDgY2rl/CHvLaQcuSAXGJqIP+8hxwNGn74Epqd8enuadswqiW
        iC/FZpEdBiU+rDemLSHcapEsZIr3pryPmQzWxuQ=
X-Google-Smtp-Source: ACHHUZ7q8TE+VFjeNn8I+grHa6h2ic2bnO7N9MMgsJrobaDe9vZRMSQ7KCGSyu6hScRp+zEkN7XTrsFkH3hSAPTbLIo=
X-Received: by 2002:a05:651c:104:b0:2ac:7d09:41a9 with SMTP id
 a4-20020a05651c010400b002ac7d0941a9mr745853ljb.2.1685119810184; Fri, 26 May
 2023 09:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
In-Reply-To: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
From:   Song Liu <song@kernel.org>
Date:   Fri, 26 May 2023 09:49:55 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7phunDnFo8RmqvdZ+fOQmexxhaGdeA086xsOpez65izw@mail.gmail.com>
Message-ID: <CAPhsuW7phunDnFo8RmqvdZ+fOQmexxhaGdeA086xsOpez65izw@mail.gmail.com>
Subject: Re: Boot regression in Linux v6.4-rc3
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     linux-ia64@vger.kernel.org, mcgrof@kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Frank,

Thanks for the report.

On Fri, May 26, 2023 at 3:55=E2=80=AFAM Frank Scheiner <frank.scheiner@web.=
de> wrote:
>
> Dear all,
>
> there is a boot regression in effect in Linux v6.4-rc3 that affects at
> least:
>
> * rx2620 (w/2 x Montecito and zx1)
> * rx2800-i2 (w/1 x Tukwila)
>
> ...(see second part of [1] and following posts for more details, [2] and
> [3] for the respective logs), example here:
>
> ```
> ELILO v3.16 for EFI/IA-64
> ..
> Uncompressing Linux... done
> Loading file AC100221.initrd.img...done
> [    0.000000] Linux version 6.4.0-rc3 (root@x4270) (ia64-linux-gcc
> (GCC) 12.2.0, GNU ld (GNU Binutils) 2.39) #1 SMP Thu May 25 15:52:20
> CEST 2023
> [    0.000000] efi: EFI v1.1 by HP
> [    0.000000] efi: SALsystab=3D0x3ee7a000 ACPI 2.0=3D0x3fe2a000
> ESI=3D0x3ee7b000 SMBIOS=3D0x3ee7c000 HCDP=3D0x3fe28000
> [    0.000000] PCDP: v3 at 0x3fe28000
> [    0.000000] earlycon: uart8250 at MMIO 0x00000000f4050000 (options
> '9600n8')
> [    0.000000] printk: bootconsole [uart8250] enabled
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x000000003FE2A000 000028 (v02 HP    )
> [    0.000000] ACPI: XSDT 0x000000003FE2A02C 0000CC (v01 HP     rx2620
> 00000000 HP   00000000)
> [...]
> [    3.793350] Run /init as init process
> Loading, please wait...
> Starting systemd-udevd version 252.6-1
> [    3.951100] ------------[ cut here ]------------
> [    3.951100] WARNING: CPU: 6 PID: 140 at kernel/module/main.c:1547
> __layout_sections+0x370/0x3c0
> [    3.949512] Unable to handle kernel paging request at virtual address
> 1000000000000000
> [    3.951100] Modules linked in:
> [    3.951100] CPU: 6 PID: 140 Comm: (udev-worker) Not tainted 6.4.0-rc3 =
#1
> [    3.956161] (udev-worker)[142]: Oops 11003706212352 [1]
> [    3.951774] Hardware name: hp server rx2620                   , BIOS
> 04.29
> 11/30/2007
> [    3.951774]
> [    3.951774] Call Trace:
> [    3.958339] Unable to handle kernel paging request at virtual address
> 1000000000000000
> [    3.956161] Modules linked in:
> [    3.951774]  [<a0000001000156d0>] show_stack.part.0+0x30/0x60
> [    3.951774]                                 sp=3De000000183a67b20
> bsp=3De000000183a61628
> [    3.956161]
> [    3.956161]
> ```
>
> [1]: https://lists.debian.org/debian-ia64/2023/05/msg00010.html
>
> [2]: https://pastebin.com/SAUKbG7Z
>
> [3]: https://pastebin.com/v1TTB2x3

It seems the error happened during the WARN_ON_ONCE. Could you
please try whether something like the following fixes it?

diff --git i/kernel/module/main.c w/kernel/module/main.c
index 0f9183f1ca9f..ae42dfc1a815 100644
--- i/kernel/module/main.c
+++ w/kernel/module/main.c
@@ -1537,7 +1537,7 @@ static void __layout_sections(struct module
*mod, struct load_info *info, bool i
                            || is_init !=3D module_init_layout_section(snam=
e))
                                continue;

-                       if (WARN_ON_ONCE(type =3D=3D MOD_INVALID))
+                       if (type =3D=3D MOD_INVALID)
                                continue;

                        s->sh_entsize =3D
module_get_offset_and_type(mod, type, s, i);


If that doesn't work, maybe we need something like this:

diff --git i/arch/ia64/kernel/module.c w/arch/ia64/kernel/module.c
index 3661135da9d9..4e9a7f0498e2 100644
--- i/arch/ia64/kernel/module.c
+++ w/arch/ia64/kernel/module.c
@@ -815,7 +815,7 @@ apply_relocate_add (Elf64_Shdr *sechdrs, const
char *strtab, unsigned int symind
                uint64_t gp;
                struct module_memory *mod_mem;

-               mod_mem =3D &mod->mem[MOD_DATA];
+               mod_mem =3D &mod->mem[MOD_TEXT];
                if (mod_mem->size > MAX_LTOFF)
                        /*
                         * This takes advantage of fact that
SHF_ARCH_SMALL gets allocated


Song
