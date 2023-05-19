Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B79D70A072
	for <lists+linux-ia64@lfdr.de>; Fri, 19 May 2023 22:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjESUSt (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 19 May 2023 16:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjESUSs (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 19 May 2023 16:18:48 -0400
Received: from mout.web.de (mout.web.de [212.227.15.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF19FE
        for <linux-ia64@vger.kernel.org>; Fri, 19 May 2023 13:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1684527425; i=frank.scheiner@web.de;
        bh=6vMCwTk8Bb9KAirqGWuHwpesAsIjAS8RwMkcsnl/Ggs=;
        h=X-UI-Sender-Class:Date:From:Subject:To:Cc:References:In-Reply-To;
        b=apRT5kGYozcdCV0ClDTbf6JMuJ40/NoTS3vPQRiJ+3Nl6PA9ELPxEvtkEVT9ioICs
         iOraaMjG1VDh+naYJFwAigAkrh+N3fCNt4bOwpfUNzDETqUKE4/qdNAv+dCJ8mDwzn
         U6MSSjp/zyrmeTHgR70hdVk5qjLpCz15KgKssX9WEYTh0iLCr9B85Wboxf/jhrpVDx
         xFyrrd1m5Z3DO+3oO/hdNjJbIDGS8WdF+ig5mGcf6PiAps1uDXPWy7O8rNXvMT36rl
         jFwi19StRAsT+qILYvKqF7ZEc3mjRyKp6e/z5yD2JkuLS3KTiW+ug1ISudkjox/HSO
         3/fjBwNygY+9g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([79.200.209.18]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzkST-1qLbV21sKf-00vjn7; Fri, 19
 May 2023 22:17:05 +0200
Message-ID: <0075883c-7c51-00f5-2c2d-5119c1820410@web.de>
Date:   Fri, 19 May 2023 22:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From:   Frank Scheiner <frank.scheiner@web.de>
Subject: Re: [crosspost] dropping support for ia64
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     distributions@lists.freedesktop.org, debian-ia64@lists.debian.org,
        linux-ia64@vger.kernel.org, Florian Weimer <fw@deneb.enyo.de>,
        port-ia64@netbsd.org, Tony Luck <tony.luck@intel.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        matoro <matoro_mailinglist_kernel@matoro.tk>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        Steve McIntyre <steve@einval.com>,
        Sergei Trofimovich <slyfox@gentoo.org>,
        Sergei Trofimovich <slyich@gmail.com>,
        Jessica Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>, ia64@gentoo.org,
        Meelis Roos <mroos@linux.ee>,
        Pedro Miguel Justo <pmsjt@texair.net>,
        Anton Borisov <anton.borisov@gmail.com>,
        Anatoly Pugachev <matorola@gmail.com>
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
 <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de>
 <CAMj1kXFR2-56pPnLFJYKOeTnwR60pr5E7gjmGY4ys9GGCu60XA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMj1kXFR2-56pPnLFJYKOeTnwR60pr5E7gjmGY4ys9GGCu60XA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eetC7UPioanKJbS8ia4doexauekoEZWiifoHCnhgrLFBSle7zpY
 LucqTgix/Xu99LeVIkoUnNs9lIWGtyu6SLl13JmqTRN1a59Kc6aprd1AmTGIEfF0VmH9V11
 04JBGdmkGZUPZlfwnHauc1f7X+rdbupBce5d6gzQl0jqPwn+kmJ4Zfl47om6W4umPkn3KF4
 i1pBnXyElcRuTSINrU2ow==
UI-OutboundReport: notjunk:1;M01:P0:83CFSAQcK28=;t+fXOIhVLpFyB4iv5YGZyRcTRYx
 y1CBPYoBPa8SgDgdxCDRXCw4o6uoFUYf/y8/v0+vUMPXDr5zohaZXaTgouChhfCBt6B7sVPEg
 +B1dtK0tUSpCpuw4gAmWskD1fXDcE398asdVIehQl5fRzZWL5/HZrnwveGizB1b/dWFnU2aYX
 XJE82FEUiOLut1xKmFbqMADASkGIh5BxWTMnX6s6cQg3rBz662QLCvNSXwtbTTjY2QhdLvfF+
 p9/BlMN75i3x/DqujS1gGNyyCuQyAZMQa5+lOE0oGqJGmR8zwPqyG6dvLN+NBjyVKToo+yssZ
 6Sa8PDj6Sr2gfC0AHL9dw1H+pj7vbcHl0fMtvXV/I1bKuzVNHjuqJUeo0XRAC94PIcrFFmy/h
 Kq3SabyxdRGSQwV2K49csmbbj/urlmRpfC3yMtpfZtibJC/Mmr+sJ9u7X+JWCogRv9JbH00NX
 IdW+mfg+7nWzNWDDQv6YhvIVvNcEp48XIkwqrVgSMxc3EsruLvnTEyTxEwBjGzRPJ1L2/QWJa
 qh4d6Q+Eh1ZCcqORTMsydnBvq+YboKlx5MEpiC2ozBkoDpgdbBiBnUoYcb/RqwteOfjtW3y8J
 SZxowrSFXnE5NeZXM4Q5VD3WR1PIraI4yy3kwiivwKwzFRqTJWWWZfezZmqj9auqWGkUN3a/m
 ayV4Epq+454aMBF+acAMSKFyX30xuw0/KHCfRtQXEKMn8201++WUXxzlkwY6ti4IQv/C/hCx+
 Sed0ogPWA5nqphKZV3emjfbT/8/DeYjIa98GGsch3D+Lk0qzcnc/DiIiYIvtHHAc6Knev5CBI
 jETwtqaoy8F35m5O+efw54VXiJqdXkrDy1lJGz020o1xUcTzXsfyEpmexCNjH2H0MotlZb9IT
 ZQHSqUK+bpQxahbOcFxRiFseken5QTxXnJW71DJbAqgL1YKq4B+/1ozHZYEYXn41iG8nVsUZR
 Fpy6cW0DFOKPWLBOOdAE6SkYwT8=
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Dear Ard, all,

@new CC addressees:

The thread starts here (for example on marc.info, though it's slow to
respond currently, at least for me):

https://marc.info/?l=3Dlinux-ia64&m=3D168390699019217&w=3D2

I also recommend to read through the following threads and article to
get the background:

* https://marc.info/?l=3Dlinux-ia64&m=3D167490894109449&w=3D2
* https://marc.info/?l=3Dlinux-ia64&m=3D167645523010657&w=3D2
* https://www.theregister.com/2023/02/16/itanium_linux_kernel/
* https://marc.info/?l=3Dgrub-devel&m=3D168380680728904&w=3D2

On 17.05.23 23:41, Ard Biesheuvel wrote:
> On Wed, 17 May 2023 at 20:39, Frank Scheiner <frank.scheiner@web.de> wro=
te:
>> On 12.05.23 17:57, Ard Biesheuvel wrote:
>>> The bottom line is that, while I know of at least 2 people (on cc)
>>> that test stuff on itanium, and package software for it, I don't think
>>> there are any actual users remaining, and so it is doubtful whether it
>>> is justified to ask people to spend time and effort on this.
>>
>> While I get your argument, I also find it important to be able to
>> innovate without destroying the past. And with the already severly
>> limited choice of current architectures for the masses (x86, arm), it
>> becomes even more important to keep what we have or had in the past, to
>> not end in a "If all you have is a hammer, everything looks like a
>> nail." type of future.
>>
>
> I don't disagree with that. But why does this imply that Linux should
> be kept alive on an architecture that is not used by anyone to run
> Linux in the first place? Could you be more specific about how you see
> this correlation?

I don't think the main problem for ia64 is interest, I think it's
availability. These machines are rare - already because they weren't
sold in high numbers - and are usually quite expensive to acquire,
except if you can get them from the trasher, get them donated or cheap
by sheer luck.

Apart from that I also don't expect ordinary users to actually subscribe t=
o:

* distributions@lists.freedesktop.org
* debian-ia64@lists.debian.org
* linux-ia64@vger.kernel.org
* port-ia64@netbsd.org

I assume even less would feel entitled to write to a thread like this one.

I therefore thought it would be a good idea to spam a few people in
addition. Hope you don't mind.

>>> And for GRUB in particular (which is what triggered this message), it
>>> is unclear to me why any machines still running would not be better
>>> served by sticking with their current bootloader build, rather than
>>> upgrading to a new build with a refactored EFI layer where the best
>>> case scenario is that it boots the kernel in exactly the same way,
>>> while there is a substantial risk of regressions.
>>
>> Sure, and every ia64 machine I have still network boots fine with elilo=
,
>> even the rx2800-i2. Though most people still have their root FS on disk=
,
>> where elilo might limit the choice of the bootstrap file system(s).
>>
>
> So which Linux versions are you running on these machines? And what
> are you using them for (if you don't mind me asking)?

I have a lot of machines of different vintage, a little from everything
and my ia64 machines only make a few of them. And I'm definitely the
bottleneck for work done on them.

But according to my notes I originally started with Debian Wheezy (so
3.2.x) on my rx2620 (w/2 x Montecito) and later (in 2017) on my rx4640
(w/4 x Madison) and rx2660 (w/1 x Montvale, later 2 x Montecito). I
tried to get configurations with different processor generations and
chipsets (e.g. zx1 with Madison/Montecito or zx2 with Montecito/Montvale
or Tukwila w/integrated memory controller) in order to be able to debug
cases that only affect specific combinations and there were some in the
recent past. Also in 2017 but later the year I had a brief episode of
Gentoo, as Gentoo had a newer Linux kernel (4.9.34) available on their
installer ISO that worked on the rx2660. It took days to fix and
finalize a Gentoo installation for this machine but in the end I could
finally create "modern" Linux kernels on ia64. The shipped elilo didn't
work for on-disk installations though, as I later found out, so I
switched to the version from Debian Wheezy. It took nearly a year (until
June 2018) before I did revisit my ia64 machines, because work happened
on powerpc, ppc64, sparc64, sgi, hppa and others in between. The ia64
port of Debian Sid got a kernel package back then, most likely by Adrian
and others, and I wanted to switch my ia64 machines from Wheezy to Sid.
I needed to move on to Linux 3.14.x from Wheezy Backports to be able to
debootstrap Sid back then and had to "fix" (I just reinstated a patch
that was dropped, see [1]) the klibc utils for the initramfs so they
worked and didn't segfault. Sadly the 4.17.0-rc7 didn't work (due to
"corrupted stack end detected inside scheduler"), but I could get the
rx4640 and rx2660 to work with the Gentoo kernel (4.9.95) instead, so
could actually run Debian Sid on them, though with a "non-native"
kernel. Sometime later I could procure a rx2800-i2 (w/1 x Tukwila) and
tried to put that to use. Gentoo's 4.14.x and the older 4.9.x were the
only Linux kernels that did work on this machine, though. Debian kernels
started to work on the other machines with 4.17.14 in August 2018.
Between 2019 and 2022 not much did happen with these machines, because
of other interests. This started to change in 2022 and I am getting back
to it.

There is an issue since a while (see [2]) which does not affect the
rx2800-i2 (neither with (I checked that on Tuesday) nor w/o initramfs
(as pointed out on [3]). But all the other machines I have (all the
above, plus second rx2660 (w/1 x single-core Montvale) and rx6600 (w/4 x
Montvale) are affected, so Linux on ia64 is not completely broken at the
moment.

[1]:
https://salsa.debian.org/kernel-team/klibc/-/merge_requests/1/diffs#9c96da=
0e9f91d7d8937b69b524702c106258f0d1

[2]: https://marc.info/?l=3Dlinux-ia64&m=3D167404713006203&w=3D2

[3]: https://marc.info/?l=3Dlinux-ia64&m=3D167710457217507&w=3D2

So in short: I ran and run every Linux kernel version I could get to
work on these, preferrably w/o building them myself. And I use(d) them
with the goal to make it easier for other people to use them (I can
detail that if needed), to assist other people in debugging specific
issues, to find out if a problem affects specific configurations only or
not and to test specific software pieces (e.g. grub for ia64 in Debian,
or the installer ISOs although I prefer network booting).

Considering that and also the work and effort put into Debian by Jason
(Duerstock, +CC), Adrian and Jessica (Clarke, +CC) to get the ia64 port
of Sid going, plus the effort by Jessica and Sergei (Trofimovich, +CC, I
also put ia64@gentoo.org in CC now) and others for sure that was put
into fixing bugs (not only in the Linux kernel IIC) and testing by users
I dare to say that the work or pain (see e.g. Linus' take on that [4])
is shared between many people.

[4]: https://marc.info/?l=3Dlinux-ia64&m=3D167649168302428&w=3D2

And considering how bad the situation was for ia64 before it was
reestablished in Debian, I'd say the support for ia64 is in a much
better shape now than back then, thanks to all people involved.

>> Plus elilo is gone from the Debian repositories, just like yaboot,
>> leaving grub2 as the only bootloader for ia64 there at the moment - if
>> I'm not mistaken. And I assume Adrian invested quite some time and work
>> to get grub2 usable as default boot loader for ia64 in Debian.
>>
>
> Sure. But I am not suggesting retroactively removing ia64 support from
> GRUB. As I explained, both the firmware interfaces and the Linux boot
> protocol are essentially set in stone at this point, so upgrading to a
> newer GRUB has no upsides.

Sure. The question is, can it be handled downstream, e.g. can Debian
stay on grub2 - before your refactoring - for ia64 only? But as said,
elilo still works fine, though there seem to be specific versions that
don't as I just re-read in some older posts when going through the
debian-ia64 mailing list archive.

But again, I'm not afraid of loosing ia64 support in grub, but of
loosing it in the Linux kernel.

>> But apart from this - also from other posts - it is pretty obvious that
>> you seem to be absolutely determined to remove ia64 support from the
>> Linux ecosystem. So removing it from the bootloader is just a step ston=
e
>> to removing ia64 support from the Linux kernel and a discussion about
>> the bootloader seems futile then.
>>
>
> Not at all.

So why then put effort in patches that remove ia64 from grub and Linux,
if the decision for pulling the plug on ia64 would be made by potential
users you claim there aren't any?

> As a Linux subsystem maintainer, I have to keep the bigger
> EFI picture in mind when I accept contributions from people who may
> work on many different topics and projects, and move on to something
> else immediately. So generally, the responsibility of balancing the
> interests of different EFI stakeholders falls to me, and I have to
> decide how much emphasis to put on build and boot testing across
> architectures and use cases, for instance. So what purpose is being
> served by either them or me spending a disproportionate amount of time
> build and boot testing code that nobody is ever going to run?
>
> Up to this point, not a single person has indicated that Linux on ia64
> is important for an actual use case.

What is an actual use case for you? Maybe it would be easier to know
what you consider legit.

How could support for RISC-V materialize in the Linux kernel under such
circumstances, w/o users, w/o use cases and w/o hardware?

Is CI testing the Grid Community Toolkit on this arch to confirm its
multiplatform interoperability a use case for you? What about examining
network performance with GridFTP and different NICs? What about
examining performance variations between different kernel versions and
processor generations? I am sure users can think of many things they
could do on these machines, if they only had one at their hands.

Again, maybe it would be easier to know what you want to hear.

> The only responses I am getting
> (which are much appreciated, don't get me wrong) generally state that
> ongoing ia64 support is important for the common good, but nobody
> actually uses Linux/ia64 for anything other than checking whether it
> still works, and churning out distro packages that nobody ever
> downloads.

Exactly, isn't that how you maintain an architecture downstream: You
make sure it is working for any users to come by. What's the problem
with that? And is that any different for most other architectures? How
many of the maybe 60k (?) packages for x86 on Debian are actually used
by users?

Look, Debian is not RHEL or SLES. It (or the support for it) is not sold
for money, so it is not produced for demand or specialized for
profitable markets. The same's valid for Gentoo I'd say.

But I figure, building a distribution out of kernel, bootloader and
userland and try to keep it in shape is not a legitimate use case?

>>> For the Linux kernel itself, the situation is quite similar. There is
>>> a non-zero effort involved in keeping things working, and if anyone
>>> still needs to run their programs on Itanium, it is not clear to me
>>> why that would require a recent version of the OS.
>>>
>>> So bottom line: I am proposing we drop support for Itanium across the
>>> board. Would anyone have any problems with that?
>>
>> Of course I would have a problem with that. AFAIK GNU/Linux is the last
>> free OS for these machines. And I don't see those machines as museum
>> pieces yet, but as options for interested people, coming back to the
>> hammer and nail thing from above.
>>
>
> By 'interested people' you mean other people than yourself, right?

Is that a rhetorical question?

>> But I demand nothing of you. And to be honest I can't contribute at thi=
s
>> level to ia64, as I just don't have the required expertise for this typ=
e
>> of hacking.
>>
>> Apart from that I'd like to thank all people involved in keeping those
>> interesting systems afloat for the good times I had and have on ia64 an=
d
>> other interesting architectures and machines.
>>
>
> Again, your insight is much appreciated, even if we fundamentally disagr=
ee.

You're welcome. :-)

Have a nice weekend all,
Frank
