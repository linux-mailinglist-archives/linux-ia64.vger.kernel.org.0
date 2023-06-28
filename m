Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE90F740FA6
	for <lists+linux-ia64@lfdr.de>; Wed, 28 Jun 2023 13:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbjF1LGt (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 28 Jun 2023 07:06:49 -0400
Received: from foss.arm.com ([217.140.110.172]:53768 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231518AbjF1LGp (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Wed, 28 Jun 2023 07:06:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E52A7C14;
        Wed, 28 Jun 2023 04:07:27 -0700 (PDT)
Received: from [10.57.76.180] (unknown [10.57.76.180])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF06E3F663;
        Wed, 28 Jun 2023 04:06:40 -0700 (PDT)
Message-ID: <5ad4f4de-1751-0320-5b8e-52bd6bd23d95@arm.com>
Date:   Wed, 28 Jun 2023 12:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v1 03/10] mm: Introduce try_vma_alloc_movable_folio()
To:     Yin Fengwei <fengwei.yin@intel.com>, Yu Zhao <yuzhao@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-4-ryan.roberts@arm.com>
 <CAOUHufZKM+aS_hYQ5nDUHh74UQwWipJ27Na5Sw4n+RDqnwyWHA@mail.gmail.com>
 <CAOUHufZeFTjzO6nSFz7Y=5rBGPzY+_eeN3f8W+g0u6AqosdmuQ@mail.gmail.com>
 <ba282a84-1a0d-4ffd-0b22-ac9510a820ef@arm.com>
 <8ab18141-8091-6691-ddbd-cff834a8d4d0@intel.com>
From:   Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <8ab18141-8091-6691-ddbd-cff834a8d4d0@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 28/06/2023 03:32, Yin Fengwei wrote:
> 
> 
> On 6/27/23 15:56, Ryan Roberts wrote:
>> On 27/06/2023 06:29, Yu Zhao wrote:
>>> On Mon, Jun 26, 2023 at 8:34 PM Yu Zhao <yuzhao@google.com> wrote:
>>>>
>>>> On Mon, Jun 26, 2023 at 11:14 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>>
>>>>> Opportunistically attempt to allocate high-order folios in highmem,
>>>>> optionally zeroed. Retry with lower orders all the way to order-0, until
>>>>> success. Although, of note, order-1 allocations are skipped since a
>>>>> large folio must be at least order-2 to work with the THP machinery. The
>>>>> user must check what they got with folio_order().
>>>>>
>>>>> This will be used to oportunistically allocate large folios for
>>>>> anonymous memory with a sensible fallback under memory pressure.
>>>>>
>>>>> For attempts to allocate non-0 orders, we set __GFP_NORETRY to prevent
>>>>> high latency due to reclaim, instead preferring to just try for a lower
>>>>> order. The same approach is used by the readahead code when allocating
>>>>> large folios.
>>>>>
>>>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>>>> ---
>>>>>  mm/memory.c | 33 +++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 33 insertions(+)
>>>>>
>>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>>> index 367bbbb29d91..53896d46e686 100644
>>>>> --- a/mm/memory.c
>>>>> +++ b/mm/memory.c
>>>>> @@ -3001,6 +3001,39 @@ static vm_fault_t fault_dirty_shared_page(struct vm_fault *vmf)
>>>>>         return 0;
>>>>>  }
>>>>>
>>>>> +static inline struct folio *vma_alloc_movable_folio(struct vm_area_struct *vma,
>>>>> +                               unsigned long vaddr, int order, bool zeroed)
>>>>> +{
>>>>> +       gfp_t gfp = order > 0 ? __GFP_NORETRY | __GFP_NOWARN : 0;
>>>>> +
>>>>> +       if (zeroed)
>>>>> +               return vma_alloc_zeroed_movable_folio(vma, vaddr, gfp, order);
>>>>> +       else
>>>>> +               return vma_alloc_folio(GFP_HIGHUSER_MOVABLE | gfp, order, vma,
>>>>> +                                                               vaddr, false);
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Opportunistically attempt to allocate high-order folios, retrying with lower
>>>>> + * orders all the way to order-0, until success. order-1 allocations are skipped
>>>>> + * since a folio must be at least order-2 to work with the THP machinery. The
>>>>> + * user must check what they got with folio_order(). vaddr can be any virtual
>>>>> + * address that will be mapped by the allocated folio.
>>>>> + */
>>>>> +static struct folio *try_vma_alloc_movable_folio(struct vm_area_struct *vma,
>>>>> +                               unsigned long vaddr, int order, bool zeroed)
>>>>> +{
>>>>> +       struct folio *folio;
>>>>> +
>>>>> +       for (; order > 1; order--) {
>>>>> +               folio = vma_alloc_movable_folio(vma, vaddr, order, zeroed);
>>>>> +               if (folio)
>>>>> +                       return folio;
>>>>> +       }
>>>>> +
>>>>> +       return vma_alloc_movable_folio(vma, vaddr, 0, zeroed);
>>>>> +}
>>>>
>>>> I'd drop this patch. Instead, in do_anonymous_page():
>>>>
>>>>   if (IS_ENABLED(CONFIG_ARCH_WANTS_PTE_ORDER))
>>>>     folio = vma_alloc_zeroed_movable_folio(vma, addr,
>>>> CONFIG_ARCH_WANTS_PTE_ORDER))
>>>>
>>>>   if (!folio)
>>>>     folio = vma_alloc_zeroed_movable_folio(vma, addr, 0);
>>>
>>> I meant a runtime function arch_wants_pte_order() (Its default
>>> implementation would return 0.)
>>
>> There are a bunch of things which you are implying here which I'll try to make
>> explicit:
>>
>> I think you are implying that we shouldn't retry allocation with intermediate
>> orders; but only try the order requested by the arch (arch_wants_pte_order())
>> and 0. Correct? For arm64 at least, I would like the VMA's THP hint to be a
>> factor in determining the preferred order (see patches 8 and 9). So I would add
>> a vma parameter to arch_wants_pte_order() to allow for this.
>>
>> For the case where the THP hint is present, then the arch will request 2M (if
>> the page size is 16K or 64K). If that fails to allocate, there is still value in
>> allocating a 64K folio (which is order 2 in the 16K case). Without the retry
>> with intermediate orders logic, we would not get this.
>>
>> We can't just blindly allocate a folio of arch_wants_pte_order() size because it
>> might overlap with existing populated PTEs, or cross the bounds of the VMA (or a
>> number of other things - see calc_anon_folio_order_alloc() in patch 10). Are you
>> implying that if there is any kind of issue like this, then we should go
>> directly to order 0? I can kind of see the argument from a minimizing
>> fragmentation perspective, but for best possible performance I think we are
>> better off "packing the bin" with intermediate orders.
> 
> One drawback of the retry is that it could introduce large tail latency (by
> memory zeroing, memory reclaiming or existing populated PTEs). That may not
> be appreciated by some applications. Thanks.

Good point. based on all the discussion, I think the conclusion is:

 - ask the arch to for preferred folio order with runtime function
 - check the folio will fit (racy) - if does not fit fall back to order-0
 - allocate the folio
 - take the ptl
 - check the folio still fits (not racy) - if does not fit fall back to order-0

So in the worst case the latency will be allocating and zeroing a large folio,
then allocating and zeroing an order-0 folio. Which is obviously better than
iterating through every order from preferred to 0.

I'll work this flow into a v2.

> 
> 
> Regards
> Yin, Fengwei
> 
>>
>> You're also implying that a runtime arch_wants_pte_order() function is better
>> than the Kconfig stuff I did in patch 8. On reflection, I agree with you here. I
>> think you mentioned that AMD supports coalescing 8 pages on some CPUs - so you
>> would probably want runtime logic to determine if you are on an appropriate AMD
>> CPU as part of the decision in that function?
>>
>> The real reason for the existance of try_vma_alloc_movable_folio() is that I'm
>> reusing it on the other fault paths (which are no longer part of this series).
>> But I guess that's not a good reason to keep this until we get to those patches.

