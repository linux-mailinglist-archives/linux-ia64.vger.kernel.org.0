Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A6E41C7A9
	for <lists+linux-ia64@lfdr.de>; Wed, 29 Sep 2021 17:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344920AbhI2PCO (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 29 Sep 2021 11:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344917AbhI2PCN (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 29 Sep 2021 11:02:13 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4104DC061764
        for <linux-ia64@vger.kernel.org>; Wed, 29 Sep 2021 08:00:32 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so3224646otj.2
        for <linux-ia64@vger.kernel.org>; Wed, 29 Sep 2021 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TyCjlk+pKET0YnhEJ9dBR7JvrBUso42NvxusqbVesPE=;
        b=ZRsAtTKKZkNWJDjgYxhe3J0JQ6O4p9PNnpilI5M/5ibU0Ns8JNWVFybSsX6EBzrksN
         R65R1h5hDzyJkWBSxO3Xxu/askCvW9MkdwMQeGoYWNAp/yRQTADpthmpMjax5IO0Q4WI
         ABtba/4i+sNFFRausiGclbZIeWVV4PF2DdELi3MG65Kq6dNP4mPUi67cxEZH2EnIRgh2
         3YDUFsI25i8zD+stDMZoSIPbe7zURBUfdxGb9UdP1TCeRUrIk9n+aGAbWLeeuzYU6cgv
         YlHzJlkMzt/yCDcFfWeOtRlteCpTbVMVzBTbhRhqYzLKNUw6qhAkjCl4deGNv2Zh0TQ0
         ZoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TyCjlk+pKET0YnhEJ9dBR7JvrBUso42NvxusqbVesPE=;
        b=Q/gLP2575jgY7T/xsWjRXVOJoecSq9ZOLtK6biSwfuagStZZPajYMlA1WXi5rWyb5i
         QL6m0mMOt0LS37d5P5Ir9rIUFfzTTjnIraMbezG0URqVxxBHAzgl0N2AFIhABkQYjMRn
         yODyw47qjpapCXL5aXxpxEuRO+cdYWiKGsiOhxhm0p2cBtuA57aSHqN1tNWz+d3nuJVm
         G13ITPtJm9vA1IC8SohboiG0NzScRA39cAyf9M6eD9URUXPhyIcURLUzfOSRGQvAUGT1
         dUbHEBvqYZ0RXp8GK4YRbP0KbfVd26tmUZmmQgSKLrTINtlt41mNC7YJfjq0xn1EjwDJ
         yuTg==
X-Gm-Message-State: AOAM530vyBcr+QqnweGbVab3wdCMrm8mQTKlXqw3561gA7PIoDtZX/cH
        Stk2MBgqabeBI9Vlsdq1cofWDg==
X-Google-Smtp-Source: ABdhPJxvnP/V+YuEnXmU9u5fhBlMx5mvuyCq8Z16F2mnD2G8Ku4DbjlhH8TBG8+ZLm2LdxATitXYnw==
X-Received: by 2002:a9d:3e54:: with SMTP id h20mr421968otg.236.1632927631577;
        Wed, 29 Sep 2021 08:00:31 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y83sm490275oia.47.2021.09.29.08.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 08:00:30 -0700 (PDT)
Date:   Wed, 29 Sep 2021 10:00:28 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        the arch/x86 maintainers <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
Message-ID: <YVR/jMv5HZj1hxmI@yoga>
References: <20210928075216.4193128-1-arnd@kernel.org>
 <20210928115856.GK4199@sirena.org.uk>
 <CAK8P3a05oRxgncJb04+niAKSO_2Adki03a04tnj8YuQT=Py54A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a05oRxgncJb04+niAKSO_2Adki03a04tnj8YuQT=Py54A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue 28 Sep 07:22 CDT 2021, Arnd Bergmann wrote:

> On Tue, Sep 28, 2021 at 1:58 PM Mark Brown <broonie@kernel.org> wrote:
> > On Tue, Sep 28, 2021 at 09:50:26AM +0200, Arnd Bergmann wrote:
> >
> > > Not sure how we'd want to merge this patch, if two other things
> > > need it. I'd prefer to merge it along with the QCOM_SCM change
> > > through the soc tree, but that leaves the cirrus firmware broken
> > > unless we also merge it the same way (rather than through ASoC
> > > as it is now).
> >
> > We could also merge a tag into both places.
> 
> I wonder if I should just take my two patches as bugfixes for 5.15,
> after all they do address real build failures. In that case, all  you need
> is a merge with 5.15-rc4 or higher.
> 

I'm in favor of this, better get it over with.
With QCOM_IOMMU fixed up as well, feel free to add my

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

on both the patches, and for the qcom_scm changes you have my

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn
