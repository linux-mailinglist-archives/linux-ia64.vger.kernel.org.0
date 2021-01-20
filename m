Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D287E2FD52C
	for <lists+linux-ia64@lfdr.de>; Wed, 20 Jan 2021 17:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391316AbhATQNU (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 20 Jan 2021 11:13:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389807AbhATQMo (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 20 Jan 2021 11:12:44 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213E9C061757
        for <linux-ia64@vger.kernel.org>; Wed, 20 Jan 2021 08:12:04 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id l23so2487363pjg.1
        for <linux-ia64@vger.kernel.org>; Wed, 20 Jan 2021 08:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CqHqnHcIJaCkWPW9HWa5KJzCYCaCgCZY4xECqzhyIRY=;
        b=uEG4tyBew5EmT9IrbaFxW3oQ82bRK5NkQ2bIyGxvNUyPlDfZLQODz5JJoWio/8+PUU
         BLr22Ij+kAaz40sICmJ7TBYvHiaeWZeWPNoqRBA9wJUBht2UohsCAtDETTBMD0bmR/TY
         iUPrMjH654zBqtaGwwTBtSxmxETwQvxOtOy0sb0VSt7bxXCAxMkyU7/E05NtBNAViLfE
         gT3s0QopWuvpfyCn6U8Ib7BNiMbDXwJsW9qYIBMIsAYyy01UV5KQMnrlx2haJzbKzIbh
         KemDMb+nEikDnuNvLBYefGRFG3JNgIY6QTarDcBdKpeY+ZLwlIRmj/MnleIK0igpvdSS
         Yp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CqHqnHcIJaCkWPW9HWa5KJzCYCaCgCZY4xECqzhyIRY=;
        b=dcwz7Z3T6nLrMGOpe18ONlFk4SRK/pRjMnGkvSKheNwKw8HrmBDhRPmf9xTlz9TjYB
         nOqgQUjNe5GrV+SGZGVKVPEQYGYeu8wX2bW7OrCWD3QyKeucLoO/ioZFm1Fk7EiyiFEs
         gELTp6YzSXXNZYAfknhyIygk/z68/qmnHVHnwL+n8UdZH8uow23HckmvQV6+gMoMEIf0
         fSxuJTDcE9ycAg/BVNrfN9r5jBYlwOpPlHNrvSzjMW69C+YIKcFfYqrGWvmwZ46Xh6Ug
         gSouz7ocA8opyA4dyjO0XEtzjYiih+64eRP+AitxmHNRzDowV3Fvz3iPhUpL8xlQ8O/2
         eERQ==
X-Gm-Message-State: AOAM5329t1exovRifcANqYF6IaIfKexMpbf2sXM07tFo9g6/qgb0OwNs
        tNJF0d5Upc90qgGFPVp2QWM2XWV2uno/Iw==
X-Google-Smtp-Source: ABdhPJwIlIn6kJHIk2AhmDW7nhhNidS031J8Ha1rmAXknXaEVr+vzHISWXDAleG/vpne5V90BWrfIw==
X-Received: by 2002:a17:90a:d913:: with SMTP id c19mr2152897pjv.19.1611159123658;
        Wed, 20 Jan 2021 08:12:03 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id j6sm2972946pjd.33.2021.01.20.08.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 08:12:03 -0800 (PST)
Subject: Re: [PATCH] ia64: add support for TIF_NOTIFY_SIGNAL
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-ia64@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <d3a2aa1e-0fae-1d3f-519f-d32adc608c38@kernel.dk>
 <71d32a91-c429-7405-f4a6-58c74eb898bf@physik.fu-berlin.de>
 <477eb7cf-cbf8-540e-c355-41b7e5ed558f@kernel.dk>
 <17cd57b5-c728-193f-3776-d6fcceeedcbb@physik.fu-berlin.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <04b3bda1-3d27-ff70-e8a1-4dae62e2033f@kernel.dk>
Date:   Wed, 20 Jan 2021 09:12:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <17cd57b5-c728-193f-3776-d6fcceeedcbb@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 1/20/21 9:09 AM, John Paul Adrian Glaubitz wrote:
> On 1/20/21 5:08 PM, Jens Axboe wrote:
>>> This change broke the hpsa driver on my RX-2600 ia64 workstation in the sense that the
>>> driver no longer loads and hence hard disks are no longer recognized.
>>
>> What does "no longer loads" mean? Does it hang?
> 
> It does not load at all. The driver no longer shows up in the kernel message buffer
> and therefore no disks are found.

Really should be no relation there at all. Is it built-in or modular?

>>> Any idea what could be wrong?
>>
>> Can you try current -git? There's a task_work related fix in there which is
>> related to this series, maybe that's it...
> 
> I can. However, I already tested 5.11-rc4 before I sent the mail.

-rc4 doesn't have the fix, it wasn't merged until yesterday. I doubt
that it's related to this though...

-- 
Jens Axboe

