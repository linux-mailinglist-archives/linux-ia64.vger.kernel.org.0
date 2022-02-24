Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB374C22C2
	for <lists+linux-ia64@lfdr.de>; Thu, 24 Feb 2022 04:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiBXD73 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 23 Feb 2022 22:59:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbiBXD72 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 23 Feb 2022 22:59:28 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BC625D26F
        for <linux-ia64@vger.kernel.org>; Wed, 23 Feb 2022 19:59:00 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id s1so597359plg.12
        for <linux-ia64@vger.kernel.org>; Wed, 23 Feb 2022 19:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ipcMbOhFS/2FiJEFtsW19b67QSx/DKh4wGATjCAKrkY=;
        b=ZnawhkpDqU+rZlOg1P0cBGB0T65BAaTadLRW1leM/SrFFGbp0E9ZJ3/bJH3dhqPAcm
         pQpEqo/A7vpTuh9ApxtdE0+Q4YuYDWgqFar+s/Iao8+jjt3Uuz5ySEP3Sv8h8VmG/zcc
         1ARH9+FZTnmavgiFljrm2KxQ8Wy3OsIlx+FLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ipcMbOhFS/2FiJEFtsW19b67QSx/DKh4wGATjCAKrkY=;
        b=NbB4VesEnGC7rpWIZ2v7nIRkHzBPoiPHh6LtaOU/fLrhQ6yOJeZQWS42vNU7pc5EuP
         aKtvqAZhG680686ExFwn6ItRbqvci8dW0vwoOqNy9eli2hfteU8okx9mYAUYkJc3FPPt
         4UTwWfcL/Tg06PB95qTwofLg2elV4j7JnvJTWMXAsN2V6Fo2YUXUVxOwxxhubkzd5udb
         j+cCCpN51V23PAKjZ6GYKnomtG6Uy/uyMPQgfhMTG+MDdj9RGDwOSNZrumRUEixhSG55
         TeJh6vSXszi9OBDi0HsEEm30oIXSTqriq4SXjUR8dppKsXKbyTMnBXgI0Q0gapsZSanL
         +7/w==
X-Gm-Message-State: AOAM5327Kdze64a4BBuoVPTlFaP3bZAQ1CCVSYDJ+qmZ3YKg/Vv6XfEU
        uxUwMpI8cIZSy9umR9yhkv3XEw==
X-Google-Smtp-Source: ABdhPJzn1uMQcYSD5vqES/uqQG8fcX1txbzlrszEOeO34PcIjg+0QC/31asHtN0y0pT/5plGU0HyDA==
X-Received: by 2002:a17:902:f606:b0:14b:4c2d:e1fa with SMTP id n6-20020a170902f60600b0014b4c2de1famr889815plg.24.1645675139788;
        Wed, 23 Feb 2022 19:58:59 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z13sm1146016pfe.20.2022.02.23.19.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 19:58:59 -0800 (PST)
Date:   Wed, 23 Feb 2022 19:58:58 -0800
From:   Kees Cook <keescook@chromium.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Thorsten Leemhuis <regressions@leemhuis.info>,
        Anthony Yznaga <anthony.yznaga@oracle.com>,
        matoro_bugzilla_kernel@matoro.tk,
        Andrew Morton <akpm@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        linux-ia64@vger.kernel.org,
        Linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: regression: Bug 215601 - gcc segv at startup on ia64
Message-ID: <202202231957.801F1780@keescook>
References: <a3edd529-c42d-3b09-135c-7e98a15b150f@leemhuis.info>
 <823f70be-7661-0195-7c97-65673dc7c12a@leemhuis.info>
 <03497313-A472-4152-BD28-41C35E4E824E@chromium.org>
 <94c3be49-0262-c613-e5f5-49b536985dde@physik.fu-berlin.de>
 <9A1F30F8-3DE2-4075-B103-81D891773246@chromium.org>
 <4e42e754-d87e-5f6b-90db-39b4700ee0f1@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e42e754-d87e-5f6b-90db-39b4700ee0f1@physik.fu-berlin.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, Feb 21, 2022 at 10:57:01PM +0100, John Paul Adrian Glaubitz wrote:
> Hi Kees!
> 
> On 2/21/22 21:58, Kees Cook wrote:
> >> I have applied this patch on top of 038101e6b2cd5c55f888f85db42ea2ad3aecb4b6 and it doesn't
> >> fix the problem for me. Reverting 5f501d555653f8968011a1e65ebb121c8b43c144, however, fixes
> >> the problem.
> >>
> >> FWIW, this problem doesn't just affect GCC but systemd keeps segfaulting with this change as well.
> > 
> > Very weird! Can you attached either of those binaries to bugzilla (or a URL I can fetch it from)? I can try to figure out where it is going weird...
> 
> Here's the initrd of that particular machine:
> 
> > https://people.debian.org/~glaubitz/initrd.img-5.17.0-rc5+
> 
> You should be able to extract the binaries from this initrd image and the "mount" command,
> for example, should be one of the affected binaries.

I don't see anything immediately obvious here, but I'll keep looking. Is
there any way to emulate ia64? I don't see anything that'll work under
QEMU...

-- 
Kees Cook
