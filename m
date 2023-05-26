Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE0D9712FF5
	for <lists+linux-ia64@lfdr.de>; Sat, 27 May 2023 00:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243948AbjEZWWu (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 26 May 2023 18:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243360AbjEZWWt (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 26 May 2023 18:22:49 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68B310A
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 15:22:47 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-96fab30d1e1so278004266b.0
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 15:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1685139766; x=1687731766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0P88TtepTglwbFV8KCipet38sISwjQ7ABs82b/n72iE=;
        b=Gxh5AiyQx08MFOf3cXElcHKdAHbiIKRyS/EffUb9W4b0RJrjd9uYzQ0QF3+cwXEmhM
         2Ab/OiMIThU1tpxQ7FSj9yNJSiFaAViDEBaEVr1UNJsfokM+odrYDrldy+DF+F20YJ+D
         d/A6/BkLaJ35+u4d62a8QTUxMCPKmRkOzIFIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685139766; x=1687731766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0P88TtepTglwbFV8KCipet38sISwjQ7ABs82b/n72iE=;
        b=Wfmp2eeGXSxlPFvggdJz92cUvCBJTIQsjKCq77/0JuTm+Fws1s3uMSHDHnnjg6pmvM
         iNHuLDHpH+7Bco55Dt+NlX4a+2PN9rgtMu3bKYO/g6p4molbQPJwYVDGj/osC2Jb3hbk
         9RM2gJLKSe094bMN8v1Bq/wwEn1e4qNUNzebs2EpAJwbFaaEmsn+H8gCteqkPrp2Kdbn
         8H+dJVOMmMjw7W9QsGbMZ3aC5XEEuhzwitWV/gkjQ67oL37sb98tJqWnJTx3H77Wt8o7
         VNOkEEYxelHvqNdQ/uAQsbWszETfwKxRPOhwz5v59Gu4FSbuu3TTsPw2vpNak6jxQ5DA
         nSzQ==
X-Gm-Message-State: AC+VfDxOzPNaP+e7DS2L9vk5NUHLkr5zP3o9ajYL6buoJsQSe/r4WDHZ
        jDMsJmlhhVT6E3SIW/WxDHRMOvKSz83T6sjXdv/4yRaM
X-Google-Smtp-Source: ACHHUZ74LqEtGJFQdiFQzSAu/jGilYVYmGnWUVBAz/ObI4q1DD+mpuHsefjFyr+2tpLmoaYC3flhPA==
X-Received: by 2002:a17:907:60d6:b0:96f:a412:8b03 with SMTP id hv22-20020a17090760d600b0096fa4128b03mr353200ejc.5.1685139766194;
        Fri, 26 May 2023 15:22:46 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id va15-20020a17090711cf00b0094ee99eeb01sm2659315ejb.150.2023.05.26.15.22.45
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 15:22:45 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51456392cbbso2318467a12.0
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 15:22:45 -0700 (PDT)
X-Received: by 2002:a17:907:7b9b:b0:94f:2916:7d7 with SMTP id
 ne27-20020a1709077b9b00b0094f291607d7mr381213ejc.19.1685139764870; Fri, 26
 May 2023 15:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de> <ZHErssbUSbSznTVA@bombadil.infradead.org>
In-Reply-To: <ZHErssbUSbSznTVA@bombadil.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 26 May 2023 15:22:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
Message-ID: <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
Subject: Re: Boot regression in Linux v6.4-rc3
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Frank Scheiner <frank.scheiner@web.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>, linux-ia64@vger.kernel.org,
        song@kernel.org, debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Fri, May 26, 2023 at 2:59=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> Not saying that debugging commit ac3b4328392344 ("module: replace
> module_layout with module_memory") is going to be impossible, quite
> the contrary I think it would be good to root cause it, if possible,
> as perhaps it may also be similar to some other future oddball arch
> bug later that may come up.

I don't have any context - the mailing lists in question that
apparently this came in on aren't in lore.

That said, that commit looks odd for the ia64 part.

In particular, this part:

  -               if (mod->core_layout.size > MAX_LTOFF)
  +               struct module_memory *mod_mem;
  +
  +               mod_mem =3D &mod->mem[MOD_DATA];

in apply_relocate_add() (file: arch/ia64/kernel/module.c) seems suspect.

The previous place that used to look at "mod->core_layout.base"
converted that to "mod->mem[MOD_TEXT].base". As do other changes in
other architectures.

So that "MOD_DATA" looks *very* wrong.  Shouldn't core_layout. be
translated to use "MOD_TEXT" instead?

Nothing else in the ia64 parts strike me as odd, but that one looks wrong t=
o me.

But this is my "monkey see, monkey do" pattern matching reaction, not
from any deeper understanding of the problem (I can't even see the
report) or really even the code.

                   Linus
