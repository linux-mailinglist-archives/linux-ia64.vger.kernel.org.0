Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D12D712C73
	for <lists+linux-ia64@lfdr.de>; Fri, 26 May 2023 20:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjEZSam (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 26 May 2023 14:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjEZSal (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 26 May 2023 14:30:41 -0400
Received: from mout.web.de (mout.web.de [217.72.192.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11A2F3
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 11:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1685125809; i=frank.scheiner@web.de;
        bh=0MWLegM0TR4wovUIzlEZyj/HvPYuBpjhUnoskAkjeow=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=HPlugQ2m+e6HePhxHqM0Kb40vQmHCPmPHEK3nmqUizCFEC288REC5FE4VKkEVwGda
         pUv1jxY9C+xHTtwdzA/jQ2VTkTtXYMn496tGBFNiK00R6doGHtHxzFZwsyxgxsup5W
         8F8azvquXbtv4m6YlMh/E/aKBfnZn0oAEacW1BbzJfunVGty84mBjBVR5iALesOYVV
         W1+LcTum0Hy4K2ez8YF9pYEMGrxlcRBcvgGxQ8rjkzkiNteCACRVC7qxUMZj18Ct9D
         Oi4bJFOxxkeraTCcZv19zI3zdKQqfQlRBad3nNj+35wDma0eyUA6/Hass75LPYn/t/
         ozC/7kGLS2aqQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([79.200.217.234]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N79RG-1qA3IL0w0K-017V24; Fri, 26
 May 2023 20:30:09 +0200
Message-ID: <77175d92-e0fa-d197-07c3-2749dfec79ce@web.de>
Date:   Fri, 26 May 2023 20:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Boot regression in Linux v6.4-rc3
Content-Language: en-US
To:     Song Liu <song@kernel.org>
Cc:     linux-ia64@vger.kernel.org, mcgrof@kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
 <CAPhsuW7phunDnFo8RmqvdZ+fOQmexxhaGdeA086xsOpez65izw@mail.gmail.com>
From:   Frank Scheiner <frank.scheiner@web.de>
In-Reply-To: <CAPhsuW7phunDnFo8RmqvdZ+fOQmexxhaGdeA086xsOpez65izw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Nu3KN2npiNu2t3CLLu464wg7uVVLPt6lYHk3VWOfweByuDe27O5
 +Z08FU1fy1paCTqAvxlk1VfJAaorqs3wUCXUivQXn5rw6+3jbFK0v77JTankMnLpN4YGdbF
 m6dGvH18Ux7ODIUQC3tRSpfyLXsTcJlS1FvMQZAcYOeDfgRVr10swt1/kXqK3snHmlZ9svt
 T3/OmgzeAOk80ZTBd15XQ==
UI-OutboundReport: notjunk:1;M01:P0:qwd0ZeWmH4g=;Vjvpgr8EoUIpRzdl2syzHTc5hCT
 AX6xNp9HNfALgfugkEvujvJ7Om1d3Uk5CqUOKhGVhiek2LZkD/3wED1fKWLmQiOIsGuvB+wgy
 UXn/D3Svgk/vWr82LM8hDbZCUEw+x3cR0MvCwCw/xPvYMMERcQjwbhp0vHMqKiXRFAEMd0ZbT
 flkFWu/1B6YomK6mLLItS0UNZBC2x1wsDWfPs+3L+qrzUJ97LDaVW/ZxVIf1tR0u3c/NZ8YNs
 zc/DpHCHPBScXAynKG3V2iynXzMgsj6qKvDpp4qvlKdjF1cUabKA8lj6UripW3nSPAJdGHohd
 A8BMScD1jQvs5N732HrNhL4S/FjdlP5T+KKomt/9j4sIcjJZB9yxyqD+0wdflHvHEFT2ZT//h
 KGSOmyNgc7iBoXmvYIIFoRc0Z0iP3qmE7cT6KQssRdmjKM+gY++uutVL1UX+iBTfbgdAe0QMg
 1IYguZypf7C17GP3t/SMKil2Z0WceZn/FBt8msr9w8hlTxjOAcdwHa0miMykYjcZVkomWuLgp
 Y+rrUgadBifeShwfNO993YlE5BVOVaaaGOSOxgBQLtJJ2xb5KXDeDs3fXkJa3kwC1d54rGjLp
 tRWrBSuml/w7jPZhzEx1kpc/7Lrg3QP8O+Tut0hBBgmeane9U5Pm+X7/XlWvRNqkMvLutzKwx
 AdpH0O230ejNlnKY9eQlblgNoGIrKIWu/6rNmuWKLt3rmMGSNC0vZW9lxxgajllOAAkm2lNsB
 zHmzXCN79yK00B5oirt7owQMqcbOKwDsqWm7Luzk75EWNqvs2fjK0Y/gffdoIHIaLgb9CjtMD
 GwS02Xdovon+pIluKC7KZ1SJHc5QnBqLO/odFFpE88dqCnSVvr+dxwv2d6bACNIihmalx3PZU
 C6p2BNyTtaVj+sWb+FPIATo+SeW5TJzFF/Vwp1PqfxvatVEPr8Wmnh1hTKioOviscFtcsrHuB
 jgVNklDbm0HysLiEo2O+70Vlwew=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Song,

On 26.05.23 18:49, Song Liu wrote:
> Hi Frank,
>
> Thanks for the report.

Sure, thanks for your help in this.

> It seems the error happened during the WARN_ON_ONCE. Could you
> please try whether something like the following fixes it?
>
> diff --git i/kernel/module/main.c w/kernel/module/main.c
> index 0f9183f1ca9f..ae42dfc1a815 100644
> --- i/kernel/module/main.c
> +++ w/kernel/module/main.c
> @@ -1537,7 +1537,7 @@ static void __layout_sections(struct module
> *mod, struct load_info *info, bool i
>                              || is_init !=3D module_init_layout_section(=
sname))
>                                  continue;
>
> -                       if (WARN_ON_ONCE(type =3D=3D MOD_INVALID))
> +                       if (type =3D=3D MOD_INVALID)
>                                  continue;
>
>                          s->sh_entsize =3D
> module_get_offset_and_type(mod, type, s, i);

Ok, tried that as -patch1 on top of v6.4-rc3, but didn't help, see [1].

[1]: https://pastebin.com/UK9v30Ae

> If that doesn't work, maybe we need something like this:
>
> diff --git i/arch/ia64/kernel/module.c w/arch/ia64/kernel/module.c
> index 3661135da9d9..4e9a7f0498e2 100644
> --- i/arch/ia64/kernel/module.c
> +++ w/arch/ia64/kernel/module.c
> @@ -815,7 +815,7 @@ apply_relocate_add (Elf64_Shdr *sechdrs, const
> char *strtab, unsigned int symind
>                  uint64_t gp;
>                  struct module_memory *mod_mem;
>
> -               mod_mem =3D &mod->mem[MOD_DATA];
> +               mod_mem =3D &mod->mem[MOD_TEXT];
>                  if (mod_mem->size > MAX_LTOFF)
>                          /*
>                           * This takes advantage of fact that
> SHF_ARCH_SMALL gets allocated

Tried that one as -patch2 on top of v6.4-rc3, but didn't help, see [2].

[2]: https://pastebin.com/gLupBndU

I also tried both patches as -patch1plus2 on top of v6.4-rc3 with a
similar result, see [3].

[3]: https://pastebin.com/7pXBG5vx

Cheers,
Frank
