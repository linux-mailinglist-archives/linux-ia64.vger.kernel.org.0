Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 241BE70A15A
	for <lists+linux-ia64@lfdr.de>; Fri, 19 May 2023 23:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjESVNS (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 19 May 2023 17:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjESVNS (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 19 May 2023 17:13:18 -0400
Received: from matoro.tk (unknown [IPv6:2600:1700:4b10:9d80::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9169097
        for <linux-ia64@vger.kernel.org>; Fri, 19 May 2023 14:13:16 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; bh=ppcfgIiw1awHymqtaFa0sNPDlgMin2BRR1QcBDBMQP4=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20230516; t=1684529796; v=1; x=1684961796;
 b=OWt3ze3sxfdrfg7Z12C+ddERpzdPLgGEt6uEt2+YhYOQz+r+emwcluZTNgtPQUuZFUZffBlU
 yaCyoa9y9+s/ovbXB//q0OuTHO9DHvR75aWCQgeZLT38wekk0Sfrm/jjx3WkES52Xhkck+Vqq7M
 BMJg6ViJANaK9Gmq2oLIuclJt/EDLpkgOABv5f3g5HImx72FefK83eJ240RYufh/HEDSzJvitxc
 jMXt4/+zinWSCS4AKQ6GsF+mUX7QADT6Sp7WzVz3iDqG9NydWf7/Ll5BX+3fNHskPDjqzFWwgFw
 EG6gDEVEIMbQTUvxA8t/SZMe9WlV7OX7cAqq6dnERQ0WfHnvt0Zn2aArdNQUrnD9jPgkflfqMIo
 OjA3QeaMHahBWvm+ABWoQFOhUyrzsDyW0CWVjrxW99tkXgbLvbJRR18DUni+tnrDsm6idiOup5J
 CTd1gvLf7KIYe/ukTwy/xXZYXtFCZYBxzasMNvFM0Vk63plyRJTV3Y6XpwGNBjzIk/aB0Ts3Krd
 z3iheqo8s0ExF+aZo0TPMqiMz7weiT+WwmXyWIMQey7oW4n7it3rGboW7jwQnpo9UQaLZjFFz5F
 zYtMJ0sTSiCSbCuQ/kQYuGrE+QnVa6tbLKD39gBiH4igtE2bR+MpOkeOC0mqR8ozj5g6QYyMylX
 ke2/HcISTJY=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id 5693c922; Fri, 19 May
 2023 16:56:36 -0400
MIME-Version: 1.0
Date:   Fri, 19 May 2023 16:56:36 -0400
From:   matoro <matoro_mailinglist_kernel@matoro.tk>
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     Florian Weimer <fw@deneb.enyo.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        distributions@lists.freedesktop.org, debian-ia64@lists.debian.org,
        linux-ia64@vger.kernel.org, port-ia64@netbsd.org,
        Tony Luck <tony.luck@intel.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        Steve McIntyre <steve@einval.com>
Subject: Re: [crosspost] dropping support for ia64
In-Reply-To: <12a3e3c5-9465-c97f-58ab-938e80681fbc@web.de>
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
 <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de>
 <87bkiilpc4.fsf@mid.deneb.enyo.de>
 <4e210d61adbe73a1673f113019401e5c@matoro.tk>
 <12a3e3c5-9465-c97f-58ab-938e80681fbc@web.de>
Message-ID: <5e778e16f93f2286fa535597ba5da24b@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 2023-05-19 16:17, Frank Scheiner wrote:
> Dear matoro, Florian,
> 
> On 17.05.23 23:47, matoro wrote:
>> On 2023-05-17 15:39, Florian Weimer wrote:
>>> * Frank Scheiner:
>>> 
>>>> On 12.05.23 17:57, Ard Biesheuvel wrote:
>>>>> The bottom line is that, while I know of at least 2 people (on cc)
>>>>> that test stuff on itanium, and package software for it, I don't 
>>>>> think
>>>>> there are any actual users remaining, and so it is doubtful whether 
>>>>> it
>>>>> is justified to ask people to spend time and effort on this.
>>>> 
>>>> While I get your argument, I also find it important to be able to
>>>> innovate without destroying the past. And with the already severly
>>>> limited choice of current architectures for the masses (x86, arm), 
>>>> it
>>>> becomes even more important to keep what we have or had in the past, 
>>>> to
>>>> not end in a "If all you have is a hammer, everything looks like a
>>>> nail." type of future.
>>> 
>>> The history doesn't go away.  We still have pre-built ia64 system
>>> images, the sources, and current machines can run ia64 code under
>>> QEMU.  Those host systems will remain available (maybe under
>>> virtualization) for many, many years to come.  So if anyone wants to
>>> experiment with an architecture that has register trap bits and 
>>> things
>>> like that, it's possible.
>>> 
>>> I expect the rest of the hardware itself is not remarkable, and
>>> anything useful has been thoroughly reused for other systems (like we
>>> did for the Itanium C++ ABI on the software side).
>>> 
>>> From the userspace side, the issue is not so much testing (if we
>>> bother to test our changes at all, we can use emulation), but
>>> half-completed implementaton work (I ran into missing relaxations in
>>> the link editor a while back, for example), and those limitations 
>>> have
>>> knock-on effects on generic code that we have to maintain.
>> 
>> FYI, QEMU does not have ia64 host or target support, not even TCG.
> 
> I assume Florian means user mode emulation, which for example can be 
> used to complete a `debootstrap --foreign [...]` run when you don't 
> have an existing ia64 userland on real hardware at hand.
> 
> I doubt that it works in the exact same way than the real thing, 
> though. Such differences are part of the reasons why the OpenBSD devs 
> don't seem to use cross compilers or virtualized or emulated systems to 
> produce and test their OS, though they seem to use cross compilers for 
> the bringup of new platforms IIC.
> 
> But if it's good enough to run ia64 binaries on other arches, why not.
> 
> Have a nice weekend,
> Frank

There is no user-mode emulation for ia64 in QEMU either.  The only 
"ongoing" emulation work is Sergei's fork of the old "ski" emulator, but 
this is far from QEMU quality or even usable yet:  
https://github.com/trofi/ski

Anyway, to summarize this thread for Ard:  the answer to the question of 
if anybody is using these machines for anything other than to 
experimentally see if things run or churn out packages is NO.  Any 
Itanium machines running useful production workloads are on HP-UX/VMS.  
Possibly Windows Server 2008 or an old RHEL, but unlikely.

The only argument for continued support is as you described, the 
argument from the commons, that the ecosystem as a whole benefits from 
diversity of architectures.  All that matters is whether you find this 
argument convincing.  There are some like myself who do, but I am not a 
kernel maintainer.  If you don't, then that should be that.
