Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD709366FF
	for <lists+linux-ia64@lfdr.de>; Wed,  5 Jun 2019 23:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfFEVu7 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 5 Jun 2019 17:50:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55036 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726461AbfFEVu7 (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Wed, 5 Jun 2019 17:50:59 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C58FB308626C;
        Wed,  5 Jun 2019 21:50:57 +0000 (UTC)
Received: from [10.36.116.124] (ovpn-116-124.ams2.redhat.com [10.36.116.124])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9B7D51B2ED;
        Wed,  5 Jun 2019 21:50:53 +0000 (UTC)
Subject: Re: [PATCH v3 07/11] mm/memory_hotplug: Create memory block devices
 after arch_add_memory()
To:     Wei Yang <richard.weiyang@gmail.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
        Dan Williams <dan.j.williams@intel.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "mike.travis@hpe.com" <mike.travis@hpe.com>,
        Ingo Molnar <mingo@kernel.org>,
        Andrew Banman <andrew.banman@hpe.com>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Qian Cai <cai@lca.pw>, Arun KS <arunks@codeaurora.org>,
        Mathieu Malaterre <malat@debian.org>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-8-david@redhat.com>
 <20190604214234.ltwtkcdoju2gxisx@master>
 <f6523d67-cac9-1189-884a-67b6829320ba@redhat.com>
 <9a1d282f-8dd9-a48b-cc96-f9afaa435c62@redhat.com>
 <20190605212249.s7knac6vimealdmx@master>
From:   David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <4d29c1d6-d394-903d-28ae-733d55ac06f4@redhat.com>
Date:   Wed, 5 Jun 2019 23:50:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605212249.s7knac6vimealdmx@master>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 05 Jun 2019 21:50:58 +0000 (UTC)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 05.06.19 23:22, Wei Yang wrote:
> On Wed, Jun 05, 2019 at 12:58:46PM +0200, David Hildenbrand wrote:
>> On 05.06.19 10:58, David Hildenbrand wrote:
>>>>> /*
>>>>>  * For now, we have a linear search to go find the appropriate
>>>>>  * memory_block corresponding to a particular phys_index. If
>>>>> @@ -658,6 +670,11 @@ static int init_memory_block(struct memory_block **memory, int block_id,
>>>>> 	unsigned long start_pfn;
>>>>> 	int ret = 0;
>>>>>
>>>>> +	mem = find_memory_block_by_id(block_id, NULL);
>>>>> +	if (mem) {
>>>>> +		put_device(&mem->dev);
>>>>> +		return -EEXIST;
>>>>> +	}
>>>>
>>>> find_memory_block_by_id() is not that close to the main idea in this patch.
>>>> Would it be better to split this part?
>>>
>>> I played with that but didn't like the temporary results (e.g. having to
>>> export find_memory_block_by_id()). I'll stick to this for now.
>>>
>>>>
>>>>> 	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
>>>>> 	if (!mem)
>>>>> 		return -ENOMEM;
>>>>> @@ -699,44 +716,53 @@ static int add_memory_block(int base_section_nr)
>>>>> 	return 0;
>>>>> }
>>>>>
>>>>> +static void unregister_memory(struct memory_block *memory)
>>>>> +{
>>>>> +	if (WARN_ON_ONCE(memory->dev.bus != &memory_subsys))
>>>>> +		return;
>>>>> +
>>>>> +	/* drop the ref. we got via find_memory_block() */
>>>>> +	put_device(&memory->dev);
>>>>> +	device_unregister(&memory->dev);
>>>>> +}
>>>>> +
>>>>> /*
>>>>> - * need an interface for the VM to add new memory regions,
>>>>> - * but without onlining it.
>>>>> + * Create memory block devices for the given memory area. Start and size
>>>>> + * have to be aligned to memory block granularity. Memory block devices
>>>>> + * will be initialized as offline.
>>>>>  */
>>>>> -int hotplug_memory_register(int nid, struct mem_section *section)
>>>>> +int create_memory_block_devices(unsigned long start, unsigned long size)
>>>>> {
>>>>> -	int block_id = base_memory_block_id(__section_nr(section));
>>>>> -	int ret = 0;
>>>>> +	const int start_block_id = pfn_to_block_id(PFN_DOWN(start));
>>>>> +	int end_block_id = pfn_to_block_id(PFN_DOWN(start + size));
>>>>> 	struct memory_block *mem;
>>>>> +	unsigned long block_id;
>>>>> +	int ret = 0;
>>>>>
>>>>> -	mutex_lock(&mem_sysfs_mutex);
>>>>> +	if (WARN_ON_ONCE(!IS_ALIGNED(start, memory_block_size_bytes()) ||
>>>>> +			 !IS_ALIGNED(size, memory_block_size_bytes())))
>>>>> +		return -EINVAL;
>>>>>
>>>>> -	mem = find_memory_block(section);
>>>>> -	if (mem) {
>>>>> -		mem->section_count++;
>>>>> -		put_device(&mem->dev);
>>>>> -	} else {
>>>>> +	mutex_lock(&mem_sysfs_mutex);
>>>>> +	for (block_id = start_block_id; block_id != end_block_id; block_id++) {
>>>>> 		ret = init_memory_block(&mem, block_id, MEM_OFFLINE);
>>>>> 		if (ret)
>>>>> -			goto out;
>>>>> -		mem->section_count++;
>>>>> +			break;
>>>>> +		mem->section_count = sections_per_block;
>>>>> +	}
>>>>> +	if (ret) {
>>>>> +		end_block_id = block_id;
>>>>> +		for (block_id = start_block_id; block_id != end_block_id;
>>>>> +		     block_id++) {
>>>>> +			mem = find_memory_block_by_id(block_id, NULL);
>>>>> +			mem->section_count = 0;
>>>>> +			unregister_memory(mem);
>>>>> +		}
>>>>> 	}
>>>>
>>>> Would it be better to do this in reverse order?
>>>>
>>>> And unregister_memory() would free mem, so it is still necessary to set
>>>> section_count to 0?
>>>
>>> 1. I kept the existing behavior (setting it to 0) for now. I am planning
>>> to eventually remove the section count completely (it could be
>>> beneficial to detect removing of partially populated memory blocks).
>>
>> Correction: We already use it to block offlining of partially populated
>> memory blocks \o/
> 
> Would you mind letting me know where we leverage this?

Sure:

drivers/base/memory.c:memory_subsys_offline()

if (mem->section_count != sections_per_block)
	return -EINVAL;

I would have expected such checks in the offline_pages() function instead.

-- 

Thanks,

David / dhildenb
