Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50FEC4BD6D9
	for <lists+linux-ia64@lfdr.de>; Mon, 21 Feb 2022 08:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346456AbiBUHmm (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 21 Feb 2022 02:42:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346458AbiBUHml (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 21 Feb 2022 02:42:41 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6287FCE6
        for <linux-ia64@vger.kernel.org>; Sun, 20 Feb 2022 23:42:18 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id ci24-20020a17090afc9800b001bc3071f921so2248684pjb.5
        for <linux-ia64@vger.kernel.org>; Sun, 20 Feb 2022 23:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=dLxIZoeQL5QeHlz0THvMUsIZQRWOGlgrKYRsHiIufA8=;
        b=AjM75lU/aJ1KzHzY1OS7/JQ/sF6o/a954sUrCH7fUe8N7WKDbLF0YdiJuqaRxLWcim
         HsldS2aEtNBpR5e1vpE3ApFGp4TIIpvOj1wYgmHqw55raD7mj6lrXiB0EaQqVkl/hkd3
         Wl0jhAwl/LTQRojnDaDsNCFX5x2JLCtvT8MGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=dLxIZoeQL5QeHlz0THvMUsIZQRWOGlgrKYRsHiIufA8=;
        b=tCJfzVP6RYFt4JevhiPjDk753PZJj41cy+h2ZUjpwOxpvTfAsTgs/nLq838I+Boa8P
         Mkx1cY//5GmmoO16tTsy5pZVctaOOInH2BvZWYJ05V+03z7PaqHpOb+MHrZH4EnxNw//
         8SiLIdkDPE9KFShAVBhgWH9+vrUPKz3nBtR2u2QgsX/NaNR6hprTSrLsG52zZLVTY5pf
         uMfvbS56K4CUBLVOvZAZaLeozkgATffBsRmbfG+LwiUnpbT7+4FQneJDe/ViIM9AIYuJ
         7fMhPRlRm6s+5llFRHbdRsXnuioYajAsM/bAS5geukLfJktgYbxj0nL8SAKrnVdJgrBx
         F1OA==
X-Gm-Message-State: AOAM532suv3CDWC4R2X1Eee538W+uywazps4BrrP6RHjp5tvQWsLna6p
        s1hZSLqMVT2r2cM4AwR2GYpszQ==
X-Google-Smtp-Source: ABdhPJw3sMUzvqOO9UfAnEOtXQLPiJFMTKPdJbS/nuB2oWposPJlERR9b9/rEuIUH27bdiXzpxACgg==
X-Received: by 2002:a17:90b:30cb:b0:1bb:fa5e:68a with SMTP id hi11-20020a17090b30cb00b001bbfa5e068amr9639855pjb.5.1645429337899;
        Sun, 20 Feb 2022 23:42:17 -0800 (PST)
Received: from ?IPv6:::1? ([2600:6c55:6300:7238:34b8:edf8:24ec:9845])
        by smtp.gmail.com with ESMTPSA id l17sm11871636pfu.61.2022.02.20.23.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Feb 2022 23:42:17 -0800 (PST)
Date:   Sun, 20 Feb 2022 23:42:13 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Thorsten Leemhuis <regressions@leemhuis.info>,
        Anthony Yznaga <anthony.yznaga@oracle.com>
CC:     matoro_bugzilla_kernel@matoro.tk,
        Andrew Morton <akpm@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        linux-ia64@vger.kernel.org,
        Linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: regression: Bug 215601 - gcc segv at startup on ia64
User-Agent: K-9 Mail for Android
In-Reply-To: <823f70be-7661-0195-7c97-65673dc7c12a@leemhuis.info>
References: <a3edd529-c42d-3b09-135c-7e98a15b150f@leemhuis.info> <823f70be-7661-0195-7c97-65673dc7c12a@leemhuis.info>
Message-ID: <03497313-A472-4152-BD28-41C35E4E824E@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org



On February 20, 2022 9:19:46 AM PST, Thorsten Leemhuis <regressions@leemhu=
is=2Einfo> wrote:
>[reply to get Anthony on board, I screwed up when copy and pasting his
>email address when sending below mail; sorry for the noise!]
>
>On 20=2E02=2E22 18:12, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker=2E
>>=20
>> I noticed a regression report in bugzilla=2Ekernel=2Eorg that afaics no=
body
>> acted upon since it was reported about a week ago, that's why I'm hereb=
y
>> forwarding it to the lists and the relevant people=2E To quote
>> https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D215601 :
>>=20
>>> On ia64, after 5f501d555653f8968011a1e65ebb121c8b43c144, the gcc
>>> binary crashes with SIGSEGV at startup (i=2Ee=2E, during ELF loading)=
=2E
>>> Only gcc exhibits the crash (including g++, etc), other toolchain
>>> components (such as ld, ldd, etc) do not, and neither does any other
>>> binary from what I can tell=2E  I also haven't observed the issue on
>>> any other architecture=2E
>>>
>>> Reverting this commit resolves the issue up to and including git tip,
>>> with no (visible) issues=2E
>>>
>>> Hardware:  HP Integrity rx2800 i2 Kernel config attached=2E
>>=20
>> Could somebody take a look into this? Or was this discussed somewhere
>> else already? Or even fixed?
>>=20
>> Anyway, to get this tracked:
>>=20
>> #regzbot introduced: 5f501d555653f8968011a1e65ebb121c8b43c144
>> #regzbot from: matoro <matoro_bugzilla_kernel@matoro=2Etk>
>> #regzbot title: gcc segv at startup on ia64
>> #regzbot link: https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D2156=
01

Does this fix it?

https://www=2Eozlabs=2Eorg/~akpm/mmotm/broken-out/elf-fix-overflow-in-tota=
l-mapping-size-calculation=2Epatch

-Kees


>>=20
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat=
)
>>=20
>> P=2ES=2E: As the Linux kernel's regression tracker I'm getting a lot of
>> reports on my table=2E I can only look briefly into most of them and la=
ck
>> knowledge about most of the areas they concern=2E I thus unfortunately
>> will sometimes get things wrong or miss something important=2E I hope
>> that's not the case here; if you think it is, don't hesitate to tell me
>> in a public reply, it's in everyone's interest to set the public record
>> straight=2E
>>=20

--=20
Kees Cook
