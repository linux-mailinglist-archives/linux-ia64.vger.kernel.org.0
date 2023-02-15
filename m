Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83F9B69848D
	for <lists+linux-ia64@lfdr.de>; Wed, 15 Feb 2023 20:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBOTbN (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 15 Feb 2023 14:31:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjBOTbM (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 15 Feb 2023 14:31:12 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68AD3C292
        for <linux-ia64@vger.kernel.org>; Wed, 15 Feb 2023 11:31:10 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id n20so9997118edy.0
        for <linux-ia64@vger.kernel.org>; Wed, 15 Feb 2023 11:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RED9+vAJdW3sKqtHeyKyIn11vo3x09LmIinPSfGfkd0=;
        b=MoQe7iVa3MT5PDdVl/QDU0kTTLca4GFekIkTiTQ02LvSSx5UnCUFroMNyhzDT2vzH/
         uw2jdnoctQ1jc2aut0ty7G6s2izwMb9t/kgqyDBge39MaCtw9m6s1fwN6quFCL6DkM8s
         0jF5t3yNSunFrfCUAHvHrDmjKDiRsSSvdcJN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RED9+vAJdW3sKqtHeyKyIn11vo3x09LmIinPSfGfkd0=;
        b=It+ttmdRP8DDkbJruoRiHdttYpRHEYau/44uzKyhBeZQ82BeWqga9LYIlDmLWMJp0o
         7dg7Tru99l0uvmxpZNdVyxJFPXTWRPyV2Q39IA3ZhAWfL8dZQlANV4YkTBKC5zteKwTe
         OrzZSEMA/6+8b+RhRlQshgYegkDD6A+Ez/2qX9rm99ogkIcLjWsBEN0UucEua62LMsCv
         ZmZfZAZ9JL5HihN6RpRPhD+pZCg1i0T+EwvbmBQDrXWnBIaQo+aqlvWD1pwwPsejZHFw
         TIPGLfIIf5NIUc3h9ZlwMGP+jjaQ8hLHNTSECWsv97PLVgYFhZRpJHKOWdxWoDawgWHF
         crcg==
X-Gm-Message-State: AO0yUKVTuHwZFtE+SQZfzjI3Cu0SWL8ctQ9Le/lEpFHpe6lkht97HGsm
        1ZWdQ8kz9xptSPk+bCPVbHkLb1L9U1Wp+BRhPH0=
X-Google-Smtp-Source: AK7set+p4MgAl7aEsRpcFONy04dWX2OgomTqfm0dR0i06o/+iv67HWLxqhu2qOEo7CkYr82nnf3i4w==
X-Received: by 2002:a17:906:7312:b0:8b1:3422:ddb6 with SMTP id di18-20020a170906731200b008b13422ddb6mr4445513ejc.69.1676489468934;
        Wed, 15 Feb 2023 11:31:08 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id z22-20020a17090655d600b00871f66bf354sm9963985ejp.204.2023.02.15.11.31.07
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 11:31:08 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id bt8so19171912edb.12
        for <linux-ia64@vger.kernel.org>; Wed, 15 Feb 2023 11:31:07 -0800 (PST)
X-Received: by 2002:a17:907:cc12:b0:88f:a9ec:dfd7 with SMTP id
 uo18-20020a170907cc1200b0088fa9ecdfd7mr1591050ejc.0.1676489467608; Wed, 15
 Feb 2023 11:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20230215100008.2565237-1-ardb@kernel.org> <534469b750e1847e1645f9ae5ed19dcc80b82be6.camel@physik.fu-berlin.de>
In-Reply-To: <534469b750e1847e1645f9ae5ed19dcc80b82be6.camel@physik.fu-berlin.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 15 Feb 2023 11:30:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjEmZ19T4XpVb0_Hacm53xJG_w5ygcuorwC0xBoT-myUA@mail.gmail.com>
Message-ID: <CAHk-=wjEmZ19T4XpVb0_Hacm53xJG_w5ygcuorwC0xBoT-myUA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Retire IA64/Itanium support
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Tony Luck <tony.luck@intel.com>,
        Jessica Clarke <jrtc27@jrtc27.com>,
        Matthew Wilcox <willy@infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-ia64@vger.kernel.org
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

On Wed, Feb 15, 2023 at 2:17 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> It's not that I don't care. I just haven't been able to bisect the bug .yet

I'm not a fan of ia64 as an architecture, but it's a bit sad to remove
it entirely. It's not like it's been a huge maintenance burden in
general.

That said, if it doesn't work, and nobody has the time and/or
inclination to figure out why, I don't really see any alternative.

             Linus
