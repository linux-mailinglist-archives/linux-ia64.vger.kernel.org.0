Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46A369853E
	for <lists+linux-ia64@lfdr.de>; Wed, 15 Feb 2023 21:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjBOUIu (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 15 Feb 2023 15:08:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBOUIt (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 15 Feb 2023 15:08:49 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFBF1A4A1
        for <linux-ia64@vger.kernel.org>; Wed, 15 Feb 2023 12:08:48 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id t16so2555064edd.10
        for <linux-ia64@vger.kernel.org>; Wed, 15 Feb 2023 12:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sX8eBY3r/AKljtkiUqNTMEw6Hfvd61xzSRLPDUIPd9Q=;
        b=b3zaR1eXoCYn5Ncbvddo3VOGAogqKZWNMAaERJ6GTd/LN/ybHkxlYqOqMBj+FLCC/g
         AHBOnjbV+wnvXKbg5stV7lRWcsYYG8w+F/+Nb61gju1iBIq88cQzgKSw8Ekgog29Rfqf
         hQ0yBjOU03BCb8f3qoHoTNLVeAnc0rGw9nBzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sX8eBY3r/AKljtkiUqNTMEw6Hfvd61xzSRLPDUIPd9Q=;
        b=Co4KNODOkvqxiTNAXjjjxoczc5HfrrIk+OzKA+O6kq7fjpnK+iD9zvwzw6PIJbqy/B
         /hzKfW6lNYvE47DHwfH/qQasDLEy58aeoVsUo1szAFvAW39t64ydPDoo7N/RQL7OxCBu
         jvWIoMQL5hEA5gQ2WcEhq7ABbPzHStD9osT68j2RZ5YsgjiXjpC9BS9nDO1/jwoEgNpQ
         Lht/CuWr+voa5LULp4w+bHPFqrkUnKmpckUTqeJUlZye11saQVs/6qQCnP6Zsh5/uLkZ
         LmAd/tIpcFAgpBhPdfAcAqcDGPHTbXNxXKxjZm3mES6Q8HunLUZo3VR/cOh0hOaV7h6V
         smbg==
X-Gm-Message-State: AO0yUKXvfcfWJnk9L4vgkpll2MPClTqZ2gZc7emL6Yhd2kk9XUTo/nLO
        GUutpfEdSBw77ol12k4/ou5CN185pklztCOHLKs=
X-Google-Smtp-Source: AK7set+lNF5LgW3yZoVKczOzLK629xxN1sFTijGzTL7D4oL8FSwrnBLkfONVxgAFSxuNNjFNdI3EKg==
X-Received: by 2002:a17:906:80d3:b0:886:50d:be8d with SMTP id a19-20020a17090680d300b00886050dbe8dmr3860541ejx.13.1676491726619;
        Wed, 15 Feb 2023 12:08:46 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id k16-20020a170906681000b0087223b8d6efsm10189268ejr.16.2023.02.15.12.08.45
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 12:08:46 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id dz21so13358759edb.13
        for <linux-ia64@vger.kernel.org>; Wed, 15 Feb 2023 12:08:45 -0800 (PST)
X-Received: by 2002:a50:d5de:0:b0:4ac:b616:4ba9 with SMTP id
 g30-20020a50d5de000000b004acb6164ba9mr1810449edj.5.1676491725489; Wed, 15 Feb
 2023 12:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20230215100008.2565237-1-ardb@kernel.org> <534469b750e1847e1645f9ae5ed19dcc80b82be6.camel@physik.fu-berlin.de>
 <CAHk-=wjEmZ19T4XpVb0_Hacm53xJG_w5ygcuorwC0xBoT-myUA@mail.gmail.com> <SJ1PR11MB6083F7F30FE9ED8F39FA1F85FCA39@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083F7F30FE9ED8F39FA1F85FCA39@SJ1PR11MB6083.namprd11.prod.outlook.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 15 Feb 2023 12:08:28 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9RkLN+GpYcFmsd8tze6zYL7MMkNpvdKbETQnqYm+Hwg@mail.gmail.com>
Message-ID: <CAHk-=wj9RkLN+GpYcFmsd8tze6zYL7MMkNpvdKbETQnqYm+Hwg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Retire IA64/Itanium support
To:     "Luck, Tony" <tony.luck@intel.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Jessica Clarke <jrtc27@jrtc27.com>,
        Matthew Wilcox <willy@infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, Feb 15, 2023 at 11:43 AM Luck, Tony <tony.luck@intel.com> wrote:
>
> Maybe you don't see others pain?  I added Al Viro ... perhaps
> he'll replay some of his thoughts from trying to make signals
> and other stuff work correctly on ia64.

Well, as long as it's ia64-specific, I'll just go "hey, it was Al's
choice to look at that code".

IOW, I'm more worried about "ia64 makes it a pain to make _generic_ changes".

IOW, doing something like this:

    git log -p --no-merges --since=1.year arch/ia64/

to see what kind of pain ia64 parts of patches have caused, about a
third of them are that "look, somebody cared about ia64 explicitly".

And then the rest are trivial fixups for generic changes that aren't
any different from any other architecture. The only half-way
complicated one is the SET_FS removal, and I don't think it was any
worse than most other architectures.

IOW, it doesn't look like ia64 causes any huge issues _per_se_. I
suspect alpha continues to be more of a pain.

That said, it's entirely possible I've missed some particular painpoint.

But when it's actively known to be broken and nobody has time or
interest to look at it, at that point the "it doesn't look any more
painful than other architectures" becomes kind of moot.

                  Linus
