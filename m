Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 351537135D8
	for <lists+linux-ia64@lfdr.de>; Sat, 27 May 2023 19:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjE0RIp (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 27 May 2023 13:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjE0RIp (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 27 May 2023 13:08:45 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC42BBB
        for <linux-ia64@vger.kernel.org>; Sat, 27 May 2023 10:08:43 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-514924ca903so697755a12.2
        for <linux-ia64@vger.kernel.org>; Sat, 27 May 2023 10:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1685207322; x=1687799322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atVGO+XtPagaU9l7tFVTsPSH9ByZiyTqVK+yq7BkoQs=;
        b=MHOTDskb9PYErjcfU5gV5Zhcdg4pTOF883/JVLnNy/UIhI2kFM6d3ZG2XWoPiCWaqN
         54P7IZRH31PA31g8bu0tJMFkapnZp3430jEvUr1nvzCDj2yF4o2WNLWzabFbTe2iz5el
         viUCV9q5T2xhyLtuDUhoaRTpM8ApJ8B7+Gbzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685207322; x=1687799322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atVGO+XtPagaU9l7tFVTsPSH9ByZiyTqVK+yq7BkoQs=;
        b=N0qSY3qBHp16+5fHB5mHoLIbfTGBqa098O9V2dGNZKv0wSs8sXGjVlsnYxkzQXGlAF
         LYmXupmVWOYANbi02+YoTCThekMpzxiIikJsQPEFdKzTpnTnuQ4RS7Bkb/MU/WR4k/oA
         cDsIrPmpj/I/JzspZUHQMUB5GtIYk1VqxHPbLgjwCKa/BbfHYPQniP/gBR2pIbeCXLS5
         pqGreu63+7jbD+W7lZSyz4afwG0AtpBNmAD9kTjJY18HopJabhxkA9dD+NZoxE89jkDi
         +9sYJr5imxhreCGiZ51TAlUnuihG5/UZ1r/z39orOaZQOmUH3RKvWWm1pTHDmp/lGI1S
         diuw==
X-Gm-Message-State: AC+VfDxcZofalg7kzlfuL3AV825lYscOhvNk4Ni3Z/+4yN6Wr/S3FQ8z
        6HJQ+OikAObkV3KlibagOB+ylH69jQ+VhvQzLxbKVI1v
X-Google-Smtp-Source: ACHHUZ5e+IcmIqavG+UBm3ydVp/As0LJYEaFaEFSjXn6t4R7JKPCGZIvQjbEkFvH3dzlw+Gf5twp9A==
X-Received: by 2002:a17:907:d8c:b0:973:d863:f651 with SMTP id go12-20020a1709070d8c00b00973d863f651mr3607240ejc.44.1685207322191;
        Sat, 27 May 2023 10:08:42 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a170906244600b00965b416585bsm3602702ejb.118.2023.05.27.10.08.41
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 10:08:41 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-969f90d71d4so261781566b.3
        for <linux-ia64@vger.kernel.org>; Sat, 27 May 2023 10:08:41 -0700 (PDT)
X-Received: by 2002:a17:906:fd8d:b0:96f:4927:7a96 with SMTP id
 xa13-20020a170906fd8d00b0096f49277a96mr4773384ejb.70.1685207320929; Sat, 27
 May 2023 10:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de> <ZHErssbUSbSznTVA@bombadil.infradead.org>
 <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com> <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de>
In-Reply-To: <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 27 May 2023 10:08:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
Message-ID: <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
Subject: Re: Boot regression in Linux v6.4-rc3
To:     Frank Scheiner <frank.scheiner@web.de>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
        linux-ia64@vger.kernel.org, song@kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Sat, May 27, 2023 at 12:01=E2=80=AFAM Frank Scheiner <frank.scheiner@web=
.de> wrote:
>
> If it is of any help, my initial report is available for example via:
>
> https://marc.info/?l=3Dlinux-ia64&m=3D168509859125505&w=3D2
>
> ...the whole thread is currently at:
>
> https://marc.info/?t=3D168509868200003&r=3D1&w=3D2

This does make it clear just how great a mailing list archive lore is.
Konstantin, is there any particular reason why
linux-ia64@vger.kernel.org isn't in lore? Is it just a rational hatred
of all things itanium?

Anyway, the WARN_ON() is likely related, but the bug is clearly an
unexpected page fault in __copy_user() when called by load_module().

The ia64 oops output is nasty, presumably because ia64 aggressively
inlines things. It would help a lot if you enabled debug info (maybe
you already do?) and then run the oops through
./scripts/decode_stacktrace.sh which will figure out line numbers,
inlining etc.

Because I don't even see why it would call __copy_user() in the first
place. This is 'finit_module()' that loads the module data from a
file, not user space.

So I guess it must be the strndup_user() in

        mod->args =3D strndup_user(uargs, ~0UL >> 1);

but that doesn't look like it should even care about any module
layout. Plus I would have expected to see strndup_user() in the call
trace, but whatever.

End result: that ia64 trace is very hard to read, and _maybe_ running
it through the decode script might give more information about what it
is that triggers...

             Linus
