Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC49D30819C
	for <lists+linux-ia64@lfdr.de>; Thu, 28 Jan 2021 23:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbhA1W6C (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 28 Jan 2021 17:58:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbhA1W4u (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 28 Jan 2021 17:56:50 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88D1C061573
        for <linux-ia64@vger.kernel.org>; Thu, 28 Jan 2021 14:56:09 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id u15so4207426plf.1
        for <linux-ia64@vger.kernel.org>; Thu, 28 Jan 2021 14:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qhEU96AaqUAX8iQlz7vbl9iacrXd702OB0pU92Jc1zo=;
        b=CGAEcmjGdTek5oAg43ul70BCIQlzXsTkkWZBn3MxmtmZREhr7z4Z3X54+YNiX1JG6L
         qlP0ZkUz1Mjh+pFB1YZd/nsTk1kDtm/fx33aaI0VSWiVoNcEMmkTUxD0MrBL7ra5rrGH
         81U2ulRWJS0UuFbR1TmjMqhKVpJUBqjwOnc3mrjUf9S1jcYhXVG2m4Y/mJWVUxOROE1j
         vJucDIAHjfSIdHWxkF3DW5XolUYxnS1cITR+vLbBENiRuQFBDr5A7+ScceHEZxtIjGMG
         PAQkkLh8kMjZKIbS8d7PfvY467glAiurugHTeUKnmS3Edcmx7TtRAXEujiZqj6NXyUCp
         igJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qhEU96AaqUAX8iQlz7vbl9iacrXd702OB0pU92Jc1zo=;
        b=olCDaXbNovRJBeEOyW5dPlEYyhhwPBQKBeNPGYqi3hj4zZYUWaHu44/x5zePaW09uo
         An8ZnCcSHnG0QQbrPh203RCW80/Q9iwTPsCU3clEauDUgG1IJpmeCvCvGwBParZnFHve
         MpMM9YIB5JBEFWc6gsNJdkFrUNSYxPB3yU0xDuwnibZ2uZmNNcEFlDnYA1BRRe4UEOcl
         FUiFb/pEjyLn+oxYvAF2IvDCG4QrQclGImSIS4buRe7+AZsJMFv7D/Z2SuNAtsqiqIAN
         XZZEwEr1Cwryrg3Tv3nvj61yEgAVAi9p/S5TCfpjjJc0cKpsGGhyOFdYxxR7Hxn2dIT5
         XTjA==
X-Gm-Message-State: AOAM5301wOI8O7Jce15hEXfTJe2XKhgEXHDBf/rrSiZoh4raz2+yccOO
        We9Kxb5m4tTEpu7pbI67yJ3SXVgEyxHnXw==
X-Google-Smtp-Source: ABdhPJx7RVUn7Ad6VmPrPxQeCy5R701bnUusq1UEH0huJWoJJEYADfcT6kNWoKajMtOGBEt0/Ln1bw==
X-Received: by 2002:a17:90a:4504:: with SMTP id u4mr1598046pjg.218.1611874569378;
        Thu, 28 Jan 2021 14:56:09 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id h1sm6427243pgj.59.2021.01.28.14.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 14:56:08 -0800 (PST)
Subject: Re: [PATCH] ia64: add support for TIF_NOTIFY_SIGNAL
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-ia64@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <d3a2aa1e-0fae-1d3f-519f-d32adc608c38@kernel.dk>
 <71d32a91-c429-7405-f4a6-58c74eb898bf@physik.fu-berlin.de>
 <477eb7cf-cbf8-540e-c355-41b7e5ed558f@kernel.dk>
 <4c01b344-b5bf-df4f-24f3-325de354ce50@physik.fu-berlin.de>
 <30e8ec23-476a-89f6-3ec0-3724bfcff3b4@kernel.dk>
 <82f1e3d1-c16b-8974-2781-31214d229a11@physik.fu-berlin.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <e9788776-d309-3936-aa11-78906d90c3c8@kernel.dk>
Date:   Thu, 28 Jan 2021 15:56:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <82f1e3d1-c16b-8974-2781-31214d229a11@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 1/28/21 3:51 PM, John Paul Adrian Glaubitz wrote:
> On 1/28/21 11:42 PM, Jens Axboe wrote:
>>> I just tried Linus' current tree (ge5ff2cb9cf67) and the problem still persists.
>>
>> Funky... Can you see if this helps?
>>
>> diff --git a/arch/ia64/kernel/signal.c b/arch/ia64/kernel/signal.c
>> index e67b22fc3c60..7de57ace4799 100644
>> --- a/arch/ia64/kernel/signal.c
>> +++ b/arch/ia64/kernel/signal.c
>> @@ -358,9 +358,6 @@ ia64_do_signal (struct sigscratch *scr, long in_syscall)
>>  			 */
>>  			restart = 0;
>>  
>> -		if (ksig.sig <= 0)
>> -			break;
>> -
>>  		if (unlikely(restart)) {
>>  			switch (errno) {
>>  			case ERESTART_RESTARTBLOCK:
>> @@ -381,6 +378,9 @@ ia64_do_signal (struct sigscratch *scr, long in_syscall)
>>  			}
>>  		}
>>  
>> +		if (ksig.sig <= 0)
>> +			break;
>> +
>>  		/*
>>  		 * Whee!  Actually deliver the signal.  If the delivery failed, we need to
>>  		 * continue to iterate in this loop so we can deliver the SIGSEGV...
> 
> This one doesn't help. Will try the other in a minute.

Also looks like you might need to add a:

	ksig.sig = 0;

right above get_signal(), just in case. For the 2nd patch, I mean. But thanks
for testing, interested if the other one will do it...

-- 
Jens Axboe

