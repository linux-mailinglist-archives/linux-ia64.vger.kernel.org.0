Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49D4070B5EF
	for <lists+linux-ia64@lfdr.de>; Mon, 22 May 2023 09:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjEVHKY (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 22 May 2023 03:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbjEVHJq (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 22 May 2023 03:09:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E86219B
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 00:08:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A78A161DAD
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 07:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F90C433A0
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 07:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684739329;
        bh=RoqzXA44TuIqfX/cct4EXaxJvdKaUOEZ0jXDVY6sUaM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=H1mrttU/KjMZRy1gqwWlqZNv6PBbCurK2bm1MB4TDZGCskvbk8MbGYrxw6fqPuoIk
         Xp+fsorzmA5FKGQMVTq6muhXmmcr2MxAZgEd2o8Cb2+cPRb7+TBwkV5QnLRqzcIpPM
         gumDQSIPRZem+j8Osft+rL6tw7G1qYQ7iPq/0hIaED150II9DShkpSACCd0jH72x69
         4FR0T0kOeHzdMfdJpyH9cLF4kLLEWgwZzXS0MrYhykIawppmqEs5ApUw4Qb1gAfkA2
         KCWqqoV7MEdqjUQKLbent5eQsI7JvfBb/CBsYD+i+e3Zy7E2yjlnYt4VxH81hp9Ycr
         n897d7d+89EnQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2af30d10d8fso18114971fa.0
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 00:08:48 -0700 (PDT)
X-Gm-Message-State: AC+VfDzGD5GUePvMmkpQLfF++BZb18piu3fREq/KCswvJjYiptkzdXvk
        rC64RtA/ODUi/GPbqDYQ1TavioHLSnB3CtFb5/A=
X-Google-Smtp-Source: ACHHUZ6aXi3aaUbkrvswZAn9wPeJDo2NJPOr5BOffNwwLf3SUEmPMcaSGQcnBh++ueSNMk3NbsVmX//v0vSVc9Pjw8U=
X-Received: by 2002:ac2:52aa:0:b0:4ef:d6e2:6530 with SMTP id
 r10-20020ac252aa000000b004efd6e26530mr2821773lfm.37.1684739327027; Mon, 22
 May 2023 00:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
 <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de> <87bkiilpc4.fsf@mid.deneb.enyo.de>
 <4e210d61adbe73a1673f113019401e5c@matoro.tk> <12a3e3c5-9465-c97f-58ab-938e80681fbc@web.de>
 <5e778e16f93f2286fa535597ba5da24b@matoro.tk> <87y1lj0x0m.fsf@mid.deneb.enyo.de>
 <ff58a3e76e5102c94bb5946d99187b358def688a.camel@physik.fu-berlin.de>
In-Reply-To: <ff58a3e76e5102c94bb5946d99187b358def688a.camel@physik.fu-berlin.de>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 22 May 2023 09:08:35 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGmbtiosH3fwMuduFvjmb2PVsX-tMLTk96jPvmW+oKi-w@mail.gmail.com>
Message-ID: <CAMj1kXGmbtiosH3fwMuduFvjmb2PVsX-tMLTk96jPvmW+oKi-w@mail.gmail.com>
Subject: Re: [crosspost] dropping support for ia64
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Florian Weimer <fw@deneb.enyo.de>,
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

(cc Greg as stable maintainer)

On Sat, 20 May 2023 at 21:23, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
...
>
> I have been thinking about this discussion for a while now and my suggestion
> would be to drop ia64 support from the kernel, GRUB and gcc/binutils/glibc in
> this order:
>
> - Kernel: After the next LTS release
> - GRUB: After the 2.12 release
> - gcc/binutils/glibc: After support was dropped from the kernel
>
> This way anyone still using ia64 will be able to use it with a supported codebase
> for an extended time and upstream projects have target releases for which they
> can plan the removal.
>

Yeah, I think this is reasonable. Having a clear agreement on where
the support ends helps both the remaining users and the developers
eager to move on.

My only question is how we would land fixes for ia64 into this Linux
LTS release if there is no upstream any longer to draw from.

Greg, could you comment on this?
