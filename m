Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4AC751582
	for <lists+linux-ia64@lfdr.de>; Thu, 13 Jul 2023 02:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233237AbjGMAvI (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 12 Jul 2023 20:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjGMAvH (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 12 Jul 2023 20:51:07 -0400
Received: from matoro.tk (unknown [IPv6:2600:1700:4b10:9d80::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A9221FFF;
        Wed, 12 Jul 2023 17:51:03 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; bh=ZsSVaY+eVon5SjtgUgMvgEZNg2fndUojY5kWMt/1GVE=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20230516; t=1689208543; v=1; x=1689640543;
 b=G9gasWVs2y2Zwwu9u/c5Xh+Ra2OkF9sJAWtIsQfiuyI4sMROwM8ZhzifiGtOEw07123q7wMf
 2zQvjmTOujwfXrN9qN1qvg3h1wCtXPttWviJYNubByo6K2GHWMvJ5H/wZw4yoL3wf+CLxKLY5XP
 6PMlyoatHMIatnkKuloXZrlNkWVsGo34TbGx4md0BR/JuLW8hhW4dOj0BbPN+HF1BILmriXwUX/
 Fle/DJ4v9xegX10UuG4GpEv67vtuws4wvJfwxZQB60v3/pnUzwB6RhjIaPbDAgDC2c/gDpTE5YE
 Ch8vQLugep5I4Z0bm6KFc9/TmuSta4WqaFdHk94bEN6MipQe8XdFJZrp3UPinpRNMuNBicQCtU4
 kXVWSwXxADYxjtAafthlHdjyopq1NP7Gt6bVbDdnDdBc1NKSsD4o5URaL6nLphad0oATrs69w3B
 y1ZhjM51bB4uLy1+FKfcu+0qvvSWe1nKigXbtZ8DyP3UBJigwN3/Pz99+NP9p8JUiT1CTkyvPoQ
 qsIPNz7voZokrVZRMierSD8CbcREGmRjXd13TbxtoizUmPPAP2/GW5jxQuhTMZBMNuLCFo6y3r/
 4TcptFayQlReav5CZ1F02hiCF4Se/p/bSFDyMldo/nz7TmAIEfsklCss5HFTgZyqXA6JDc9Eefq
 NCZ0Rq7oI2A=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id fd2ae737; Wed, 12 Jul
 2023 20:35:43 -0400
MIME-Version: 1.0
Date:   Wed, 12 Jul 2023 20:35:43 -0400
From:   matoro <matoro_mailinglist_kernel@matoro.tk>
To:     Helge Deller <deller@gmx.de>
Cc:     Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
        Linux Ia64 <linux-ia64@vger.kernel.org>,
        glaubitz@physik.fu-berlin.de, Sam James <sam@gentoo.org>
Subject: Re: [PATCH 1/5] io_uring: Adjust mapping wrt architecture aliasing
 requirements
In-Reply-To: <802b84f7-94f4-638b-3742-26bca00b262d@gmx.de>
References: <20230314171641.10542-1-axboe@kernel.dk>
 <20230314171641.10542-2-axboe@kernel.dk>
 <1d5f8f99f39e2769b9c76fbc24e2cf50@matoro.tk> <ZK7TrdVXc0O6HMpQ@ls3530>
 <f1bed3cc3c43083cfd86768a91402f6b@matoro.tk>
 <a3ae1656-be97-ccc2-8962-1cb70ebc67fa@gmx.de>
 <802b84f7-94f4-638b-3742-26bca00b262d@gmx.de>
Message-ID: <8bb091fb5fd00072842fe92b03abac9b@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 2023-07-12 16:30, Helge Deller wrote:
> On 7/12/23 21:05, Helge Deller wrote:
>> On 7/12/23 19:28, matoro wrote:
>>> On 2023-07-12 12:24, Helge Deller wrote:
>>>> Hi Matoro,
>>>> 
>>>> * matoro <matoro_mailinglist_kernel@matoro.tk>:
>>>>> On 2023-03-14 13:16, Jens Axboe wrote:
>>>>> > From: Helge Deller <deller@gmx.de>
>>>>> >
>>>>> > Some architectures have memory cache aliasing requirements (e.g. parisc)
>>>>> > if memory is shared between userspace and kernel. This patch fixes the
>>>>> > kernel to return an aliased address when asked by userspace via mmap().
>>>>> >
>>>>> > Signed-off-by: Helge Deller <deller@gmx.de>
>>>>> > Signed-off-by: Jens Axboe <axboe@kernel.dk>
>>>>> > ---
>>>>> >  io_uring/io_uring.c | 51 +++++++++++++++++++++++++++++++++++++++++++++
>>>>> >  1 file changed, 51 insertions(+)
>>>>> >
>>>>> > diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
>>>>> > index 722624b6d0dc..3adecebbac71 100644
>>>>> > --- a/io_uring/io_uring.c
>>>>> > +++ b/io_uring/io_uring.c
>>>>> > @@ -72,6 +72,7 @@
>>>>> >  #include <linux/io_uring.h>
>>>>> >  #include <linux/audit.h>
>>>>> >  #include <linux/security.h>
>>>>> > +#include <asm/shmparam.h>
>>>>> >
>>>>> >  #define CREATE_TRACE_POINTS
>>>>> >  #include <trace/events/io_uring.h>
>>>>> > @@ -3317,6 +3318,54 @@ static __cold int io_uring_mmap(struct file
>>>>> > *file, struct vm_area_struct *vma)
>>>>> >      return remap_pfn_range(vma, vma->vm_start, pfn, sz,
>>>>> > vma->vm_page_prot);
>>>>> >  }
>>>>> >
>>>>> > +static unsigned long io_uring_mmu_get_unmapped_area(struct file *filp,
>>>>> > +            unsigned long addr, unsigned long len,
>>>>> > +            unsigned long pgoff, unsigned long flags)
>>>>> > +{
>>>>> > +    const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
>>>>> > +    struct vm_unmapped_area_info info;
>>>>> > +    void *ptr;
>>>>> > +
>>>>> > +    /*
>>>>> > +     * Do not allow to map to user-provided address to avoid breaking the
>>>>> > +     * aliasing rules. Userspace is not able to guess the offset address
>>>>> > of
>>>>> > +     * kernel kmalloc()ed memory area.
>>>>> > +     */
>>>>> > +    if (addr)
>>>>> > +        return -EINVAL;
>>>>> > +
>>>>> > +    ptr = io_uring_validate_mmap_request(filp, pgoff, len);
>>>>> > +    if (IS_ERR(ptr))
>>>>> > +        return -ENOMEM;
>>>>> > +
>>>>> > +    info.flags = VM_UNMAPPED_AREA_TOPDOWN;
>>>>> > +    info.length = len;
>>>>> > +    info.low_limit = max(PAGE_SIZE, mmap_min_addr);
>>>>> > +    info.high_limit = arch_get_mmap_base(addr, current->mm->mmap_base);
>>>>> > +#ifdef SHM_COLOUR
>>>>> > +    info.align_mask = PAGE_MASK & (SHM_COLOUR - 1UL);
>>>>> > +#else
>>>>> > +    info.align_mask = PAGE_MASK & (SHMLBA - 1UL);
>>>>> > +#endif
>>>>> > +    info.align_offset = (unsigned long) ptr;
>>>>> > +
>>>>> > +    /*
>>>>> > +     * A failed mmap() very likely causes application failure,
>>>>> > +     * so fall back to the bottom-up function here. This scenario
>>>>> > +     * can happen with large stack limits and large mmap()
>>>>> > +     * allocations.
>>>>> > +     */
>>>>> > +    addr = vm_unmapped_area(&info);
>>>>> > +    if (offset_in_page(addr)) {
>>>>> > +        info.flags = 0;
>>>>> > +        info.low_limit = TASK_UNMAPPED_BASE;
>>>>> > +        info.high_limit = mmap_end;
>>>>> > +        addr = vm_unmapped_area(&info);
>>>>> > +    }
>>>>> > +
>>>>> > +    return addr;
>>>>> > +}
>>>>> > +
>>>>> >  #else /* !CONFIG_MMU */
>>>>> >
>>>>> >  static int io_uring_mmap(struct file *file, struct vm_area_struct *vma)
>>>>> > @@ -3529,6 +3578,8 @@ static const struct file_operations io_uring_fops
>>>>> > = {
>>>>> >  #ifndef CONFIG_MMU
>>>>> >      .get_unmapped_area = io_uring_nommu_get_unmapped_area,
>>>>> >      .mmap_capabilities = io_uring_nommu_mmap_capabilities,
>>>>> > +#else
>>>>> > +    .get_unmapped_area = io_uring_mmu_get_unmapped_area,
>>>>> >  #endif
>>>>> >      .poll        = io_uring_poll,
>>>>> >  #ifdef CONFIG_PROC_FS
>>>>> 
>>>>> Hi Jens, Helge - I've bisected a regression with io_uring on ia64 
>>>>> to this
>>>>> patch in 6.4.  Unfortunately this breaks userspace programs using 
>>>>> io_uring,
>>>>> the easiest one to test is cmake with an io_uring enabled libuv 
>>>>> (i.e., libuv
>>>>> >= 1.45.0) which will hang.
>>>>> 
>>>>> I am aware that ia64 is in a vulnerable place right now which I why 
>>>>> I am
>>>>> keeping this spread limited.  Since this clearly involves
>>>>> architecture-specific changes for parisc,
>>>> 
>>>> it isn't so much architecture-specific... (just one ifdef)
>>>> 
>>>>> is there any chance of looking at
>>>>> what is required to do the same for ia64?  I looked at
>>>>> 0ef36bd2b37815719e31a72d2beecc28ca8ecd26 ("parisc: change value of 
>>>>> SHMLBA
>>>>> from 0x00400000 to PAGE_SIZE") and tried to replicate the SHMLBA ->
>>>>> SHM_COLOUR change, but it made no difference.
>>>>> 
>>>>> If hardware is necessary for testing, I can provide it, including 
>>>>> remote BMC
>>>>> access for restarts/kernel debugging.  Any takers?
>>>> 
>>>> I won't have time to test myself, but maybe you could test?
>>>> 
>>>> Basically we should try to find out why 
>>>> io_uring_mmu_get_unmapped_area()
>>>> doesn't return valid addresses, while arch_get_unmapped_area()
>>>> [in arch/ia64/kernel/sys_ia64.c] does.
>>>> 
>>>> You could apply this patch first:
>>>> It introduces a memory leak (as it requests memory twice), but maybe 
>>>> we
>>>> get an idea?
>>>> The ia64 arch_get_unmapped_area() searches for memory from bottom
>>>> (flags=0), while io_uring function tries top-down first. Maybe 
>>>> that's
>>>> the problem. And I don't understand the offset_in_page() check right
>>>> now.
>>>> 
>>>> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
>>>> index 3bca7a79efda..93b1964d2bbb 100644
>>>> --- a/io_uring/io_uring.c
>>>> +++ b/io_uring/io_uring.c
>>>> @@ -3431,13 +3431,17 @@ static unsigned long 
>>>> io_uring_mmu_get_unmapped_area(struct file *filp,
>>>>       * can happen with large stack limits and large mmap()
>>>>       * allocations.
>>>>       */
>>>> +/* compare to arch_get_unmapped_area() in 
>>>> arch/ia64/kernel/sys_ia64.c */
>>>>      addr = vm_unmapped_area(&info);
>>>> -    if (offset_in_page(addr)) {
>>>> +printk("io_uring_mmu_get_unmapped_area() address 1 is: %px\n", 
>>>> addr);
>>>> +    addr = NULL;
>>>> +    if (!addr) {
>>>>          info.flags = 0;
>>>>          info.low_limit = TASK_UNMAPPED_BASE;
>>>>          info.high_limit = mmap_end;
>>>>          addr = vm_unmapped_area(&info);
>>>>      }
>>>> +printk("io_uring_mmu_get_unmapped_area() returns address %px\n", 
>>>> addr);
>>>> 
>>>>      return addr;
>>>>  }
>>>> 
>>>> 
>>>> Another option is to disable the call to 
>>>> io_uring_nommu_get_unmapped_area())
>>>> with the next patch. Maybe you could add printks() to ia64's 
>>>> arch_get_unmapped_area()
>>>> and check what it returns there?
>>>> 
>>>> @@ -3654,6 +3658,8 @@ static const struct file_operations 
>>>> io_uring_fops = {
>>>>  #ifndef CONFIG_MMU
>>>>      .get_unmapped_area = io_uring_nommu_get_unmapped_area,
>>>>      .mmap_capabilities = io_uring_nommu_mmap_capabilities,
>>>> +#elif 0    /* IS_ENABLED(CONFIG_IA64) */
>>>> +    .get_unmapped_area = NULL,
>>>>  #else
>>>>      .get_unmapped_area = io_uring_mmu_get_unmapped_area,
>>>>  #endif
>>>> 
>>>> Helge
>>> 
>>> Thanks Helge.  Sample output from that first patch:
>>> 
>>> [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area() address 1 
>>> is: 1ffffffffff40000
>>> [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area() returns 
>>> address 2000000001e40000
>>> [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area() address 1 
>>> is: 1ffffffffff20000
>>> [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area() returns 
>>> address 2000000001f20000
>>> [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area() address 1 
>>> is: 1ffffffffff30000
>>> [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area() returns 
>>> address 2000000001f30000
>>> [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area() address 1 
>>> is: 1ffffffffff90000
>>> [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area() returns 
>>> address 2000000001f90000
>>> 
>>> This pattern seems to be pretty stable, I tried instead just directly 
>>> returning the result of a call to arch_get_unmapped_area() at the end 
>>> of the function and it seems similar:
>>> 
>>> [Wed Jul 12 13:27:07 2023] io_uring_mmu_get_unmapped_area() would 
>>> return address 1ffffffffffd0000
>>> [Wed Jul 12 13:27:07 2023] but arch_get_unmapped_area() would return 
>>> address 2000000001f00000
>>> [Wed Jul 12 13:27:07 2023] io_uring_mmu_get_unmapped_area() would 
>>> return address 1ffffffffff00000
>>> [Wed Jul 12 13:27:07 2023] but arch_get_unmapped_area() would return 
>>> address 1ffffffffff00000
>>> [Wed Jul 12 13:27:07 2023] io_uring_mmu_get_unmapped_area() would 
>>> return address 1fffffffffe20000
>>> [Wed Jul 12 13:27:07 2023] but arch_get_unmapped_area() would return 
>>> address 2000000002000000
>>> [Wed Jul 12 13:27:07 2023] io_uring_mmu_get_unmapped_area() would 
>>> return address 1fffffffffe30000
>>> [Wed Jul 12 13:27:07 2023] but arch_get_unmapped_area() would return 
>>> address 2000000002100000
>>> 
>>> Is that enough of a clue to go on?
>> 
>> SHMLBA on ia64 is 0x100000:
>> arch/ia64/include/asm/shmparam.h:#define        SHMLBA  (1024*1024)
>> but the values returned by io_uring_mmu_get_unmapped_area() does not 
>> fullfill this.
>> 
>> So, probably ia64's SHMLBA isn't pulled in correctly in 
>> io_uring/io_uring.c.
>> Check value of this line:
>>      info.align_mask = PAGE_MASK & (SHMLBA - 1UL);
>> 
>> You could also add
>> #define SHM_COLOUR  0x100000
>> in front of the
>>      #ifdef SHM_COLOUR
>> (define SHM_COLOUR in io_uring/kbuf.c too).
> 
> What is the value of PAGE_SIZE and "ptr" on your machine?
> For 4k page size I get:
> SHMLBA -1   ->        FFFFF
> PAGE_MASK   -> FFFFFFFFF000
> so,
> info.align_mask = PAGE_MASK & (SHMLBA - 1UL) = 0xFF000;
> You could try to set nfo.align_mask = 0xfffff;
> 
> Helge

Using 64KiB (65536) PAGE_SIZE here.  64-bit pointers.

Tried both #define SHM_COLOUR 0x100000, as well and info.align_mask = 
0xFFFFF, but both of them made the problem change from 100% 
reproducible, to intermittent.

After inspecting the ouput I observed that it hangs only when the first 
allocation returns an address below 0x2000000000000000, and the second 
returns an address above it.  When both addresses are above it, it does 
not hang.  Examples:

When it works:
$ cmake --version
cmake version 3.26.4

CMake suite maintained and supported by Kitware (kitware.com/cmake).
$ dmesg --color=always -T | tail -n 4
[Wed Jul 12 20:32:37 2023] io_uring_mmu_get_unmapped_area() would return 
address 1fffffffffe20000
[Wed Jul 12 20:32:37 2023] but arch_get_unmapped_area() would return 
address 2000000002000000
[Wed Jul 12 20:32:37 2023] io_uring_mmu_get_unmapped_area() would return 
address 1fffffffffe50000
[Wed Jul 12 20:32:37 2023] but arch_get_unmapped_area() would return 
address 2000000002100000


When it hangs:
$ cmake --version
cmake version 3.26.4

CMake suite maintained and supported by Kitware (kitware.com/cmake).
^C
$ dmesg --color=always -T | tail -n 4
[Wed Jul 12 20:33:12 2023] io_uring_mmu_get_unmapped_area() would return 
address 1ffffffffff00000
[Wed Jul 12 20:33:12 2023] but arch_get_unmapped_area() would return 
address 1ffffffffff00000
[Wed Jul 12 20:33:12 2023] io_uring_mmu_get_unmapped_area() would return 
address 1fffffffffe60000
[Wed Jul 12 20:33:12 2023] but arch_get_unmapped_area() would return 
address 2000000001f00000

Is io_uring_mmu_get_unmapped_area supported to always return addresses 
above 0x2000000000000000?  Any reason why it is not doing so sometimes?
