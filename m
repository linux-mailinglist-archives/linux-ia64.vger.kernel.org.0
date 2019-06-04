Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4917433F57
	for <lists+linux-ia64@lfdr.de>; Tue,  4 Jun 2019 08:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfFDG4X (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 4 Jun 2019 02:56:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58964 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726547AbfFDG4X (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 4 Jun 2019 02:56:23 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7D37F75727;
        Tue,  4 Jun 2019 06:56:22 +0000 (UTC)
Received: from [10.36.117.37] (ovpn-117-37.ams2.redhat.com [10.36.117.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A151510013D9;
        Tue,  4 Jun 2019 06:56:16 +0000 (UTC)
Subject: Re: [PATCH v3 04/11] arm64/mm: Add temporary arch_remove_memory()
 implementation
To:     Wei Yang <richard.weiyang@gmail.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
        Dan Williams <dan.j.williams@intel.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-5-david@redhat.com>
 <20190603214139.mercn5hol2yyfl2s@master>
From:   David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwX4EEwECACgFAljj9eoCGwMFCQlmAYAGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEE3eEPcA/4Na5IIP/3T/FIQMxIfNzZshIq687qgG
 8UbspuE/YSUDdv7r5szYTK6KPTlqN8NAcSfheywbuYD9A4ZeSBWD3/NAVUdrCaRP2IvFyELj
 xoMvfJccbq45BxzgEspg/bVahNbyuBpLBVjVWwRtFCUEXkyazksSv8pdTMAs9IucChvFmmq3
 jJ2vlaz9lYt/lxN246fIVceckPMiUveimngvXZw21VOAhfQ+/sofXF8JCFv2mFcBDoa7eYob
 s0FLpmqFaeNRHAlzMWgSsP80qx5nWWEvRLdKWi533N2vC/EyunN3HcBwVrXH4hxRBMco3jvM
 m8VKLKao9wKj82qSivUnkPIwsAGNPdFoPbgghCQiBjBe6A75Z2xHFrzo7t1jg7nQfIyNC7ez
 MZBJ59sqA9EDMEJPlLNIeJmqslXPjmMFnE7Mby/+335WJYDulsRybN+W5rLT5aMvhC6x6POK
 z55fMNKrMASCzBJum2Fwjf/VnuGRYkhKCqqZ8gJ3OvmR50tInDV2jZ1DQgc3i550T5JDpToh
 dPBxZocIhzg+MBSRDXcJmHOx/7nQm3iQ6iLuwmXsRC6f5FbFefk9EjuTKcLMvBsEx+2DEx0E
 UnmJ4hVg7u1PQ+2Oy+Lh/opK/BDiqlQ8Pz2jiXv5xkECvr/3Sv59hlOCZMOaiLTTjtOIU7Tq
 7ut6OL64oAq+zsFNBFXLn5EBEADn1959INH2cwYJv0tsxf5MUCghCj/CA/lc/LMthqQ773ga
 uB9mN+F1rE9cyyXb6jyOGn+GUjMbnq1o121Vm0+neKHUCBtHyseBfDXHA6m4B3mUTWo13nid
 0e4AM71r0DS8+KYh6zvweLX/LL5kQS9GQeT+QNroXcC1NzWbitts6TZ+IrPOwT1hfB4WNC+X
 2n4AzDqp3+ILiVST2DT4VBc11Gz6jijpC/KI5Al8ZDhRwG47LUiuQmt3yqrmN63V9wzaPhC+
 xbwIsNZlLUvuRnmBPkTJwwrFRZvwu5GPHNndBjVpAfaSTOfppyKBTccu2AXJXWAE1Xjh6GOC
 8mlFjZwLxWFqdPHR1n2aPVgoiTLk34LR/bXO+e0GpzFXT7enwyvFFFyAS0Nk1q/7EChPcbRb
 hJqEBpRNZemxmg55zC3GLvgLKd5A09MOM2BrMea+l0FUR+PuTenh2YmnmLRTro6eZ/qYwWkC
 u8FFIw4pT0OUDMyLgi+GI1aMpVogTZJ70FgV0pUAlpmrzk/bLbRkF3TwgucpyPtcpmQtTkWS
 gDS50QG9DR/1As3LLLcNkwJBZzBG6PWbvcOyrwMQUF1nl4SSPV0LLH63+BrrHasfJzxKXzqg
 rW28CTAE2x8qi7e/6M/+XXhrsMYG+uaViM7n2je3qKe7ofum3s4vq7oFCPsOgwARAQABwsFl
 BBgBAgAPBQJVy5+RAhsMBQkJZgGAAAoJEE3eEPcA/4NagOsP/jPoIBb/iXVbM+fmSHOjEshl
 KMwEl/m5iLj3iHnHPVLBUWrXPdS7iQijJA/VLxjnFknhaS60hkUNWexDMxVVP/6lbOrs4bDZ
 NEWDMktAeqJaFtxackPszlcpRVkAs6Msn9tu8hlvB517pyUgvuD7ZS9gGOMmYwFQDyytpepo
 YApVV00P0u3AaE0Cj/o71STqGJKZxcVhPaZ+LR+UCBZOyKfEyq+ZN311VpOJZ1IvTExf+S/5
 lqnciDtbO3I4Wq0ArLX1gs1q1XlXLaVaA3yVqeC8E7kOchDNinD3hJS4OX0e1gdsx/e6COvy
 qNg5aL5n0Kl4fcVqM0LdIhsubVs4eiNCa5XMSYpXmVi3HAuFyg9dN+x8thSwI836FoMASwOl
 C7tHsTjnSGufB+D7F7ZBT61BffNBBIm1KdMxcxqLUVXpBQHHlGkbwI+3Ye+nE6HmZH7IwLwV
 W+Ajl7oYF+jeKaH4DZFtgLYGLtZ1LDwKPjX7VAsa4Yx7S5+EBAaZGxK510MjIx6SGrZWBrrV
 TEvdV00F2MnQoeXKzD7O4WFbL55hhyGgfWTHwZ457iN9SgYi1JLPqWkZB0JRXIEtjd4JEQcx
 +8Umfre0Xt4713VxMygW0PnQt5aSQdMD58jHFxTk092mU+yIHj5LeYgvwSgZN4airXk5yRXl
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <5059f68d-45d2-784e-0770-ee67060773c7@redhat.com>
Date:   Tue, 4 Jun 2019 08:56:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190603214139.mercn5hol2yyfl2s@master>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 04 Jun 2019 06:56:22 +0000 (UTC)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 03.06.19 23:41, Wei Yang wrote:
> On Mon, May 27, 2019 at 01:11:45PM +0200, David Hildenbrand wrote:
>> A proper arch_remove_memory() implementation is on its way, which also
>> cleanly removes page tables in arch_add_memory() in case something goes
>> wrong.
> 
> Would this be better to understand?
> 
>     removes page tables created in arch_add_memory

That's not what this sentence expresses. Have a look at
arch_add_memory(), in case  __add_pages() fails, the page tables are not
removed. This will also be fixed by Anshuman in the same shot.

> 
>>
>> As we want to use arch_remove_memory() in case something goes wrong
>> during memory hotplug after arch_add_memory() finished, let's add
>> a temporary hack that is sufficient enough until we get a proper
>> implementation that cleans up page table entries.
>>
>> We will remove CONFIG_MEMORY_HOTREMOVE around this code in follow up
>> patches.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will.deacon@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>> Cc: Chintan Pandya <cpandya@codeaurora.org>
>> Cc: Mike Rapoport <rppt@linux.ibm.com>
>> Cc: Jun Yao <yaojun8558363@gmail.com>
>> Cc: Yu Zhao <yuzhao@google.com>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>> arch/arm64/mm/mmu.c | 19 +++++++++++++++++++
>> 1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index a1bfc4413982..e569a543c384 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1084,4 +1084,23 @@ int arch_add_memory(int nid, u64 start, u64 size,
>> 	return __add_pages(nid, start >> PAGE_SHIFT, size >> PAGE_SHIFT,
>> 			   restrictions);
>> }
>> +#ifdef CONFIG_MEMORY_HOTREMOVE
>> +void arch_remove_memory(int nid, u64 start, u64 size,
>> +			struct vmem_altmap *altmap)
>> +{
>> +	unsigned long start_pfn = start >> PAGE_SHIFT;
>> +	unsigned long nr_pages = size >> PAGE_SHIFT;
>> +	struct zone *zone;
>> +
>> +	/*
>> +	 * FIXME: Cleanup page tables (also in arch_add_memory() in case
>> +	 * adding fails). Until then, this function should only be used
>> +	 * during memory hotplug (adding memory), not for memory
>> +	 * unplug. ARCH_ENABLE_MEMORY_HOTREMOVE must not be
>> +	 * unlocked yet.
>> +	 */
>> +	zone = page_zone(pfn_to_page(start_pfn));
> 
> Compared with arch_remove_memory in x86. If altmap is not NULL, zone will be
> retrieved from page related to altmap. Not sure why this is not the same?

This is a minimal implementation, sufficient for this use case here. A
full implementation is in the works. For now, this function will not be
used with an altmap (ZONE_DEVICE is not esupported for arm64 yet).

Thanks!

> 
>> +	__remove_pages(zone, start_pfn, nr_pages, altmap);
>> +}
>> +#endif
>> #endif
>> -- 
>> 2.20.1
> 


-- 

Thanks,

David / dhildenb
