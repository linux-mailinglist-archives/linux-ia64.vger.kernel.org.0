Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C636B70B6A9
	for <lists+linux-ia64@lfdr.de>; Mon, 22 May 2023 09:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjEVHjc (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 22 May 2023 03:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjEVHjb (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 22 May 2023 03:39:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DA6AC
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 00:39:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F13426112E
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 07:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89E6C433D2;
        Mon, 22 May 2023 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1684741169;
        bh=unBCmLjti5qPWyFre7scGGJN7KaHD7qaU7zPn6WVgMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pK0X13zwvS5EyYfekJ+3CB6ekfNfxSCXOm+nsTpBX0e0Qnh2iZ/TJlRS2EZg9uI8r
         7anzs2uiIY68gkVemhKfELShxmrnGxMwKkFj2n78aJAgOOzIAVKcokeYaFE650SvTg
         u6814t1ZBT3QuECG4cCPPUD415TaLH7a9tuZMQb0=
Date:   Mon, 22 May 2023 08:39:26 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ard Biesheuvel <ardb@kernel.org>
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
Subject: Re: [crosspost] dropping support for ia64
Message-ID: <2023052230-lunacy-graffiti-0cee@gregkh>
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
 <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de>
 <87bkiilpc4.fsf@mid.deneb.enyo.de>
 <4e210d61adbe73a1673f113019401e5c@matoro.tk>
 <12a3e3c5-9465-c97f-58ab-938e80681fbc@web.de>
 <5e778e16f93f2286fa535597ba5da24b@matoro.tk>
 <87y1lj0x0m.fsf@mid.deneb.enyo.de>
 <ff58a3e76e5102c94bb5946d99187b358def688a.camel@physik.fu-berlin.de>
 <CAMj1kXGmbtiosH3fwMuduFvjmb2PVsX-tMLTk96jPvmW+oKi-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGmbtiosH3fwMuduFvjmb2PVsX-tMLTk96jPvmW+oKi-w@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, May 22, 2023 at 09:08:35AM +0200, Ard Biesheuvel wrote:
> (cc Greg as stable maintainer)
> 
> On Sat, 20 May 2023 at 21:23, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> >
> ...
> >
> > I have been thinking about this discussion for a while now and my suggestion
> > would be to drop ia64 support from the kernel, GRUB and gcc/binutils/glibc in
> > this order:
> >
> > - Kernel: After the next LTS release
> > - GRUB: After the 2.12 release
> > - gcc/binutils/glibc: After support was dropped from the kernel
> >
> > This way anyone still using ia64 will be able to use it with a supported codebase
> > for an extended time and upstream projects have target releases for which they
> > can plan the removal.
> >
> 
> Yeah, I think this is reasonable. Having a clear agreement on where
> the support ends helps both the remaining users and the developers
> eager to move on.
> 
> My only question is how we would land fixes for ia64 into this Linux
> LTS release if there is no upstream any longer to draw from.
> 
> Greg, could you comment on this?

That would imply that people actually used that arch and code, so why
would it have been removed from Linus's tree?

And there's nothing "special" about LTS releases for features like this,
just drop the code when no one is using it and all is good.

thanks,

greg k-h
