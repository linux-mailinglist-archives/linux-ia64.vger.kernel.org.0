Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C837070F5
	for <lists+linux-ia64@lfdr.de>; Wed, 17 May 2023 20:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjEQSj6 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 17 May 2023 14:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjEQSjk (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 17 May 2023 14:39:40 -0400
Received: from mout.web.de (mout.web.de [212.227.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9941586AE
        for <linux-ia64@vger.kernel.org>; Wed, 17 May 2023 11:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1684348736; i=frank.scheiner@web.de;
        bh=KxvQD5sCpWcOJo+gQJf3t5jECfWri8X0tHGNnxF3H1A=;
        h=X-UI-Sender-Class:Date:From:Subject:To:References:In-Reply-To;
        b=FRLhdm8T26rgoOLwe8lit2a51OP3e1CoD7IEAwFPRhTIHvANalGeOBrPpD4iT3XRK
         uCbksoQSyGux9Qqja5zaq3TI++XfQ7W67IDIY1sW9bIU2xEikK5lz1KmSIQ3W+S3uY
         lI7vHkF/BmzevCRszvAABQrB6cd3iebT3k3KkFf+keoBfBymqZqypLp6r/QjKdEr3Z
         MTna8gUsDkZREOWWeljlV5KffVJxfY8hQYYXO2Z4bUMzi1q6bq1JyEq06nc7LNL9RW
         Kc5EAczsqsi6pF66bEbXkrxyMmWF3gZeatFUVoW51BGuieQ4HtHxBDA+joa1gJGFkG
         MmpY25x37kR3A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([84.152.245.244]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MOlwj-1pnZ9U3XrT-00Q9io; Wed, 17
 May 2023 20:38:55 +0200
Message-ID: <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de>
Date:   Wed, 17 May 2023 20:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From:   Frank Scheiner <frank.scheiner@web.de>
Subject: Re: [crosspost] dropping support for ia64
To:     Ard Biesheuvel <ardb@kernel.org>,
        distributions@lists.freedesktop.org, debian-ia64@lists.debian.org,
        linux-ia64@vger.kernel.org, Florian Weimer <fw@deneb.enyo.de>,
        port-ia64@netbsd.org, Tony Luck <tony.luck@intel.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        matoro <matoro_mailinglist_kernel@matoro.tk>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        Steve McIntyre <steve@einval.com>
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ifmnA/x4dlA84dKeBQjHgNcu2Q0jAo9LjasVOVL7lehE0ObofYG
 wM1vtHc5DWmHSfHpe6QIVYaAQuzjnZD2BgFQdsRTXrGvqCI7I9ofq9rbpHjFaz2qRkDrCyg
 IGz0W+/fQoLPGuzLgRoIJiSFMGNAemcBcCMm85sLRsDnIe+leA5VgCzhHVUzfOTfDyrKFLB
 6Fi8wNRdI2FsGNwcy6Pdg==
UI-OutboundReport: notjunk:1;M01:P0:bFF/CPZjfQE=;R9L1pr1XGrfOJ75Muluyfq7vET2
 Vlu8vZBHf5aiuSGLpvFdQDKeGSsM1I5qZc3gnfdM5Aet/Kz7ND/tCWuLwjvYZklaS8lWn3U2M
 415izbbthAfgVHIG5OGUyKrXcmFjO0gpiLzNhhJJJ5rDJgDKc5xdIj5NAa1bc/f1IitHQksa5
 n7vM/g0ZAAXyoNwlo978MWl/FH31LlDssjd7a26bmhxmQ+IB1cd/zatV3AxKzP5hvugHIGgQa
 y2JPQg/+cyJrGzb0TbOHd7kFa92eq5SYksOKpir1Dik5yz7Yo9jN1ywLF1ieC80WPb6Pkmnai
 AcpYTJ4dwy+CWFNkvxH3ElYPYZmQp8MEqy3vCbjM2Q/pyfbRHIQxREk0LEuZwhvgPzxQWsXaY
 i+BaL9v1P2bZ2spFUwwxnGKGpfl8SBM/aZNZO0y9HMLAwmWQSn5gVpDv0APZDfIdWZrExy0/X
 c7+9YbxXwz/UY7Hw2q3foxzl3EJV6m9fx/m/+9stkaQmUYLdC+w6AfOaM2RwbFvFTbK8nrr8P
 UCr7NNLrkLAZAwax+txZmVo2dKjkjYLZVk/bY3T/FL4BlJy8znILWpufFiDWFJIJSmPzPrFId
 RW08Gk9BXVz2X2nwsJO0oexlryCVpkLbcnZ85Xg6cGJ5mxpvDe/YV+xtc20LBvH1CoULyl7y3
 L+rX9Xg+jtdyO0uAQST2DiB1BtyaNFywOFpbTzUeSF93VEPgPHjHVtO1Wl1k0ddq3KqOX7tuD
 LF+LnO2byfQrvFgGBZrIYB2M76i/HXhiqBckzkPSqFDDggW9KU8cP5ExaTr/r9lX43u8g3MXt
 hvC74IBFImu+fk1KIy9/wZ5ksGuqVG5e8pOn7E4l4068jlf0wWl+RMchOH1+c1VXO0F0pZF0V
 W1usDFQSKZmgFoFcpQq/0TBmivNz1ZQL3rfFKNeMAor5PTRVT+A5ceRyW3iYuA+zeX8hl2D5R
 IC5nr5NfAEpQioBrJQ7yjyXEgDE=
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Dear Ard, all,

First of all, I demand nothing of other people in this regard, you
included. Please notice there's no "but" attached.

I think I have a little first-hand knowledge about how much effort is
involved in keeping an interesting architecture from the past running,
to the least since when I thought it would be a cool idea to maintain
the retired sgi port of OpenBSD...

I have a few remarks below...

On 12.05.23 17:57, Ard Biesheuvel wrote:
> (cross posted to several ia64 related mailing list)
>
> Hello all,
>
> As the maintainer of the EFI subsystem in Linux, I am one of the
> people that have to deal with the impact that code refactoring for
> current platforms has on legacy use of such code, in this particular
> case, the use of shared EFI code in the Itanium Linux port.
>
> I am sending this message to gauge the remaining interest in ia64
> support across the OS/distro landscape, and whether people feel that
> the effort required to keep it alive is worth it or not.
>
> As a maintainer, I feel uncomfortable asking contributors to build
> test their changes for Itanium, and boot testing is infeasible for
> most, even if some people are volunteering access to infrastructure
> for this purpose. In general, hacking on kernels or bootloaders (which
> is where the EFI pieces live) is tricky using remote access.

That is all doable, at least all HP Integrity gear I am familiar with -
and which surely make up the majority of ia64 machines in hobbyist use -
are equipped with full remote control (console, reset, power, etc.). The
main problem at least in Germany is the insanity of our energy prices,
which were already too high before they skyrocketed in the recent past.
But you also wrote:

> The bottom line is that, while I know of at least 2 people (on cc)
> that test stuff on itanium, and package software for it, I don't think
> there are any actual users remaining, and so it is doubtful whether it
> is justified to ask people to spend time and effort on this.

While I get your argument, I also find it important to be able to
innovate without destroying the past. And with the already severly
limited choice of current architectures for the masses (x86, arm), it
becomes even more important to keep what we have or had in the past, to
not end in a "If all you have is a hammer, everything looks like a
nail." type of future.

> And for GRUB in particular (which is what triggered this message), it
> is unclear to me why any machines still running would not be better
> served by sticking with their current bootloader build, rather than
> upgrading to a new build with a refactored EFI layer where the best
> case scenario is that it boots the kernel in exactly the same way,
> while there is a substantial risk of regressions.

Sure, and every ia64 machine I have still network boots fine with elilo,
even the rx2800-i2. Though most people still have their root FS on disk,
where elilo might limit the choice of the bootstrap file system(s).

Plus elilo is gone from the Debian repositories, just like yaboot,
leaving grub2 as the only bootloader for ia64 there at the moment - if
I'm not mistaken. And I assume Adrian invested quite some time and work
to get grub2 usable as default boot loader for ia64 in Debian.

But apart from this - also from other posts - it is pretty obvious that
you seem to be absolutely determined to remove ia64 support from the
Linux ecosystem. So removing it from the bootloader is just a step stone
to removing ia64 support from the Linux kernel and a discussion about
the bootloader seems futile then.

> For the Linux kernel itself, the situation is quite similar. There is
> a non-zero effort involved in keeping things working, and if anyone
> still needs to run their programs on Itanium, it is not clear to me
> why that would require a recent version of the OS.
>
> So bottom line: I am proposing we drop support for Itanium across the
> board. Would anyone have any problems with that?

Of course I would have a problem with that. AFAIK GNU/Linux is the last
free OS for these machines. And I don't see those machines as museum
pieces yet, but as options for interested people, coming back to the
hammer and nail thing from above.

But I demand nothing of you. And to be honest I can't contribute at this
level to ia64, as I just don't have the required expertise for this type
of hacking.

Apart from that I'd like to thank all people involved in keeping those
interesting systems afloat for the good times I had and have on ia64 and
other interesting architectures and machines.

Cheers,
Frank


