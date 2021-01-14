Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24102F6167
	for <lists+linux-ia64@lfdr.de>; Thu, 14 Jan 2021 14:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbhANM7h (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 14 Jan 2021 07:59:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:33560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726066AbhANM7h (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Thu, 14 Jan 2021 07:59:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8351923A33;
        Thu, 14 Jan 2021 12:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610629136;
        bh=MsbkcZB9miMJgu/jBC8joLgliDJgOGuSFm0lQV8ramk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sYS1U2PKUm9xKwc0145uEPYPxVwHiIYptIqKJhpkGCnVkFsYPsKs94Lo1SadbKimG
         6cAqWO2P7NQ20F/IspYVTygOoTfy7SKy5qvVzXFNEeHVZXWG5ezB0Z14byQ1ysdm1S
         qOGSJ3X++zXwG883nYb4SI6owJRaEgt/Rmbtw1CosONeJZc8mArRps/Jzmn9rnYjGS
         PZpb00+fZgfYCJI9YBXWn1DDygEaP3/0mQoDxUvc6SDLkI3XcYlSSQykuV6Mp0eXRs
         Ed7/8jqOUhPjvjMOd986R0qz8e3fFHhh0cZ/etIPGncH9HeQKKjXU2Tz/nuZCLn3+C
         dBtnoJ3Lk4ePA==
Date:   Thu, 14 Jan 2021 14:58:50 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ia64: fix build failure caused by memory model changes
Message-ID: <20210114125850.GJ1106298@kernel.org>
References: <20201218163550.8838-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218163550.8838-1-rppt@kernel.org>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

If there are no objections, I'll take it via the memblock tree.

@Tony an ack would be appreciated.

On Fri, Dec 18, 2020 at 06:35:50PM +0200, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The change of ia64's default memory model to SPARSEMEM causes defconfig
> build to fail:
> 
>   CC      kernel/async.o
> In file included from include/linux/numa.h:25,
>                  from include/linux/async.h:13,
>                  from kernel/async.c:47:
> arch/ia64/include/asm/sparsemem.h:14:40: warning: "PAGE_SHIFT" is not defined, evaluates to 0 [-Wundef]
>    14 | #if ((CONFIG_FORCE_MAX_ZONEORDER - 1 + PAGE_SHIFT) > SECTION_SIZE_BITS)
>       |                                        ^~~~~~~~~~
> In file included from include/linux/gfp.h:6,
>                  from include/linux/xarray.h:14,
>                  from include/linux/radix-tree.h:19,
>                  from include/linux/idr.h:15,
>                  from include/linux/kernfs.h:13,
>                  from include/linux/sysfs.h:16,
>                  from include/linux/kobject.h:20,
>                  from include/linux/energy_model.h:7,
>                  from include/linux/device.h:16,
>                  from include/linux/async.h:14,
>                  from kernel/async.c:47:
> include/linux/mmzone.h:1156:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
>  1156 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
>       |  ^~~~~
> 
> The error cause is the missing definition of PAGE_SHIFT in the calculation
> of SECTION_SIZE_BITS.
> 
> Add include of <asm/page.h> to arch/ia64/include/asm/sparsemem.h to solve
> the problem.
> 
> Fixes: 214496cb1870 ("ia64: make SPARSEMEM default and disable DISCONTIGMEM")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
> 
> Surprisingly, only Guenter's bot caught this.
> 
> @Andrew, if you prefer I can take this via memblock tree.
> 
>  arch/ia64/include/asm/sparsemem.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/ia64/include/asm/sparsemem.h b/arch/ia64/include/asm/sparsemem.h
> index dd8c166ffd7b..42ed5248fae9 100644
> --- a/arch/ia64/include/asm/sparsemem.h
> +++ b/arch/ia64/include/asm/sparsemem.h
> @@ -3,6 +3,7 @@
>  #define _ASM_IA64_SPARSEMEM_H
>  
>  #ifdef CONFIG_SPARSEMEM
> +#include <asm/page.h>
>  /*
>   * SECTION_SIZE_BITS            2^N: how big each section will be
>   * MAX_PHYSMEM_BITS             2^N: how much memory we can have in that space
> -- 
> 2.28.0
> 

-- 
Sincerely yours,
Mike.
