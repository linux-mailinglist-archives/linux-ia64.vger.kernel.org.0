Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC304D3684
	for <lists+linux-ia64@lfdr.de>; Wed,  9 Mar 2022 18:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235484AbiCIQhI (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 9 Mar 2022 11:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236114AbiCIQez (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 9 Mar 2022 11:34:55 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CCBAB453
        for <linux-ia64@vger.kernel.org>; Wed,  9 Mar 2022 08:30:18 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id e6so2410216pgn.2
        for <linux-ia64@vger.kernel.org>; Wed, 09 Mar 2022 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OEKJ6HDfRbAYXq1y3GQ16S8ECnj8rGvJ1M6VsKHeWho=;
        b=oIHRdIQt5LoDmfPbY/G+bBH9o203m/KAHGz2i3DiFvY04vAFtOZbiV2VNw1Bco6aPR
         7KbjGoeqlwQ3COOJKgMqcvt6n0uAgO8pXJ9sECo3BMw6jNYxt57ENxj/F5kjvVMnCAXv
         jY2cx0MvlUyBrD5/D8cKaWx8Xmj0/ViDCRVWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OEKJ6HDfRbAYXq1y3GQ16S8ECnj8rGvJ1M6VsKHeWho=;
        b=Dc37fQAThbozkz1AqXMm7GZoxJR2Z3b5bcPhPjgPzQvZxQdt2q+yliI6rYCYtl6jkX
         NCfYL11UtTbp+tQNJwL22jqOHtpMh5LF/F16Trw1FChawHMMPCIBymqTyjVyjSfoajVS
         4RHFJGuoCoam05K37MEpa5oMraTDvOtzKsjwqq7auZG3/LeGJS6mNdtitvfAaO5qnjWC
         ja6EjE2ws/FVejUwIU7sDxW1UtmfiC1maO97hvTEY7ETUm1HIVEykF/PbZQO6ID5fhRE
         JP1DnuIxh1SZCH6vVryixWJIzcy1fxB9kMQYQu2gzgWyNI/Vwk3oYOcGrMhaVNPGCQfY
         HbNA==
X-Gm-Message-State: AOAM531aHcCmrc/XCTMJU5TaPz1D7/IYfp40wJYOcizZnL+/teVjV1hV
        ouIbjVjjOMUiTPfqfsU4D+55ow==
X-Google-Smtp-Source: ABdhPJysLOSUH1ejLQlt60xHSX+d3Bmy5LiPEBTc5BsVYUZY79bDZ5hXlYyKJbRu0bUDKCQC8AewHg==
X-Received: by 2002:a05:6a00:140b:b0:4e1:2cbd:30ba with SMTP id l11-20020a056a00140b00b004e12cbd30bamr340497pfu.46.1646843418232;
        Wed, 09 Mar 2022 08:30:18 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g28-20020a63111c000000b00374646abc42sm2841805pgl.36.2022.03.09.08.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 08:30:17 -0800 (PST)
Date:   Wed, 9 Mar 2022 08:30:17 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Michael Ellerman <patch-notifications@ellerman.id.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Helge Deller <deller@gmx.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
        linux-parisc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v4 00/13] Fix LKDTM for PPC64/IA64/PARISC v4
Message-ID: <202203090829.53A243306@keescook>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
 <164674125384.3322453.12551849351633372798.b4-ty@ellerman.id.au>
 <87r17bnbxx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r17bnbxx.fsf@mpe.ellerman.id.au>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, Mar 09, 2022 at 12:37:14PM +1100, Michael Ellerman wrote:
> Michael Ellerman <patch-notifications@ellerman.id.au> writes:
> > On Tue, 15 Feb 2022 13:40:55 +0100, Christophe Leroy wrote:
> >> PPC64/IA64/PARISC have function descriptors. LKDTM doesn't work
> >> on those three architectures because LKDTM messes up function
> >> descriptors with functions.
> >> 
> >> This series does some cleanup in the three architectures and
> >> refactors function descriptors so that it can then easily use it
> >> in a generic way in LKDTM.
> >> 
> >> [...]
> >
> > Applied to powerpc/next.
> 
> I also have it in an rc2-based topic branch if there are any merge
> conflicts that people want to resolve, I don't see any in linux-next at
> the moment though.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/func-desc-lkdtm

Thanks! I've got some core changes coming for lkdtm, but I'm waiting
until after the merge window to rebase them and get them into -next.

-- 
Kees Cook
