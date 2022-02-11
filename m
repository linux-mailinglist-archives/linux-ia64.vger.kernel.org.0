Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4264B1ADF
	for <lists+linux-ia64@lfdr.de>; Fri, 11 Feb 2022 02:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346590AbiBKBBJ (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 10 Feb 2022 20:01:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345107AbiBKBBJ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 10 Feb 2022 20:01:09 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308B710BB
        for <linux-ia64@vger.kernel.org>; Thu, 10 Feb 2022 17:01:09 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id t4-20020a17090a510400b001b8c4a6cd5dso7281378pjh.5
        for <linux-ia64@vger.kernel.org>; Thu, 10 Feb 2022 17:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RdgcHpK2QxPcOYOUkcGQd2wPLDeTg88ycTZ52tqwOpM=;
        b=ayaQeq+iHp1StJk08sGOB8wL9hF2ax+YroHj/Q2xe57EsF2tmwRM+bRcoP5B6RJSao
         zVRGQxURnYafJmjj2pjUpW4Gbc4ywJAnHBFGFsrK1qUnpQSCr8sghtVn51G6hSguVMPD
         lHPaakslQ0USKodMgm+Qx4Kb22euGUvZ0qMSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RdgcHpK2QxPcOYOUkcGQd2wPLDeTg88ycTZ52tqwOpM=;
        b=CZIIR4nFW5RVCc9udLFdYcO83mTVW1M2kIOAvLkOEYFgM9+RWp8KUuD78U2vJXKMzq
         8qBVPfdDpjNqdqfr/7wdR5pP8uDiuYXKwOqveETYv3c4/j9NChy0Yv9XR0pwb37oY7OG
         Ads6qQgoz+K1E6Xs1Xiw5secdKZNreE4nqvNmkyZiUVDUqFvWAICOdZifAzXtg356p5b
         8NV+yTXpW7kAkRQ0pfGK7LtKjuX/4mLQejiS4SyRYMMJ34qJ7U7ucBx6NYe7v8VUzjYv
         9FoSAD4aGx0DY7yY6Q8rsLriwxIK0Fa9uc7AUQcTZEcpaljKqEBjxTTssUhxwUe5wpU2
         sE4g==
X-Gm-Message-State: AOAM530n9YHtuAKi+tiLQA/gEUoM2f2ojQ9JUtdKLfh/PWTSIoOPlcKX
        2u5JowzQZQdjOL5NPYyUtqlHBA==
X-Google-Smtp-Source: ABdhPJy2kB/YH9xMcBfAS96T6mrN64LEHeytd1RwomHu8ZQbb2OHvCkkk5zZkV2I8D5+PzLBVw0c7Q==
X-Received: by 2002:a17:902:a413:: with SMTP id p19mr10224104plq.35.1644541268697;
        Thu, 10 Feb 2022 17:01:08 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c20sm13253330pfl.46.2022.02.10.17.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 17:01:08 -0800 (PST)
Date:   Thu, 10 Feb 2022 17:01:07 -0800
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
Subject: Re: [PATCH v3 11/12] lkdtm: Fix execute_[user]_location()
Message-ID: <202202101700.985C29A@keescook>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
 <d4688c2af08dda706d3b6786ae5ec5a74e6171f1.1634457599.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4688c2af08dda706d3b6786ae5ec5a74e6171f1.1634457599.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Sun, Oct 17, 2021 at 02:38:24PM +0200, Christophe Leroy wrote:
> execute_location() and execute_user_location() intent
> to copy do_nothing() text and execute it at a new location.
> However, at the time being it doesn't copy do_nothing() function
> but do_nothing() function descriptor which still points to the
> original text. So at the end it still executes do_nothing() at
> its original location allthough using a copied function descriptor.
> 
> So, fix that by really copying do_nothing() text and build a new
> function descriptor by copying do_nothing() function descriptor and
> updating the target address with the new location.
> 
> Also fix the displayed addresses by dereferencing do_nothing()
> function descriptor.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

This looks good. I might rename variables in the future (e.g. to avoid
the churn from adding _text) but also, that does help keep it clear. :)

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/misc/lkdtm/perms.c | 37 ++++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 035fcca441f0..1cf24c4a79e9 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -44,19 +44,34 @@ static noinline void do_overwritten(void)
>  	return;
>  }
>  
> +static void *setup_function_descriptor(func_desc_t *fdesc, void *dst)
> +{
> +	if (!have_function_descriptors())
> +		return dst;
> +
> +	memcpy(fdesc, do_nothing, sizeof(*fdesc));
> +	fdesc->addr = (unsigned long)dst;
> +	barrier();
> +
> +	return fdesc;
> +}
> +
>  static noinline void execute_location(void *dst, bool write)
>  {
> -	void (*func)(void) = dst;
> +	void (*func)(void);
> +	func_desc_t fdesc;
> +	void *do_nothing_text = dereference_function_descriptor(do_nothing);
>  
> -	pr_info("attempting ok execution at %px\n", do_nothing);
> +	pr_info("attempting ok execution at %px\n", do_nothing_text);
>  	do_nothing();
>  
>  	if (write == CODE_WRITE) {
> -		memcpy(dst, do_nothing, EXEC_SIZE);
> +		memcpy(dst, do_nothing_text, EXEC_SIZE);
>  		flush_icache_range((unsigned long)dst,
>  				   (unsigned long)dst + EXEC_SIZE);
>  	}
> -	pr_info("attempting bad execution at %px\n", func);
> +	pr_info("attempting bad execution at %px\n", dst);
> +	func = setup_function_descriptor(&fdesc, dst);
>  	func();
>  	pr_err("FAIL: func returned\n");
>  }
> @@ -66,16 +81,19 @@ static void execute_user_location(void *dst)
>  	int copied;
>  
>  	/* Intentionally crossing kernel/user memory boundary. */
> -	void (*func)(void) = dst;
> +	void (*func)(void);
> +	func_desc_t fdesc;
> +	void *do_nothing_text = dereference_function_descriptor(do_nothing);
>  
> -	pr_info("attempting ok execution at %px\n", do_nothing);
> +	pr_info("attempting ok execution at %px\n", do_nothing_text);
>  	do_nothing();
>  
> -	copied = access_process_vm(current, (unsigned long)dst, do_nothing,
> +	copied = access_process_vm(current, (unsigned long)dst, do_nothing_text,
>  				   EXEC_SIZE, FOLL_WRITE);
>  	if (copied < EXEC_SIZE)
>  		return;
> -	pr_info("attempting bad execution at %px\n", func);
> +	pr_info("attempting bad execution at %px\n", dst);
> +	func = setup_function_descriptor(&fdesc, dst);
>  	func();
>  	pr_err("FAIL: func returned\n");
>  }
> @@ -153,7 +171,8 @@ void lkdtm_EXEC_VMALLOC(void)
>  
>  void lkdtm_EXEC_RODATA(void)
>  {
> -	execute_location(lkdtm_rodata_do_nothing, CODE_AS_IS);
> +	execute_location(dereference_function_descriptor(lkdtm_rodata_do_nothing),
> +			 CODE_AS_IS);
>  }
>  
>  void lkdtm_EXEC_USERSPACE(void)
> -- 
> 2.31.1
> 

-- 
Kees Cook
