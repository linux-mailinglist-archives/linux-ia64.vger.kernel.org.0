Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A75242B849
	for <lists+linux-ia64@lfdr.de>; Wed, 13 Oct 2021 09:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbhJMHDx (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 13 Oct 2021 03:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238237AbhJMHDw (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 13 Oct 2021 03:03:52 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08523C06174E
        for <linux-ia64@vger.kernel.org>; Wed, 13 Oct 2021 00:01:50 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id r2so1402778pgl.10
        for <linux-ia64@vger.kernel.org>; Wed, 13 Oct 2021 00:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W1TvfEn9hETtgRdpCl58SYxcbENIjjH6xIOozoqUidk=;
        b=MiMmWBnV7fK/LRulBj97pgznDjd0sTVyvYOHU+wqZXHDzKYsb5IY0/pybu5wCZVeUO
         89tP8M8FQFXw1CVUA6arONHwFzF7aXl/UqXncJs22D99krNezbXxMuuF6TpDeG+DvXC3
         wMyDgBXJxJzBcQsvICTBtJ/TWHtit/X5eqtpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W1TvfEn9hETtgRdpCl58SYxcbENIjjH6xIOozoqUidk=;
        b=gQiwa1Z7zeR0NbdAgaZNoc4vod0lYBfIsQHZwH9TipImGoXY/JtFfwSVUWJ5ij/HUV
         xv35FexGJIACCyyuITk/SywooJqzt1O4HZmdV94mA7NPC5X4fsyvN3bppnbp2LPe2VQC
         PJ329X4fN2kQNMu3s1bfYSKuwXDmVhfSlyPtCSMhDSC1xrEYx7xhzQ7GPPacd6S3ezRk
         a8ov5WshRrmvf8hA2U76IVFm1PkZ+A7jyFxw8Ezp3kLf+QehO5fs7rpABRhI9cO6HKWO
         I17LWLbHs97uZl6pDdW8RA6SW0LjoARBFylMq8p7cPO8w8X2uuTwdl++HAqeb84u13Hm
         Hn7g==
X-Gm-Message-State: AOAM533h7nXq6bVyc/t08MuNFOlCK569A/I7I5379G5y3PXxDgM05PWz
        ExtY4mq/x4Q0xuFVx+0rzUHCsQ==
X-Google-Smtp-Source: ABdhPJwyFLjw/2mnoLszmWzrHimaUwUUOJtR4rLgtHIulRE2XeazTIf6D+X27fVIGJT33rf3Ee5ReA==
X-Received: by 2002:a63:9a12:: with SMTP id o18mr17842269pge.419.1634108509519;
        Wed, 13 Oct 2021 00:01:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a67sm12924857pfa.128.2021.10.13.00.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 00:01:49 -0700 (PDT)
Date:   Wed, 13 Oct 2021 00:01:48 -0700
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
Subject: Re: [PATCH v1 05/10] asm-generic: Define 'funct_descr_t' to commonly
 describe function descriptors
Message-ID: <202110130001.11A50456@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <02224551451ab9c37055499fc621c41246c81125.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02224551451ab9c37055499fc621c41246c81125.1633964380.git.christophe.leroy@csgroup.eu>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, Oct 11, 2021 at 05:25:32PM +0200, Christophe Leroy wrote:
> We have three architectures using function descriptors, each with its
> own name.
> 
> Add a common typedef that can be used in generic code.
> 
> Also add a stub typedef for architecture without function descriptors,

nit: funct_descr_t reads weird to me. why not func_desc_t ? Either way:

Reviewed-by: Kees Cook <keescook@chromium.org>


> to avoid a forest of #ifdefs.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/ia64/include/asm/sections.h    | 1 +
>  arch/parisc/include/asm/sections.h  | 1 +
>  arch/powerpc/include/asm/sections.h | 1 +
>  include/asm-generic/sections.h      | 3 +++
>  4 files changed, 6 insertions(+)
> 
> diff --git a/arch/ia64/include/asm/sections.h b/arch/ia64/include/asm/sections.h
> index 80f5868afb06..929b5c535620 100644
> --- a/arch/ia64/include/asm/sections.h
> +++ b/arch/ia64/include/asm/sections.h
> @@ -8,6 +8,7 @@
>   */
>  
>  #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
> +typedef struct fdesc funct_descr_t;
>  
>  #include <linux/elf.h>
>  #include <linux/uaccess.h>
> diff --git a/arch/parisc/include/asm/sections.h b/arch/parisc/include/asm/sections.h
> index 2e781ee19b66..329e80f7af0a 100644
> --- a/arch/parisc/include/asm/sections.h
> +++ b/arch/parisc/include/asm/sections.h
> @@ -4,6 +4,7 @@
>  
>  #ifdef CONFIG_64BIT
>  #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
> +typedef Elf64_Fdesc funct_descr_t;
>  #endif
>  
>  /* nothing to see, move along */
> diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
> index b7f1ba04e756..d0d5287fa568 100644
> --- a/arch/powerpc/include/asm/sections.h
> +++ b/arch/powerpc/include/asm/sections.h
> @@ -10,6 +10,7 @@
>  
>  #ifdef PPC64_ELF_ABI_v1
>  #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
> +typedef struct ppc64_opd_entry funct_descr_t;
>  #endif
>  
>  #include <asm-generic/sections.h>
> diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
> index 1db5cfd69817..436412d94054 100644
> --- a/include/asm-generic/sections.h
> +++ b/include/asm-generic/sections.h
> @@ -63,6 +63,9 @@ extern __visible const void __nosave_begin, __nosave_end;
>  #else
>  #define dereference_function_descriptor(p) ((void *)(p))
>  #define dereference_kernel_function_descriptor(p) ((void *)(p))
> +typedef struct {
> +	unsigned long addr;
> +} funct_descr_t;
>  #endif
>  
>  /* random extra sections (if any).  Override
> -- 
> 2.31.1
> 

-- 
Kees Cook
