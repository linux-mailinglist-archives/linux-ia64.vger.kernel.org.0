Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0659F699C5A
	for <lists+linux-ia64@lfdr.de>; Thu, 16 Feb 2023 19:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjBPScU (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 16 Feb 2023 13:32:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjBPScT (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 16 Feb 2023 13:32:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5670C8A7D
        for <linux-ia64@vger.kernel.org>; Thu, 16 Feb 2023 10:32:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E736962068
        for <linux-ia64@vger.kernel.org>; Thu, 16 Feb 2023 18:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56034C433AA
        for <linux-ia64@vger.kernel.org>; Thu, 16 Feb 2023 18:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676572337;
        bh=RRWc7hUpmo0QqVQQg2kQWESY+7Co/0AwMfs0BGDonpo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hs+SZksw9mG0UnJ1rWiEY8EFXU7W9VR13ls4D9NcolcBD95fYlhovURrlxWbD/KnT
         DE1zaJBtbL3xLeev5PSrvZ/Dm+wbyZrZcSlngWlzqiCgJsUERrCc49iyngwEYLRMQs
         Tg+sVFGhxPfkkAVVKiQV+cD+9hawUmnqb2+MHHS8WlAp6b3jirlTH4sxoQV7SC1hX4
         tixC4ZKY3+0m5WL5TKx5dXJYH/HCbS+SdEhbpVVGNI/r9+YnK/UlcBS2oPG8UVvCPy
         6/yQZROOQOKlQsPcModXVj8gkbRR9VJ7PO/60zSVQ75m1+aysPP6+HHS3iu7smFYbR
         aK4xjXtZRNkLg==
Received: by mail-lf1-f47.google.com with SMTP id x40so3852811lfu.12
        for <linux-ia64@vger.kernel.org>; Thu, 16 Feb 2023 10:32:17 -0800 (PST)
X-Gm-Message-State: AO0yUKUH8njy6wKq1MTkfgDW8he+mXMooDjWmN85veQIOBjji4WPem4z
        f7yurGEmsAT/HbhSDQhOqmDobqBM/hgRwHHlQCA=
X-Google-Smtp-Source: AK7set+YTKj7//vGbBANCWF9JfWAqlBxuRr0U5PqS7NeX2TKtCpUgbkf831zyvZQA1cbsWi3MNxcp4YPWoEfMfHAhY8=
X-Received: by 2002:ac2:43b9:0:b0:4d8:62e5:4f66 with SMTP id
 t25-20020ac243b9000000b004d862e54f66mr1925348lfl.7.1676572335318; Thu, 16 Feb
 2023 10:32:15 -0800 (PST)
MIME-Version: 1.0
References: <CO1PR13MB48707CAD2AFD26D4B6D11321C8A09@CO1PR13MB4870.namprd13.prod.outlook.com>
In-Reply-To: <CO1PR13MB48707CAD2AFD26D4B6D11321C8A09@CO1PR13MB4870.namprd13.prod.outlook.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 16 Feb 2023 19:32:03 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG5ufjnZGX=i92REDTayrYEKu0uVCdMB5X5JkNfAX4peA@mail.gmail.com>
Message-ID: <CAMj1kXG5ufjnZGX=i92REDTayrYEKu0uVCdMB5X5JkNfAX4peA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Retire IA64/Itanium support
To:     Pedro Miguel Justo <pmsjt@texair.net>
Cc:     Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
        Tony Luck <tony.luck@intel.com>,
        Jessica Clarke <jrtc27@jrtc27.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Matthew Wilcox <willy@infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, 16 Feb 2023 at 18:43, Pedro Miguel Justo <pmsjt@texair.net> wrote:
>
> Hi Ard.
>
> John is not the "only remaining user". I also reported the problem. I am sorry I don't update the kernel every month. Yes there might have been more than 30 days between updates.
>

Thanks for the report.

Apologies if that sounded a bit callous but it does help get some
clarity regarding the ia64 situation. Essentially, we have a very
small number of downstream users but no dedicated developers or
maintainers. That is still not a great situation.

> I'd prefer if we don't remove the Itanium McKinley+ support but I'll understand if it must.
>

If you are invested in keeping Itanium alive, how much effort would
you be willing to spend yourself on testing and reviewing Itanium
changes?
