Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37955ACF25
	for <lists+linux-ia64@lfdr.de>; Mon,  5 Sep 2022 11:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbiIEJqT (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 5 Sep 2022 05:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235929AbiIEJqS (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 5 Sep 2022 05:46:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D9A51410
        for <linux-ia64@vger.kernel.org>; Mon,  5 Sep 2022 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662371174;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1Q/0WbMfiU5pCGwYiNx91CEKF86M0nGqDiqFxeXREM8=;
        b=NMDeFA1gG8XFzvA7mPce0nh+xNc7jiR+aKr1GnFLO4RDZ0qfnSxqdgXhYD/1O6WDfnVe61
        Jxxxkq4DBLooqa4+8rXz+koJhwvkLHGJOHE4cSPqvWm6Q1kpJKSrdo/Sl0+9Q7UGjCpD2k
        8xWrs08jw8JZxQjypHH1Kx3BDRwb4IY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-kyecnvOgOwCNIo5fm0Gjnw-1; Mon, 05 Sep 2022 05:46:13 -0400
X-MC-Unique: kyecnvOgOwCNIo5fm0Gjnw-1
Received: by mail-wr1-f69.google.com with SMTP id t11-20020adfba4b000000b00226eb5f7564so1121103wrg.10
        for <linux-ia64@vger.kernel.org>; Mon, 05 Sep 2022 02:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=1Q/0WbMfiU5pCGwYiNx91CEKF86M0nGqDiqFxeXREM8=;
        b=EgTdEK7KhcUBx2SUzSuypPRWzLQp4XvW23I3Lq+TjGeq4WKa3RFoJnZyLKmd8UXHhB
         shRWbtM3/Evlh4CBFM47P3NDlPjWs4p8l0oLi7wnP3+NhEBFMk08zyFNZ7iaMYULjeaf
         vD939NJS4avgPGP+lUTJ5Xo2jpa63I5k34Tcs/x7RAfG9gVIRsqNMvmjjkAUh63Stx2s
         rFumKTX1guAmi07UKKXS3CYswG2cqtkrSpd3HHC2i6FjJ3Hz9GVnvlRfgYVdtZUOEtov
         h3ONogOwUDVKyxDyxcRmSIfnI4UoH879EF0yUxdjG04/ghNP3LYkNp9NQdz6laUY+q+f
         MC0A==
X-Gm-Message-State: ACgBeo1g22mCDZhBT47Ls1PPLKfwT0FO3Vcs+xqTWDAYy4fxDKiXYxGS
        Emr/t2OeUG0MTAvy7r90cTh6Yr1T+0S53A2Q5WBpXnRqp8wqIL84aDozJrXjnrvSGtCRlkX8FDM
        YNp2iDKXqMJ9mE5dyE6Udjg==
X-Received: by 2002:a1c:7708:0:b0:3a5:5543:cec4 with SMTP id t8-20020a1c7708000000b003a55543cec4mr10424032wmi.47.1662371171877;
        Mon, 05 Sep 2022 02:46:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Wwy0zqSyrxArr5R3ToadS4HGGIDzAwUIVN/JrVOdKZSTGbW21NA2h//jzBvvIZj5PunHYoA==
X-Received: by 2002:a1c:7708:0:b0:3a5:5543:cec4 with SMTP id t8-20020a1c7708000000b003a55543cec4mr10424006wmi.47.1662371171554;
        Mon, 05 Sep 2022 02:46:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0? (p200300d82f0dba00c95131d7b2b08ba0.dip0.t-ipconnect.de. [2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0])
        by smtp.gmail.com with ESMTPSA id bz9-20020a056000090900b0022584c82c80sm8630307wrb.19.2022.09.05.02.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 02:46:11 -0700 (PDT)
Message-ID: <e54a4004-3de9-7ddf-9368-e98e0dc45425@redhat.com>
Date:   Mon, 5 Sep 2022 11:46:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Mike Kravetz <mike.kravetz@oracle.com>
Cc:     "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Naoya Horiguchi <naoya.horiguchi@linux.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220829234053.159158-1-mike.kravetz@oracle.com>
 <608934d4-466d-975e-6458-34a91ccb4669@redhat.com> <Yw5AOZ/Kc5f3UP+s@monkey>
 <Yw6Bpsow+gUMlHCU@monkey> <739dc825-ece3-a59f-adc5-65861676e0ae@redhat.com>
 <YxJQfGSsbXd3W4m/@monkey> <323fdb0f-c5a5-e0e5-1ff4-ab971bc295cc@redhat.com>
 <c6f3d408-e050-c1dc-9864-c1b2c92369ed@csgroup.eu>
 <5f6a7c6b-5073-f050-8dae-6ee279a8bb0b@redhat.com>
 <ac9ef726-c465-ccec-363e-9cfb60c170e7@csgroup.eu>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
In-Reply-To: <ac9ef726-c465-ccec-363e-9cfb60c170e7@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 05.09.22 11:33, Christophe Leroy wrote:
> 
> 
> Le 05/09/2022 à 10:37, David Hildenbrand a écrit :
>> On 03.09.22 09:07, Christophe Leroy wrote:
>>> +Resending with valid powerpc list address
>>>
>>> Le 02/09/2022 à 20:52, David Hildenbrand a écrit :
>>>>>>> Adding Christophe on Cc:
>>>>>>>
>>>>>>> Christophe do you know if is_hugepd is true for all hugetlb
>>>>>>> entries, not
>>>>>>> just hugepd?
>>>
>>> is_hugepd() is true if and only if the directory entry points to a huge
>>> page directory and not to the normal lower level directory.
>>>
>>> As far as I understand if the directory entry is not pointing to any
>>> lower directory but is a huge page entry, pXd_leaf() is true.
>>>
>>>
>>>>>>>
>>>>>>> On systems without hugepd entries, I guess ptdump skips all
>>>>>>> hugetlb entries.
>>>>>>> Sigh!
>>>
>>> As far as I can see, ptdump_pXd_entry() handles the pXd_leaf() case.
>>>
>>>>>>
>>>>>> IIUC, the idea of ptdump_walk_pgd() is to dump page tables even
>>>>>> outside
>>>>>> VMAs (for debugging purposes?).
>>>>>>
>>>>>> I cannot convince myself that that's a good idea when only holding the
>>>>>> mmap lock in read mode, because we can just see page tables getting
>>>>>> freed concurrently e.g., during concurrent munmap() ... while holding
>>>>>> the mmap lock in read we may only walk inside VMA boundaries.
>>>>>>
>>>>>> That then raises the questions if we're only calling this on
>>>>>> special MMs
>>>>>> (e.g., init_mm) whereby we cannot really see concurrent munmap() and
>>>>>> where we shouldn't have hugetlb mappings or hugepd entries.
>>>
>>> At least on powerpc, PTDUMP handles only init_mm.
>>>
>>> Hugepage are used at least on powerpc 8xx for linear memory mapping, see
>>>
>>> commit 34536d780683 ("powerpc/8xx: Add a function to early map kernel
>>> via huge pages")
>>> commit cf209951fa7f ("powerpc/8xx: Map linear memory with huge pages")
>>>
>>> hugepds may also be used in the future to use huge pages for vmap and
>>> vmalloc, see commit a6a8f7c4aa7e ("powerpc/8xx: add support for huge
>>> pages on VMAP and VMALLOC")
>>>
>>> As far as I know, ppc64 also use huge pages for VMAP and VMALLOC, see
>>>
>>> commit d909f9109c30 ("powerpc/64s/radix: Enable HAVE_ARCH_HUGE_VMAP")
>>> commit 8abddd968a30 ("powerpc/64s/radix: Enable huge vmalloc mappings")
>>
>> There is a difference between an ordinary huge mapping (e.g., as used
>> for THP) and a a hugetlb mapping.
>>
>> Our current understanding is that hugepd only applies to hugetlb.
>> Wouldn't vmap/vmalloc user ordinary huge pmd entries instead of hugepd?
>>
> 
> 'hugepd' stands for huge page directory. It is independant of whether a
> huge page is used for hugetlb or for anything else, it represents the
> way pages are described in the page tables.

This patch here makes the assumption that hugepd only applies to 
hugetlb, because it removes any such handling from the !hugetlb path in 
GUP. Is that incorrect or are there valid cases where that could happen? 
(init_mm is special in that regard, i don't think it interacts with GUP 
at all).

> 
> I don't know what you mean by _ordinary_ huge pmd entry.
> 

Essentially, what we use for THP. Let me try to understand how hugepd 
interact with the rest of the system.

Do systems that support hugepd currently implement THP? Reading above 
32bit systems below, I assume not?

> Let's take the exemple of powerpc 8xx which is the one I know best. This
> is a powerpc32, so it has two levels : PGD and PTE. PGD has 1024 entries
> and each entry covers a 4Mbytes area. Normal PTE has 1024 entries and
> each entry is a 4k page. When you use 8Mbytes pages, you don't use PTEs
> as it would be a waste of memory. You use a huge page directory that has
> a single entry, and you have two PGD entries pointing to the huge page
> directory.

Thanks, I assume there are no 8MB THP, correct?

The 8MB example with 4MB PGD entries makes it sound a bit like the 
cont-PTE/cont-PMD handling on aarch64: they don't use a hugepd but 
would simply let two consecutive PGD entries point at the the relevant 
(sub) parts of the hugetlb page. No hugepd involved.

> 
> Some time ago, hupgepd was also used for 512kbytes pages and 16kbytes
> pages:
> - there was huge page directories with 8x 512kbytes pages,
> - there was huge page directories with 256x 16kbytes pages,
> 
> And the PGD/PMD entry points to a huge page directory (HUGEPD) instead
> of pointing to a page table directory (PTE).

Thanks for the example.

> 
> Since commit b250c8c08c79 ("powerpc/8xx: Manage 512k huge pages as
> standard pages."), the 8xx doesn't use anymore hugepd for 512k huge
> page, but other platforms like powerpc book3e extensively use huge page
> directories.
> 
> I hope this clarifies the subject, otherwise I'm happy to provide
> further details.

Thanks, it would be valuable to know if the assumption in this patch is 
correct: hugepd will only be found in hugetlb areas in ordinary MMs (not 
init_mm).

-- 
Thanks,

David / dhildenb

