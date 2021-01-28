Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28370308164
	for <lists+linux-ia64@lfdr.de>; Thu, 28 Jan 2021 23:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbhA1Wrg (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 28 Jan 2021 17:47:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbhA1Wqg (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 28 Jan 2021 17:46:36 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCC9C061786
        for <linux-ia64@vger.kernel.org>; Thu, 28 Jan 2021 14:45:54 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id s23so4013975pgh.11
        for <linux-ia64@vger.kernel.org>; Thu, 28 Jan 2021 14:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BEkDi56T/7dzEeq0Zm/MOZPIzJcYoXNganwzuXKDk5I=;
        b=pQCkYEIW8EsbJvBraZ4WSz9Ikr5zrdJv7jt+bI9afRUXaa+JUMRlJF6+G4RzIOKgIF
         pbnQhcmndecf9bmmfYymVEcL/yPCgA5/s2EQPzaBXeAnRX1W5RiFSaa2W3vNSt7MRtz+
         nEm9PrD7XazbSh02g83DsLKGArK0MVet39EseQKAL6KxKwof4NhgWeZ2CI6TGvSKBctT
         xdooZl7CMPi/8vJgBeyHDcW+m1TaFmBDiFvy4zde81BQ90ovNrKL3955HlsqcG9mOC5g
         BHRGuOptBcwM1qMcqbNVCknsYyQAAJ/jiIwq4HmUK/ADCGpnMMY9mzWlA7V+v9tSfRxs
         212g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BEkDi56T/7dzEeq0Zm/MOZPIzJcYoXNganwzuXKDk5I=;
        b=W4+ub6rV7OvALQ8IXDIqshZVcsxUg2elGZLUcYz/OjBJ01XMSqAoMIsSyXs8A7JbSt
         w8Ti2IECWqhASgqbsUAvVqFTbOejfUikH1ed/sNnab7PDmHxlOPQLJZLq7w8wKzmT6rN
         R4ZfZK9ysv+miGt4kwv5gg8zcMDJ+/Kb9Sqhgy8VgFyDEQFVOXH00NOFSZLtq6TSDpq/
         uxvyBdt1ZGitMjOtavOBKNUdGX7cUzKmF/E3sxlaKt/y2lDporRTWaDoVLTt2DlMC65N
         xKpVPHzZWzfRjabTujQE/29dGsXb4Lg89MBUXn1FcO2qvgyz5yUFXyJqAMrwZ/6QbHzw
         ESZQ==
X-Gm-Message-State: AOAM533XnanzxTQ/RWnka3+CPXTI3xLWztXyFv7D5BPt3rv58s+3HwMl
        642iK5ECa1H+PEaX08Yr0L61MQcp2qP4Fg==
X-Google-Smtp-Source: ABdhPJyUFBVSBEFxftF1TX5DiTZf5I3YC8XqivE8p9h2sWfiPw/nv/s7ZNQnx6EMgN8eMYuSltCwaQ==
X-Received: by 2002:a62:ac1a:0:b029:1a4:cb2a:2833 with SMTP id v26-20020a62ac1a0000b02901a4cb2a2833mr1413285pfe.35.1611873954291;
        Thu, 28 Jan 2021 14:45:54 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id p64sm6484302pfb.201.2021.01.28.14.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 14:45:53 -0800 (PST)
Subject: Re: [PATCH] ia64: add support for TIF_NOTIFY_SIGNAL
From:   Jens Axboe <axboe@kernel.dk>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-ia64@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <d3a2aa1e-0fae-1d3f-519f-d32adc608c38@kernel.dk>
 <71d32a91-c429-7405-f4a6-58c74eb898bf@physik.fu-berlin.de>
 <477eb7cf-cbf8-540e-c355-41b7e5ed558f@kernel.dk>
 <4c01b344-b5bf-df4f-24f3-325de354ce50@physik.fu-berlin.de>
 <30e8ec23-476a-89f6-3ec0-3724bfcff3b4@kernel.dk>
Message-ID: <61a8ba7e-1591-4c80-ccd8-6b820e3482d6@kernel.dk>
Date:   Thu, 28 Jan 2021 15:45:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <30e8ec23-476a-89f6-3ec0-3724bfcff3b4@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 1/28/21 3:42 PM, Jens Axboe wrote:
> On 1/28/21 12:22 PM, John Paul Adrian Glaubitz wrote:
>> Hi Jens!
>>
>> On 1/20/21 5:08 PM, Jens Axboe wrote:
>>>> This change broke the hpsa driver on my RX-2600 ia64 workstation in the sense that the
>>>> driver no longer loads and hence hard disks are no longer recognized.
>>>
>>> What does "no longer loads" mean? Does it hang?
>>>
>>>> Any idea what could be wrong?
>>>
>>> Can you try current -git? There's a task_work related fix in there which is
>>> related to this series, maybe that's it...
>>
>> I just tried Linus' current tree (ge5ff2cb9cf67) and the problem still persists.
> 
> Funky... Can you see if this helps?

Actually, this one might be better.

diff --git a/arch/ia64/kernel/signal.c b/arch/ia64/kernel/signal.c
index e67b22fc3c60..22d825f26668 100644
--- a/arch/ia64/kernel/signal.c
+++ b/arch/ia64/kernel/signal.c
@@ -340,7 +340,7 @@ ia64_do_signal (struct sigscratch *scr, long in_syscall)
 	 * This only loops in the rare cases of handle_signal() failing, in which case we
 	 * need to push through a forced SIGSEGV.
 	 */
-	while (1) {
+	do {
 		get_signal(&ksig);
 
 		/*
@@ -358,9 +358,6 @@ ia64_do_signal (struct sigscratch *scr, long in_syscall)
 			 */
 			restart = 0;
 
-		if (ksig.sig <= 0)
-			break;
-
 		if (unlikely(restart)) {
 			switch (errno) {
 			case ERESTART_RESTARTBLOCK:
@@ -387,7 +384,7 @@ ia64_do_signal (struct sigscratch *scr, long in_syscall)
 		 */
 		if (handle_signal(&ksig, scr))
 			return;
-	}
+	} while (ksig.sig > 0);
 
 	/* Did we come from a system call? */
 	if (restart) {

-- 
Jens Axboe

