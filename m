Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D202376685
	for <lists+linux-ia64@lfdr.de>; Fri,  7 May 2021 16:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236579AbhEGOBl (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 7 May 2021 10:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30156 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229635AbhEGOBl (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 7 May 2021 10:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620396041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MiSXjJ0WR3uZ2T2RJ9lHILm/xn7n1a3SDG4Exknmyh4=;
        b=Mh5pzjvsKq4+XDSdN3KloYh2of2L6cw5Qoa5yXoUUZOadz4u4D5UwxySIdmSqZYjOdMi/U
        lQogti4CWz45KR5maMtiv4Y3iUxRbIyH0Ih0D9ZVmhZOnkHyHyRmM78VS7NjtGUuHilcEi
        ZmWUsC+DCEKJtLu0xu9+/ndVvs7qxCk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-LaGskUvAOXysio1v5BNpzQ-1; Fri, 07 May 2021 10:00:39 -0400
X-MC-Unique: LaGskUvAOXysio1v5BNpzQ-1
Received: by mail-wm1-f69.google.com with SMTP id o10-20020a05600c4fcab029014ae7fdec90so2276150wmq.5
        for <linux-ia64@vger.kernel.org>; Fri, 07 May 2021 07:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MiSXjJ0WR3uZ2T2RJ9lHILm/xn7n1a3SDG4Exknmyh4=;
        b=ILNGyI3d9B1HkCgPp7rTGDzyQgVq3MmmTrnTqvvgiFsPjwr6AHnuC5ehdQqqT/W9ra
         L3eaAOx8m5b2ZVsw7rEbQXzfZkFEAZcpnXaMAbfukjNbISYiVRwFkuIoAC+YuBlcCw5f
         K2ZU+1cTtCRi1wW0mn62I1rPjXN+ict6viMMC+NSDp43++bggJZbI8Hvu6NFTUlUCv5R
         iI3ZPKRQQWjObkKq4B5xod0zvFVWMagI46mLsr0EfpI/XT7ELxZkjvabQEQIC1LWAP9I
         YTy8prBpc9LbCwiuftvARcZr9eUaT/LpEPRKwO6nNK7/ThjDTuOIm3JEcVJBHU49bbGP
         Xguw==
X-Gm-Message-State: AOAM530pEdQFzE0nkUDdciC+eyrNmHhLURCgj2DprarPCv2Gntyz2uqq
        qizz5/uE+W88B/dozGuFk3KAny0vatgAsahdRSvSz2tAycu1JaasemB/kzyaZqlXd8Ik4uhLsIT
        Oyi5I1tykgYkzgCcM+ux7oA==
X-Received: by 2002:adf:e291:: with SMTP id v17mr12060502wri.149.1620396038173;
        Fri, 07 May 2021 07:00:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+s+cU3Vtr7QIEk2tXxhKFgB7G7iAl1u8Q7+ZtZsRjRk+l+P2f2eAswGLfrfLFtpRTfd9csw==
X-Received: by 2002:adf:e291:: with SMTP id v17mr12060455wri.149.1620396037823;
        Fri, 07 May 2021 07:00:37 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c63c0.dip0.t-ipconnect.de. [91.12.99.192])
        by smtp.gmail.com with ESMTPSA id c8sm8651643wrx.4.2021.05.07.07.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 May 2021 07:00:37 -0700 (PDT)
To:     Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>
Cc:     Oscar Salvador <osalvador@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
 <YJUqrOacyqI+kiKW@dhcp22.suse.cz>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
Message-ID: <792d73e2-5d63-74a5-5554-20351d5532ff@redhat.com>
Date:   Fri, 7 May 2021 16:00:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJUqrOacyqI+kiKW@dhcp22.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 07.05.21 13:55, Michal Hocko wrote:
> [I haven't read through respective patches due to lack of time but let
>   me comment on the general idea and the underlying justification]
> 
> On Thu 06-05-21 17:31:09, David Hildenbrand wrote:
>> On 06.05.21 17:26, Zi Yan wrote:
>>> From: Zi Yan <ziy@nvidia.com>
>>>
>>> Hi all,
>>>
>>> This patchset tries to remove the restriction on memory hotplug/hotremove
>>> granularity, which is always greater or equal to memory section size[1].
>>> With the patchset, kernel is able to online/offline memory at a size independent
>>> of memory section size, as small as 2MB (the subsection size).
>>
>> ... which doesn't make any sense as we can only online/offline whole memory
>> block devices.
> 
> Agreed. The subsection thingy is just a hack to workaround pmem
> alignement problems. For the real memory hotplug it is quite hard to
> argue for reasonable hotplug scenarios for very small physical memory
> ranges wrt. to the existing sparsemem memory model.
>   
>>> The motivation is to increase MAX_ORDER of the buddy allocator and pageblock
>>> size without increasing memory hotplug/hotremove granularity at the same time,
>>
>> Gah, no. Please no. No.
> 
> Agreed. Those are completely independent concepts. MAX_ORDER is can be
> really arbitrary irrespective of the section size with vmemmap sparse
> model. The existing restriction is due to old sparse model not being
> able to do page pointer arithmetic across memory sections. Is there any
> reason to stick with that memory model for an advance feature you are
> working on?
> 

I gave it some more thought yesterday. I guess the first thing we should 
look into is increasing MAX_ORDER and leaving pageblock_order and 
section size as is -- finding out what we have to tweak to get that up 
and running. Once we have that in place, we can actually look into 
better fragmentation avoidance etc. One step at a time.

Because that change itself might require some thought. Requiring that 
bigger MAX_ORDER depends on SPARSE_VMEMMAP is something reasonable to do.

As stated somewhere here already, we'll have to look into making 
alloc_contig_range() (and main users CMA and virtio-mem) independent of 
MAX_ORDER and mainly rely on pageblock_order. The current handling in 
alloc_contig_range() is far from optimal as we have to isolate a whole 
MAX_ORDER - 1 page -- and on ZONE_NORMAL we'll fail easily if any part 
contains something unmovable although we don't even want to allocate 
that part. I actually have that on my list (to be able to fully support 
pageblock_order instead of MAX_ORDER -1 chunks in virtio-mem), however 
didn't have time to look into it.

Further, page onlining / offlining code and early init code most 
probably also needs care if MAX_ORDER - 1 crosses sections. Memory holes 
we might suddenly have in MAX_ORDER - 1 pages might become a problem and 
will have to be handled. Not sure which other code has to be tweaked 
(compaction? page isolation?).

Figuring out what needs care itself might take quite some effort.


One thing I was thinking about as well: The bigger our MAX_ORDER, the 
slower it could be to allocate smaller pages. If we have 1G pages, 
splitting them down to 4k then takes 8 additional steps if I'm, not 
wrong. Of course, that's the worst case. Would be interesting to evaluate.

-- 
Thanks,

David / dhildenb

