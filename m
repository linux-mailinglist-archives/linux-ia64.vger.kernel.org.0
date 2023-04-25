Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5D26EE54C
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Apr 2023 18:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234705AbjDYQKt (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Apr 2023 12:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233838AbjDYQKr (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 25 Apr 2023 12:10:47 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5703E16190
        for <linux-ia64@vger.kernel.org>; Tue, 25 Apr 2023 09:10:34 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4ec94eb6dcaso6501133e87.3
        for <linux-ia64@vger.kernel.org>; Tue, 25 Apr 2023 09:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1682439032; x=1685031032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzBCWhkUry18zVOWXW5QyNYiFJMq+EJv8KjCsvLzxVI=;
        b=BTMOhNKncKkgEuXrkg4iVOUvlKOamBULDwD87gwAUY4uTD9Uj8fOtJ8gnRCGGD3Y1Y
         EtcCG/CbuQPtv6M80WfxId3IXWcwWs9h5Lw0T8BF7gXn5EhdGbVOPoy+A21e0y6npPOT
         fckBUd7/6mSyrUkCfa67U2Xyq6C+WOQMzpITU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682439032; x=1685031032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzBCWhkUry18zVOWXW5QyNYiFJMq+EJv8KjCsvLzxVI=;
        b=d1UgKlGZIxcdquy5xwFWOpc5v/04dXu+dnHUpkdPhsaDy96Eb4Kvpx8pw1aokSu8KT
         IRDOSlksdxWgluiO3t9YidRDraQ1uUIcAHCPlGNOgGLB/NKCs/hTwaf12++gINLORWXk
         3Oao24Tb+bHWAQyuAyUgdl8v5R1I8XfigIxvCGgp3CrnSb+uovuveoU6h+vmG8S1+5rA
         g/jy8BHz/K0j+jY6NjFn3cecjMmKHolAqGfQN7RaYKog73jMLgSShbRYHhlzoXq/H+js
         dELZMlSeCKpSyjV4q6SvFiPj93fP+yVQmQT4zNTtYBb4Q3uWCfuG7MX+LSsjAnTsnG6V
         W+Ww==
X-Gm-Message-State: AC+VfDzD8tafgztWemyONogqDu0axPRJKCYnik9OX2WTHGQ4UNd0Mfjj
        ZIFsESQIaOmCel4kqsnSxaL7cviMdfJ3syYErVyDIFJr
X-Google-Smtp-Source: ACHHUZ6Aoq+zLngz2+tTMBzuHyX2RRsL9Mv302KX3qs5ZlHjm/G2MJhgfHUqcP0xBbFSVsmYfBC9Hw==
X-Received: by 2002:ac2:5505:0:b0:4ef:f667:16aa with SMTP id j5-20020ac25505000000b004eff66716aamr1344944lfk.43.1682439032197;
        Tue, 25 Apr 2023 09:10:32 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 28-20020ac2485c000000b004ef82cd1c1dsm1795583lfy.107.2023.04.25.09.10.31
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 09:10:31 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4edcdfa8638so6493056e87.2
        for <linux-ia64@vger.kernel.org>; Tue, 25 Apr 2023 09:10:31 -0700 (PDT)
X-Received: by 2002:a05:6512:145:b0:4d7:44c9:9f4c with SMTP id
 m5-20020a056512014500b004d744c99f4cmr4233943lfo.4.1682439010843; Tue, 25 Apr
 2023 09:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230325060828.2662773-1-rppt@kernel.org> <20230325060828.2662773-3-rppt@kernel.org>
 <CAFxkdAr5C7ggZ+WdvDbsfmwuXujT_z_x3qcUnhnCn-WrAurvgA@mail.gmail.com>
 <ZCvQGJzdED+An8an@kernel.org> <CAFbkSA38eTA_iJ3ttBvQ8G4Rjj8qB12GxY7Z=qmZ8wm+0tZieA@mail.gmail.com>
 <ZDbp7LAHES3YFo30@arm.com> <20230418150557.ea8c87c96ec64c899c88ab08@linux-foundation.org>
In-Reply-To: <20230418150557.ea8c87c96ec64c899c88ab08@linux-foundation.org>
From:   Justin Forbes <jforbes@fedoraproject.org>
Date:   Tue, 25 Apr 2023 11:09:58 -0500
X-Gmail-Original-Message-ID: <CAFbkSA2hU+2V0i5OG0BBD-s3yNOAZwBmyGmxMLkbzoWZK6cxOQ@mail.gmail.com>
Message-ID: <CAFbkSA2hU+2V0i5OG0BBD-s3yNOAZwBmyGmxMLkbzoWZK6cxOQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] arm64: drop ranges in definition of ARCH_FORCE_MAX_ORDER
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "David S. Miller" <davem@davemloft.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Guo Ren <guoren@kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rich Felker <dalias@libc.org>,
        Russell King <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Zi Yan <ziy@nvidia.com>, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mm@kvack.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, Apr 18, 2023 at 5:22=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 12 Apr 2023 18:27:08 +0100 Catalin Marinas <catalin.marinas@arm.c=
om> wrote:
>
> > > It sounds nice in theory. In practice. EXPERT hides too much. When yo=
u
> > > flip expert, you expose over a 175ish new config options which are
> > > hidden behind EXPERT.  You don't have to know what you are doing just
> > > with the MAX_ORDER, but a whole bunch more as well.  If everyone were
> > > already running 10, this might be less of a problem. At least Fedora
> > > and RHEL are running 13 for 4K pages on aarch64. This was not some
> > > accidental choice, we had to carry a patch to even allow it for a
> > > while.  If this does go in as is, we will likely just carry a patch t=
o
> > > remove the "if EXPERT", but that is a bit of a disservice to users wh=
o
> > > might be trying to debug something else upstream, bisecting upstream
> > > kernels or testing a patch.  In those cases, people tend to use
> > > pristine upstream sources without distro patches to verify, and they
> > > tend to use their existing configs. With this change, their MAX_ORDER
> > > will drop to 10 from 13 silently.   That can look like a different
> > > issue enough to ruin a bisect or have them give bad feedback on a
> > > patch because it introduces a "regression" which is not a regression
> > > at all, but a config change they couldn't see.
> >
> > If we remove EXPERT (as prior to this patch), I'd rather keep the range=
s
> > and avoid having to explain to people why some random MAX_ORDER doesn't
> > build (keeping the range would also make sense for randconfig, not sure
> > we got to any conclusion there).
>
> Well this doesn't seem to have got anywhere.  I think I'll send the
> patchset into Linus for the next merge window as-is.  Please let's take
> a look at this Kconfig presentation issue during the following -rc
> cycle.

Well, I am very sorry to see this going in as is.  It will silently
change people building with oldconfig, and anyone not paying attention
will not notice until an issue is hit where "it worked before, and my
config hasn't changed".  If EXPERT is unset, there is no notification,
just a changed behavior.  While it would be easy for me to carry a
patch dropping the if EXPERT, it will not help any users building on
upstream with our configs, whether for their own regular use, or while
trying to debug other issues,  I expect it will result in a reasonable
amount of frustration from users trying to do the right thing and
bisect or test patches upstream.

Justin
