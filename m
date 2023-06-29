Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF467424F7
	for <lists+linux-ia64@lfdr.de>; Thu, 29 Jun 2023 13:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbjF2LaN (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 29 Jun 2023 07:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbjF2LaM (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 29 Jun 2023 07:30:12 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 67B4830EF;
        Thu, 29 Jun 2023 04:30:10 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B155EC14;
        Thu, 29 Jun 2023 04:30:53 -0700 (PDT)
Received: from [10.1.27.40] (C02Z41KALVDN.cambridge.arm.com [10.1.27.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EE113F64C;
        Thu, 29 Jun 2023 04:30:07 -0700 (PDT)
Message-ID: <bfd1de51-d445-5861-f69f-13d740651f8e@arm.com>
Date:   Thu, 29 Jun 2023 12:30:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v1 10/10] mm: Allocate large folios for anonymous memory
To:     Yang Shi <shy828301@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        David Hildenbrand <david@redhat.com>,
        Yu Zhao <yuzhao@google.com>,
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
 <20230626171430.3167004-11-ryan.roberts@arm.com>
 <CAHbLzkoZf=5PLrC0HNT4Owy=xM4HfA9HDjdCHC+h5RYXUwp0gw@mail.gmail.com>
From:   Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAHbLzkoZf=5PLrC0HNT4Owy=xM4HfA9HDjdCHC+h5RYXUwp0gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 29/06/2023 03:13, Yang Shi wrote:
> On Mon, Jun 26, 2023 at 10:15 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> With all of the enabler patches in place, modify the anonymous memory
>> write allocation path so that it opportunistically attempts to allocate
>> a large folio up to `max_anon_folio_order()` size (This value is
>> ultimately configured by the architecture). This reduces the number of
>> page faults, reduces the size of (e.g. LRU) lists, and generally
>> improves performance by batching what were per-page operations into
>> per-(large)-folio operations.
>>
>> If CONFIG_LARGE_ANON_FOLIO is not enabled (the default) then
>> `max_anon_folio_order()` always returns 0, meaning we get the existing
>> allocation behaviour.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  mm/memory.c | 159 +++++++++++++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 144 insertions(+), 15 deletions(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index a8f7e2b28d7a..d23c44cc5092 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -3161,6 +3161,90 @@ static inline int max_anon_folio_order(struct vm_area_struct *vma)
>>                 return CONFIG_LARGE_ANON_FOLIO_NOTHP_ORDER_MAX;
>>  }
>>
>> +/*
>> + * Returns index of first pte that is not none, or nr if all are none.
>> + */
>> +static inline int check_ptes_none(pte_t *pte, int nr)
>> +{
>> +       int i;
>> +
>> +       for (i = 0; i < nr; i++) {
>> +               if (!pte_none(ptep_get(pte++)))
>> +                       return i;
>> +       }
>> +
>> +       return nr;
>> +}
>> +
>> +static int calc_anon_folio_order_alloc(struct vm_fault *vmf, int order)
>> +{
>> +       /*
>> +        * The aim here is to determine what size of folio we should allocate
>> +        * for this fault. Factors include:
>> +        * - Order must not be higher than `order` upon entry
>> +        * - Folio must be naturally aligned within VA space
>> +        * - Folio must not breach boundaries of vma
>> +        * - Folio must be fully contained inside one pmd entry
>> +        * - Folio must not overlap any non-none ptes
>> +        *
>> +        * Additionally, we do not allow order-1 since this breaks assumptions
>> +        * elsewhere in the mm; THP pages must be at least order-2 (since they
>> +        * store state up to the 3rd struct page subpage), and these pages must
>> +        * be THP in order to correctly use pre-existing THP infrastructure such
>> +        * as folio_split().
>> +        *
>> +        * As a consequence of relying on the THP infrastructure, if the system
>> +        * does not support THP, we always fallback to order-0.
>> +        *
>> +        * Note that the caller may or may not choose to lock the pte. If
>> +        * unlocked, the calculation should be considered an estimate that will
>> +        * need to be validated under the lock.
>> +        */
>> +
>> +       struct vm_area_struct *vma = vmf->vma;
>> +       int nr;
>> +       unsigned long addr;
>> +       pte_t *pte;
>> +       pte_t *first_set = NULL;
>> +       int ret;
>> +
>> +       if (has_transparent_hugepage()) {
>> +               order = min(order, PMD_SHIFT - PAGE_SHIFT);
>> +
>> +               for (; order > 1; order--) {
>> +                       nr = 1 << order;
>> +                       addr = ALIGN_DOWN(vmf->address, nr << PAGE_SHIFT);
>> +                       pte = vmf->pte - ((vmf->address - addr) >> PAGE_SHIFT);
>> +
>> +                       /* Check vma bounds. */
>> +                       if (addr < vma->vm_start ||
>> +                           addr + (nr << PAGE_SHIFT) > vma->vm_end)
>> +                               continue;
>> +
>> +                       /* Ptes covered by order already known to be none. */
>> +                       if (pte + nr <= first_set)
>> +                               break;
>> +
>> +                       /* Already found set pte in range covered by order. */
>> +                       if (pte <= first_set)
>> +                               continue;
>> +
>> +                       /* Need to check if all the ptes are none. */
>> +                       ret = check_ptes_none(pte, nr);
>> +                       if (ret == nr)
>> +                               break;
>> +
>> +                       first_set = pte + ret;
>> +               }
>> +
>> +               if (order == 1)
>> +                       order = 0;
>> +       } else
>> +               order = 0;
>> +
>> +       return order;
>> +}
>> +
>>  /*
>>   * Handle write page faults for pages that can be reused in the current vma
>>   *
>> @@ -4201,6 +4285,9 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>>         struct folio *folio;
>>         vm_fault_t ret = 0;
>>         pte_t entry;
>> +       unsigned long addr;
>> +       int order = uffd_wp ? 0 : max_anon_folio_order(vma);
>> +       int pgcount = BIT(order);
>>
>>         /* File mapping without ->vm_ops ? */
>>         if (vma->vm_flags & VM_SHARED)
>> @@ -4242,24 +4329,44 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>>                         pte_unmap_unlock(vmf->pte, vmf->ptl);
>>                         return handle_userfault(vmf, VM_UFFD_MISSING);
>>                 }
>> -               goto setpte;
>> +               if (uffd_wp)
>> +                       entry = pte_mkuffd_wp(entry);
>> +               set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
>> +
>> +               /* No need to invalidate - it was non-present before */
>> +               update_mmu_cache(vma, vmf->address, vmf->pte);
>> +               goto unlock;
>>         }
>>
>> -       /* Allocate our own private page. */
>> +retry:
>> +       /*
>> +        * Estimate the folio order to allocate. We are not under the ptl here
>> +        * so this estiamte needs to be re-checked later once we have the lock.
>> +        */
>> +       vmf->pte = pte_offset_map(vmf->pmd, vmf->address);
>> +       order = calc_anon_folio_order_alloc(vmf, order);
>> +       pte_unmap(vmf->pte);
>> +
>> +       /* Allocate our own private folio. */
>>         if (unlikely(anon_vma_prepare(vma)))
>>                 goto oom;
>> -       folio = vma_alloc_zeroed_movable_folio(vma, vmf->address, 0, 0);
>> +       folio = try_vma_alloc_movable_folio(vma, vmf->address, order, true);
>>         if (!folio)
>>                 goto oom;
>>
>> +       /* We may have been granted less than we asked for. */
>> +       order = folio_order(folio);
>> +       pgcount = BIT(order);
>> +       addr = ALIGN_DOWN(vmf->address, pgcount << PAGE_SHIFT);
>> +
>>         if (mem_cgroup_charge(folio, vma->vm_mm, GFP_KERNEL))
>>                 goto oom_free_page;
>>         folio_throttle_swaprate(folio, GFP_KERNEL);
>>
>>         /*
>>          * The memory barrier inside __folio_mark_uptodate makes sure that
>> -        * preceding stores to the page contents become visible before
>> -        * the set_pte_at() write.
>> +        * preceding stores to the folio contents become visible before
>> +        * the set_ptes() write.
>>          */
>>         __folio_mark_uptodate(folio);
>>
>> @@ -4268,11 +4375,31 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>>         if (vma->vm_flags & VM_WRITE)
>>                 entry = pte_mkwrite(pte_mkdirty(entry));
>>
>> -       vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
>> -                       &vmf->ptl);
>> -       if (vmf_pte_changed(vmf)) {
>> -               update_mmu_tlb(vma, vmf->address, vmf->pte);
>> -               goto release;
>> +       vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, addr, &vmf->ptl);
>> +
>> +       /*
>> +        * Ensure our estimate above is still correct; we could have raced with
>> +        * another thread to service a fault in the region.
>> +        */
>> +       if (order == 0) {
>> +               if (vmf_pte_changed(vmf)) {
>> +                       update_mmu_tlb(vma, vmf->address, vmf->pte);
>> +                       goto release;
>> +               }
>> +       } else if (check_ptes_none(vmf->pte, pgcount) != pgcount) {
>> +               pte_t *pte = vmf->pte + ((vmf->address - addr) >> PAGE_SHIFT);
>> +
>> +               /* If faulting pte was allocated by another, exit early. */
>> +               if (!pte_none(ptep_get(pte))) {
>> +                       update_mmu_tlb(vma, vmf->address, pte);
>> +                       goto release;
>> +               }
>> +
>> +               /* Else try again, with a lower order. */
>> +               pte_unmap_unlock(vmf->pte, vmf->ptl);
>> +               folio_put(folio);
>> +               order--;
>> +               goto retry;
> 
> I'm not sure whether this extra fallback logic is worth it or not. Do
> you have any benchmark data or is it just an arbitrary design choice?
> If it is just an arbitrary design choice, I'd like to go with the
> simplest way by just exiting page fault handler, just like the
> order-0, IMHO.

Yes, its an arbitrary design choice. Based on Yu Zhao's feedback, I'm already
reworking this so that we only try the preferred order and order-0, so no longer
iterating through intermediate orders.

I think what you are suggesting is that if attempting to allocate the preferred
order and we find there was a race meaning that the folio now is overlapping
populated ptes (but the faulting pte is still empty), just exit and rely on the
page fault being re-triggered, rather than immediately falling back to order-0?

The reason I didn't do that was I wasn't sure if the return path might have
assumptions that the faulting pte is now valid if no error was returned? I guess
another option is to return VM_FAULT_RETRY but then it seemed cleaner to do the
retry directly here. What do you suggest?

Thanks,
Ryan



> 
>>         }
>>
>>         ret = check_stable_address_space(vma->vm_mm);
>> @@ -4286,16 +4413,18 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>>                 return handle_userfault(vmf, VM_UFFD_MISSING);
>>         }
>>
>> -       inc_mm_counter(vma->vm_mm, MM_ANONPAGES);
>> -       folio_add_new_anon_rmap(folio, vma, vmf->address);
>> +       folio_ref_add(folio, pgcount - 1);
>> +
>> +       add_mm_counter(vma->vm_mm, MM_ANONPAGES, pgcount);
>> +       folio_add_new_anon_rmap_range(folio, &folio->page, pgcount, vma, addr);
>>         folio_add_lru_vma(folio, vma);
>> -setpte:
>> +
>>         if (uffd_wp)
>>                 entry = pte_mkuffd_wp(entry);
>> -       set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
>> +       set_ptes(vma->vm_mm, addr, vmf->pte, entry, pgcount);
>>
>>         /* No need to invalidate - it was non-present before */
>> -       update_mmu_cache(vma, vmf->address, vmf->pte);
>> +       update_mmu_cache_range(vma, addr, vmf->pte, pgcount);
>>  unlock:
>>         pte_unmap_unlock(vmf->pte, vmf->ptl);
>>         return ret;
>> --
>> 2.25.1
>>
>>

