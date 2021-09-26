Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735BF418828
	for <lists+linux-ia64@lfdr.de>; Sun, 26 Sep 2021 12:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhIZKwp (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 26 Sep 2021 06:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhIZKwo (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 26 Sep 2021 06:52:44 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32E0C061570
        for <linux-ia64@vger.kernel.org>; Sun, 26 Sep 2021 03:51:08 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id w17so42306983wrv.10
        for <linux-ia64@vger.kernel.org>; Sun, 26 Sep 2021 03:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=t+YQA6NcnBwj140GMdqh1H1cRDgKuBzPuXJMzQi6QK4=;
        b=rc5oJE3lQkAU6aKt6yVqGNHWRxzbY6mlw20Pt9TGLIJr+WNdwGaZrYZuvc+l0oyYbL
         L+eNTXaeMs84KMkJzNZ1/V+lj0m+t/4byQDiGrT8Sgyl2glADw0X/Yg/A40V9HDTWO7w
         zTG0HUVjHzsjyRXmjiOINKnzP+nyHf9Y+3ACY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t+YQA6NcnBwj140GMdqh1H1cRDgKuBzPuXJMzQi6QK4=;
        b=GbwGmU7zNYM69596V8MFPvrUMSZQNHEmEibZhoWTagidr/GZabdEowpIvkRVIut0xy
         GzEbUzCoe+34f5b5ZbQnVOCLVTdXjTgy+PKwB5NOOnTiE5G1s4sGs6BhJ5TxESaubgz/
         q9//IkcRAwiM9ZVA2ZiUcKn7u0JpN26CjginMFoihXxfzmm/47BsFNf2tWuuu0HG6NNm
         I6yzgkK3YiauUJ4wwZqIfbuZHglxbZrCjxbPWr+cOB750PeMbr3aXtEJMyeQjS4Rp5Wg
         pgMkqc4ExmwY6bp6HmWxzNYwcL637p6tELbpvJsYyeNIPkUhTgFlciK7WlPGjJQOtgmA
         DUFQ==
X-Gm-Message-State: AOAM530JNOsG5eB4ZVDfR4fv95PXm2k6OUrn0kEQhc1NzPOSXKoTBNuT
        nc9/ZqBkJKPprIC982K3adZAhg==
X-Google-Smtp-Source: ABdhPJx1vfiq6XPMK+6q1BkjDE+yrar6QGTkbT0iNrZZvFhY4NYfwgX8cC3+BU2PY+xVgoqxYYJM4g==
X-Received: by 2002:a5d:6545:: with SMTP id z5mr21609745wrv.51.1632653467271;
        Sun, 26 Sep 2021 03:51:07 -0700 (PDT)
Received: from localhost ([2a01:4b00:8432:8a00:63de:dd93:20be:f460])
        by smtp.gmail.com with ESMTPSA id a77sm13495210wme.28.2021.09.26.03.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 03:51:06 -0700 (PDT)
Date:   Sun, 26 Sep 2021 11:51:05 +0100
From:   Chris Down <chris@chrisdown.name>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        Petr Mladek <pmladek@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH] ia64: don't do IA64_CMPXCHG_DEBUG without CONFIG_PRINTK
Message-ID: <YVBQmQS8WFh71+dP@chrisdown.name>
References: <20210926063325.13581-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210926063325.13581-1-rdunlap@infradead.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Randy,

Randy Dunlap writes:
>When CONFIG_PRINTK is not set, the CMPXCHG_BUGCHECK() macro calls
>_printk(), but _printk() is a static inline function, not available
>as an extern.
>Since the purpose of the macro is to print the BUGCHECK info,
>make this config option depend on PRINTK.
>
>Fixes multiple occurrences of this build error:
>
>../include/linux/printk.h:208:5: error: static declaration of '_printk' follows non-static declaration
>  208 | int _printk(const char *s, ...)
>      |     ^~~~~~~
>In file included from ../arch/ia64/include/asm/cmpxchg.h:5,
>../arch/ia64/include/uapi/asm/cmpxchg.h:146:28: note: previous declaration of '_printk' with type 'int(const char *, ...)'
>  146 |                 extern int _printk(const char *fmt, ...);
>
>Fixes: 337015573718 ("printk: Userspace format indexing support")

This Fixes tag doesn't make much sense. This was already broken long before 
that patch, just the error message changed: printk() was already static inline 
on !CONFIG_PRINTK for eons.

>Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>Cc: linux-ia64@vger.kernel.org
>Cc: Petr Mladek <pmladek@suse.com>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Tony Luck <tony.luck@intel.com>
>Cc: Chris Down <chris@chrisdown.name>
>---
> arch/ia64/Kconfig.debug |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>--- linux-next-20210917.orig/arch/ia64/Kconfig.debug
>+++ linux-next-20210917/arch/ia64/Kconfig.debug
>@@ -39,7 +39,7 @@ config DISABLE_VHPT
>
> config IA64_DEBUG_CMPXCHG
> 	bool "Turn on compare-and-exchange bug checking (slow!)"
>-	depends on DEBUG_KERNEL
>+	depends on DEBUG_KERNEL && PRINTK
> 	help
> 	  Selecting this option turns on bug checking for the IA-64
> 	  compare-and-exchange instructions.  This is slow!  Itaniums
