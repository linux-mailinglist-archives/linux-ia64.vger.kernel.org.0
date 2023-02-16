Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C992699CEC
	for <lists+linux-ia64@lfdr.de>; Thu, 16 Feb 2023 20:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjBPTSC (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 16 Feb 2023 14:18:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjBPTSC (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 16 Feb 2023 14:18:02 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA71725955
        for <linux-ia64@vger.kernel.org>; Thu, 16 Feb 2023 11:17:59 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id t5so2704127oiw.1
        for <linux-ia64@vger.kernel.org>; Thu, 16 Feb 2023 11:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nOVlvsUBz2mNf5oykYZJP3CIj5NMFan6eI3l7bZzRvw=;
        b=Cj1DSIWgpSz+/e/0E+xF3TQVbmNA45pOIWbj6UcKt9o89U4vSWznB/hIogbVq1kgg+
         2uj2Eerr3zLOOan94X3vyJjND5rmt8OS5f3bCiT3ybzGHhJ0xjPoCiL0ii6Jj/9UpeXN
         C7rON8QrYPcNSBlaiNqWhDfgxJeEDvVoib75XM6FegxUOA9VUXt8HPt3uEp377dFfjDB
         LCN17veksRXImKe7d+W957GiEJ3Ox+V/tpKShCNTaexGHLB9QFUIe9Wi31k3sZBSMGlu
         AqW6hDaoR7vR0kMhCaEFj7sGNNJ/kd6nKBrcMxKAX+uXZvHY/vkTjdlNPXfM/tjOIUuS
         51BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOVlvsUBz2mNf5oykYZJP3CIj5NMFan6eI3l7bZzRvw=;
        b=LLY3ki1fHdQ1mEASURUmM1S0Mt372HfQvLrUTYIrtD4MbZz73wPVNeCt6vPUFAqU2i
         AHub245Z+WnrxT99yj2zfjfLQKxDk9OXogs6kM7PjoMXNsxzJe7+z29WLfm2vefUIHE/
         3ZmYX8SN0PUC1ZO1txtXZ3Jt49k35gUGRHcorC3h9jN90aSeFIJQr46Jlc2zgxYdxPvE
         LqRvZlFKBMB0m7+OD1HgLx65+SttjDHY7AL/6bQRi/BmaQV5VVvhSpecrwUi1ELCU1r+
         e0u1MKdw/2fRz+ouApAiqmprLt9l9hc64dHycobSjKWLF1wjSudVlFCeN8pqoJzSm5LY
         thNA==
X-Gm-Message-State: AO0yUKV0yjCszdmzQRsEyfXX1ISZ8pUFRt6zakdElO/4zv3NmSLV6Gas
        WdLL0RUrbB6pEIRWUtrJzVM=
X-Google-Smtp-Source: AK7set9kii7+hWFq+AZkDv+r6rvCOSRXfrXz0jgjlool1lIZwCBfHXAv7XXPRYMdKK75dGDXVyzaFw==
X-Received: by 2002:a05:6808:aa7:b0:360:c338:b958 with SMTP id r7-20020a0568080aa700b00360c338b958mr3048206oij.55.1676575079031;
        Thu, 16 Feb 2023 11:17:59 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o124-20020acad782000000b0036e9160f57csm887418oig.20.2023.02.16.11.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 11:17:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3f91da52-619a-89a2-da96-bf04e8ae3e48@roeck-us.net>
Date:   Thu, 16 Feb 2023 11:17:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>,
        Pedro Miguel Justo <pmsjt@texair.net>
Cc:     Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
        Tony Luck <tony.luck@intel.com>,
        Jessica Clarke <jrtc27@jrtc27.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Matthew Wilcox <willy@infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
References: <CO1PR13MB48707CAD2AFD26D4B6D11321C8A09@CO1PR13MB4870.namprd13.prod.outlook.com>
 <CAMj1kXG5ufjnZGX=i92REDTayrYEKu0uVCdMB5X5JkNfAX4peA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH 0/5] Retire IA64/Itanium support
In-Reply-To: <CAMj1kXG5ufjnZGX=i92REDTayrYEKu0uVCdMB5X5JkNfAX4peA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 2/16/23 10:32, Ard Biesheuvel wrote:
> On Thu, 16 Feb 2023 at 18:43, Pedro Miguel Justo <pmsjt@texair.net> wrote:
>>
>> Hi Ard.
>>
>> John is not the "only remaining user". I also reported the problem. I am sorry I don't update the kernel every month. Yes there might have been more than 30 days between updates.
>>
> 
> Thanks for the report.
> 
> Apologies if that sounded a bit callous but it does help get some
> clarity regarding the ia64 situation. Essentially, we have a very
> small number of downstream users but no dedicated developers or
> maintainers. That is still not a great situation.
> 
>> I'd prefer if we don't remove the Itanium McKinley+ support but I'll understand if it must.
>>
> 
> If you are invested in keeping Itanium alive, how much effort would
> you be willing to spend yourself on testing and reviewing Itanium
> changes?

It isn't just that. Trying to build ia64:allmodconfig with gcc 11.2
fails due to build warning(s) which are now errors, and the same
build with gcc 11.3 or later (and binutils 2.32 or later) fails
completely with
     Error: Register number out of range 0..1
and similar all over the place. So there isn't just code bitrot,
there is also compiler and/or binutils bitrot.

Guenter

