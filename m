Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D595700F88
	for <lists+linux-ia64@lfdr.de>; Fri, 12 May 2023 22:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237950AbjELUCs (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 12 May 2023 16:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjELUCs (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 12 May 2023 16:02:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5737126BF
        for <linux-ia64@vger.kernel.org>; Fri, 12 May 2023 13:02:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E08A06586F
        for <linux-ia64@vger.kernel.org>; Fri, 12 May 2023 20:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4C3C433AC
        for <linux-ia64@vger.kernel.org>; Fri, 12 May 2023 20:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683921766;
        bh=FwdVEVqYMTR0dJZt8KCCDYDUwtkn2EfN5+VaYiQehVE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kZ9Cs9BV1Bzg70SozQedRcXKrOj5czJ1H8JJ2ugkvnDCWimFfkun4bJjwDLBiauj/
         veaDYBD++b6EjcQlWCtZCI5kbYI/E8bnY7Q+Q/uFYcIC+iuqZapO0cZSvUdTRq9TdJ
         RblCiz00PmSiK5w5ZbMLC1ufX6SfQLKQFWusKyzAdrIoP4s3RgdnATzDtkJf+JtQsM
         QttSuHuzFeXIQTDwJtvqfcTUC4u3yGxIkxZP6LiFXoCrUSadsaJppy5r6I6hsdZKCg
         aszLFkFzsA5dlHYtUw6RnX9Bc+b/goaZWmCRqPbVjavuUymMPEccOlyk6/VXA5WaPO
         MPmcHKHHgfeZw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f00d41df22so55170130e87.1
        for <linux-ia64@vger.kernel.org>; Fri, 12 May 2023 13:02:46 -0700 (PDT)
X-Gm-Message-State: AC+VfDySGwCr/kmaGN9NmQi5VpEjMUeNu/oDNy4yrSzjedENgDpN97mV
        MYuILRvFO/rUQMoEItjbSuLNTrXYRqdhiMjqIZQ=
X-Google-Smtp-Source: ACHHUZ4oIoMyCWYuShc96tzjlx6ctLbIuyn6gUp0JtMDQuDOpEDnNHh7XvQIHCeJy8/nopmh5/O0qWh82YYHELVBVP8=
X-Received: by 2002:a05:6512:33d4:b0:4f0:3e1:9ada with SMTP id
 d20-20020a05651233d400b004f003e19adamr4479264lfg.31.1683921764162; Fri, 12
 May 2023 13:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
 <8fea5127-c985-8057-2654-9001cb6256c0@Cypress-Tech.com>
In-Reply-To: <8fea5127-c985-8057-2654-9001cb6256c0@Cypress-Tech.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 12 May 2023 22:02:32 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFBqkFO4hN=40Zv46r3xaym9oPMRMN+e_7AwuhL0vK4Vg@mail.gmail.com>
Message-ID: <CAMj1kXFBqkFO4hN=40Zv46r3xaym9oPMRMN+e_7AwuhL0vK4Vg@mail.gmail.com>
Subject: Re: [crosspost] dropping support for ia64
To:     Jesse Dougherty <Jesse@cypress-tech.com>
Cc:     distributions@lists.freedesktop.org, debian-ia64@lists.debian.org,
        linux-ia64@vger.kernel.org, Florian Weimer <fw@deneb.enyo.de>,
        port-ia64@netbsd.org, Tony Luck <tony.luck@intel.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        matoro <matoro_mailinglist_kernel@matoro.tk>,
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

On Fri, 12 May 2023 at 20:50, Jesse Dougherty <Jesse@cypress-tech.com> wrote:
>
> I'm a little bias because my company is a re-sellers of the HP Itanium
> ia64 hardware (RX & ZX boxes), as well as PA-RISC. For that reason, I
> would hate to see it fade away in any sector. The ia64 platform is still
> widely used with HP-UX Unix and Open VMS users worldwide. This hardware
> is embedded in most every data center and large and medium companies
> that have been around since the 80s/90s, its probably the oldest box
> they have in there but its the one thats in the corner running for 20
> years, long before most people started working there. PA-RICS is also
> massively intertwined into the US military as well as foreign
> military's, they did that in the early 2000's and they are stuck with it..
>
> I could go on but me as a hardware guy, I'm on team ia64 :-)
>

Thanks for the data point. Gwtting your angle as someone who supports
actual users is rather useful.

So how many of your customers would be adversely impacted by the lack
of an upgrade path to, say, Linux kernels beyond v6.3 or GRUB versions
beyond today's 2.06?
