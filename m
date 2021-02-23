Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F30322325
	for <lists+linux-ia64@lfdr.de>; Tue, 23 Feb 2021 01:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhBWAew (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 22 Feb 2021 19:34:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbhBWAeu (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 22 Feb 2021 19:34:50 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD8CC061574
        for <linux-ia64@vger.kernel.org>; Mon, 22 Feb 2021 16:34:10 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id 75so11291631pgf.13
        for <linux-ia64@vger.kernel.org>; Mon, 22 Feb 2021 16:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fnq80JS20An3brvb6jTXlmtN+pyFY4Q53F5wytzjFAU=;
        b=SObCTdI50XkMR8b6I3KkaBessZDrv1s/shacymNg3jqo+mR0gIaE/Ev0jPe1Rs7EBw
         IEOvVVuXq+9ITh3gD50loPi+uBmrFuY1x65Q+g1xENttJokVcRmPjOvDo3D2zWu2PJUO
         ci27uPGudOBH6Tudk/W5Dv2WZQ+fWNQBNuY9W3v24PERanAjGe744sWj83joTOncED9q
         CPDAJShvxFgkhQibAJg+knlJUPzuCba0eptFGfiXYrBPm9zMfXzvFATaitxKU42ymmKM
         1y3khsMYU0VwEivteNy9hlOs+NvQqDqwvnWiLfrCVAa9abugwr8q2/QZZCcoZxK7HzWn
         /+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fnq80JS20An3brvb6jTXlmtN+pyFY4Q53F5wytzjFAU=;
        b=TmYSLwqay2jO5PG34UScH+x+Jth6QEYlwKbSGCnSgOR0UTM26u850HSRkFUfdsvgMp
         6DJba/SwMYHL5zXN7z/gphl+8WQgA4Gi/Igwc43jLYKHHt7Qrv+xYmo4ww3bEgazOvbO
         uD6rmpza8X0lh2JKDAedRAGDgoZ83t0J/USdYQmqElXHFqsZINWODvidCVfhLvifkXRn
         P3TlML/X0kHIInNLa1IU7m3CIOgAWDIgXmKs3Bl2S7zRee8AXGgSVqv2n3Y2PWmCiqCx
         rJdh7BFgkf6KmbJZEs4BcJZ0OUZk7wA4rq9eYV2rw3DVtwVSoM1ld7k+aOH/dPZZEuGJ
         AEyw==
X-Gm-Message-State: AOAM53057ex93NtpVER12f+N2UAdnCVBpfHFQ4HAHtWqsrQt6T75HhoY
        aBNIJtlX2q+JLcRFx2ZPz8kyTQ==
X-Google-Smtp-Source: ABdhPJzdmdoNrAXy3uCMCNsLeNbXn0z1zxk0TF9QJJRIMjklL26b6hNdYasZinZjqt9LCtnzfYwt7A==
X-Received: by 2002:a62:92ca:0:b029:1ec:c9c2:115a with SMTP id o193-20020a6292ca0000b02901ecc9c2115amr23458934pfd.35.1614040449558;
        Mon, 22 Feb 2021 16:34:09 -0800 (PST)
Received: from ?IPv6:2600:380:497c:8b1b:6d68:602d:6c32:8715? ([2600:380:497c:8b1b:6d68:602d:6c32:8715])
        by smtp.gmail.com with ESMTPSA id k15sm6292816pfh.17.2021.02.22.16.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 16:34:08 -0800 (PST)
Subject: Re: 5.11 regression: "ia64: add support for TIF_NOTIFY_SIGNAL" breaks
 ia64 boot
To:     Sergei Trofimovich <slyich@gmail.com>
Cc:     linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210222230519.73f3e239@sf>
 <cc658b61-530e-90bf-3858-36cc60468a24@kernel.dk> <20210222235359.75d1a912@sf>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <d6cc2bfc-374c-6fb8-9c63-65b3dfebdf3e@kernel.dk>
Date:   Mon, 22 Feb 2021 17:34:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222235359.75d1a912@sf>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 2/22/21 4:53 PM, Sergei Trofimovich wrote:
> On Mon, 22 Feb 2021 16:34:50 -0700
> Jens Axboe <axboe@kernel.dk> wrote:
> 
>> On 2/22/21 4:05 PM, Sergei Trofimovich wrote:
>>> Hia Jens!
>>>
>>> Tried 5.11 on rx3600 box and noticed it has
>>> a problem handling init (5.10 booted fine):
>>>
>>> INIT: version 2.98 booting
>>>
>>>    OpenRC 0.42.1 is starting up Gentoo Linux (ia64)
>>>
>>> mkdir `/run/openrc': Read-only file system
>>> mkdir `/run/openrc/starting': No such file or directory
>>> mkdir `/run/openrc/started': No such file or directory
>>> mkdir `/run/openrc/stopping': No such file or directory
>>> mkdir `/run/openrc/inactive': No such file or directory
>>> mkdir `/run/openrc/wasinactive': No such file or directory
>>> mkdir `/run/openrc/failed': No such file or directory
>>> mkdir `/run/openrc/hotplugged': No such file or directory
>>> mkdir `/run/openrc/daemons': No such file or directory
>>> mkdir `/run[   14.595059] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>>> [   14.599059] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>>>
>>> I suspect we build bad signal stack frame for userspace.
>>>
>>> With a bit of #define DEBUG_SIG 1 enabled the signals are SIGCHLD:
>>>
>>> [   34.969771] SIG deliver (gendepends.sh:69): sig=17 sp=60000fffff6aeaa0 ip=a000000000040740 handler=000000004b4c59b6
>>> [   34.969948] SIG deliver (init:1): sig=17 sp=60000fffff1ccc50 ip=a000000000040740 handler=000000004638b9e5
>>> [   34.969948] SIG deliver (gendepends.sh:69): sig=17 sp=60000fffff6adf90 ip=a000000000040740 handler=000000004b4c59b6
>>> [   34.973948] SIG deliver (init:1): sig=17 sp=60000fffff1cc140 ip=a000000000040740 handler=000000004638b9e5
>>> [   34.973948] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>>> [   34.973948] SIG deliver (gendepends.sh:69): sig=17 sp=60000fffff6ad480 ip=a000000000040740 handler=000000004b4c59b6
>>> [   34.973948] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>>>
>>> Bisect points at:
>>>
>>> commit b269c229b0e89aedb7943c06673b56b6052cf5e5
>>> Author: Jens Axboe <axboe@kernel.dk>
>>> Date:   Fri Oct 9 14:49:43 2020 -0600
>>>
>>>     ia64: add support for TIF_NOTIFY_SIGNAL
>>>
>>>     Wire up TIF_NOTIFY_SIGNAL handling for ia64.
>>>
>>>     Cc: linux-ia64@vger.kernel.org
>>>     [axboe: added fixes from Mike Rapoport <rppt@kernel.org>]
>>>     Signed-off-by: Jens Axboe <axboe@kernel.dk>
>>>
>>> diff --git a/arch/ia64/include/asm/thread_info.h b/arch/ia64/include/asm/thread_info.h
>>> index 64a1011f6812..51d20cb37706 100644
>>> --- a/arch/ia64/include/asm/thread_info.h
>>> +++ b/arch/ia64/include/asm/thread_info.h
>>> @@ -103,6 +103,7 @@ struct thread_info {
>>>  #define TIF_SYSCALL_TRACE      2       /* syscall trace active */
>>>  #define TIF_SYSCALL_AUDIT      3       /* syscall auditing active */
>>>  #define TIF_SINGLESTEP         4       /* restore singlestep on return to user mode */
>>> +#define TIF_NOTIFY_SIGNAL      5       /* signal notification exist */
>>>  #define TIF_NOTIFY_RESUME      6       /* resumption notification requested */
>>>  #define TIF_MEMDIE             17      /* is terminating due to OOM killer */
>>>  #define TIF_MCA_INIT           18      /* this task is processing MCA or INIT */
>>> @@ -115,6 +116,7 @@ struct thread_info {
>>>  #define _TIF_SINGLESTEP                (1 << TIF_SINGLESTEP)
>>>  #define _TIF_SYSCALL_TRACEAUDIT        (_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT|_TIF_SINGLESTEP)
>>>  #define _TIF_NOTIFY_RESUME     (1 << TIF_NOTIFY_RESUME)
>>> +#define _TIF_NOTIFY_SIGNAL     (1 << TIF_NOTIFY_SIGNAL)
>>>  #define _TIF_SIGPENDING                (1 << TIF_SIGPENDING)
>>>  #define _TIF_NEED_RESCHED      (1 << TIF_NEED_RESCHED)
>>>  #define _TIF_MCA_INIT          (1 << TIF_MCA_INIT)
>>> @@ -124,7 +126,7 @@ struct thread_info {
>>>
>>>  /* "work to do on user-return" bits */
>>>  #define TIF_ALLWORK_MASK       (_TIF_SIGPENDING|_TIF_NOTIFY_RESUME|_TIF_SYSCALL_AUDIT|\
>>> -                                _TIF_NEED_RESCHED|_TIF_SYSCALL_TRACE)
>>> +                                _TIF_NEED_RESCHED|_TIF_SYSCALL_TRACE|_TIF_NOTIFY_SIGNAL)
>>>  /* like TIF_ALLWORK_BITS but sans TIF_SYSCALL_TRACE or TIF_SYSCALL_AUDIT */
>>>  #define TIF_WORK_MASK          (TIF_ALLWORK_MASK&~(_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT))
>>>
>>> diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
>>> index 6b61a703bcf5..8d4e1cab9190 100644
>>> --- a/arch/ia64/kernel/process.c
>>> +++ b/arch/ia64/kernel/process.c
>>> @@ -171,7 +171,8 @@ do_notify_resume_user(sigset_t *unused, struct sigscratch *scr, long in_syscall)
>>>         }
>>>
>>>         /* deal with pending signal delivery */
>>> -       if (test_thread_flag(TIF_SIGPENDING)) {
>>> +       if (test_thread_flag(TIF_SIGPENDING) ||
>>> +           test_thread_flag(TIF_NOTIFY_SIGNAL)) {
>>>                 local_irq_enable();     /* force interrupt enable */
>>>                 ia64_do_signal(scr, in_syscall);
>>>
>>> which looks benign, but it enables a bit of conditional
>>> TIF_NOTIFY_SIGNAL handling I don't understand.
>>>
>>> Can you help me get what is the interaction between
>>> TIF_NOTIFY_SIGNAL and TIF_SIGPENDING for
>>> simple processes without io_uring use case?
>>>
>>> I wonder if it's ia64_do_signal()' generates a signal
>>> delivery when it should not.  
>>
>> Can you test:
>>
>> https://marc.info/?l=linux-ia64&m=161187407609443&w=1
>>
>> with the addition mentioned here:
> 
> Not enough:
> 
> mkdir `/run/openrc': Read-only file system
> mkdir `/run/openrc/starting': No such file or directory
> mkdir `/run/openrc/started': No such file or directory
> mkdir `/run/openrc/stopping': No such file or directory
> mkdir `/run/openrc/inactive': No such file or directory
> mkdir `/run/openrc/wasinactive': No such file or directory
> mkdir `/run/openrc/failed': No such file or directory
> mkdir `/run/openrc/hotplugged': No such file or directory
> mkdir `/run/openrc/daemons': No such file or directory
> [   14.554357] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [   14.554357] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> mkdir `/run/openrc/options': No such file or directory
> mkdir `/run/openrc/exclusive': No such file or directory
> mkdir `/run/openrc/scheduled': No such file or directory
> mkdir `/run/openrc/tmp': No such file or directory
> 
>> https://marc.info/?l=linux-ia64&m=161187470709706&w=1
>>
>> if needed?
> 
> Two patches above do fix the boot \o/ But have a lot of spam about
> 'signal 0' delivery to a bunch of processes:
> 
>  * Mounting /proc ...
>  [ ok ]
>  * Mounting /run ...
>  * /run/openrc: creating directory
>  * /run/lock: creating directory
>  * /run/lock: correcting owner
>  * Caching service dependencies ...
>  [ ok ]
>  * Mounting /sys ...
>  [ ok ]
>  * Mounting debug filesystem ...
>  [ ok ]
>  * Mounting efivarfs filesystem ...
>  [ ok ]
>  * sysfs: caught unknown signal 0
>  * openrc: caught unknown signal 0
>  * Mounting cgroup filesystem ...

That's an improvement! Let me take a look at this tonight and see if I
can figure out what's going on. But yes, it's the ia64 signal delivery
being just different enough from the norm that it apparently triggers
some weirdness.

-- 
Jens Axboe

