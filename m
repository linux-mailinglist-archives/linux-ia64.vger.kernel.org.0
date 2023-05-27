Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98AC871361A
	for <lists+linux-ia64@lfdr.de>; Sat, 27 May 2023 20:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjE0Sfi (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 27 May 2023 14:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjE0Sfh (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 27 May 2023 14:35:37 -0400
Received: from mout.web.de (mout.web.de [212.227.15.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16275D2
        for <linux-ia64@vger.kernel.org>; Sat, 27 May 2023 11:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1685212492; i=frank.scheiner@web.de;
        bh=d0HjeZdipUcEHREeLBu4iFZZeaRWqxMbToAzYFYNx5c=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=HvbyLaOLi+4q1i7zMoIcEZQW6BcCsAld4a1Ogd03tJfNEl8wCANyLzsAEVf/3mJsw
         Ls4BsnI2CWfYg3qmq3fonZ569D7hxv2C7N0nGxGpPVc8saHKhTr5deBdjntl5c3Nso
         YAqFRbHm5H2CcdJW//2eEy9jqvIXW9ZunVdWtyWwbwNdSEwVPLBrvMBfvHw20M8Xod
         oGXtLFceiVvadYnHQB80vHmokZYI6qfbszAjE7ZNii6DQ/rksIGKZvJeVzNmDq4a5j
         S5MBGPlZ9Imn6CLRZvIIX7aO9PZ5wK+OieBZDFrszWI33hkR9xwtWti7MtZY17Zjy7
         RyMEkpOripnHA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([217.247.45.222]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQxs3-1phkZn1muF-00O1Cu; Sat, 27
 May 2023 20:34:52 +0200
Message-ID: <b2b47c19-d527-fbd2-1666-801f173b6174@web.de>
Date:   Sat, 27 May 2023 20:34:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Boot regression in Linux v6.4-rc3
Content-Language: en-US
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
        linux-ia64@vger.kernel.org, song@kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
 <ZHErssbUSbSznTVA@bombadil.infradead.org>
 <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
 <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de>
 <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
From:   Frank Scheiner <frank.scheiner@web.de>
In-Reply-To: <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RmZ59izoPV4AEOKkZw+Q0NZWomJ/V9mjyXd3E+s6DtpUyIQOX/v
 UW5qdLONWQAlXcpmHM2h4GVVa5E+fuMbyXgImkqP5SOZQcVN830aIEfq+4X7dos83qqsC8L
 5oGIFYYB0U5bCMgCgPb75xKCp8Nq31SGUECyODmZRPZjbMqGKiH8NLX+x19+NseKSmz///p
 yOOqB806wtxuy88Iu4kQw==
UI-OutboundReport: notjunk:1;M01:P0:lDP7MOUlOTA=;TnhCn5p+Fe/illnk5UeEkJSmJ3C
 es0Y4BMREmMZvFPP+UX6svBm9lgKqAQlQSGKrI7v1D4fdYr9tqBddcYTm53Ee0bcWAbNc85cW
 ScdK40foUNSvPQgVjMEmxUvvBRDCVKyNwYJCp9QFNH4D2TWFgKlRE2BA7mlQzdOkK6IIgSz4J
 0+0yffiRn0TeM1byCNUUtssCxz2thXLfkpf34DpIfGWBGuZxeXmxJQ9vTtb48g3RB+IGS6rQO
 V3Mw5X8A3hAtnDepqXGv5PsVwphPQ7RmhQG//GpRiAqC85R4UxbIzpEIL++VrrTiGtlFmxs8s
 8vzAnF3nYCNOVSzhy+m/PhPV4jsWQq3xcx8TmRMSzjBz/cBbD0vQxiH/5sesWrWA0WkfRy4Z/
 OYDG9LvioeTB+VYQmg8jLGX6dXgT7n73WjAfIVikwIWiQ+j7+vv0lHVU57OV2ITtajNzuHYxl
 PPv0avmmny8S4gbeRjYuhfYZY54zjci6rGhIvCkIINchXElc9YkFyLKcyagwmrk2DfKuTBnk/
 jcucmtliW1OKghE2oZgWMTzF4TdYi1E08ehSRz+R06Le202+4phfG+9UliMs3kgmp2phq1Qdc
 1C4Bqs+klPqrjE+3aBnB3ONoucaPFFfM7sz59m2q6jJ37lGLvwwrWsDGR0v/gphqE269AKY49
 QYFwxEbyfMasvArgNotvGHH2FDkRZbcMPyrvNSajj1oOWD+th6M1E2kzEn7TFh2VAviCUWmKX
 kulpdx1N40V7fxrikUwfwXNySX8m69MMHQpGTl5iMS9BWBNMkAS4llL2/DATC0VGnzSqYlW13
 FjDmqa/PkEucGDt2G0wOkNAL/I61MT76jKWPie+UoC6G/PE5Fquk4gPD1KC1jfBiSve4dr7Jr
 K5w18kibv6Lmm33Xv5ZaV0UkTh4hAtF6xnXxPlfsGN8UavjyoxVJhpFO25KoFKGObDkcISLTh
 TjnV6A==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi,

On 27.05.23 19:08, Linus Torvalds wrote:
> Anyway, the WARN_ON() is likely related, but the bug is clearly an
> unexpected page fault in __copy_user() when called by load_module().
>
> The ia64 oops output is nasty, presumably because ia64 aggressively
> inlines things. It would help a lot if you enabled debug info (maybe
> you already do?)

I believe it is enabled - I have at least CONFIG_DEBUG_KERNEL=3Dy and
CONFIG_DEBUG_INFO=3Dy - my kernel config is on [1] for reference.

[1]: https://pastebin.com/HRQtZ9vb

> and then run the oops through
> ./scripts/decode_stacktrace.sh which will figure out line numbers,
> inlining etc.
>
> Because I don't even see why it would call __copy_user() in the first
> place. This is 'finit_module()' that loads the module data from a
> file, not user space.
>
> So I guess it must be the strndup_user() in
>
>          mod->args =3D strndup_user(uargs, ~0UL >> 1);
>
> but that doesn't look like it should even care about any module
> layout. Plus I would have expected to see strndup_user() in the call
> trace, but whatever.
>
> End result: that ia64 trace is very hard to read, and _maybe_ running
> it through the decode script might give more information about what it
> is that triggers...

Ok, I put the decoded console messages on [2].

[2]: https://pastebin.com/dLYMijfS

Cheers,
Frank
