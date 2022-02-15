Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604EF4B7300
	for <lists+linux-ia64@lfdr.de>; Tue, 15 Feb 2022 17:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241298AbiBOQHM (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 15 Feb 2022 11:07:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241294AbiBOQHL (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 15 Feb 2022 11:07:11 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0020B60D9
        for <linux-ia64@vger.kernel.org>; Tue, 15 Feb 2022 08:07:00 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id x11so1820782pll.10
        for <linux-ia64@vger.kernel.org>; Tue, 15 Feb 2022 08:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vyO09UbxJeRvoJPXaZeuEPEmDAtin+d+KKe2VrtUaUo=;
        b=k6dGMBXjj16JgvtRS/W1l6Q4I2nZDtQcAdycCp9Yomvd6JZnH2zqPlxIg+g+ZPVwSz
         Yd2M1LVjLDjA37krskwjCpbidnONcAVHIcSbAjYLFVZbM5iGekAEKyRZZ7xCywxW3nBM
         4HP4E451gdn725+Vgz91Q6TCzCawlBmVlldfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vyO09UbxJeRvoJPXaZeuEPEmDAtin+d+KKe2VrtUaUo=;
        b=3aiqA71vQH50D5Q+meq5rXa8s0hSRjlNzkanjdfL6ilwX6VdM3qKHI+Ybi4xcpGBCc
         rRj3tq23WGf6JiDLXvOUne7dcCTiyUaQBjNlrKZEdvnba5GyTBInqPfLEMuc0qjPKipP
         eyEDR+WZz7Aly6JzSm+sI5hXoG3/b5sDW+cC9lJ1+khnhF/MuOHPgrgz/97+7M90XDH6
         EsKdRgJKxfLBqClym1RW0ouAOM/zOYu9R9K8HO3MeFt+c0+5tJ1gxbM3BZ0mQ1Tk3dnF
         B9j5FkiDbl5Wnew4CEwylkjL9CPMm9W2Ld6gF4PMBu0TY11qdH7CZ6vj5EfU6dQFxfh9
         yerw==
X-Gm-Message-State: AOAM5302jPIjFVO7+TKDF91b0uzI2pohjegbvlKJsCDaqyaVY8Bm1/KK
        ZAcUVwuFzlia0mxY4E/zroPp/5SzeBwfkg==
X-Google-Smtp-Source: ABdhPJySTpQ67R+nuQyJJfrGZTBLhUE5/ijHpxyRKCqjoqAnDBf2qQYFgmJer9uiO3sFYsKqwhcw6g==
X-Received: by 2002:a17:902:cec5:: with SMTP id d5mr4782522plg.96.1644941220276;
        Tue, 15 Feb 2022 08:07:00 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i17sm3101014pgv.8.2022.02.15.08.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 08:06:59 -0800 (PST)
Date:   Tue, 15 Feb 2022 08:06:59 -0800
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
Subject: Re: [PATCH v4 01/13] powerpc: Fix 'sparse' checking on PPC64le
Message-ID: <202202150806.66CC906@keescook>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
 <ac1312f2451aa558bb2a8806b4d0aa2020f0c176.1644928018.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac1312f2451aa558bb2a8806b4d0aa2020f0c176.1644928018.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, Feb 15, 2022 at 01:40:56PM +0100, Christophe Leroy wrote:
> 'sparse' is architecture agnostic and knows nothing about ELF ABI
> version.
> 
> Just like it gets arch and powerpc type and endian from Makefile,
> it also need to get _CALL_ELF from there, otherwise it won't set
> PPC64_ELF_ABI_v2 macro for PPC64le and won't check the correct code.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
