Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C05D707511
	for <lists+linux-ia64@lfdr.de>; Thu, 18 May 2023 00:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjEQWEu (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 17 May 2023 18:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjEQWEt (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 17 May 2023 18:04:49 -0400
X-Greylist: delayed 977 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 17 May 2023 15:04:10 PDT
Received: from matoro.tk (unknown [IPv6:2600:1700:4b10:9d80::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C1C284EE2
        for <linux-ia64@vger.kernel.org>; Wed, 17 May 2023 15:04:10 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; bh=jCJPJziDjoqQkXebKMkIS93IYK6hdRfH+HesZSjfyAU=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20230516; t=1684360051; v=1; x=1684792051;
 b=hseeOKRth9j8yuDUtdHr19uOXjIjdd906NZzWLWDQBwKZlaLCp1fHPsAVgOKEo7Vof7Nq672
 p6AyPPxU+EoFMB8zieGpoFvXl7HcmrAbkU1o7kyM5BqNiJbrj+M4GvI7tVBcsuwgkXyL/bbS0/d
 jd7noxO0vvCw4e2xMErztLvsiGtfs0izMCnxBXJ9J4BOyGiQkZt+LmLpL6/OIFpX6574nf5Fh5p
 H/psw1PV9JoiPONawfXeLICyLfccm7HZA1PqTRrGZLawsRra4ZRviVMJnz/g3A+5ool1FaTDCXE
 F4TD6tb5YJVmPSwvQk5cKa2wQyD7YXyyrvyaRItJ64V0j0QJGJtR61az/RUr0VlYuGV1P9OCQ+n
 rzC7idFQ+jLJhVPIC1PefIwbnu/wdbppXR+suFSNPeb3JEgBXmBDcecrLNVi0W0W9O+58ee7Hbn
 jOvzuILB/sHRJsnEfmUzF6j6/w/dZMBjA7XZcfF06F0/OelLL6vqAnNN7s9c5e/lcuegd+eC9dk
 wdnpUPrg0dAfRe73L3uGYPbcz68YLYb8Whu8rm20p4HVlNouj59PkkBB1yNcgYOlSn09yf54IUF
 ydhWvYvUxyuaMxxJySBAzGF9zDdBwzidRnKNA7yt3jL+k2iO64kJMblivXDOS+BBlaE+kjjQFjJ
 ItpoAr5yL8Q=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id 33a940ea; Wed, 17 May
 2023 17:47:31 -0400
MIME-Version: 1.0
Date:   Wed, 17 May 2023 17:47:30 -0400
From:   matoro <matoro_mailinglist_kernel@matoro.tk>
To:     Florian Weimer <fw@deneb.enyo.de>
Cc:     Frank Scheiner <frank.scheiner@web.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        distributions@lists.freedesktop.org, debian-ia64@lists.debian.org,
        linux-ia64@vger.kernel.org, port-ia64@netbsd.org,
        Tony Luck <tony.luck@intel.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        Steve McIntyre <steve@einval.com>
Subject: Re: [crosspost] dropping support for ia64
In-Reply-To: <87bkiilpc4.fsf@mid.deneb.enyo.de>
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
 <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de>
 <87bkiilpc4.fsf@mid.deneb.enyo.de>
Message-ID: <4e210d61adbe73a1673f113019401e5c@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 2023-05-17 15:39, Florian Weimer wrote:
> * Frank Scheiner:
> 
>> On 12.05.23 17:57, Ard Biesheuvel wrote:
>>> The bottom line is that, while I know of at least 2 people (on cc)
>>> that test stuff on itanium, and package software for it, I don't 
>>> think
>>> there are any actual users remaining, and so it is doubtful whether 
>>> it
>>> is justified to ask people to spend time and effort on this.
>> 
>> While I get your argument, I also find it important to be able to
>> innovate without destroying the past. And with the already severly
>> limited choice of current architectures for the masses (x86, arm), it
>> becomes even more important to keep what we have or had in the past, 
>> to
>> not end in a "If all you have is a hammer, everything looks like a
>> nail." type of future.
> 
> The history doesn't go away.  We still have pre-built ia64 system
> images, the sources, and current machines can run ia64 code under
> QEMU.  Those host systems will remain available (maybe under
> virtualization) for many, many years to come.  So if anyone wants to
> experiment with an architecture that has register trap bits and things
> like that, it's possible.
> 
> I expect the rest of the hardware itself is not remarkable, and
> anything useful has been thoroughly reused for other systems (like we
> did for the Itanium C++ ABI on the software side).
> 
> From the userspace side, the issue is not so much testing (if we
> bother to test our changes at all, we can use emulation), but
> half-completed implementaton work (I ran into missing relaxations in
> the link editor a while back, for example), and those limitations have
> knock-on effects on generic code that we have to maintain.

FYI, QEMU does not have ia64 host or target support, not even TCG.
