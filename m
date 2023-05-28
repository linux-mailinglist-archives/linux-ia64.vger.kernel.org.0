Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 149E57137CA
	for <lists+linux-ia64@lfdr.de>; Sun, 28 May 2023 07:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjE1FYn (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 28 May 2023 01:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjE1FYm (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 28 May 2023 01:24:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A45D8
        for <linux-ia64@vger.kernel.org>; Sat, 27 May 2023 22:24:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 139076140D
        for <linux-ia64@vger.kernel.org>; Sun, 28 May 2023 05:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7491CC433A7
        for <linux-ia64@vger.kernel.org>; Sun, 28 May 2023 05:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685251478;
        bh=6dXEQhVMzEiJ4pKhmR6DLgI8tKBGMpAsgSOvt2hI0Ik=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WC0TOFgnlpNc42Sd8VdhQRkLSD7vXtKm5Xoz1MBlj6msLZxqa9cU5jPMv3KcV3EqQ
         m3krHgr8/UClIdOXqVqpWUsSjnv/hUPZdM93DAtI05Jjt2kqTk+dDJIgbKxwcgio2h
         k97I1b1kIJdzb5Y7xSenR7zIMyReE0nDa88PBDxbS0mcG2bTpPTDwwNbcAsi4D1bGq
         FmaaBo5MpzinrJHbUnhnU2+QLDrXld8G74nJzl81omkmLrEyfiQ9ENnzlToq5dsFHD
         P/EK2WKfrD5bDSd3gd1K6q6figo/3X8ah1uro3jHkxPMRAhsq9+K7i0XDVXGnPJL7j
         TRE22Ub+C6wjA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f4e71a09a7so2261263e87.1
        for <linux-ia64@vger.kernel.org>; Sat, 27 May 2023 22:24:38 -0700 (PDT)
X-Gm-Message-State: AC+VfDzFSxI6c+PY4YmCZammOsIxUlpcyLDokkptrpfAUk8TjoF1i/sV
        iHtH/olKwH8Tkuak8XoVhUH1dBapAzqK1XImapY=
X-Google-Smtp-Source: ACHHUZ6SYJmFIEXRtd0tv/BpMiO34NSbLEe37AwxBBGEjDdcLru3NZiM55dszaUpmh2qM7GxiGHpeC5yWkF4OD8kh2w=
X-Received: by 2002:a05:6512:b88:b0:4f3:b324:ea8 with SMTP id
 b8-20020a0565120b8800b004f3b3240ea8mr1762267lfv.19.1685251476421; Sat, 27 May
 2023 22:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de> <ZHErssbUSbSznTVA@bombadil.infradead.org>
 <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
 <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de> <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
 <b2b47c19-d527-fbd2-1666-801f173b6174@web.de> <CAHk-=wjDQZ8snU__Y8qJ8M5H--1FtAwNq-oHKmY4CJuomWPvDw@mail.gmail.com>
In-Reply-To: <CAHk-=wjDQZ8snU__Y8qJ8M5H--1FtAwNq-oHKmY4CJuomWPvDw@mail.gmail.com>
From:   Song Liu <song@kernel.org>
Date:   Sat, 27 May 2023 22:24:24 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7Gcd7hkrD6RtBdJDMdVnaN8Bv_kVNdpyccUiuD-TqYDw@mail.gmail.com>
Message-ID: <CAPhsuW7Gcd7hkrD6RtBdJDMdVnaN8Bv_kVNdpyccUiuD-TqYDw@mail.gmail.com>
Subject: Re: Boot regression in Linux v6.4-rc3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Frank Scheiner <frank.scheiner@web.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>, linux-ia64@vger.kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Sat, May 27, 2023 at 12:34=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, May 27, 2023 at 11:41=E2=80=AFAM Frank Scheiner <frank.scheiner@w=
eb.de> wrote:
> >
> > Ok, I put the decoded console messages on [2].
> >
> > [2]: https://pastebin.com/dLYMijfS
>
> Ugh. Apparently ia64 decoding isn't great. But at least it gives
> multiple line numbers:
>
>    load_module (kernel/module/main.c:2291 kernel/module/main.c:2412
> kernel/module/main.c:2868)
>
> except your kernel obviously has those test-patches, so I still don't
> know exactly where they are.
>
> But it looks like it is in move_module(). Strange. I don't know how it
> gets to "__copy_user" from there...
>
> [ Looks at the ia64 code ]
>
> Oh.
>
> It turns out that it *says* __copy_user(), but the code is actually
> shared with the regular memcpy() function, which does
>
>   GLOBAL_ENTRY(memcpy)
>         and     r28=3D0x7,in0
>         and     r29=3D0x7,in1
>         mov     f6=3Df0
>         mov     retval=3Din0
>         br.cond.sptk .common_code
>         ;;
>
> where that ".common_code" label is - surprise surprise - the common
> copy code, and so when the oops reports that the problem happened in
> __copy_user(), it actually is in this case just a normal memcpy.
>
> Ok, so it's probably the
>
>         memcpy(dest, (void *)shdr->sh_addr, shdr->sh_size);
>
> in move_module() that takes a fault.  And looking at the registers,
> the destination is in r17/r18, and your dump has
>
>     unable to handle kernel paging request at virtual address 10000000000=
00000
>     ...
>     r17 : 0fffffffffffffff r18 : 1000000000000000
>
> so it's almost certainly that 'dest' that is bad.

Yeah, it appears we are writing to mod_mem[MOD_INVALID].

From the log, the following sections are assigned to MOD_INVALID:

[ 4.009109] __layout_sections: section .got (sh_flags 10000002)
matched to MOD_INVALID
[ 4.009109] __layout_sections: section .sdata (sh_flags 10000003)
matched to MOD_INVALID
[ 4.009109] __layout_sections: section .sbss (sh_flags 10000003)
matched to MOD_INVALID

AFAICT,  .got should go to rodata, while .sdata and .sbss should go
to (rw)data. However, reading the code before the module_memory
change, I think they were all copied to (rw)data, which is not ideal but
most likely OK.

To match the behavior before the module_memory change, I think
we need something like the following.

Frank, could you please give it a try?

Thanks,
Song

diff --git i/kernel/module/main.c w/kernel/module/main.c
index 0f9183f1ca9f..e4e723e1eb21 100644
--- i/kernel/module/main.c
+++ w/kernel/module/main.c
@@ -1514,14 +1514,14 @@ static void __layout_sections(struct module
*mod, struct load_info *info, bool i
                MOD_RODATA,
                MOD_RO_AFTER_INIT,
                MOD_DATA,
-               MOD_INVALID,    /* This is needed to match the masks array =
*/
+               MOD_DATA,
        };
        static const int init_m_to_mem_type[] =3D {
                MOD_INIT_TEXT,
                MOD_INIT_RODATA,
                MOD_INVALID,
                MOD_INIT_DATA,
-               MOD_INVALID,    /* This is needed to match the masks array =
*/
+               MOD_INIT_DATA,
        };

        for (m =3D 0; m < ARRAY_SIZE(masks); ++m) {
