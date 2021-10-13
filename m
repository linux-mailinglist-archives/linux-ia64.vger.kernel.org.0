Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A64E42B864
	for <lists+linux-ia64@lfdr.de>; Wed, 13 Oct 2021 09:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238193AbhJMHHb (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 13 Oct 2021 03:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238124AbhJMHHb (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 13 Oct 2021 03:07:31 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AF0C061749
        for <linux-ia64@vger.kernel.org>; Wed, 13 Oct 2021 00:05:28 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id l6so1157172plh.9
        for <linux-ia64@vger.kernel.org>; Wed, 13 Oct 2021 00:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6tGvcqjwGnkwXapVdxREWLfq3SeiEzYltujninCiyHk=;
        b=Y9iLi2JrztwgqJU7WxouRqkcs19pQmlvc+dwqmTt/LsB2A/+LkmdmebziJqWx90+1l
         QGUBkBxPvUXkDNRhn2WfhIRnIA//lJRWBR6Sy4+Bvt3AZnPK5owInFUImk8i6ZlkNfXx
         3PbBkcLhCoweDrO9NiqjhNF4c3MLWR35u5DiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6tGvcqjwGnkwXapVdxREWLfq3SeiEzYltujninCiyHk=;
        b=A3id3WLvNuiiQQjYO5av75zQbXA9UQE1ashbrWQosEe1RR4ws72wEoIcMSD/QMtEJp
         8yBBjnKKPRceqA/69B7ZRULXsndROb+PunEu+WdRxPHFDb1JdCK3YQOXyICkRvpmkkYz
         cI2Dk3gi02fHKZpV+4QEUx7pcyxWw7f9qYTXXzyv3LNd6JHNRgMZQXve/3Dz9jP6DPTN
         3PIgsTXT3GbkhiixwluMkvGJc6K3lBowScFZc/RGszd+sKvr7w/UJqDKFDTHQjFripNW
         Omxey/zWBeEuliDKN9H3psCqjXTR2umRv9aPSbIJKAdGC3HOCfu1qkbH3JQeEB069Zsc
         GsFQ==
X-Gm-Message-State: AOAM532oJLjImln7GmmyvrVf0RQAPkHX8oR0mCsAyJZFOvm09vH2rj5G
        293xEys8P67PjVONThMSYT1DXw==
X-Google-Smtp-Source: ABdhPJxyo+lKj4DVYPaWC7XDi86I8yDjK4zmQZScEiHVyq9xnd6FexVoNrQNr9v1X26KMPGowX7ckA==
X-Received: by 2002:a17:90b:3b44:: with SMTP id ot4mr11523975pjb.73.1634108727909;
        Wed, 13 Oct 2021 00:05:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ip10sm5334805pjb.40.2021.10.13.00.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 00:05:27 -0700 (PDT)
Date:   Wed, 13 Oct 2021 00:05:26 -0700
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
Subject: Re: [PATCH v1 08/10] lkdtm: Really write into kernel text in
 WRITE_KERN
Message-ID: <202110130004.880A6C841@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <624940395e5d81967246f911a65740b9a15b5a70.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <624940395e5d81967246f911a65740b9a15b5a70.1633964380.git.christophe.leroy@csgroup.eu>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, Oct 11, 2021 at 05:25:35PM +0200, Christophe Leroy wrote:
> WRITE_KERN is supposed to overwrite some kernel text, namely
> do_overwritten() function.
> 
> But at the time being it overwrites do_overwritten() function
> descriptor, not function text.
> 
> Fix it by dereferencing the function descriptor to obtain
> function text pointer.
> 
> And make do_overwritten() noinline so that it is really
> do_overwritten() which is called by lkdtm_WRITE_KERN().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/misc/lkdtm/perms.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 60b3b2fe929d..442d60ed25ef 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -5,6 +5,7 @@
>   * even non-readable regions.
>   */
>  #include "lkdtm.h"
> +#include <linux/kallsyms.h>

Why not #include <asm/sections.h> instead here?

>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
>  #include <linux/mman.h>
> @@ -37,7 +38,7 @@ static noinline void do_nothing(void)
>  }
>  
>  /* Must immediately follow do_nothing for size calculuations to work out. */
> -static void do_overwritten(void)
> +static noinline void do_overwritten(void)
>  {
>  	pr_info("do_overwritten wasn't overwritten!\n");
>  	return;
> @@ -113,8 +114,9 @@ void lkdtm_WRITE_KERN(void)
>  	size_t size;
>  	volatile unsigned char *ptr;
>  
> -	size = (unsigned long)do_overwritten - (unsigned long)do_nothing;
> -	ptr = (unsigned char *)do_overwritten;
> +	size = (unsigned long)dereference_symbol_descriptor(do_overwritten) -
> +	       (unsigned long)dereference_symbol_descriptor(do_nothing);
> +	ptr = dereference_symbol_descriptor(do_overwritten);

But otherwise, yup, I expect there will be a bunch of things like this
to clean up in LKDTM. :| Sorry about that!

Acked-by: Kees Cook <keescook@chromium.org>

>  
>  	pr_info("attempting bad %zu byte write at %px\n", size, ptr);
>  	memcpy((void *)ptr, (unsigned char *)do_nothing, size);
> -- 
> 2.31.1
> 

-- 
Kees Cook
