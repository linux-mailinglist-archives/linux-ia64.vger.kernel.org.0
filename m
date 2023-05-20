Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E253C70A946
	for <lists+linux-ia64@lfdr.de>; Sat, 20 May 2023 18:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbjETQso (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 20 May 2023 12:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjETQsm (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 20 May 2023 12:48:42 -0400
Received: from albireo.enyo.de (albireo.enyo.de [37.24.231.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D590A0
        for <linux-ia64@vger.kernel.org>; Sat, 20 May 2023 09:48:41 -0700 (PDT)
Received: from [172.17.203.2] (port=48443 helo=deneb.enyo.de)
        by albireo.enyo.de ([172.17.140.2]) with esmtps (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        id 1q0Pkm-00CUzx-F7; Sat, 20 May 2023 16:48:25 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.96)
        (envelope-from <fw@deneb.enyo.de>)
        id 1q0Pkn-000Lef-25;
        Sat, 20 May 2023 18:48:25 +0200
From:   Florian Weimer <fw@deneb.enyo.de>
To:     matoro <matoro_mailinglist_kernel@matoro.tk>
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
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
        <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de>
        <87bkiilpc4.fsf@mid.deneb.enyo.de>
        <4e210d61adbe73a1673f113019401e5c@matoro.tk>
        <12a3e3c5-9465-c97f-58ab-938e80681fbc@web.de>
        <5e778e16f93f2286fa535597ba5da24b@matoro.tk>
Date:   Sat, 20 May 2023 18:48:25 +0200
In-Reply-To: <5e778e16f93f2286fa535597ba5da24b@matoro.tk> (matoro's message of
        "Fri, 19 May 2023 16:56:36 -0400")
Message-ID: <87y1lj0x0m.fsf@mid.deneb.enyo.de>
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

* matoro:

> There is no user-mode emulation for ia64 in QEMU either.  The only 
> "ongoing" emulation work is Sergei's fork of the old "ski" emulator, but 
> this is far from QEMU quality or even usable yet:  
> https://github.com/trofi/ski

Yeah, I must have misremembered.  Awkward.

So it's a really exclusive club, which makes continued maintenance
efforts even more doubtful.

> Anyway, to summarize this thread for Ard:  the answer to the question of 
> if anybody is using these machines for anything other than to 
> experimentally see if things run or churn out packages is NO.  Any 
> Itanium machines running useful production workloads are on HP-UX/VMS.  
> Possibly Windows Server 2008 or an old RHEL, but unlikely.

RHEL 6 didn't have ia64 anymore.  RHEL 5 is out of support.  In any
case, the last thing such customers would want (if they existed) is a
rebase from 2.6.18 to a 6.x kernel, or a toolchain upgrade for that
matter.  So what we do to current versions really does not matter to
hypothetical commercial ia64 Linux users.

> The only argument for continued support is as you described, the 
> argument from the commons, that the ecosystem as a whole benefits from 
> diversity of architectures.  All that matters is whether you find this 
> argument convincing.  There are some like myself who do, but I am not a 
> kernel maintainer.  If you don't, then that should be that.

Some of the variance/diversity isn't actually necessary, though.  It's
just that ia64 has some half-done stuff in the tools that no one
bothered to fix, creating complexities elsewhere.
