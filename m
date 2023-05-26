Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B68A712E9F
	for <lists+linux-ia64@lfdr.de>; Fri, 26 May 2023 23:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243988AbjEZVCW (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 26 May 2023 17:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236842AbjEZVCF (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 26 May 2023 17:02:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB11B1A7
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 14:01:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6CD16653A0
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 21:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47F9C433D2
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 21:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685134905;
        bh=5Ci41L/GO+p74PWxvtRZAuLHT3LVKuK6GE9AnEv/zG8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nsmQXyFJoJyQGLjbytg7aNSMj2zWPIOZR9cEmYS+iXNdeyE6F1IZcWeEvJOHac0cC
         JKDvv8AhKUcy1kkt9bAh4L10eBinUovT7ZrdyDJjYiHG119qX1zhKn5BdxOFm6u+BK
         ylmVv9DczfoTJ+/pwUNMlH0WLvQmy31AuXy94rgsns9T6OYiDtfckb7iOZq/uahDi6
         BQEqw3oUkMfNtpHk6HR08DR4nhKEbkK0AQDFlqc6/+mKfH5O86cBlWGsix6Rba8Ir5
         SkAtCXjSUpyYsdUGs5dXiEcyRHZZLpwUBUL987lmbSWzm+BT/16b2z3XB7v1OUfwgD
         rNEpyRMk14leA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f3a99b9177so1359162e87.1
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 14:01:45 -0700 (PDT)
X-Gm-Message-State: AC+VfDy5EQzCWT4rH1YbIUGlHg6vmejjHSQhjNnwQeLc8t62Xg22ssn/
        IXqjO/On1LQeRKLgVGtvS/XGd0T2Hp8MdlFbwL4=
X-Google-Smtp-Source: ACHHUZ4at+iBk6D4HXz27aT3Fd/q/cna6pBJ3mTcOECnMeCbO2ckxrFX8FhGrnn5zung3+50HuGWVbjRLN+LA3md14M=
X-Received: by 2002:a19:5508:0:b0:4a4:6af4:43b7 with SMTP id
 n8-20020a195508000000b004a46af443b7mr805054lfe.69.1685134903863; Fri, 26 May
 2023 14:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de> <CAPhsuW7phunDnFo8RmqvdZ+fOQmexxhaGdeA086xsOpez65izw@mail.gmail.com>
 <77175d92-e0fa-d197-07c3-2749dfec79ce@web.de>
In-Reply-To: <77175d92-e0fa-d197-07c3-2749dfec79ce@web.de>
From:   Song Liu <song@kernel.org>
Date:   Fri, 26 May 2023 14:01:31 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5pwKe-hPKSyrcnF16Z6KTSYk8mSULcQbDBuvzEb6wneQ@mail.gmail.com>
Message-ID: <CAPhsuW5pwKe-hPKSyrcnF16Z6KTSYk8mSULcQbDBuvzEb6wneQ@mail.gmail.com>
Subject: Re: Boot regression in Linux v6.4-rc3
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     linux-ia64@vger.kernel.org, mcgrof@kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Fri, May 26, 2023 at 11:36=E2=80=AFAM Frank Scheiner <frank.scheiner@web=
.de> wrote:
>
> Hi Song,
>
> On 26.05.23 18:49, Song Liu wrote:
> > Hi Frank,
> >
> > Thanks for the report.
>
> Sure, thanks for your help in this.
>
> > It seems the error happened during the WARN_ON_ONCE. Could you
> > please try whether something like the following fixes it?
> >
> > diff --git i/kernel/module/main.c w/kernel/module/main.c
> > index 0f9183f1ca9f..ae42dfc1a815 100644
> > --- i/kernel/module/main.c
> > +++ w/kernel/module/main.c
> > @@ -1537,7 +1537,7 @@ static void __layout_sections(struct module
> > *mod, struct load_info *info, bool i
> >                              || is_init !=3D module_init_layout_section=
(sname))
> >                                  continue;
> >
> > -                       if (WARN_ON_ONCE(type =3D=3D MOD_INVALID))
> > +                       if (type =3D=3D MOD_INVALID)
> >                                  continue;
> >
> >                          s->sh_entsize =3D
> > module_get_offset_and_type(mod, type, s, i);
>
> Ok, tried that as -patch1 on top of v6.4-rc3, but didn't help, see [1].
>
> [1]: https://pastebin.com/UK9v30Ae
>
> > If that doesn't work, maybe we need something like this:
> >
> > diff --git i/arch/ia64/kernel/module.c w/arch/ia64/kernel/module.c
> > index 3661135da9d9..4e9a7f0498e2 100644
> > --- i/arch/ia64/kernel/module.c
> > +++ w/arch/ia64/kernel/module.c
> > @@ -815,7 +815,7 @@ apply_relocate_add (Elf64_Shdr *sechdrs, const
> > char *strtab, unsigned int symind
> >                  uint64_t gp;
> >                  struct module_memory *mod_mem;
> >
> > -               mod_mem =3D &mod->mem[MOD_DATA];
> > +               mod_mem =3D &mod->mem[MOD_TEXT];
> >                  if (mod_mem->size > MAX_LTOFF)
> >                          /*
> >                           * This takes advantage of fact that
> > SHF_ARCH_SMALL gets allocated
>
> Tried that one as -patch2 on top of v6.4-rc3, but didn't help, see [2].
>
> [2]: https://pastebin.com/gLupBndU
>
> I also tried both patches as -patch1plus2 on top of v6.4-rc3 with a
> similar result, see [3].
>
> [3]: https://pastebin.com/7pXBG5vx

Thanks for running the test.

I am not very familiar with the code, but I think we shouldn't hit that
WARN_ON_ONCE. Could you please try with the follow patch to see
which section caused this issue?

Thanks,
Song

diff --git i/kernel/module/main.c w/kernel/module/main.c
index 0f9183f1ca9f..caf3d30cd133 100644
--- i/kernel/module/main.c
+++ w/kernel/module/main.c
@@ -1537,8 +1537,11 @@ static void __layout_sections(struct module
*mod, struct load_info *info, bool i
                            || is_init !=3D module_init_layout_section(snam=
e))
                                continue;

-                       if (WARN_ON_ONCE(type =3D=3D MOD_INVALID))
+                       if (WARN_ON_ONCE(type =3D=3D MOD_INVALID)) {
+                               pr_warn("%s: section %s (sh_flags
%llx) matched to MOD_INVALID\n", __func__,
+                                       sname, s->sh_flags);
                                continue;
+                       }

                        s->sh_entsize =3D
module_get_offset_and_type(mod, type, s, i);
                        pr_debug("\t%s\n", sname);
