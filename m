Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE953700C68
	for <lists+linux-ia64@lfdr.de>; Fri, 12 May 2023 17:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241567AbjELP5u (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 12 May 2023 11:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241557AbjELP5t (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 12 May 2023 11:57:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B471FCE
        for <linux-ia64@vger.kernel.org>; Fri, 12 May 2023 08:57:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 35AD9657FC
        for <linux-ia64@vger.kernel.org>; Fri, 12 May 2023 15:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869FCC433D2
        for <linux-ia64@vger.kernel.org>; Fri, 12 May 2023 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683907067;
        bh=M6bsfp6OBiFAzuz3jDRvylle74s0YtqqtIcwIv/Aopc=;
        h=From:Date:Subject:To:From;
        b=RQaj4A4DivQ1DgtQe8jsKVgYfP6W2IOt/9jsMQ4QiERD5mOPXvDf7pTMzyH2QPzEn
         pt7ChubeNqB50RWY7Z4zYx/obwvdk9KL/EVSwLkWfLbbwHF0HU5n17TYty8UGbUrtU
         GXQu7z5z2ZMuJv3TTJkj0+ZCcO/KJvRb+Sadj4dK4oKF24wieXdNVyze2xjHkpw9M0
         bPEtdNzQiWT0w9ECgFRqrKOrDAwkitrhopHUR9flGlPvglf5B9CBlcBRPl07JK3qHL
         YcXL0i64QScHMzEZdLbQclFzmjb+eCKpWfCNRhiramHB8TkqMSX8b20UVBWrCeMs9z
         ZlkKnXs9qiCWA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ac7de2b72fso112494361fa.1
        for <linux-ia64@vger.kernel.org>; Fri, 12 May 2023 08:57:47 -0700 (PDT)
X-Gm-Message-State: AC+VfDzjBkO71LLcZjGq6yoe8h/9Gzckd/IeLpT2fitPqqUYH25Moa8b
        oD47xjMw5RLHN0HM9qYI47y+yvPuJWL1ZP/Cqcc=
X-Google-Smtp-Source: ACHHUZ694inCdh6O2j/MHeUuzCzsmWIctE8bglTzBIqoiJu29hGsndRa6x/lgSMU9rQBIcB0h8EFyJK/SCSoE8UonTQ=
X-Received: by 2002:a2e:9dd0:0:b0:2a8:ffdd:26fa with SMTP id
 x16-20020a2e9dd0000000b002a8ffdd26famr4333848ljj.52.1683907065488; Fri, 12
 May 2023 08:57:45 -0700 (PDT)
MIME-Version: 1.0
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 12 May 2023 17:57:34 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
Message-ID: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
Subject: [crosspost] dropping support for ia64
To:     distributions@lists.freedesktop.org, debian-ia64@lists.debian.org,
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

(cross posted to several ia64 related mailing list)

Hello all,

As the maintainer of the EFI subsystem in Linux, I am one of the
people that have to deal with the impact that code refactoring for
current platforms has on legacy use of such code, in this particular
case, the use of shared EFI code in the Itanium Linux port.

I am sending this message to gauge the remaining interest in ia64
support across the OS/distro landscape, and whether people feel that
the effort required to keep it alive is worth it or not.

As a maintainer, I feel uncomfortable asking contributors to build
test their changes for Itanium, and boot testing is infeasible for
most, even if some people are volunteering access to infrastructure
for this purpose. In general, hacking on kernels or bootloaders (which
is where the EFI pieces live) is tricky using remote access.

The bottom line is that, while I know of at least 2 people (on cc)
that test stuff on itanium, and package software for it, I don't think
there are any actual users remaining, and so it is doubtful whether it
is justified to ask people to spend time and effort on this.

And for GRUB in particular (which is what triggered this message), it
is unclear to me why any machines still running would not be better
served by sticking with their current bootloader build, rather than
upgrading to a new build with a refactored EFI layer where the best
case scenario is that it boots the kernel in exactly the same way,
while there is a substantial risk of regressions.

For the Linux kernel itself, the situation is quite similar. There is
a non-zero effort involved in keeping things working, and if anyone
still needs to run their programs on Itanium, it is not clear to me
why that would require a recent version of the OS.

So bottom line: I am proposing we drop support for Itanium across the
board. Would anyone have any problems with that?

Kind regards,
Ard.
