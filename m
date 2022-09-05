Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B115ACE42
	for <lists+linux-ia64@lfdr.de>; Mon,  5 Sep 2022 10:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236720AbiIEIi4 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 5 Sep 2022 04:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237955AbiIEIiL (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 5 Sep 2022 04:38:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8431A822
        for <linux-ia64@vger.kernel.org>; Mon,  5 Sep 2022 01:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662367066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RskN8vPxcZR9tBlMGRowc28Et8faIlvMz95rfc0y61A=;
        b=Fc8fy/9lEJ3WjUgnAYjdClNGYDfzzV72cvIw+3lZ6BfbXV6a4HGm1OHp1H8WFG4zlZqo48
        RnerWzmzeMm9pZaD/Z5U3BHxnP8DiKmtRkbYrHKOlJpnZ2cfcatkcoJeyhwXpe3Yw4zfxQ
        rrrhVfJYys64KlGpWLNGM3V5qQsHpbA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-5fBMgBPqMOS3KIz-_ks4Qg-1; Mon, 05 Sep 2022 04:37:45 -0400
X-MC-Unique: 5fBMgBPqMOS3KIz-_ks4Qg-1
Received: by mail-wm1-f69.google.com with SMTP id ay27-20020a05600c1e1b00b003a5bff0df8dso6092679wmb.0
        for <linux-ia64@vger.kernel.org>; Mon, 05 Sep 2022 01:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=RskN8vPxcZR9tBlMGRowc28Et8faIlvMz95rfc0y61A=;
        b=tcVEj4YmcugPPaET/gFGoDJQWVMks1KowhfW1qGnobB7bgpRebkL2vMKZjgHMtOGul
         MIH6yJEllZckOm8I54ME5ncF3LKIghfr/HDJeNxpU800Hg2QPWJSyCyQULH/b9rHXrw0
         J4/nxAo+Okt0z/Mrgbj1jpDeAA4T0QDYD9nAMrEVoyksGdMutr4OXPrrUxGfmGQOJFlX
         rK081yROEyrTxO3KQKfltefxtnKNJACBr7X0Vjzlc3OH8f3Q0gXsTNU7Ll8gZ5Q2Mrsy
         S1QW5GqjfCjGTw/9dl+PZ4SDgmGkPbAiL8VqhS9Zu6SETBAvJEsMg1CC0qI6dGqbmrCh
         WHNg==
X-Gm-Message-State: ACgBeo3zaSgtBxUg9ovtAJiY5ihjz71uIBydN7G0k8bNeWhLwShYcD3L
        qh7jk9vR7ryaGrwB5Iv5j214d9HLVlDuRDTwAOkL8jb8xbUSR/AWPFLWDlN+9WdTHVZsRXn3ThW
        XhmlLJm3uVeLBTl/fFCWuqQ==
X-Received: by 2002:a05:600c:4148:b0:3a5:4f94:577b with SMTP id h8-20020a05600c414800b003a54f94577bmr10251117wmm.167.1662367063950;
        Mon, 05 Sep 2022 01:37:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hOewj1kAW5ksLrjog3tDXN8mruAU1BTTIBPUwXHo5nCkedd3cF0KNcRs+6mz3jaCdK4MqQA==
X-Received: by 2002:a05:600c:4148:b0:3a5:4f94:577b with SMTP id h8-20020a05600c414800b003a54f94577bmr10251102wmm.167.1662367063706;
        Mon, 05 Sep 2022 01:37:43 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0? (p200300d82f0dba00c95131d7b2b08ba0.dip0.t-ipconnect.de. [2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0])
        by smtp.gmail.com with ESMTPSA id n22-20020a05600c465600b003a839b9ba0asm15604972wmo.40.2022.09.05.01.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 01:37:43 -0700 (PDT)
Message-ID: <5f6a7c6b-5073-f050-8dae-6ee279a8bb0b@redhat.com>
Date:   Mon, 5 Sep 2022 10:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
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
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <c6f3d408-e050-c1dc-9864-c1b2c92369ed@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 03.09.22 09:07, Christophe Leroy wrote:
> +Resending with valid powerpc list address
> 
> Le 02/09/2022 à 20:52, David Hildenbrand a écrit :
>>>>> Adding Christophe on Cc:
>>>>>
>>>>> Christophe do you know if is_hugepd is true for all hugetlb entries, not
>>>>> just hugepd?
> 
> is_hugepd() is true if and only if the directory entry points to a huge
> page directory and not to the normal lower level directory.
> 
> As far as I understand if the directory entry is not pointing to any
> lower directory but is a huge page entry, pXd_leaf() is true.
> 
> 
>>>>>
>>>>> On systems without hugepd entries, I guess ptdump skips all hugetlb entries.
>>>>> Sigh!
> 
> As far as I can see, ptdump_pXd_entry() handles the pXd_leaf() case.
> 
>>>>
>>>> IIUC, the idea of ptdump_walk_pgd() is to dump page tables even outside
>>>> VMAs (for debugging purposes?).
>>>>
>>>> I cannot convince myself that that's a good idea when only holding the
>>>> mmap lock in read mode, because we can just see page tables getting
>>>> freed concurrently e.g., during concurrent munmap() ... while holding
>>>> the mmap lock in read we may only walk inside VMA boundaries.
>>>>
>>>> That then raises the questions if we're only calling this on special MMs
>>>> (e.g., init_mm) whereby we cannot really see concurrent munmap() and
>>>> where we shouldn't have hugetlb mappings or hugepd entries.
> 
> At least on powerpc, PTDUMP handles only init_mm.
> 
> Hugepage are used at least on powerpc 8xx for linear memory mapping, see
> 
> commit 34536d780683 ("powerpc/8xx: Add a function to early map kernel
> via huge pages")
> commit cf209951fa7f ("powerpc/8xx: Map linear memory with huge pages")
> 
> hugepds may also be used in the future to use huge pages for vmap and
> vmalloc, see commit a6a8f7c4aa7e ("powerpc/8xx: add support for huge
> pages on VMAP and VMALLOC")
> 
> As far as I know, ppc64 also use huge pages for VMAP and VMALLOC, see
> 
> commit d909f9109c30 ("powerpc/64s/radix: Enable HAVE_ARCH_HUGE_VMAP")
> commit 8abddd968a30 ("powerpc/64s/radix: Enable huge vmalloc mappings")

There is a difference between an ordinary huge mapping (e.g., as used 
for THP) and a a hugetlb mapping.

Our current understanding is that hugepd only applies to hugetlb. 
Wouldn't vmap/vmalloc user ordinary huge pmd entries instead of hugepd?

-- 
Thanks,

David / dhildenb

