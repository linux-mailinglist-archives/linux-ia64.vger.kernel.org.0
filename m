Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6167189EC
	for <lists+linux-ia64@lfdr.de>; Wed, 31 May 2023 21:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjEaTO3 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 31 May 2023 15:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjEaTO2 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 31 May 2023 15:14:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0B0137
        for <linux-ia64@vger.kernel.org>; Wed, 31 May 2023 12:14:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 00B0563E55
        for <linux-ia64@vger.kernel.org>; Wed, 31 May 2023 19:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C779C433A0
        for <linux-ia64@vger.kernel.org>; Wed, 31 May 2023 19:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685560464;
        bh=9MzZQ+cbGdqSptAfx68yX2N/dEdWtyQDve72+Z9h5m4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dHpd03nOWZXu+OppVP8cSL7ZkrhIY+Eucma8EZaafxfz7pM4r0EH8fPEfm7MtlkrA
         IukEeHY77ViddR9yKK+8SxCFhr6vuzPlGGccchRVJKGAHc+tIRe8xElgDhUmuKmGoo
         Xmz8axJ7cgNLbkBca4E29o0lHZJ9NcwYmA4HhQlicP7GtpYmirADOwU/Ajmq2U+4Im
         6epcUoy4mq6EVShMJOAu/jHTp1blUFgmkCj4FAsyHc/SzrR5bmmFA0yZlkPCVA5kmZ
         TedNnYSwS+QlUC+p/cFM74cHmtqBF5C5q7bbRxaVjXQAHkET+WkgV0V2oVpVdngKJH
         CUfpZteBMsAFg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f3bb395e69so7515431e87.2
        for <linux-ia64@vger.kernel.org>; Wed, 31 May 2023 12:14:24 -0700 (PDT)
X-Gm-Message-State: AC+VfDxRUlou7ZxHL9aZsQn6khGqyk8VTuT3HNTkWCHPt8SEOvtSjqlx
        AdhqqV0m19fxMz7pdlB7nyu9itNKq9reG94Kz5I=
X-Google-Smtp-Source: ACHHUZ4CtqBP6HnqMVvsuAwlolc/3M+6RxbQAlW3fMR8i0lGVQpLlagOVbZhWC+xV60Eeo/BNYPHzP/yws/q0exwrJA=
X-Received: by 2002:a05:6512:247:b0:4f2:74d3:8996 with SMTP id
 b7-20020a056512024700b004f274d38996mr37438lfo.8.1685560462261; Wed, 31 May
 2023 12:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de> <ZHErssbUSbSznTVA@bombadil.infradead.org>
 <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
 <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de> <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
 <b2b47c19-d527-fbd2-1666-801f173b6174@web.de> <CAHk-=wjDQZ8snU__Y8qJ8M5H--1FtAwNq-oHKmY4CJuomWPvDw@mail.gmail.com>
 <CAPhsuW7Gcd7hkrD6RtBdJDMdVnaN8Bv_kVNdpyccUiuD-TqYDw@mail.gmail.com>
 <ea6bb10a-f830-1a9f-19b1-07269a073876@web.de> <42e4fbe4-2b4d-4f9a-222f-1d14d4836da3@web.de>
 <CAPhsuW5VdZiLwAax1Ax3OVD=Kp2y2i-U9Ap3LS3jY6jz59Nawg@mail.gmail.com> <b74bda58-8804-4456-eb52-b476e7b29f78@web.de>
In-Reply-To: <b74bda58-8804-4456-eb52-b476e7b29f78@web.de>
From:   Luis Chamberlain <mcgrof@kernel.org>
Date:   Wed, 31 May 2023 12:14:10 -0700
X-Gmail-Original-Message-ID: <CAB=NE6UXgiPwBCt-TFM3xvXmFuQUDDqiXgMbv1-xGCNKWiQTwg@mail.gmail.com>
Message-ID: <CAB=NE6UXgiPwBCt-TFM3xvXmFuQUDDqiXgMbv1-xGCNKWiQTwg@mail.gmail.com>
Subject: Re: Boot regression in Linux v6.4-rc3
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Song Liu <song@kernel.org>, linux-ia64@vger.kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, May 31, 2023 at 11:16=E2=80=AFAM Frank Scheiner <frank.scheiner@web=
.de> wrote:
> Looking forward to the next occasion - for your sake maybe on another
> architecture, but can't promise... ;-)

I think it would be prudent for Song to also ask you to test his
future upcoming modules patches on ia64 given how hard it is to
procure such hardware too.

  Luis
