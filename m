Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14B6B2FD517
	for <lists+linux-ia64@lfdr.de>; Wed, 20 Jan 2021 17:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391224AbhATQJV (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 20 Jan 2021 11:09:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387649AbhATQIv (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 20 Jan 2021 11:08:51 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFC0C061575
        for <linux-ia64@vger.kernel.org>; Wed, 20 Jan 2021 08:08:11 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id x18so12753858pln.6
        for <linux-ia64@vger.kernel.org>; Wed, 20 Jan 2021 08:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pimhCqtxr1qXSkw2CrV8ARagNLtv7rpOEIzTxouW34c=;
        b=a8S9faT43fX7FXvyiGa20LD/JlrAfJ3ThUXAICtMN3ieeXe15P1XKmxs7rmcA4A9/t
         MKQb6WwTJ7WJUZosqfL6APigRns9AEhsvgYOtQJfK24tvBv3qbWBFAfDpo5o4oAGgAhY
         qiQDqtl1eHXBBFzySBAqNPFSEdB8h5QRxYhsrNnPYAp59CUJWZJwOIYqIWFLBiD7ZLUk
         I5FcDPCdSff52ZJQoQ6SvYGdRbEtSkgNAUV1Tgm8oOBjjnQGnJP+C08ha/lfWegAUSwP
         OccWlA4n3GjJyxn9T+6pgQdiPz0AhCwxTfWQiwcyH8tBUtm+fCM56QNDldY1NMCk5ikr
         RRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pimhCqtxr1qXSkw2CrV8ARagNLtv7rpOEIzTxouW34c=;
        b=rSwLlRVntT1Uh+3QLYcGojvO4Y0jtkFQvTNhpnDftk2NIyPljOP3eamrL04sW/hhrc
         Z+vIZF0iwYwjBbttRoe0OMsd+j2+tzj7+BfS4QxcUguDj9mNF777s7HpgIMVG3cdPOgX
         J/F4e7nY3JlOqG+usbMaaBiBm8YRzOxHyUEEgO6zfXKC/SOO4JLs2e1UJvuXsjeDn2s9
         CrvZg0rmeJn7S+bI9K87hi/8HoJYhykVmWwb7NZfC1DXutU65yWBcId62OAWiYsWR7ee
         6EWSQ1GTo31dfPKCfvGPRXRO9z8CKPPBtbB/UF9AH7hGPh4KPb4z6INR1azmqMQZy4zE
         rUFA==
X-Gm-Message-State: AOAM532WSweQVpBUYMoWwzv6hydFRAR5tHW26JDiGLAThZ81Mpwj0bkr
        Om/UPoDlD40W6NjBJOZSlCqE1Ov16uU5YA==
X-Google-Smtp-Source: ABdhPJz359WLbT4XvXwfNgR1peFkaaJAQEDTloQo1tEFg6GvtxHGcfIOzGYkrtBST1uOaOCgJIKx3g==
X-Received: by 2002:a17:90b:3449:: with SMTP id lj9mr6574609pjb.84.1611158890684;
        Wed, 20 Jan 2021 08:08:10 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id r20sm2800336pgb.3.2021.01.20.08.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 08:08:10 -0800 (PST)
Subject: Re: [PATCH] ia64: add support for TIF_NOTIFY_SIGNAL
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-ia64@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <d3a2aa1e-0fae-1d3f-519f-d32adc608c38@kernel.dk>
 <71d32a91-c429-7405-f4a6-58c74eb898bf@physik.fu-berlin.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <477eb7cf-cbf8-540e-c355-41b7e5ed558f@kernel.dk>
Date:   Wed, 20 Jan 2021 09:08:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <71d32a91-c429-7405-f4a6-58c74eb898bf@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 1/18/21 6:50 PM, John Paul Adrian Glaubitz wrote:
> Hi Jens!
> 
> On 10/29/20 5:15 PM, Jens Axboe wrote:
>> Wire up TIF_NOTIFY_SIGNAL handling for ia64.
>>
>> Cc: linux-ia64@vger.kernel.org
>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>> ---
>>
>> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
>> for details:
>>
>> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
>>
>> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
>> as that will enable a set of cleanups once all of them support it. I'm
>> happy carrying this patch if need be, or it can be funelled through the
>> arch tree. Let me know.
>>
>>  arch/ia64/include/asm/thread_info.h | 4 +++-
>>  arch/ia64/kernel/process.c          | 3 ++-
>>  2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/ia64/include/asm/thread_info.h b/arch/ia64/include/asm/thread_info.h
>> index 64a1011f6812..759d7d68a5f2 100644
>> --- a/arch/ia64/include/asm/thread_info.h
>> +++ b/arch/ia64/include/asm/thread_info.h
>> @@ -104,6 +104,7 @@ struct thread_info {
>>  #define TIF_SYSCALL_AUDIT	3	/* syscall auditing active */
>>  #define TIF_SINGLESTEP		4	/* restore singlestep on return to user mode */
>>  #define TIF_NOTIFY_RESUME	6	/* resumption notification requested */
>> +#define TIF_NOTIFY_SIGNAL	7	/* signal notification exist */
>>  #define TIF_MEMDIE		17	/* is terminating due to OOM killer */
>>  #define TIF_MCA_INIT		18	/* this task is processing MCA or INIT */
>>  #define TIF_DB_DISABLED		19	/* debug trap disabled for fsyscall */
>> @@ -115,6 +116,7 @@ struct thread_info {
>>  #define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
>>  #define _TIF_SYSCALL_TRACEAUDIT	(_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT|_TIF_SINGLESTEP)
>>  #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
>> +#define _TIF_SIGNAL_NOTIFY	(1 << TIF_SIGNAL_NOTIFY)
>>  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
>>  #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
>>  #define _TIF_MCA_INIT		(1 << TIF_MCA_INIT)
>> @@ -124,7 +126,7 @@ struct thread_info {
>>  
>>  /* "work to do on user-return" bits */
>>  #define TIF_ALLWORK_MASK	(_TIF_SIGPENDING|_TIF_NOTIFY_RESUME|_TIF_SYSCALL_AUDIT|\
>> -				 _TIF_NEED_RESCHED|_TIF_SYSCALL_TRACE)
>> +				 _TIF_NEED_RESCHED|_TIF_SYSCALL_TRACE|_TIF_NOTIFY_SIGNAL)
>>  /* like TIF_ALLWORK_BITS but sans TIF_SYSCALL_TRACE or TIF_SYSCALL_AUDIT */
>>  #define TIF_WORK_MASK		(TIF_ALLWORK_MASK&~(_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT))
>>  
>> diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
>> index 6b61a703bcf5..0e0146daa88d 100644
>> --- a/arch/ia64/kernel/process.c
>> +++ b/arch/ia64/kernel/process.c
>> @@ -171,7 +171,8 @@ do_notify_resume_user(sigset_t *unused, struct sigscratch *scr, long in_syscall)
>>  	}
>>  
>>  	/* deal with pending signal delivery */
>> -	if (test_thread_flag(TIF_SIGPENDING)) {
>> +	if (test_thread_flag(TIF_SIGPENDING) ||
>> +	    test_thread_flags(TIF_NOTIFY_SIGNAL)) {
>>  		local_irq_enable();	/* force interrupt enable */
>>  		ia64_do_signal(scr, in_syscall);
>>  	}
>>
> 
> This change broke the hpsa driver on my RX-2600 ia64 workstation in the sense that the
> driver no longer loads and hence hard disks are no longer recognized.

What does "no longer loads" mean? Does it hang?

> Any idea what could be wrong?

Can you try current -git? There's a task_work related fix in there which is
related to this series, maybe that's it...

-- 
Jens Axboe

