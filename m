Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6BD32BC97
	for <lists+linux-ia64@lfdr.de>; Wed,  3 Mar 2021 23:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359383AbhCCOSh (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 3 Mar 2021 09:18:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449556AbhCCDw0 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 2 Mar 2021 22:52:26 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0CCC061356
        for <linux-ia64@vger.kernel.org>; Tue,  2 Mar 2021 19:51:45 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id l7so11092803pfd.3
        for <linux-ia64@vger.kernel.org>; Tue, 02 Mar 2021 19:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J/WwC7XpCpLdRKvSODXo8MNjiIi62pYyzRH9FxG+Ygk=;
        b=W78dqyagLrNKwYoOk6a/f7V4VtRsEVmX6vtwPHLWto0D4MP3SlxNJSYyvxqgcOscqz
         GPwtas1tEe2b42SbdX5ap+q+ZV7zInUUsbz37Lm5Xmt4YvwA2hjt7J7ZMy2QR2meZG8b
         MH1+KlbrbBcNzmOLZtNmUucWn8P9x4LnYDQf7C2QnRYiVYpgxoZb/F+s8A7e6xZOZABe
         4BxjK3z2TZvYynKa6x5zkZlwkNr/om/Ya+DMMditU12NPhS3MbU0mfQEC4trXp37Tkwf
         MsIqjDONfgTJuIu2uy29oxUH1Km4k19pJ44mFq9b7dJhY/r0ESNo110dA8DHKv8wS0cH
         4m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J/WwC7XpCpLdRKvSODXo8MNjiIi62pYyzRH9FxG+Ygk=;
        b=i2myQ1+KIhZLSOkOJ54XPLGe28v4/jESQ92Uv9xg7jG9959RgzXpdLs4reO+2/SkaO
         R6KYmUjn8Y6Unl3D5cgGcniuCrbOAD9QBmfLwEVqRhwajBQqViXXsuP8SLYLxk6KCPVJ
         LtbboiByfHdWIOLoamDt5uVUIoCpAc8Ud8AYtw/LLWwIAFmQ7WhqQOg0ov1Q5VmGnGj4
         0XY3tIGK21riOZsdGepz/RQVc17FS2MvqzX+5VoAFcoi1VgC8343CuzUmm7nNvjBjZpm
         p78TT80reEiYRw/7LlGl4bvgm+ulpr9P2tqhfUS5RSfIvvyflBYhDu86xxXnviEVDClR
         KDMQ==
X-Gm-Message-State: AOAM532a/wwqtSEdxQntNwuAPWHb8vrVimGH+ZBqci7HRPI5oMe6Zvtk
        86lV24jnila5uJnosbK5z2HBrw==
X-Google-Smtp-Source: ABdhPJy83YrKRMVE69iP/V4B/4ZQVUdKANpYnblcMJtaT3iqfS3nxLM/96z5pNMwID29BVSnHlQsjw==
X-Received: by 2002:aa7:9550:0:b029:1ee:46a:b8f7 with SMTP id w16-20020aa795500000b02901ee046ab8f7mr22942114pfq.11.1614743505231;
        Tue, 02 Mar 2021 19:51:45 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id 15sm23199992pfa.58.2021.03.02.19.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 19:51:44 -0800 (PST)
Subject: Re: 5.11 regression: "ia64: add support for TIF_NOTIFY_SIGNAL" breaks
 ia64 boot
From:   Jens Axboe <axboe@kernel.dk>
To:     Sergei Trofimovich <slyich@gmail.com>
Cc:     linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210222230519.73f3e239@sf>
 <cc658b61-530e-90bf-3858-36cc60468a24@kernel.dk> <20210222235359.75d1a912@sf>
 <d6cc2bfc-374c-6fb8-9c63-65b3dfebdf3e@kernel.dk>
 <30a833d8-44a0-284d-4fe4-e9a52f407043@kernel.dk>
 <a7e9e9a3-e5a2-fad0-560e-82c9819a60e7@kernel.dk> <20210223080830.23bccdbf@sf>
 <20210302220716.0b6f72ae@sf> <9cfaede7-d885-88a5-0bff-91b99b30a8d4@kernel.dk>
 <20210302232716.353ed49b@sf> <2b75ed33-01a0-727a-6241-40334245e4fd@kernel.dk>
Message-ID: <8756ecac-add9-2321-ce4c-516277f5da77@kernel.dk>
Date:   Tue, 2 Mar 2021 20:51:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2b75ed33-01a0-727a-6241-40334245e4fd@kernel.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 3/2/21 5:34 PM, Jens Axboe wrote:
> On 3/2/21 4:27 PM, Sergei Trofimovich wrote:
>> On Tue, 2 Mar 2021 15:31:13 -0700
>> Jens Axboe <axboe@kernel.dk> wrote:
>>
>>> On 3/2/21 3:07 PM, Sergei Trofimovich wrote:
>>>> On Tue, 23 Feb 2021 08:08:30 +0000
>>>> Sergei Trofimovich <slyich@gmail.com> wrote:
>>>>   
>>>>> On Mon, 22 Feb 2021 17:43:58 -0700
>>>>> Jens Axboe <axboe@kernel.dk> wrote:
>>>>>  
>>>>>> On 2/22/21 5:41 PM, Jens Axboe wrote:    
>>>>>>> On 2/22/21 5:34 PM, Jens Axboe wrote:      
>>>>>>>> On 2/22/21 4:53 PM, Sergei Trofimovich wrote:      
>>>>>>>>> On Mon, 22 Feb 2021 16:34:50 -0700
>>>>>>>>> Jens Axboe <axboe@kernel.dk> wrote:
>>>>>>>>>      
>>>>>>>>>> On 2/22/21 4:05 PM, Sergei Trofimovich wrote:      
>>>>>>>>>>> Hia Jens!
>>>>>>>>>>>
>>>>>>>>>>> Tried 5.11 on rx3600 box and noticed it has
>>>>>>>>>>> a problem handling init (5.10 booted fine):
>>>>>>>>>>>
>>>>>>>>>>> INIT: version 2.98 booting
>>>>>>>>>>>
>>>>>>>>>>>    OpenRC 0.42.1 is starting up Gentoo Linux (ia64)
>>>>>>>>>>>
>>>>>>>>>>> mkdir `/run/openrc': Read-only file system
>>>>>>>>>>> mkdir `/run/openrc/starting': No such file or directory
>>>>>>>>>>> mkdir `/run/openrc/started': No such file or directory
>>>>>>>>>>> mkdir `/run/openrc/stopping': No such file or directory
>>>>>>>>>>> mkdir `/run/openrc/inactive': No such file or directory
>>>>>>>>>>> mkdir `/run/openrc/wasinactive': No such file or directory
>>>>>>>>>>> mkdir `/run/openrc/failed': No such file or directory
>>>>>>>>>>> mkdir `/run/openrc/hotplugged': No such file or directory
>>>>>>>>>>> mkdir `/run/openrc/daemons': No such file or directory
>>>>>>>>>>> mkdir `/run[   14.595059] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>>>>>>>>>>> [   14.599059] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>>>>>>>>>>>
>>>>>>>>>>> I suspect we build bad signal stack frame for userspace.
>>>>>>>>>>>
>>>>>>>>>>> With a bit of #define DEBUG_SIG 1 enabled the signals are SIGCHLD:
>>>>>>>>>>>
>>>>>>>>>>> [   34.969771] SIG deliver (gendepends.sh:69): sig=17 sp=60000fffff6aeaa0 ip=a000000000040740 handler=000000004b4c59b6
>>>>>>>>>>> [   34.969948] SIG deliver (init:1): sig=17 sp=60000fffff1ccc50 ip=a000000000040740 handler=000000004638b9e5
>>>>>>>>>>> [   34.969948] SIG deliver (gendepends.sh:69): sig=17 sp=60000fffff6adf90 ip=a000000000040740 handler=000000004b4c59b6
>>>>>>>>>>> [   34.973948] SIG deliver (init:1): sig=17 sp=60000fffff1cc140 ip=a000000000040740 handler=000000004638b9e5
>>>>>>>>>>> [   34.973948] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>>>>>>>>>>> [   34.973948] SIG deliver (gendepends.sh:69): sig=17 sp=60000fffff6ad480 ip=a000000000040740 handler=000000004b4c59b6
>>>>>>>>>>> [   34.973948] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>>>>>>>>>>>
>>>>>>>>>>> Bisect points at:
>>>>>>>>>>>
>>>>>>>>>>> commit b269c229b0e89aedb7943c06673b56b6052cf5e5
>>>>>>>>>>> Author: Jens Axboe <axboe@kernel.dk>
>>>>>>>>>>> Date:   Fri Oct 9 14:49:43 2020 -0600
>>>>>>>>>>>
>>>>>>>>>>>     ia64: add support for TIF_NOTIFY_SIGNAL
>>>>>>>>>>>
>>>>>>>>>>>     Wire up TIF_NOTIFY_SIGNAL handling for ia64.
>>>>>>>>>>>
>>>>>>>>>>>     Cc: linux-ia64@vger.kernel.org
>>>>>>>>>>>     [axboe: added fixes from Mike Rapoport <rppt@kernel.org>]
>>>>>>>>>>>     Signed-off-by: Jens Axboe <axboe@kernel.dk>
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/arch/ia64/include/asm/thread_info.h b/arch/ia64/include/asm/thread_info.h
>>>>>>>>>>> index 64a1011f6812..51d20cb37706 100644
>>>>>>>>>>> --- a/arch/ia64/include/asm/thread_info.h
>>>>>>>>>>> +++ b/arch/ia64/include/asm/thread_info.h
>>>>>>>>>>> @@ -103,6 +103,7 @@ struct thread_info {
>>>>>>>>>>>  #define TIF_SYSCALL_TRACE      2       /* syscall trace active */
>>>>>>>>>>>  #define TIF_SYSCALL_AUDIT      3       /* syscall auditing active */
>>>>>>>>>>>  #define TIF_SINGLESTEP         4       /* restore singlestep on return to user mode */
>>>>>>>>>>> +#define TIF_NOTIFY_SIGNAL      5       /* signal notification exist */
>>>>>>>>>>>  #define TIF_NOTIFY_RESUME      6       /* resumption notification requested */
>>>>>>>>>>>  #define TIF_MEMDIE             17      /* is terminating due to OOM killer */
>>>>>>>>>>>  #define TIF_MCA_INIT           18      /* this task is processing MCA or INIT */
>>>>>>>>>>> @@ -115,6 +116,7 @@ struct thread_info {
>>>>>>>>>>>  #define _TIF_SINGLESTEP                (1 << TIF_SINGLESTEP)
>>>>>>>>>>>  #define _TIF_SYSCALL_TRACEAUDIT        (_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT|_TIF_SINGLESTEP)
>>>>>>>>>>>  #define _TIF_NOTIFY_RESUME     (1 << TIF_NOTIFY_RESUME)
>>>>>>>>>>> +#define _TIF_NOTIFY_SIGNAL     (1 << TIF_NOTIFY_SIGNAL)
>>>>>>>>>>>  #define _TIF_SIGPENDING                (1 << TIF_SIGPENDING)
>>>>>>>>>>>  #define _TIF_NEED_RESCHED      (1 << TIF_NEED_RESCHED)
>>>>>>>>>>>  #define _TIF_MCA_INIT          (1 << TIF_MCA_INIT)
>>>>>>>>>>> @@ -124,7 +126,7 @@ struct thread_info {
>>>>>>>>>>>
>>>>>>>>>>>  /* "work to do on user-return" bits */
>>>>>>>>>>>  #define TIF_ALLWORK_MASK       (_TIF_SIGPENDING|_TIF_NOTIFY_RESUME|_TIF_SYSCALL_AUDIT|\
>>>>>>>>>>> -                                _TIF_NEED_RESCHED|_TIF_SYSCALL_TRACE)
>>>>>>>>>>> +                                _TIF_NEED_RESCHED|_TIF_SYSCALL_TRACE|_TIF_NOTIFY_SIGNAL)
>>>>>>>>>>>  /* like TIF_ALLWORK_BITS but sans TIF_SYSCALL_TRACE or TIF_SYSCALL_AUDIT */
>>>>>>>>>>>  #define TIF_WORK_MASK          (TIF_ALLWORK_MASK&~(_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT))
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
>>>>>>>>>>> index 6b61a703bcf5..8d4e1cab9190 100644
>>>>>>>>>>> --- a/arch/ia64/kernel/process.c
>>>>>>>>>>> +++ b/arch/ia64/kernel/process.c
>>>>>>>>>>> @@ -171,7 +171,8 @@ do_notify_resume_user(sigset_t *unused, struct sigscratch *scr, long in_syscall)
>>>>>>>>>>>         }
>>>>>>>>>>>
>>>>>>>>>>>         /* deal with pending signal delivery */
>>>>>>>>>>> -       if (test_thread_flag(TIF_SIGPENDING)) {
>>>>>>>>>>> +       if (test_thread_flag(TIF_SIGPENDING) ||
>>>>>>>>>>> +           test_thread_flag(TIF_NOTIFY_SIGNAL)) {
>>>>>>>>>>>                 local_irq_enable();     /* force interrupt enable */
>>>>>>>>>>>                 ia64_do_signal(scr, in_syscall);
>>>>>>>>>>>
>>>>>>>>>>> which looks benign, but it enables a bit of conditional
>>>>>>>>>>> TIF_NOTIFY_SIGNAL handling I don't understand.
>>>>>>>>>>>
>>>>>>>>>>> Can you help me get what is the interaction between
>>>>>>>>>>> TIF_NOTIFY_SIGNAL and TIF_SIGPENDING for
>>>>>>>>>>> simple processes without io_uring use case?
>>>>>>>>>>>
>>>>>>>>>>> I wonder if it's ia64_do_signal()' generates a signal
>>>>>>>>>>> delivery when it should not.        
>>>>>>>>>>
>>>>>>>>>> Can you test:
>>>>>>>>>>
>>>>>>>>>> https://marc.info/?l=linux-ia64&m=161187407609443&w=1
>>>>>>>>>>
>>>>>>>>>> with the addition mentioned here:      
>>>>>>>>>
>>>>>>>>> Not enough:
>>>>>>>>>
>>>>>>>>> mkdir `/run/openrc': Read-only file system
>>>>>>>>> mkdir `/run/openrc/starting': No such file or directory
>>>>>>>>> mkdir `/run/openrc/started': No such file or directory
>>>>>>>>> mkdir `/run/openrc/stopping': No such file or directory
>>>>>>>>> mkdir `/run/openrc/inactive': No such file or directory
>>>>>>>>> mkdir `/run/openrc/wasinactive': No such file or directory
>>>>>>>>> mkdir `/run/openrc/failed': No such file or directory
>>>>>>>>> mkdir `/run/openrc/hotplugged': No such file or directory
>>>>>>>>> mkdir `/run/openrc/daemons': No such file or directory
>>>>>>>>> [   14.554357] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>>>>>>>>> [   14.554357] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>>>>>>>>> mkdir `/run/openrc/options': No such file or directory
>>>>>>>>> mkdir `/run/openrc/exclusive': No such file or directory
>>>>>>>>> mkdir `/run/openrc/scheduled': No such file or directory
>>>>>>>>> mkdir `/run/openrc/tmp': No such file or directory
>>>>>>>>>      
>>>>>>>>>> https://marc.info/?l=linux-ia64&m=161187470709706&w=1
>>>>>>>>>>
>>>>>>>>>> if needed?      
>>>>>>>>>
>>>>>>>>> Two patches above do fix the boot \o/ But have a lot of spam about
>>>>>>>>> 'signal 0' delivery to a bunch of processes:
>>>>>>>>>
>>>>>>>>>  * Mounting /proc ...
>>>>>>>>>  [ ok ]
>>>>>>>>>  * Mounting /run ...
>>>>>>>>>  * /run/openrc: creating directory
>>>>>>>>>  * /run/lock: creating directory
>>>>>>>>>  * /run/lock: correcting owner
>>>>>>>>>  * Caching service dependencies ...
>>>>>>>>>  [ ok ]
>>>>>>>>>  * Mounting /sys ...
>>>>>>>>>  [ ok ]
>>>>>>>>>  * Mounting debug filesystem ...
>>>>>>>>>  [ ok ]
>>>>>>>>>  * Mounting efivarfs filesystem ...
>>>>>>>>>  [ ok ]
>>>>>>>>>  * sysfs: caught unknown signal 0
>>>>>>>>>  * openrc: caught unknown signal 0
>>>>>>>>>  * Mounting cgroup filesystem ...      
>>>>>>>>
>>>>>>>> That's an improvement! Let me take a look at this tonight and see if I
>>>>>>>> can figure out what's going on. But yes, it's the ia64 signal delivery
>>>>>>>> being just different enough from the norm that it apparently triggers
>>>>>>>> some weirdness.      
>>>>>>>
>>>>>>> Is this any better?      
>>>>>>
>>>>>> And if that one works, can you try this basic variant?    
>>>>>
>>>>> Both patches boot successfully without 'caught unknown signal 0' spam \o/
>>>>>  
>>>>>> diff --git a/arch/ia64/kernel/signal.c b/arch/ia64/kernel/signal.c
>>>>>> index e67b22fc3c60..c1b299760bf7 100644
>>>>>> --- a/arch/ia64/kernel/signal.c
>>>>>> +++ b/arch/ia64/kernel/signal.c
>>>>>> @@ -341,7 +341,8 @@ ia64_do_signal (struct sigscratch *scr, long in_syscall)
>>>>>>  	 * need to push through a forced SIGSEGV.
>>>>>>  	 */
>>>>>>  	while (1) {
>>>>>> -		get_signal(&ksig);
>>>>>> +		if (!get_signal(&ksig))
>>>>>> +			break;
>>>>>>  
>>>>>>  		/*
>>>>>>  		 * get_signal() may have run a debugger (via notify_parent())
>>>>>>  
>>>>
>>>> Should I send the patch in `git am`-able form or the patch 
>>>> already queued up in some other form?  
>>>
>>> I'll be happy to queue it up. I take it you tried the above one-liner and it
>>> works for you. Just trying to get some clarity on what was tried so I can
>>> queue it up appropriately.
>>
>> Yes, 1.5 liner with
>>
>>>>>> -		get_signal(&ksig);
>>>>>> +		if (!get_signal(&ksig))
>>>>>> +			break;
>>
>> made 5.11 boot successfully.
>>
>> Tested-by: Sergei Trofimovich <slyich@gmail.com>
> 
> Awesome! Queued it up:
> 
> https://git.kernel.dk/cgit/linux-block/commit/?h=misc-5.12&id=f5f4fc4649ae542b1a25670b17aaf3cbb6187acc

This is now in Linus's tree.

-- 
Jens Axboe

