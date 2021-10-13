Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1294242B821
	for <lists+linux-ia64@lfdr.de>; Wed, 13 Oct 2021 08:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhJMHBH (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 13 Oct 2021 03:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbhJMHBG (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 13 Oct 2021 03:01:06 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595C8C061714
        for <linux-ia64@vger.kernel.org>; Tue, 12 Oct 2021 23:59:04 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 75so1426904pga.3
        for <linux-ia64@vger.kernel.org>; Tue, 12 Oct 2021 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ah8mNtDhQsWbV9KwnesQGFpsH5Aqgy4h8sZPRodsuTQ=;
        b=iYoXg2tr5uR+0Nm6/7bv2feTzNboP5MoWc+N3Mcwv2iDRVw0pFvhxWOd61gJnNH9su
         tIqFIxnUdQlKPtmJqrQ8BNteu39zfQaWMQasygpt32FcCdo7pqlDFdgKgPrXyx3AptwM
         zkZxhWFgsqIFBb3TLt1dhhopIbTg0apkRywBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ah8mNtDhQsWbV9KwnesQGFpsH5Aqgy4h8sZPRodsuTQ=;
        b=qsLT7TWgKBPU+9T0/k3BkFZ8UEfs3yakZZmrQgU87qRk/JYBaRVs7AVWr5G3rwMHzK
         dMDyPkYpBgLMzoEcB1tG62XXwrTTmYGHrflixf6zCu3JKODqgAj/52pwXaC85JIsnerT
         CBBFgbxyLABEgAIlHwb4lIi2dkcnfwgekSTIS/Vck6NJR5eINgsyh1fSLlM6R+lBf4q2
         Rou6dvCxHk5M0TYj19qhWZ0uaz+08Mh36QOIu13on1Wt5swBj0H8HN/iFWDVCSPjx8wK
         yeAnWhDG7hD7ZS2OIo8HoTVE2ZhDb3ODtVWNntZeW6Tv6y4pSDsvLgtuQoYGm6+jXzjN
         jFBA==
X-Gm-Message-State: AOAM532M+rNjUWMUbhDZfwEu9FYTxXYBz3wrjl2GiRQ3MkahfYDSwBLN
        tF1LyIs5B++vE13+6noaHp2Qwg==
X-Google-Smtp-Source: ABdhPJzillT6hQ4qfjxKjNb7ySoarsV30yXxp2Jky0yj9b4NY2jS3CPORXAf7y3D7ilwslclDlQbpA==
X-Received: by 2002:a62:188c:0:b0:44d:6660:212b with SMTP id 134-20020a62188c000000b0044d6660212bmr1056541pfy.8.1634108343817;
        Tue, 12 Oct 2021 23:59:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n21sm1086528pfv.115.2021.10.12.23.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 23:59:03 -0700 (PDT)
Date:   Tue, 12 Oct 2021 23:59:02 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v1 01/10] powerpc: Move 'struct ppc64_opd_entry' back
 into asm/elf.h
Message-ID: <202110122358.4AFDC0BC7@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <8ff3ec195d695033b652e9971fba2dc5528f7151.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ff3ec195d695033b652e9971fba2dc5528f7151.1633964380.git.christophe.leroy@csgroup.eu>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, Oct 11, 2021 at 05:25:28PM +0200, Christophe Leroy wrote:
> 'struct ppc64_opd_entry' doesn't belong to uapi/asm/elf.h
> 
> It was initially in module_64.c and commit 2d291e902791 ("Fix compile
> failure with non modular builds") moved it into asm/elf.h
> 
> But it was by mistake added outside of __KERNEL__ section,
> therefore commit c3617f72036c ("UAPI: (Scripted) Disintegrate
> arch/powerpc/include/asm") moved it to uapi/asm/elf.h
> 
> Move it back into asm/elf.h, this brings it back in line with
> IA64 and PARISC architectures.
> 
> Fixes: 2d291e902791 ("Fix compile failure with non modular builds")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I'd agree with Arnd: this is a reasonable cleanup and nothing should be
using it.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
