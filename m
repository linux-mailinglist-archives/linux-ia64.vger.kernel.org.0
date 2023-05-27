Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0BDE713639
	for <lists+linux-ia64@lfdr.de>; Sat, 27 May 2023 21:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbjE0Ted (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 27 May 2023 15:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjE0Tec (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 27 May 2023 15:34:32 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60BB0D3
        for <linux-ia64@vger.kernel.org>; Sat, 27 May 2023 12:34:30 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-96fd3a658eeso274917866b.1
        for <linux-ia64@vger.kernel.org>; Sat, 27 May 2023 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1685216068; x=1687808068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jv93bshO6Eh7nHndeuly34Df0A8rAArgRg3XiyD86mA=;
        b=MiC0/LAKx6GyWl7frPDkTAT7yaJ7TPwcckppWJpmWrQdl9rx+pxPlQTQvUJZ6Zt6BG
         VDA57UVhFjhq0iFXTaqNs6ej3q0RjG+mo343KVlL/flLGsUzI6cafd6/lGRC4Q2MAcfu
         B+pUAVVOSieAkWPbAQyPdmjP+X4+1Dbu7WcL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685216068; x=1687808068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jv93bshO6Eh7nHndeuly34Df0A8rAArgRg3XiyD86mA=;
        b=IC+zHAFlE1EjFI6klqaCLIsEzhavNPJ6k/OkHTetzUfmwT/vEjGVDc/CQA6JDcKy+T
         H/hl2qJQc8xfyKVh5pDUqe9oi8gDubL++X+BEAPQSC+PnjcpNseu+mPdcC0sqJ479Tm8
         PPSLFoAY4doucKt9UmThMPtH5NUymSrySiNPCy62DlgZH+mbIMGaRmaP0Ijpoq+QMQvr
         scxSPqYM+V8mwUtOGGnf5vANrjfF5AS41CJEijKz936jCTFyxzBuq//FnABgAhCSx8EV
         QtkJFAYzFXvmEqnoXwOTLUYKtp4FSz+GqQQ3B5zSS/c74aAcdlqzgIf0eiJdbXB6GS7X
         5T0Q==
X-Gm-Message-State: AC+VfDzyZQPHouqOboJHj2CLG8UGMOJyxt5wNUP3JaqMVfd+masJM0Dy
        +SQJjFt4uMby7Xib9d2exmwtGhLtCu7MwBe4mvIBUuzX
X-Google-Smtp-Source: ACHHUZ6lgqpKAySaNmwFD2kKw1uaobeaOJgut02Bhsk/sZ/c5vOhOsciYCTc1dHhHINunHO5vW+aLw==
X-Received: by 2002:a17:907:3d89:b0:96a:9c44:86d9 with SMTP id he9-20020a1709073d8900b0096a9c4486d9mr6029114ejc.12.1685216068463;
        Sat, 27 May 2023 12:34:28 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id x15-20020a170906148f00b00969f13d886fsm3762023ejc.71.2023.05.27.12.34.27
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 12:34:27 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-514859f3ffbso1831192a12.1
        for <linux-ia64@vger.kernel.org>; Sat, 27 May 2023 12:34:27 -0700 (PDT)
X-Received: by 2002:a17:906:6a14:b0:962:582d:89d7 with SMTP id
 qw20-20020a1709066a1400b00962582d89d7mr6509564ejc.38.1685216067452; Sat, 27
 May 2023 12:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de> <ZHErssbUSbSznTVA@bombadil.infradead.org>
 <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
 <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de> <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
 <b2b47c19-d527-fbd2-1666-801f173b6174@web.de>
In-Reply-To: <b2b47c19-d527-fbd2-1666-801f173b6174@web.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 27 May 2023 12:34:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjDQZ8snU__Y8qJ8M5H--1FtAwNq-oHKmY4CJuomWPvDw@mail.gmail.com>
Message-ID: <CAHk-=wjDQZ8snU__Y8qJ8M5H--1FtAwNq-oHKmY4CJuomWPvDw@mail.gmail.com>
Subject: Re: Boot regression in Linux v6.4-rc3
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
        linux-ia64@vger.kernel.org, song@kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
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

On Sat, May 27, 2023 at 11:41=E2=80=AFAM Frank Scheiner <frank.scheiner@web=
.de> wrote:
>
> Ok, I put the decoded console messages on [2].
>
> [2]: https://pastebin.com/dLYMijfS

Ugh. Apparently ia64 decoding isn't great. But at least it gives
multiple line numbers:

   load_module (kernel/module/main.c:2291 kernel/module/main.c:2412
kernel/module/main.c:2868)

except your kernel obviously has those test-patches, so I still don't
know exactly where they are.

But it looks like it is in move_module(). Strange. I don't know how it
gets to "__copy_user" from there...

[ Looks at the ia64 code ]

Oh.

It turns out that it *says* __copy_user(), but the code is actually
shared with the regular memcpy() function, which does

  GLOBAL_ENTRY(memcpy)
        and     r28=3D0x7,in0
        and     r29=3D0x7,in1
        mov     f6=3Df0
        mov     retval=3Din0
        br.cond.sptk .common_code
        ;;

where that ".common_code" label is - surprise surprise - the common
copy code, and so when the oops reports that the problem happened in
__copy_user(), it actually is in this case just a normal memcpy.

Ok, so it's probably the

        memcpy(dest, (void *)shdr->sh_addr, shdr->sh_size);

in move_module() that takes a fault.  And looking at the registers,
the destination is in r17/r18, and your dump has

    unable to handle kernel paging request at virtual address 1000000000000=
000
    ...
    r17 : 0fffffffffffffff r18 : 1000000000000000

so it's almost certainly that 'dest' that is bad.

Which I guess shouldn't surprise anybody.

But that's where my knowledge of ia64 and the new module loader layout ends=
.

                Linus
