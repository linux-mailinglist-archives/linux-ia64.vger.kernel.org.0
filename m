Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAAED7132CF
	for <lists+linux-ia64@lfdr.de>; Sat, 27 May 2023 08:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjE0G0f (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 27 May 2023 02:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjE0G0e (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 27 May 2023 02:26:34 -0400
Received: from mout.web.de (mout.web.de [212.227.15.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE080EC
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 23:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1685168767; i=frank.scheiner@web.de;
        bh=knC6k8ksVHsGQOBE/sCT3ZvuznYeg1t5P3Ticwr784M=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Ykm8M9uvMEogKoswGGEcv05/qq0SeRjQh8f8ZzTYjsznbZviHx72N4yLqtdR7Ci9Q
         GgrmplxrHWVqJOGh7f9MPhPEuU/bDVVncaoIZuW34M6fULdXmF0/1x/ElZlQQuinnu
         25PObsMTaVqNxtuNR3GCNdn9os1IXwMsNHNiMO9dz6UVDeNFi+hgGdtIg0td5Fv3zj
         jSP8gpsF0AZ5oHP9Khvuqs6NZgNFgq10sIeH/vAHfl88VgPkS1OK+uYrZDzVh9Javc
         DOmzRcwWqemxoPriFc1sbvX2VO5Hss93Kw3jm0XKpFR7EdtaHEXmnxXTwtuJgGOydG
         kjmueEkDUx6ig==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([217.247.45.222]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N4N98-1qD8yu3S2I-011Ux6; Sat, 27
 May 2023 08:26:06 +0200
Message-ID: <0be2c4e1-1fcb-ca84-4c12-d8ecf17b77e6@web.de>
Date:   Sat, 27 May 2023 08:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Boot regression in Linux v6.4-rc3
Content-Language: en-US
To:     Song Liu <song@kernel.org>
Cc:     linux-ia64@vger.kernel.org, mcgrof@kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
 <CAPhsuW7phunDnFo8RmqvdZ+fOQmexxhaGdeA086xsOpez65izw@mail.gmail.com>
 <77175d92-e0fa-d197-07c3-2749dfec79ce@web.de>
 <CAPhsuW5pwKe-hPKSyrcnF16Z6KTSYk8mSULcQbDBuvzEb6wneQ@mail.gmail.com>
From:   Frank Scheiner <frank.scheiner@web.de>
In-Reply-To: <CAPhsuW5pwKe-hPKSyrcnF16Z6KTSYk8mSULcQbDBuvzEb6wneQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ngD49CmeS7T8l8AuO6ro7oYV3cKj1MZM4SycX61J5bdAz502dFF
 3wUcuUkqXAf5IV/iHADlTIustT+lY+wG+uXjRIyjWHKC0xHQKwRLCJmUEQGGWZNjmBjWk1b
 EbKGi7Z9TZl4SgNEzf1HbmmpCYju8s7zb9sJ2i/ygopwCl6Zwkd9oVnEYzqclSH2d9+GFBr
 K/udz35+y/v3WVvIvgA3w==
UI-OutboundReport: notjunk:1;M01:P0:JMd347n5bnk=;v3e12BEfVngIBN2AVs8Gy+sSgxL
 EO9iVrrcT+LshhRs/vqIQFthBrVkz+VADaaPGMJ4h2ud16ziDdXpYY2I9NOpMdP1VpqKwrVib
 znKdiHUsGf6jsWAV/zAh7fZLWFPWNA3UsDB9ReqJAx5jHjW4baEzPACsLX8a2pP7bYn5XvFXK
 8o7o/VslGjjOxlqTQJmibzcD13/O2reb+Xuf32iATD2+y93AZA1q1ErZm1/IcbIpBum/uvhT7
 rDvVuy+elGAcE3ftwag2p/vV2NJ+e4tQcQAphY66u/1Fev4HKd26BzW5I65uxEs+PIREu+B8N
 mt/ZWafNNcohodSJLu8dplunimCje2NLm7WftLCITW/Q8dRZ7Y6+7xpaM4wj+mh8EULdl0bN3
 EZCYq1cGkTQbb3MQ+L8/09MPhbw0upUmjRx7lx5Zd1+kHRvs/iDovbxGcfTl8Cn86Spdf7XdZ
 lw0fLmUPKhy925w9UYBgXaa3XQkcE5JbKNxAhYn5Qh6t0mFEW/YCuMLmXh84nmCxbuQykJvsf
 /krSPailzASYDyySBuEwTFc+0sV/w4c/+YgLJVwis3CjkUPK+xxDclN7amWHsgWInpTZrrH7j
 snRQEms6K8h/ysaO8NkZ0pXSIzi/BZ48PfUTfFSiKT1SnAG6HdJWXN7mNWwosOjHAbasGX8LP
 5at7iWBUJHShmhxDgaweSdGSj1qWF4PVr6849ROpuz8d7aq1se2MUqef4uzMn0GdxUre+dwyl
 ISp9jSiLgZ6wRjfPVsM+uT4zim9jJ5lKqbm/Nmaco71VzfnqbGm9P5TgtW5Rli+9xYoYKXDv8
 6qKz3b3HpGcDB3BKcaQS1qO8cRyr9fOWlSQEskE0sIoxwxzmZSN+9ehURfox83/xyor5/A1Wh
 199drmQk3K1GQLyc7PEvcuPJPDzr/jHFPQbYcOcgXHQweguiqBhh/CZv9z1OdCYXtZQeEtDEZ
 Y9+1pGlCGA1h6y5OzYBlpvePFvc=
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

On 26.05.23 23:01, Song Liu wrote:
> Thanks for running the test.

Thanks for staying with me.

> I am not very familiar with the code, but I think we shouldn't hit that
> WARN_ON_ONCE. Could you please try with the follow patch to see
> which section caused this issue?
>
> Thanks,
> Song
>
> diff --git i/kernel/module/main.c w/kernel/module/main.c
> index 0f9183f1ca9f..caf3d30cd133 100644
> --- i/kernel/module/main.c
> +++ w/kernel/module/main.c
> @@ -1537,8 +1537,11 @@ static void __layout_sections(struct module
> *mod, struct load_info *info, bool i
>                              || is_init !=3D module_init_layout_section(=
sname))
>                                  continue;
>
> -                       if (WARN_ON_ONCE(type =3D=3D MOD_INVALID))
> +                       if (WARN_ON_ONCE(type =3D=3D MOD_INVALID)) {
> +                               pr_warn("%s: section %s (sh_flags
> %llx) matched to MOD_INVALID\n", __func__,
> +                                       sname, s->sh_flags);
>                                  continue;
> +                       }
>
>                          s->sh_entsize =3D
> module_get_offset_and_type(mod, type, s, i);
>                          pr_debug("\t%s\n", sname);

I put that as -patch3 on top of 6.4-rc3, the result is on [1].

[1]: https://pastebin.com/KqnWL2pM

I this time put the whole console messages there, just in case some of
the earlier messages could be of any help. To jump to the actual oopses,
search for "Loading, please wait...".

Cheers,
Frank
