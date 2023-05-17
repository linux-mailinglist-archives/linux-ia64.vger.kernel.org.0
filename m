Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8591707478
	for <lists+linux-ia64@lfdr.de>; Wed, 17 May 2023 23:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjEQVmC (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 17 May 2023 17:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjEQVmB (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 17 May 2023 17:42:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B15FE40
        for <linux-ia64@vger.kernel.org>; Wed, 17 May 2023 14:42:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9DE0B63ED7
        for <linux-ia64@vger.kernel.org>; Wed, 17 May 2023 21:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0598EC433A8
        for <linux-ia64@vger.kernel.org>; Wed, 17 May 2023 21:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684359719;
        bh=PkSFXWERYoAI7TSVdnf0vqN2N5PrrkfNgDwiazExw1g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=d9XrQ4FnbcTygkvpFkqlMlGMH9YedkEk9f7r+gEElpzd4RSL9EU27SiKF83B7QWyz
         75X8cgdYIwVVAUighoa9TPoRMofEisnIuf8LjLnLuvmo9htK7aQN9sR6pT9TYToGEs
         ek+5QDAgXI518FWvVmEqvMMy8IxFK0RCIbaeOzhrHwevVgiV9nGU4H1jpKD61WmxJh
         1l7/i2Ci7OsjGFUdpNutNoacr53MgsxXVQHN4crLNHCgS37KjEbCwM9SK3tj0havAE
         IvmmmjPnbK9k4UziReEEZWkGm3/6Yiky/Stt/pzkAVXkrG5HsyBoB+SX/vXXClxVFo
         8JXpcv8G9owAw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f00c33c3d6so1625467e87.2
        for <linux-ia64@vger.kernel.org>; Wed, 17 May 2023 14:41:58 -0700 (PDT)
X-Gm-Message-State: AC+VfDwyDcxzbzLtV+01t8XunaAx2gXIQG2uOSpBRAxYQnPopMOZAJVJ
        vm5cnKrUbEwDfwEHHSwyVwtXZTDJjwlUgW/kEGg=
X-Google-Smtp-Source: ACHHUZ4lxxxmEGtRwO3l65yZHYJpuuNYgHTtEVXNCTfUD3ERiFtjknu3FwbztBhDPu3yuxcuCHQD5CXJ4BiT1/W6MM4=
X-Received: by 2002:ac2:456b:0:b0:4f3:8c0d:41c0 with SMTP id
 k11-20020ac2456b000000b004f38c0d41c0mr749423lfm.61.1684359716841; Wed, 17 May
 2023 14:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
 <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de>
In-Reply-To: <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 17 May 2023 23:41:45 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFR2-56pPnLFJYKOeTnwR60pr5E7gjmGY4ys9GGCu60XA@mail.gmail.com>
Message-ID: <CAMj1kXFR2-56pPnLFJYKOeTnwR60pr5E7gjmGY4ys9GGCu60XA@mail.gmail.com>
Subject: Re: [crosspost] dropping support for ia64
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     distributions@lists.freedesktop.org, debian-ia64@lists.debian.org,
        linux-ia64@vger.kernel.org, Florian Weimer <fw@deneb.enyo.de>,
        port-ia64@netbsd.org, Tony Luck <tony.luck@intel.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        matoro <matoro_mailinglist_kernel@matoro.tk>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        Steve McIntyre <steve@einval.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, 17 May 2023 at 20:39, Frank Scheiner <frank.scheiner@web.de> wrote:
>
> Dear Ard, all,
>
> First of all, I demand nothing of other people in this regard, you
> included. Please notice there's no "but" attached.
>
> I think I have a little first-hand knowledge about how much effort is
> involved in keeping an interesting architecture from the past running,
> to the least since when I thought it would be a cool idea to maintain
> the retired sgi port of OpenBSD...
>

Hello Frank,

Thanks for sharing your insights.

> I have a few remarks below...
>
> On 12.05.23 17:57, Ard Biesheuvel wrote:
> > (cross posted to several ia64 related mailing list)
> >
> > Hello all,
> >
> > As the maintainer of the EFI subsystem in Linux, I am one of the
> > people that have to deal with the impact that code refactoring for
> > current platforms has on legacy use of such code, in this particular
> > case, the use of shared EFI code in the Itanium Linux port.
> >
> > I am sending this message to gauge the remaining interest in ia64
> > support across the OS/distro landscape, and whether people feel that
> > the effort required to keep it alive is worth it or not.
> >
> > As a maintainer, I feel uncomfortable asking contributors to build
> > test their changes for Itanium, and boot testing is infeasible for
> > most, even if some people are volunteering access to infrastructure
> > for this purpose. In general, hacking on kernels or bootloaders (which
> > is where the EFI pieces live) is tricky using remote access.
>
> That is all doable, at least all HP Integrity gear I am familiar with -
> and which surely make up the majority of ia64 machines in hobbyist use -
> are equipped with full remote control (console, reset, power, etc.). The
> main problem at least in Germany is the insanity of our energy prices,
> which were already too high before they skyrocketed in the recent past.

This is good to know.

> But you also wrote:
>
> > The bottom line is that, while I know of at least 2 people (on cc)
> > that test stuff on itanium, and package software for it, I don't think
> > there are any actual users remaining, and so it is doubtful whether it
> > is justified to ask people to spend time and effort on this.
>
> While I get your argument, I also find it important to be able to
> innovate without destroying the past. And with the already severly
> limited choice of current architectures for the masses (x86, arm), it
> becomes even more important to keep what we have or had in the past, to
> not end in a "If all you have is a hammer, everything looks like a
> nail." type of future.
>

I don't disagree with that. But why does this imply that Linux should
be kept alive on an architecture that is not used by anyone to run
Linux in the first place? Could you be more specific about how you see
this correlation?

> > And for GRUB in particular (which is what triggered this message), it
> > is unclear to me why any machines still running would not be better
> > served by sticking with their current bootloader build, rather than
> > upgrading to a new build with a refactored EFI layer where the best
> > case scenario is that it boots the kernel in exactly the same way,
> > while there is a substantial risk of regressions.
>
> Sure, and every ia64 machine I have still network boots fine with elilo,
> even the rx2800-i2. Though most people still have their root FS on disk,
> where elilo might limit the choice of the bootstrap file system(s).
>

So which Linux versions are you running on these machines? And what
are you using them for (if you don't mind me asking)?

> Plus elilo is gone from the Debian repositories, just like yaboot,
> leaving grub2 as the only bootloader for ia64 there at the moment - if
> I'm not mistaken. And I assume Adrian invested quite some time and work
> to get grub2 usable as default boot loader for ia64 in Debian.
>

Sure. But I am not suggesting retroactively removing ia64 support from
GRUB. As I explained, both the firmware interfaces and the Linux boot
protocol are essentially set in stone at this point, so upgrading to a
newer GRUB has no upsides.

> But apart from this - also from other posts - it is pretty obvious that
> you seem to be absolutely determined to remove ia64 support from the
> Linux ecosystem. So removing it from the bootloader is just a step stone
> to removing ia64 support from the Linux kernel and a discussion about
> the bootloader seems futile then.
>

Not at all. As a Linux subsystem maintainer, I have to keep the bigger
EFI picture in mind when I accept contributions from people who may
work on many different topics and projects, and move on to something
else immediately. So generally, the responsibility of balancing the
interests of different EFI stakeholders falls to me, and I have to
decide how much emphasis to put on build and boot testing across
architectures and use cases, for instance. So what purpose is being
served by either them or me spending a disproportionate amount of time
build and boot testing code that nobody is ever going to run?

Up to this point, not a single person has indicated that Linux on ia64
is important for an actual use case. The only responses I am getting
(which are much appreciated, don't get me wrong) generally state that
ongoing ia64 support is important for the common good, but nobody
actually uses Linux/ia64 for anything other than checking whether it
still works, and churning out distro packages that nobody ever
downloads.

> > For the Linux kernel itself, the situation is quite similar. There is
> > a non-zero effort involved in keeping things working, and if anyone
> > still needs to run their programs on Itanium, it is not clear to me
> > why that would require a recent version of the OS.
> >
> > So bottom line: I am proposing we drop support for Itanium across the
> > board. Would anyone have any problems with that?
>
> Of course I would have a problem with that. AFAIK GNU/Linux is the last
> free OS for these machines. And I don't see those machines as museum
> pieces yet, but as options for interested people, coming back to the
> hammer and nail thing from above.
>

By 'interested people' you mean other people than yourself, right?

> But I demand nothing of you. And to be honest I can't contribute at this
> level to ia64, as I just don't have the required expertise for this type
> of hacking.
>
> Apart from that I'd like to thank all people involved in keeping those
> interesting systems afloat for the good times I had and have on ia64 and
> other interesting architectures and machines.
>

Again, your insight is much appreciated, even if we fundamentally disagree.
