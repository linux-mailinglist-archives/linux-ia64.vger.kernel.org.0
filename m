Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B92F570725D
	for <lists+linux-ia64@lfdr.de>; Wed, 17 May 2023 21:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjEQTj4 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 17 May 2023 15:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjEQTjz (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 17 May 2023 15:39:55 -0400
Received: from albireo.enyo.de (albireo.enyo.de [37.24.231.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60FCED
        for <linux-ia64@vger.kernel.org>; Wed, 17 May 2023 12:39:53 -0700 (PDT)
Received: from [172.17.203.2] (port=38659 helo=deneb.enyo.de)
        by albireo.enyo.de ([172.17.140.2]) with esmtps (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        id 1pzMzq-001q3v-8D; Wed, 17 May 2023 19:39:39 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.96)
        (envelope-from <fw@deneb.enyo.de>)
        id 1pzMzr-000BVz-1T;
        Wed, 17 May 2023 21:39:39 +0200
From:   Florian Weimer <fw@deneb.enyo.de>
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        distributions@lists.freedesktop.org, debian-ia64@lists.debian.org,
        linux-ia64@vger.kernel.org, port-ia64@netbsd.org,
        Tony Luck <tony.luck@intel.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        matoro <matoro_mailinglist_kernel@matoro.tk>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        Steve McIntyre <steve@einval.com>
Subject: Re: [crosspost] dropping support for ia64
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
        <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de>
Date:   Wed, 17 May 2023 21:39:39 +0200
In-Reply-To: <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de> (Frank Scheiner's
        message of "Wed, 17 May 2023 20:38:53 +0200")
Message-ID: <87bkiilpc4.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

* Frank Scheiner:

> On 12.05.23 17:57, Ard Biesheuvel wrote:
>> The bottom line is that, while I know of at least 2 people (on cc)
>> that test stuff on itanium, and package software for it, I don't think
>> there are any actual users remaining, and so it is doubtful whether it
>> is justified to ask people to spend time and effort on this.
>
> While I get your argument, I also find it important to be able to
> innovate without destroying the past. And with the already severly
> limited choice of current architectures for the masses (x86, arm), it
> becomes even more important to keep what we have or had in the past, to
> not end in a "If all you have is a hammer, everything looks like a
> nail." type of future.

The history doesn't go away.  We still have pre-built ia64 system
images, the sources, and current machines can run ia64 code under
QEMU.  Those host systems will remain available (maybe under
virtualization) for many, many years to come.  So if anyone wants to
experiment with an architecture that has register trap bits and things
like that, it's possible.

I expect the rest of the hardware itself is not remarkable, and
anything useful has been thoroughly reused for other systems (like we
did for the Itanium C++ ABI on the software side).

From the userspace side, the issue is not so much testing (if we
bother to test our changes at all, we can use emulation), but
half-completed implementaton work (I ran into missing relaxations in
the link editor a while back, for example), and those limitations have
knock-on effects on generic code that we have to maintain.
