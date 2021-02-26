Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D7F3262E8
	for <lists+linux-ia64@lfdr.de>; Fri, 26 Feb 2021 13:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhBZMsl (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 26 Feb 2021 07:48:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbhBZMsk (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 26 Feb 2021 07:48:40 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099C8C06174A
        for <linux-ia64@vger.kernel.org>; Fri, 26 Feb 2021 04:48:00 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id i9so7031520wml.0
        for <linux-ia64@vger.kernel.org>; Fri, 26 Feb 2021 04:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TMdyoGpsUz60QnR0spjaWP1dFPFBzwuCMWnm1un/xsQ=;
        b=eEqgi9n7vxuk2yqcdRUd4PX6Qj+/MYB4oOjvk4RRX82nzyg6TmMSs+YV+2a00qFACG
         2u262/C+xHk2s4RaVNji6NzJwU++QP7GPlxG4e7THZ45d0L1zZ9uzVmDr7BjZ2v1bt5b
         fAbCnk9k/w/8RLdjCjtqO6UGTdJrCTS8fe/58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TMdyoGpsUz60QnR0spjaWP1dFPFBzwuCMWnm1un/xsQ=;
        b=aX22VeeX8ZoIeSLel6fQDeL/NwRaTbJ5BeYwBHA1jDtcchOjzomVbG0RryYyF6Fxwp
         pHpQeRCIkJFYtMkUH48SlkSTnP+pt3l30nQPH6qeijiTaR05EbNG5oW1K1pNfQZ4MBaY
         QOV4V2f4PCPhjEtsyrfKX4iyk17d/pzgl3Bnfxa9dK+s8J9jvi3+ffITXZOaHMxN89a+
         aNBpiicoNcQL2FZvcVqry7l5ro12th2mAMQVuSuvSBitWoe0Rw+Lvnkoh3gMPzu49ub4
         0DQFRmmLusFXI0pL1qdmh99mVL9RURI6YMQZEV8BxeS7Jr9OwYVRUZ+1UTEb0ep7TNQR
         QOxw==
X-Gm-Message-State: AOAM530L6N2peud/wERRb0w0IERmGaJEGsfPqhku2z4vefv128F4dbFj
        kQ6P0ihdDZk1UiLOGk2bbSAn+Q==
X-Google-Smtp-Source: ABdhPJywxeh7Tv35PnGaJd8kuTd9tEkf3oMPkGi2cb3V+dxoFjbIk+aaDAy6hop6xlcSBR8AJakrQQ==
X-Received: by 2002:a05:600c:3546:: with SMTP id i6mr2819459wmq.24.1614343678763;
        Fri, 26 Feb 2021 04:47:58 -0800 (PST)
Received: from localhost ([2620:10d:c093:400::4:87b5])
        by smtp.gmail.com with ESMTPSA id y18sm12668754wrq.61.2021.02.26.04.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 04:47:58 -0800 (PST)
Date:   Fri, 26 Feb 2021 12:47:58 +0000
From:   Chris Down <chris@chrisdown.name>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm@kvack.org, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@fb.com
Subject: Re: [PATCH] ia64: Depend on non-static printk for cmpxchg debug
Message-ID: <YDjt/lI82VzZcCgq@chrisdown.name>
References: <YCflN5zTvo5mxvKY@chrisdown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YCflN5zTvo5mxvKY@chrisdown.name>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

+ akpm, linux-mm

Hey folks,

Chris Down writes:
>With !CONFIG_PRINTK, printk() is static in the header, but ia64's
>cmpxchg.h with CONFIG_IA64_DEBUG_CMPXCHG doesn't take this into account
>before trying to use it as extern, resulting in a compiler error:
>
>    ./include/linux/printk.h:219:5: error: static declaration of 'printk' follows non-static declaration
>    219 | int printk(const char *s, ...)
>	|     ^~~~~~
>    ./arch/ia64/include/uapi/asm/cmpxchg.h:142:14: note: previous declaration of 'printk' was here
>    142 |   extern int printk(const char *fmt, ...);  \
>	|              ^~~~~~
>
>Make CONFIG_IA64_DEBUG_CMPXCHG dependent on CONFIG_PRINTK to avoid this.
>
>Signed-off-by: Chris Down <chris@chrisdown.name>
>Reported-by: kernel test robot <lkp@intel.com>
>Cc: Tony Luck <tony.luck@intel.com>
>Cc: Fenghua Yu <fenghua.yu@intel.com>
>Cc: linux-ia64@vger.kernel.org

I now see that last month ia64 was marked as orphaned, so I'm going to send 
this over to Andrew/-mm.

Andrew, any chance you can take this in your tree? It's causing spurious LKP 
noise for some recent work on printk and would be great to have in -next.

Thanks,

Chris

>---
> arch/ia64/Kconfig.debug | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/ia64/Kconfig.debug b/arch/ia64/Kconfig.debug
>index 40ca23bd228d..2ce008e2d164 100644
>--- a/arch/ia64/Kconfig.debug
>+++ b/arch/ia64/Kconfig.debug
>@@ -39,7 +39,7 @@ config DISABLE_VHPT
>
> config IA64_DEBUG_CMPXCHG
> 	bool "Turn on compare-and-exchange bug checking (slow!)"
>-	depends on DEBUG_KERNEL
>+	depends on DEBUG_KERNEL && PRINTK
> 	help
> 	  Selecting this option turns on bug checking for the IA-64
> 	  compare-and-exchange instructions.  This is slow!  Itaniums
>-- 
>2.30.1
>
