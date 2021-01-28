Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789AD30814B
	for <lists+linux-ia64@lfdr.de>; Thu, 28 Jan 2021 23:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbhA1Wnm (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 28 Jan 2021 17:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbhA1WnT (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 28 Jan 2021 17:43:19 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC184C061574
        for <linux-ia64@vger.kernel.org>; Thu, 28 Jan 2021 14:42:37 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id kx7so4732478pjb.2
        for <linux-ia64@vger.kernel.org>; Thu, 28 Jan 2021 14:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mg5GHxCWHBDuJd0ZDCdUUqwWrZOd+gaS2UXbK/MHIdw=;
        b=AcqFjFTs2gh+Q3mGwSaJxPoQSGtQr/8N1VT3n7Z3xp8bilaEwBROXER+crbcNq6skK
         rcV1VlrTZO9Nretm0Ypk4X6CiPt0lCNoY11/DTQZEDxkxfBdYM/2yXXISXKGS+zAYtMY
         6MYMNqovkSykQwBMkkEMqdBCrCq4cvNv4a9LKfzxmBkL5DqRQs1z9WkGVuC6y9KIbsvW
         OMy3lb3ItC41+FIjYwoW6IXS+J5dnvSVVhDXOBuzshFwizI6765CJKZTYhLyQuAZGTip
         PIBtQiUOornCylg2/8o+KlofIXwPd3P5N95J5sW/8YJRunSL2+4PJJQ0SnXrnMWqShR1
         w4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mg5GHxCWHBDuJd0ZDCdUUqwWrZOd+gaS2UXbK/MHIdw=;
        b=i7W9OSse9vGWJOCqvteaOoLRamNcPYdqjjnBeCzESZa5kjLDjKWjnj+8RqAeluY4Du
         8iJ0BAgCDscrEK2NxONP4ra9ozV8ooN+vtojn/0N/3AUzpOi6ngB1tjNGrOiu6Q1pbqy
         wArw1cI8j8FyXKZiW17wOTUTXo/RNwK9fdwGM2yqvO+TjSSdRhOxDgWCRKB8zB1UYA4/
         QPcmapQkDWnhbRFkgINVDe9ArFMO6ezpvJ+cavapItG+pAEryeZI9db1SU+pJitoKwOK
         +5tnX3aaPWAPZX2KxS+13V9ZCaT8M5/BH0wJxVF4iQ2UEGqEEVLVWewHsEqRJvJLx3dq
         Cq7g==
X-Gm-Message-State: AOAM532GcUZMjtVk+iuXaHLJSfFMVKfGav5fxrVJVPICQpK7Fr2VXlNg
        AOHsXjAgw/HWlGDN2IWrnRPFUud2wKgXxA==
X-Google-Smtp-Source: ABdhPJw1F4l1/35rRcBRZdo7Hb79OAQAKwlzZTSMtA0Hng87apN9NHQkp0WhVX3zov9Gvq/YmagU1Q==
X-Received: by 2002:a17:902:eb12:b029:df:f561:c06b with SMTP id l18-20020a170902eb12b02900dff561c06bmr1324629plb.39.1611873757228;
        Thu, 28 Jan 2021 14:42:37 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id y16sm6689897pgg.20.2021.01.28.14.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 14:42:35 -0800 (PST)
Subject: Re: [PATCH] ia64: add support for TIF_NOTIFY_SIGNAL
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-ia64@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <d3a2aa1e-0fae-1d3f-519f-d32adc608c38@kernel.dk>
 <71d32a91-c429-7405-f4a6-58c74eb898bf@physik.fu-berlin.de>
 <477eb7cf-cbf8-540e-c355-41b7e5ed558f@kernel.dk>
 <4c01b344-b5bf-df4f-24f3-325de354ce50@physik.fu-berlin.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <30e8ec23-476a-89f6-3ec0-3724bfcff3b4@kernel.dk>
Date:   Thu, 28 Jan 2021 15:42:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4c01b344-b5bf-df4f-24f3-325de354ce50@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 1/28/21 12:22 PM, John Paul Adrian Glaubitz wrote:
> Hi Jens!
> 
> On 1/20/21 5:08 PM, Jens Axboe wrote:
>>> This change broke the hpsa driver on my RX-2600 ia64 workstation in the sense that the
>>> driver no longer loads and hence hard disks are no longer recognized.
>>
>> What does "no longer loads" mean? Does it hang?
>>
>>> Any idea what could be wrong?
>>
>> Can you try current -git? There's a task_work related fix in there which is
>> related to this series, maybe that's it...
> 
> I just tried Linus' current tree (ge5ff2cb9cf67) and the problem still persists.

Funky... Can you see if this helps?

diff --git a/arch/ia64/kernel/signal.c b/arch/ia64/kernel/signal.c
index e67b22fc3c60..7de57ace4799 100644
--- a/arch/ia64/kernel/signal.c
+++ b/arch/ia64/kernel/signal.c
@@ -358,9 +358,6 @@ ia64_do_signal (struct sigscratch *scr, long in_syscall)
 			 */
 			restart = 0;
 
-		if (ksig.sig <= 0)
-			break;
-
 		if (unlikely(restart)) {
 			switch (errno) {
 			case ERESTART_RESTARTBLOCK:
@@ -381,6 +378,9 @@ ia64_do_signal (struct sigscratch *scr, long in_syscall)
 			}
 		}
 
+		if (ksig.sig <= 0)
+			break;
+
 		/*
 		 * Whee!  Actually deliver the signal.  If the delivery failed, we need to
 		 * continue to iterate in this loop so we can deliver the SIGSEGV...

-- 
Jens Axboe

