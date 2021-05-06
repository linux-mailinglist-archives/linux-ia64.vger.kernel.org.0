Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C67843757A6
	for <lists+linux-ia64@lfdr.de>; Thu,  6 May 2021 17:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbhEFPk0 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 6 May 2021 11:40:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43259 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235665AbhEFPjw (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 6 May 2021 11:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620315533;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UoFaFG5meAOT76aQgHG0SVdbeZvG8CD4G86zVOp7u+4=;
        b=MVbSbKC1azO7NG4qDCQIbL5CFAyZGWdEQvM0Hf1LDWTeSD5U+oaUqfvsfC5D0wxnb5Io1A
        JOyybcYB7mMBGX8MLSC+Ok9BjfzxXT6bAGI1C/NnoVOyjW/NlGHStWZMe2Eo5jFCs79bTM
        KQj5q+eeY9N+zgGFMO/C1BLKDa5bVMg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-1CpGmC7mOimeyR9XUdKQqQ-1; Thu, 06 May 2021 11:38:51 -0400
X-MC-Unique: 1CpGmC7mOimeyR9XUdKQqQ-1
Received: by mail-ed1-f70.google.com with SMTP id g7-20020aa7c5870000b02903888f809d62so2856849edq.23
        for <linux-ia64@vger.kernel.org>; Thu, 06 May 2021 08:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UoFaFG5meAOT76aQgHG0SVdbeZvG8CD4G86zVOp7u+4=;
        b=iO3j+rrMjoBb2XUv5D4lyJDVSPJGo5bHyfFWYyVaBFBT7oLO5XlZ5xtTWGtE6l6ft1
         vnae8Tef/A92Y6VZfSzFxHwE9CGdw6bXPc0hpnaCCs51n5huvJ2IIFnP96PUPY76T7fm
         rl2wLnga4fFh0jmKCkfjGU4xF4YzQooZjDRfiEf8TH9DkWMxgkV/mvhGWImnN607/qEX
         CEbtRL57uGoUDUD2kxE/9CZZx8zIg0pdYW6QeSW115WRJqOIZXgYeFXA7FGnar8bXbCu
         D4ryZHw0Lpu2FkfHRjMjkEUZVRvxx6UfBWyUepMJLQSFg6cUd6JApqMRW5Lce/ooTITm
         q7ZQ==
X-Gm-Message-State: AOAM5328eOerzcnCtlJSV9m16eclTYsv/sQchlUuutFGO9B4/rJ5Afon
        H0IE0QXpNK8sDrUJronNa5T6q202uhA/9udf866eHxu4UHrCirFanuK1xuO5Wcdv567BAb0RU+q
        yNU8mn970iIKPNqR00oLuSQ==
X-Received: by 2002:aa7:cf07:: with SMTP id a7mr5980731edy.261.1620315530220;
        Thu, 06 May 2021 08:38:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL2Szhl+Ueqawj9kuZ34daMTIBv79xuFgvY8BkgWo+1XkwBijQ+2hXlcRNb5PMiMs9QZDJBg==
X-Received: by 2002:aa7:cf07:: with SMTP id a7mr5980704edy.261.1620315529996;
        Thu, 06 May 2021 08:38:49 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
        by smtp.gmail.com with ESMTPSA id v23sm1986761eda.8.2021.05.06.08.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 08:38:49 -0700 (PDT)
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
From:   David Hildenbrand <david@redhat.com>
To:     Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
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
Organization: Red Hat
Message-ID: <596173b0-310f-7719-d432-11a13e325eab@redhat.com>
Date:   Thu, 6 May 2021 17:38:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 06.05.21 17:31, David Hildenbrand wrote:
> On 06.05.21 17:26, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> Hi all,
>>
>> This patchset tries to remove the restriction on memory hotplug/hotremove
>> granularity, which is always greater or equal to memory section size[1].
>> With the patchset, kernel is able to online/offline memory at a size independent
>> of memory section size, as small as 2MB (the subsection size).
> 
> ... which doesn't make any sense as we can only online/offline whole
> memory block devices.
> 
>>
>> The motivation is to increase MAX_ORDER of the buddy allocator and pageblock
>> size without increasing memory hotplug/hotremove granularity at the same time,
> 
> Gah, no. Please no. No.
> 
>> so that the kernel can allocator 1GB pages using buddy allocator and utilizes
>> existing pageblock based anti-fragmentation, paving the road for 1GB THP
>> support[2].
> 
> Not like this, please no.
> 
>>
>> The patchset utilizes the existing subsection support[3] and changes the
>> section size alignment checks to subsection size alignment checks. There are
>> also changes to pageblock code to support partial pageblocks, when pageblock
>> size is increased along with MAX_ORDER. Increasing pageblock size can enable
>> kernel to utilize existing anti-fragmentation mechanism for gigantic page
>> allocations.
> 
> Please not like this.
> 
>>
>> The last patch increases SECTION_SIZE_BITS to demonstrate the use of memory
>> hotplug/hotremove subsection, but is not intended to be merged as is. It is
>> there in case one wants to try this out and will be removed during the final
>> submission.
>>
>> Feel free to give suggestions and comments. I am looking forward to your
>> feedback.
> 
> Please not like this.
> 

And just to be clear (I think I mentioned this already to you?): Nack to 
increasing the section size. Nack to increasing the pageblock order. 
Please find different ways to group on gigantic-pages level. There are 
alternative ideas floating around.

Semi-nack to increasing MAX_ORDER. I first want to see 
alloc_contig_range() be able to fully and cleanly handle allocations < 
MAX_ORDER in all cases (especially !CMA and !ZONE_MOVABLE) before we go 
down that path.

-- 
Thanks,

David / dhildenb

