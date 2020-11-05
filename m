Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3A92A8357
	for <lists+linux-ia64@lfdr.de>; Thu,  5 Nov 2020 17:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731304AbgKEQSy (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 5 Nov 2020 11:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731299AbgKEQSy (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 5 Nov 2020 11:18:54 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF15C0613CF
        for <linux-ia64@vger.kernel.org>; Thu,  5 Nov 2020 08:18:54 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id n129so2360726iod.5
        for <linux-ia64@vger.kernel.org>; Thu, 05 Nov 2020 08:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=zeOiowttxIIaGITXRM4SdZLbxUTpttLfeQL+vwuiZNY=;
        b=pvPMYnWADyqoyldegabyaarEuKF/R7J0MjC6OI+p7UcQKQBzJ4vAni5MQf/GlzUZMp
         EJk2myDzmDF6hbe62xN4B8RjLbVGUy6n4IeOHOthCXqazPej8NtXiNuADQ/2NiUTFBCR
         mT1Uqf3nrdYeB4A/ZYyISoRGQL2GYpw9XKSdvu+WGbt6uUg8W2N4KWBAGnUlinPAsWdN
         PcW3SS9KeeJnjFUhnnBFbUzrPqCdDd40x4FqXftSDJIgu6h38ag56UB6E0/Pmfhx7E03
         Z7pK1pOydhv4BIGPB46qnXV6r2wNnLkyxfoi7NvwI8izU/NaNv0VEDVZEAO5adPBTE9D
         NU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zeOiowttxIIaGITXRM4SdZLbxUTpttLfeQL+vwuiZNY=;
        b=bn08AXJUsgOUUQjvcGfHHEkCl5HlCGQj/hRh7Mcilas/NowwSr+EpM48TCW1pyIIK0
         UORLfy5kNgJnckLJ/Lu+X2I7U9kJF5NJrwf/SzhB4mrqf+eNZMcBXbEH+jibk2m5jUj2
         fsHNp2LzKW6JO/pMBVTb4oW6uMiWIjZp+BrvS4YjOf0Njv9tLq9HKOD/FYLwEJNyCXuo
         VG1eizDYrUFUIHHGbJ4bys4gBDpIhNPsnbkhkv9LYfVR8MNhtGzoXKMCATsHL1JhMm8t
         L3UgB2vxyiK/hMZoPwDtlIOMxyRsQ0D0MkQ4Jkt71/nAufQh2X+WhrYie2roFpBR/CDW
         BiPQ==
X-Gm-Message-State: AOAM530cYmpCO7Tx2dNNZYjT5AJvjQ5PQXOENgrJr7ZrIC4mNSqaJS9a
        e7n1lvIt9vk1ITVXH8I+plvPcYFFmgZQag==
X-Google-Smtp-Source: ABdhPJz4IyNcGEi6qhRx7ukR0ziSs+M63W3qcG2jgggysdlSC6U+tugKUkHRhbhR/41j45j4dSt00A==
X-Received: by 2002:a6b:5507:: with SMTP id j7mr2205323iob.14.1604593133458;
        Thu, 05 Nov 2020 08:18:53 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id l12sm1312919ioq.16.2020.11.05.08.18.52
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 08:18:52 -0800 (PST)
Subject: Re: [PATCH] ia64: add support for TIF_NOTIFY_SIGNAL
From:   Jens Axboe <axboe@kernel.dk>
To:     linux-ia64@vger.kernel.org
References: <d3a2aa1e-0fae-1d3f-519f-d32adc608c38@kernel.dk>
Message-ID: <dc1821c3-6a42-1ca6-0444-731440baf058@kernel.dk>
Date:   Thu, 5 Nov 2020 09:18:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d3a2aa1e-0fae-1d3f-519f-d32adc608c38@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Gentle nudge on this one.

On 10/29/20 10:15 AM, Jens Axboe wrote:
> Wire up TIF_NOTIFY_SIGNAL handling for ia64.
> 
> Cc: linux-ia64@vger.kernel.org
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
> 
> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
> for details:
> 
> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
> 
> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
> as that will enable a set of cleanups once all of them support it. I'm
> happy carrying this patch if need be, or it can be funelled through the
> arch tree. Let me know.
> 
>  arch/ia64/include/asm/thread_info.h | 4 +++-
>  arch/ia64/kernel/process.c          | 3 ++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/ia64/include/asm/thread_info.h b/arch/ia64/include/asm/thread_info.h
> index 64a1011f6812..759d7d68a5f2 100644
> --- a/arch/ia64/include/asm/thread_info.h
> +++ b/arch/ia64/include/asm/thread_info.h
> @@ -104,6 +104,7 @@ struct thread_info {
>  #define TIF_SYSCALL_AUDIT	3	/* syscall auditing active */
>  #define TIF_SINGLESTEP		4	/* restore singlestep on return to user mode */
>  #define TIF_NOTIFY_RESUME	6	/* resumption notification requested */
> +#define TIF_NOTIFY_SIGNAL	7	/* signal notification exist */
>  #define TIF_MEMDIE		17	/* is terminating due to OOM killer */
>  #define TIF_MCA_INIT		18	/* this task is processing MCA or INIT */
>  #define TIF_DB_DISABLED		19	/* debug trap disabled for fsyscall */
> @@ -115,6 +116,7 @@ struct thread_info {
>  #define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
>  #define _TIF_SYSCALL_TRACEAUDIT	(_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT|_TIF_SINGLESTEP)
>  #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
> +#define _TIF_SIGNAL_NOTIFY	(1 << TIF_SIGNAL_NOTIFY)
>  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
>  #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
>  #define _TIF_MCA_INIT		(1 << TIF_MCA_INIT)
> @@ -124,7 +126,7 @@ struct thread_info {
>  
>  /* "work to do on user-return" bits */
>  #define TIF_ALLWORK_MASK	(_TIF_SIGPENDING|_TIF_NOTIFY_RESUME|_TIF_SYSCALL_AUDIT|\
> -				 _TIF_NEED_RESCHED|_TIF_SYSCALL_TRACE)
> +				 _TIF_NEED_RESCHED|_TIF_SYSCALL_TRACE|_TIF_NOTIFY_SIGNAL)
>  /* like TIF_ALLWORK_BITS but sans TIF_SYSCALL_TRACE or TIF_SYSCALL_AUDIT */
>  #define TIF_WORK_MASK		(TIF_ALLWORK_MASK&~(_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT))
>  
> diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
> index 6b61a703bcf5..0e0146daa88d 100644
> --- a/arch/ia64/kernel/process.c
> +++ b/arch/ia64/kernel/process.c
> @@ -171,7 +171,8 @@ do_notify_resume_user(sigset_t *unused, struct sigscratch *scr, long in_syscall)
>  	}
>  
>  	/* deal with pending signal delivery */
> -	if (test_thread_flag(TIF_SIGPENDING)) {
> +	if (test_thread_flag(TIF_SIGPENDING) ||
> +	    test_thread_flags(TIF_NOTIFY_SIGNAL)) {
>  		local_irq_enable();	/* force interrupt enable */
>  		ia64_do_signal(scr, in_syscall);
>  	}
> 


-- 
Jens Axboe

