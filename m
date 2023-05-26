Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB2D713018
	for <lists+linux-ia64@lfdr.de>; Sat, 27 May 2023 00:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbjEZWkD (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 26 May 2023 18:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbjEZWj7 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 26 May 2023 18:39:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798429C
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 15:39:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 16B676546F
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 22:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CECC433A4
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 22:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685140797;
        bh=Hk22xJtb3aL8iiExGGCeF1n7/U5a679Gwf0jSwnoAKk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MOdzW9BSSmuuTsia6tigttFVDpcMD89kGGkg2s0tHGh0+pdcwWBqAvp6jUfipGKuI
         j9blmAcj9R6ZhU/wMsmclUwI0ilt0FqdypDvFafdHJX87z6rgrWD3MzyvefMlTwmew
         IlJt/GlA4m+4rsEvL3LHXZnZA88H3ohduAtgBSacv9apt1/7LAy0OSmPh4/NHKUXJE
         Ht3RGVXvi1KkC4Rly2C4b2buxU5HTSOR96uY7+qIzx8Tzz6eizPpinHcVwv88Om0a8
         DzJyYR0qc18FjJJlo8TOVjy0+2jIHTe1RbNgSlgrYhoogoSP4NXgg5GDuB0lIKn8dS
         /KGcEDFwRwbnA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f4bdcde899so1342277e87.0
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 15:39:57 -0700 (PDT)
X-Gm-Message-State: AC+VfDzSoOv0HX+bKY2XJK7gfrSIHinkG4dg+Zju4jT54L95VD19n2P6
        7F1r5D6chvMS0nJ+yiUgt9qoiyUMQH6UBzjj88s=
X-Google-Smtp-Source: ACHHUZ7qJFyap6RCqjibRYKYpczV3j3qQW8Dd6X5M9Onm5fQu9QrtpcI1bv5PdHY0pr4sJ7J+Shje15wVCiNBPm2aJE=
X-Received: by 2002:ac2:430a:0:b0:4f1:3d9f:1b53 with SMTP id
 l10-20020ac2430a000000b004f13d9f1b53mr806139lfh.50.1685140795366; Fri, 26 May
 2023 15:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de> <ZHErssbUSbSznTVA@bombadil.infradead.org>
 <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
In-Reply-To: <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
From:   Song Liu <song@kernel.org>
Date:   Fri, 26 May 2023 15:39:43 -0700
X-Gmail-Original-Message-ID: <CAPhsuW484GVC9PD-cJu5fxX5E1y6XWHgyv3FvJuyOPbpZQx9cw@mail.gmail.com>
Message-ID: <CAPhsuW484GVC9PD-cJu5fxX5E1y6XWHgyv3FvJuyOPbpZQx9cw@mail.gmail.com>
Subject: Re: Boot regression in Linux v6.4-rc3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Frank Scheiner <frank.scheiner@web.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>, linux-ia64@vger.kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Fri, May 26, 2023 at 3:22=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, May 26, 2023 at 2:59=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.o=
rg> wrote:
> >
> > Not saying that debugging commit ac3b4328392344 ("module: replace
> > module_layout with module_memory") is going to be impossible, quite
> > the contrary I think it would be good to root cause it, if possible,
> > as perhaps it may also be similar to some other future oddball arch
> > bug later that may come up.
>
> I don't have any context - the mailing lists in question that
> apparently this came in on aren't in lore.
>
> That said, that commit looks odd for the ia64 part.
>
> In particular, this part:
>
>   -               if (mod->core_layout.size > MAX_LTOFF)
>   +               struct module_memory *mod_mem;
>   +
>   +               mod_mem =3D &mod->mem[MOD_DATA];
>
> in apply_relocate_add() (file: arch/ia64/kernel/module.c) seems suspect.
>
> The previous place that used to look at "mod->core_layout.base"
> converted that to "mod->mem[MOD_TEXT].base". As do other changes in
> other architectures.
>
> So that "MOD_DATA" looks *very* wrong.  Shouldn't core_layout. be
> translated to use "MOD_TEXT" instead?

MOD_DATA is likely wrong here. But as Frank tested, changing it to MOD_TEXT
didn't fix the issue. I suspect we missed some special cases when we update=
d
layout_sections().

Thanks,
Song
