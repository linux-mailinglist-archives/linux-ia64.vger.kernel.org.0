Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5448F2A8496
	for <lists+linux-ia64@lfdr.de>; Thu,  5 Nov 2020 18:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731693AbgKERPh (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 5 Nov 2020 12:15:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgKERPf (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 5 Nov 2020 12:15:35 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8723BC0613D2
        for <linux-ia64@vger.kernel.org>; Thu,  5 Nov 2020 09:15:33 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id r9so2562685ioo.7
        for <linux-ia64@vger.kernel.org>; Thu, 05 Nov 2020 09:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MDVz0BYmGnQ2gofOIEnVxLEZI7aVyupKXOj2vDPWo3I=;
        b=u7+xVON+XlJJ4nFAqg3JBXRglp0YxYrevKYCVFFXCW7nImYygB+uiRpdan6vq2ld2y
         AGSRkuMjXAme8cWpE3LhJMyz666JLd18pX3UrQthUXf41qy8EeqFoXT5TuP25gt8E8VH
         3L2Ud1wB60qpt/84eJPbVNLHNBjScUjFrefAkvC9aBliJ1Iy4SjV+wzcUcwkd7o3+iuo
         ITlt85FrYUmyCOjC8tflccgEkgOnZFs2s1sbIfcrOtx4qWE2iwliTAUE9t1aVFtHo4L8
         xcM50t0trLvgbKeNfyQ5m2SxhAQ83JneT+HjCp1J1YC95hhnhUljPB+/BJOUefZ21DCn
         0jWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MDVz0BYmGnQ2gofOIEnVxLEZI7aVyupKXOj2vDPWo3I=;
        b=KPh+tgTeM+QseuFHghwbb/UJu8ed1ix/nLglJjV5AVAc0KfcBm7CEAwOximAyaPUkw
         LfX6DmwFmlWZTZZagtalFlRq8zmwkDXaqvKQwbcBuKFSU5WpI6IZguMocT7sbwBBep/H
         bUv9DV/rCzdhZas/r31thHwNASjreQ9z5AfEluDm3rrxIYpKcbFeqgZ/yF2MiNwpn96T
         SbkSnJncM34uHdAVOFziLETsBcf98+9P38bdgpohrV5TCrUYJg06eTryKZMlYvox/Rnv
         zs8h+A5Yj44sID5hQt0DtGHiDaXiVj2et/USD8L8TjCQhyKSyFTpKtO+piwLRXszsm5T
         fRvw==
X-Gm-Message-State: AOAM530VGzRPiHjGEsN+gFvRS9m1NTy+o+GfPjKk9ubFZNPGB8NsEa04
        S/T9+bjMPDu0agUlcKlz1jELsCo32Wc3EQ==
X-Google-Smtp-Source: ABdhPJx3e4RATqt5GiJBabS1KxGvzXuSeEPWRKTV8e65RVnozR1FkAI50It+3TAvulbrrP9HgvPwxg==
X-Received: by 2002:a02:b146:: with SMTP id s6mr1564252jah.10.1604596532605;
        Thu, 05 Nov 2020 09:15:32 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id k15sm1449425ils.87.2020.11.05.09.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 09:15:32 -0800 (PST)
Subject: Re: [PATCH] sh: add support for TIF_NOTIFY_SIGNAL
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-sh@vger.kernel.org,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
References: <5fcc82b4-89ae-3bca-10ab-6ad933565cee@kernel.dk>
 <ae29ab73-ee7a-2bb7-3fd8-3037f40c1cbd@kernel.dk>
 <5611bde9-67e7-6ff6-defc-9b02ea830fac@physik.fu-berlin.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <9ea14eb3-d698-5499-ba4c-c6a3c35cd8d4@kernel.dk>
Date:   Thu, 5 Nov 2020 10:15:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5611bde9-67e7-6ff6-defc-9b02ea830fac@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 11/5/20 9:20 AM, John Paul Adrian Glaubitz wrote:
> Hi Jens!
> 
> On 11/5/20 5:17 PM, Jens Axboe wrote:
>> Gentle nudge on this one.
> 
> I can build- and boot-test on SH and IA64.

That'd be great, thanks!

> I assume Rich will be fine with the SH changes, not sure about the IA64 and Tony.

Let's add Tony - maybe he'll have a chance to take a look at the ia64 change.

-- 
Jens Axboe

