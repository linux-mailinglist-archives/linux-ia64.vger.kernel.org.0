Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428DF42B858
	for <lists+linux-ia64@lfdr.de>; Wed, 13 Oct 2021 09:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238256AbhJMHEq (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 13 Oct 2021 03:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238138AbhJMHEq (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 13 Oct 2021 03:04:46 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FEC8C061749
        for <linux-ia64@vger.kernel.org>; Wed, 13 Oct 2021 00:02:43 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id f21so1175173plb.3
        for <linux-ia64@vger.kernel.org>; Wed, 13 Oct 2021 00:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=efB3Lcg8IS6RzUiO27f4O4XhGBeoDlQrvifyp9iElT0=;
        b=Yu/d1w7scx0araRrouwcPv6x4zAyT5UDwg8br0GJKxvpbtbYX8o2X/sT0DZJj85xPu
         GeOG1cedBC9ir+WJzzTn0DlJjTcSrRwmj6JY0uqPzF+FpwjUp67IJwMyMJy7Xmdg24ud
         6JNdT8Dwc4xpSiQj6cf4wp2M/y/7wOCbdXf/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=efB3Lcg8IS6RzUiO27f4O4XhGBeoDlQrvifyp9iElT0=;
        b=d4OKz87VM97cDe+VG89r+SUEfm0dhQHKN4bSCwZLbg0lAdNqDyn+/l6ZAZ3uxih/6M
         nNag61uyR7ffngw25Rn49TC0tlDbFBEyM4uwfUQNs8MRRFN0+gSd2NY7e2iEPyIedLMF
         ug/mTtsNTA3pub2D3NWwnYeRPShHoMdwt6q8rgFomz6m29FJPEJdytZ+WacP4NhhWH7x
         t+3w0Wy6d691N9SzkmBTzT8b9q873KgzuwUyRIKxVyZor9FfDhlseMmJwzsKfPxYVFO+
         z1//SesXS1Uu4cIMLNGrym4u36Dfzs7jRtARHk3nA+tOCa58BNn1HeDWKYV+YniPeSAX
         gHpA==
X-Gm-Message-State: AOAM530GmerjLl/4GpU3s8FZwZAaekJkx2PJ5mJa+rwZNHVy3Io+MbBD
        AsMtVEb+AKL/gSspktyKGw9+og==
X-Google-Smtp-Source: ABdhPJx2yhgK3ntHhywGbHAC8jYO6ehQsn+GhjQrHT7BjbF3OFKwU6TjoJG8lD6XMAvpgbQCPNEisw==
X-Received: by 2002:a17:90b:17cc:: with SMTP id me12mr11443156pjb.147.1634108562933;
        Wed, 13 Oct 2021 00:02:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u19sm3124045pgo.73.2021.10.13.00.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 00:02:42 -0700 (PDT)
Date:   Wed, 13 Oct 2021 00:02:41 -0700
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
Subject: Re: [PATCH v1 07/10] lkdtm: Force do_nothing() out of line
Message-ID: <202110130002.0FC7878252@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <b353a85e50ac336c385b46459a5fc43f4a6171ac.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b353a85e50ac336c385b46459a5fc43f4a6171ac.1633964380.git.christophe.leroy@csgroup.eu>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, Oct 11, 2021 at 05:25:34PM +0200, Christophe Leroy wrote:
> LKDTM tests display that the run do_nothing() at a given
> address, but in reality do_nothing() is inlined into the
> caller.
> 
> Force it out of line so that it really runs text at the
> displayed address.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
