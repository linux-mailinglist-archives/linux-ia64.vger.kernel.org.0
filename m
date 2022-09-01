Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 797AE5A8EFA
	for <lists+linux-ia64@lfdr.de>; Thu,  1 Sep 2022 09:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233463AbiIAHAX (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 1 Sep 2022 03:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233436AbiIAHAB (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 1 Sep 2022 03:00:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E4015A3E
        for <linux-ia64@vger.kernel.org>; Wed, 31 Aug 2022 23:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662015591;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KutrrOGNshk1JY+KNnymRzeyn0LVovbCCf72jYJxCGQ=;
        b=PVLNrSImv4Mt3SrX+ucleQ69oJ3t3u/9w4ZZGID/rHSyUpRAEqNSbn4q6I42JzypAA4n3g
        I602mi490WOyXkN0AZj3zkJqEnr4axHmsH9JvC8V7740WMgIrlmFBHsnV4BZyKkHIVXiJL
        taGUMYO4RzG2zFYC5jsZR75gvzK7je0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-El8bitbGOoq88g2A7QZskw-1; Thu, 01 Sep 2022 02:59:50 -0400
X-MC-Unique: El8bitbGOoq88g2A7QZskw-1
Received: by mail-wr1-f69.google.com with SMTP id h3-20020adfa4c3000000b002266f5ef273so2780445wrb.14
        for <linux-ia64@vger.kernel.org>; Wed, 31 Aug 2022 23:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=KutrrOGNshk1JY+KNnymRzeyn0LVovbCCf72jYJxCGQ=;
        b=AQCGV+BwyBnrPB04Ci3PEMjOCPH/+vpR4IeNdbtlfmsNTxOj1CqjhznVXkiIifnPaq
         TONDgVF+ej1g0Nu9fszzfy2JxcP2l8POnsNPpBuVzevZrHHcnFD11CfBuB7bkAI0OhQT
         +n0VZ09pwyqBgJK+X8aJ53J9E4zOOV6uyouWmpUC4v+pJmkoJZFzfQ+MZiem0UEV4vrK
         0irYtOsr7I8Rx7kl4UgG1qSxFBFnf3x9P5IdgobboFJKoMNgOpanjQCQptF+xoQv7w4w
         aZa4SYwQWIixOu8PFwy1Okdy8L5oFk/C3Az1d2jNdeMH1x3haIqZY4CReuW0SHBMbcCQ
         UOIw==
X-Gm-Message-State: ACgBeo1Y2agFddFmoILSBpl0TdqokcbXwhAuCgBfDLHSsqMBH362PeWn
        QO62uvTOHKyavB/Lqa5riQ8MlwOEkn/JWCBkMLHIn3y9eCBVcCTRGyGF+9YIG7wsnZJyPWmu5s8
        q3DoRVh70mf7/8nMbsaw97A==
X-Received: by 2002:a5d:5963:0:b0:226:dff7:adbe with SMTP id e35-20020a5d5963000000b00226dff7adbemr7898420wri.568.1662015589136;
        Wed, 31 Aug 2022 23:59:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5m7cRVGCRrdQO37krM0xY2Mf0J7OCDD2pnsNFgIDdRbjKsEjIYNlKU/VsHPl1xPTx1IzQE+g==
X-Received: by 2002:a5d:5963:0:b0:226:dff7:adbe with SMTP id e35-20020a5d5963000000b00226dff7adbemr7898405wri.568.1662015588841;
        Wed, 31 Aug 2022 23:59:48 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:9e00:fec0:7e96:15cb:742? (p200300cbc7079e00fec07e9615cb0742.dip0.t-ipconnect.de. [2003:cb:c707:9e00:fec0:7e96:15cb:742])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c154900b003a60ff7c082sm4693019wmg.15.2022.08.31.23.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 23:59:48 -0700 (PDT)
Message-ID: <02209dba-532d-a033-2dba-077ed26c8c6a@redhat.com>
Date:   Thu, 1 Sep 2022 08:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
Content-Language: en-US
To:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        Mike Kravetz <mike.kravetz@oracle.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        inuxppc-dev@lists.ozlabs.org, linux-ia64@vger.kernel.org,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Naoya Horiguchi <naoya.horiguchi@linux.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20220829234053.159158-1-mike.kravetz@oracle.com>
 <57c8f032-e48a-bacb-7922-3e2cc10dc0d2@linux.alibaba.com>
 <Yw4+YvdS9kJUnx1s@monkey> <Yw5ZTEqxZCAgEbK9@monkey>
 <0a8025eb-cf15-453a-7d7d-7c72d008889a@linux.alibaba.com>
 <Yw/2CDbFDX5cnB2o@monkey>
 <aee00134-794a-1589-e4a7-a1480d7a559f@linux.alibaba.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <aee00134-794a-1589-e4a7-a1480d7a559f@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 01.09.22 03:24, Baolin Wang wrote:
> 
> 
> On 9/1/2022 8:00 AM, Mike Kravetz wrote:
>> On 08/31/22 09:07, Baolin Wang wrote:
>>>
>>>
>>> On 8/31/2022 2:39 AM, Mike Kravetz wrote:
>>>> On 08/30/22 09:44, Mike Kravetz wrote:
>>>>> On 08/30/22 09:06, Baolin Wang wrote:
>>>>>> Hi Mike,
>>>>>>
>>>>>> On 8/30/2022 7:40 AM, Mike Kravetz wrote:
>>>>>>> During discussions of this series [1], it was suggested that hugetlb
>>>>>>> handling code in follow_page_mask could be simplified.  At the beginning
>>>>>>> of follow_page_mask, there currently is a call to follow_huge_addr which
>>>>>>> 'may' handle hugetlb pages.  ia64 is the only architecture which provides
>>>>>>> a follow_huge_addr routine that does not return error.  Instead, at each
>>>>>>> level of the page table a check is made for a hugetlb entry.  If a hugetlb
>>>>>>> entry is found, a call to a routine associated with that entry is made.
>>>>>>>
>>>>>>> Currently, there are two checks for hugetlb entries at each page table
>>>>>>> level.  The first check is of the form:
>>>>>>> 	if (p?d_huge())
>>>>>>> 		page = follow_huge_p?d();
>>>>>>> the second check is of the form:
>>>>>>> 	if (is_hugepd())
>>>>>>> 		page = follow_huge_pd().
>>>>>>>
>>>>>>> We can replace these checks, as well as the special handling routines
>>>>>>> such as follow_huge_p?d() and follow_huge_pd() with a single routine to
>>>>>>> handle hugetlb vmas.
>>>>>>>
>>>>>>> A new routine hugetlb_follow_page_mask is called for hugetlb vmas at the
>>>>>>> beginning of follow_page_mask.  hugetlb_follow_page_mask will use the
>>>>>>> existing routine huge_pte_offset to walk page tables looking for hugetlb
>>>>>>> entries.  huge_pte_offset can be overwritten by architectures, and already
>>>>>>> handles special cases such as hugepd entries.
>>>>>>
>>>>>> Could you also mention that this patch will fix the lock issue for
>>>>>> CONT-PTE/PMD hugetlb by changing to use huge_pte_lock()? which will help
>>>>>> people to understand the issue.
>>>>>
>>>>> Will update message in v2.  Thanks for taking a look!
>>>>>
>>>>
>>>> One additional thought, we 'may' need a separate patch to fix the locking
>>>> issues that can be easily backported.  Not sure this 'simplification' is
>>>> a good backport candidate.
>>>
>>> Yes, that was my thought before, but David did not like adding more
>>> make-legacy-cruft-happy code.
>>>
>>> So how about creating a series that contains 3 patches: picking up patch 1
>>> and patch 3 of my previous series [1], and your current patch? That means
>>> patch 1 and patch 2 in this series can fix the lock issue explicitly and be
>>> suitable to backport, meanwhile patch 3 (which is your current patch) will
>>> cleanup the legacy code.
>>>
>>
>> When I looked at patch 3, I was thinking the update follow_huge_pmd routine
>> would work for the PTE level with a few more modifications.  Perhaps, this is
>> too ugly but it is a smaller set of changes for backport.
>>
>> Of course, this would be followed up with the simplification patch which
>> removes all this code.
> 
> Yes, looks more simple. I can send you a formal patch with your 
> suggestion, which can be added into your cleanup series. Thanks.

As an alternative, we can have a stable-only version that does that.

-- 
Thanks,

David / dhildenb

