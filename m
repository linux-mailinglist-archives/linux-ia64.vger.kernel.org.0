Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1600870B701
	for <lists+linux-ia64@lfdr.de>; Mon, 22 May 2023 09:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbjEVHuO (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 22 May 2023 03:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbjEVHtq (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 22 May 2023 03:49:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08962138
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 00:48:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AB48861E8D
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 07:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C595C4339C
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 07:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684741630;
        bh=jp2uml+yKSk2bBrMiqwlsTUlRUKtKiP8FO83XkfojNs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cHAzRZ216U1zqxFjJ7FSp5TeLsPyVLtAU9OaW9f3JuhINVjnbqoMHZulIU7SrSkYj
         8jMQhbsC9R3EAqaL95MwgqsNqpbmAv3HXy+CDzJBye1FcCD7swETdwrbUgw75dmnzO
         dgAgTxcugDYn2JMGsbC8NKdIMPUFbkqmr2I/tMd8NLKqxT7kD/Op+yzTphsBvgcsW5
         tD8usfVUagn2kFpjUUQr7D8RZ0QFpajJkl4qbfIq9R78ebXgoXgmY7u/Aa3AQE6RBm
         AgPC2W3/cBz8EilW3a53yvIoGCZosm8uzZEw+Cb6ONLHQNnf45wceUoJfbt8R9gRfq
         5T94Y7k/m9nUg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f3b9e54338so1858777e87.0
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 00:47:09 -0700 (PDT)
X-Gm-Message-State: AC+VfDxtXWj7Uup1UXWLVpFg9DfzQXyW6EgPvaG5bcsctF05UzZ/M27y
        ROUvo9Z9Zuqe1wi8qcF1h28U+NlK19fnWqS+U70=
X-Google-Smtp-Source: ACHHUZ7zJd2J9gZbJzjpNuc/W0+HOOeOvZvKc+Oal+f4EozuPGG/aMclcEUVQvBUxvGJ26xPQUZZLxLMLp+UVH1YyGE=
X-Received: by 2002:ac2:4a84:0:b0:4f3:a44d:6982 with SMTP id
 l4-20020ac24a84000000b004f3a44d6982mr3033184lfp.45.1684741628079; Mon, 22 May
 2023 00:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
 <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de> <87bkiilpc4.fsf@mid.deneb.enyo.de>
 <4e210d61adbe73a1673f113019401e5c@matoro.tk> <12a3e3c5-9465-c97f-58ab-938e80681fbc@web.de>
 <5e778e16f93f2286fa535597ba5da24b@matoro.tk> <87y1lj0x0m.fsf@mid.deneb.enyo.de>
 <ff58a3e76e5102c94bb5946d99187b358def688a.camel@physik.fu-berlin.de>
 <CAMj1kXGmbtiosH3fwMuduFvjmb2PVsX-tMLTk96jPvmW+oKi-w@mail.gmail.com> <2023052230-lunacy-graffiti-0cee@gregkh>
In-Reply-To: <2023052230-lunacy-graffiti-0cee@gregkh>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 22 May 2023 09:46:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFWCo4kqkGeYDqY9JJ3bTesJefKTPFhnnszWHbbD4jXwQ@mail.gmail.com>
Message-ID: <CAMj1kXFWCo4kqkGeYDqY9JJ3bTesJefKTPFhnnszWHbbD4jXwQ@mail.gmail.com>
Subject: Re: [crosspost] dropping support for ia64
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Florian Weimer <fw@deneb.enyo.de>,
        matoro <matoro_mailinglist_kernel@matoro.tk>,
        Frank Scheiner <frank.scheiner@web.de>,
        distributions@lists.freedesktop.org, debian-ia64@lists.debian.org,
        linux-ia64@vger.kernel.org, port-ia64@netbsd.org,
        Tony Luck <tony.luck@intel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        Steve McIntyre <steve@einval.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, 22 May 2023 at 09:39, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, May 22, 2023 at 09:08:35AM +0200, Ard Biesheuvel wrote:
> > (cc Greg as stable maintainer)
> >
> > On Sat, 20 May 2023 at 21:23, John Paul Adrian Glaubitz
> > <glaubitz@physik.fu-berlin.de> wrote:
> > >
> > ...
> > >
> > > I have been thinking about this discussion for a while now and my suggestion
> > > would be to drop ia64 support from the kernel, GRUB and gcc/binutils/glibc in
> > > this order:
> > >
> > > - Kernel: After the next LTS release
> > > - GRUB: After the 2.12 release
> > > - gcc/binutils/glibc: After support was dropped from the kernel
> > >
> > > This way anyone still using ia64 will be able to use it with a supported codebase
> > > for an extended time and upstream projects have target releases for which they
> > > can plan the removal.
> > >
> >
> > Yeah, I think this is reasonable. Having a clear agreement on where
> > the support ends helps both the remaining users and the developers
> > eager to move on.
> >
> > My only question is how we would land fixes for ia64 into this Linux
> > LTS release if there is no upstream any longer to draw from.
> >
> > Greg, could you comment on this?
>
> That would imply that people actually used that arch and code, so why
> would it have been removed from Linus's tree?
>

As far as we have been able to establish, the only people that use
this arch and code are people that would hate to see it go, but don't
actually use it for anything other than checking whether it still
boots, and don't have the skills or bandwidth to step up and maintain
it upstream.

> And there's nothing "special" about LTS releases for features like this,
> just drop the code when no one is using it and all is good.
>

Fair enough.
