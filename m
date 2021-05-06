Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34083757BB
	for <lists+linux-ia64@lfdr.de>; Thu,  6 May 2021 17:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235926AbhEFPlo (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 6 May 2021 11:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43230 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235624AbhEFPlT (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 6 May 2021 11:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620315620;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zt1CMVCYEfkxyd9UNysxUz4SpT8ZgoiU+x8AV2J3Qcc=;
        b=HmYgesH4zOZHiP2jS3YRke1g+9zU6IFtdcvgLDslYENOMT+6xwIgET0f2+dZUOJJ5rizYc
        i3NjoHH+BW2zMU8ACGngt3R2hbpF6KJxiRUcuVPoUPWcwOT4ocBtqNwoVGd0ArJreYnzT5
        Dwgj68IKLWH40WiaCkLf/iwJMFLchmY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-qcc4pW4lNtWGjRkf9wqjkA-1; Thu, 06 May 2021 11:40:18 -0400
X-MC-Unique: qcc4pW4lNtWGjRkf9wqjkA-1
Received: by mail-ed1-f72.google.com with SMTP id bm3-20020a0564020b03b0290387c8b79486so2842349edb.20
        for <linux-ia64@vger.kernel.org>; Thu, 06 May 2021 08:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zt1CMVCYEfkxyd9UNysxUz4SpT8ZgoiU+x8AV2J3Qcc=;
        b=HNSsw5CDoF/fj7oEsKBV9JMvFoUc7VxK/TnBF1gc9Xf/5WiZWsdvRVtsbfmk5BJZBI
         8HvWAL5kWdVce4sJr40AVBFdj8rNZo44qjIyfJCyjMFbTy2BsU9ItuT1PHfKSEMxruXy
         YfLn3pFX5b6ebm84qNbcCGv/f2S5BqAT4ThF+h9nEnEZfXK7rLS8SzR2y3uXmc0SW3fK
         1gnW3ID4ZfjZ+yHDB5WQu2H9QBVt625IGfDjLj359iM6S7jKbS1HYB2lQrooK0epSQ7O
         hmiAQz6yHpMn9zswadqzJINEYJo5rRAHZ7T9N122oLlqkdD8XdkX7thkbOHk4jBfcQ0/
         1Ekg==
X-Gm-Message-State: AOAM531alotdkPFJONkpZmTA+a+152FnoDAdjYLbt3n8laSu2nwgDoNE
        rtJkxKZmhnzqp7q3H6Kal34ZwySG1l19I5EJzPQwlTvqfP2qQyQxJGFvgSpNIZrnYAgYWaGfyID
        okG4P1t0pRzHGCI956l8JZg==
X-Received: by 2002:a05:6402:4313:: with SMTP id m19mr5915855edc.263.1620315617708;
        Thu, 06 May 2021 08:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzk0LjFrMyClreAxpxpyn2/1+H3Xm8pkFKVU4ZpBXb5EXnGWXP797OFz3GwiryEOPHyCBR4Q==
X-Received: by 2002:a05:6402:4313:: with SMTP id m19mr5915815edc.263.1620315617456;
        Thu, 06 May 2021 08:40:17 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
        by smtp.gmail.com with ESMTPSA id k9sm1740567eje.102.2021.05.06.08.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 08:40:17 -0700 (PDT)
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
To:     Zi Yan <ziy@nvidia.com>
Cc:     Oscar Salvador <osalvador@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Michal Hocko <mhocko@suse.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
 <9D7FD316-988E-4B11-AC1C-64FF790BA79E@nvidia.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3a51f564-f3d1-c21f-93b5-1b91639523ec@redhat.com>
Date:   Thu, 6 May 2021 17:40:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9D7FD316-988E-4B11-AC1C-64FF790BA79E@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

>>> The last patch increases SECTION_SIZE_BITS to demonstrate the use of memory
>>> hotplug/hotremove subsection, but is not intended to be merged as is. It is
>>> there in case one wants to try this out and will be removed during the final
>>> submission.
>>>
>>> Feel free to give suggestions and comments. I am looking forward to your
>>> feedback.
>>
>> Please not like this.
> 
> Do you mind sharing more useful feedback instead of just saying a lot of No?

I remember reasoning about this already in another thread, no? Either 
you're ignoring my previous feedback or my mind is messing with me.

-- 
Thanks,

David / dhildenb

