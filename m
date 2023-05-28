Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1DB7138FC
	for <lists+linux-ia64@lfdr.de>; Sun, 28 May 2023 12:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjE1KOY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ia64@lfdr.de>); Sun, 28 May 2023 06:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjE1KOX (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 28 May 2023 06:14:23 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8ABDBB
        for <linux-ia64@vger.kernel.org>; Sun, 28 May 2023 03:14:19 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1q3DPQ-0016lg-9x; Sun, 28 May 2023 12:13:56 +0200
Received: from dynamic-089-014-160-181.89.14.pool.telefonica.de ([89.14.160.181] helo=[192.168.1.11])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1q3DPQ-001Zxv-2e; Sun, 28 May 2023 12:13:56 +0200
Message-ID: <4820abf96ee975181edcc15d84b41c4aefad0d8e.camel@physik.fu-berlin.de>
Subject: Re: Boot regression in Linux v6.4-rc3
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Frank Scheiner <frank.scheiner@web.de>, Song Liu <song@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
        linux-ia64@vger.kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date:   Sun, 28 May 2023 12:13:50 +0200
In-Reply-To: <ea6bb10a-f830-1a9f-19b1-07269a073876@web.de>
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
         <ZHErssbUSbSznTVA@bombadil.infradead.org>
         <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
         <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de>
         <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
         <b2b47c19-d527-fbd2-1666-801f173b6174@web.de>
         <CAHk-=wjDQZ8snU__Y8qJ8M5H--1FtAwNq-oHKmY4CJuomWPvDw@mail.gmail.com>
         <CAPhsuW7Gcd7hkrD6RtBdJDMdVnaN8Bv_kVNdpyccUiuD-TqYDw@mail.gmail.com>
         <ea6bb10a-f830-1a9f-19b1-07269a073876@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 89.14.160.181
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi!

On Sun, 2023-05-28 at 09:30 +0200, Frank Scheiner wrote:
> > Frank, could you please give it a try?
> > 
> > Thanks,
> > Song
> > 
> > diff --git i/kernel/module/main.c w/kernel/module/main.c
> > index 0f9183f1ca9f..e4e723e1eb21 100644
> > --- i/kernel/module/main.c
> > +++ w/kernel/module/main.c
> > @@ -1514,14 +1514,14 @@ static void __layout_sections(struct module
> > *mod, struct load_info *info, bool i
> >                  MOD_RODATA,
> >                  MOD_RO_AFTER_INIT,
> >                  MOD_DATA,
> > -               MOD_INVALID,    /* This is needed to match the masks array */
> > +               MOD_DATA,
> >          };
> >          static const int init_m_to_mem_type[] = {
> >                  MOD_INIT_TEXT,
> >                  MOD_INIT_RODATA,
> >                  MOD_INVALID,
> >                  MOD_INIT_DATA,
> > -               MOD_INVALID,    /* This is needed to match the masks array */
> > +               MOD_INIT_DATA,
> >          };
> > 
> >          for (m = 0; m < ARRAY_SIZE(masks); ++m) {
> 
> Thanks, that patch (as -patch4 on top of v6.4-rc3) fixes the boot 
> regression for me on the rx2620:

Sounds good. Would be great to get this into 6.4 before release.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
