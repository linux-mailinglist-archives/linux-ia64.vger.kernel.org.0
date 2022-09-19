Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8C65BC3B3
	for <lists+linux-ia64@lfdr.de>; Mon, 19 Sep 2022 09:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiISHuU (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 19 Sep 2022 03:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiISHuT (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 19 Sep 2022 03:50:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CD413E87
        for <linux-ia64@vger.kernel.org>; Mon, 19 Sep 2022 00:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663573817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i/iLQ4kdAhzUU0VWkseG+c5vX7QQyvDlfGs9j2AsJDU=;
        b=IkX3gN4iMoE45fXU6P1OwWTCIVHLBSwrw311FS9GL6HNdzOljMHNJcvHsVrB4aMxRGBaD3
        noHn4eQ4mKKHBX4y7Lb31aBjs5s6d5ioZDooG28QmRkTvPf1o3TKsOWk3rlgXtVtNk0hcN
        Iuw/VNW1TAgMfqB0BHhzhp/fuaHu9Y0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-75-Mt7pIDA1OrOcvuko6lzfqg-1; Mon, 19 Sep 2022 03:50:15 -0400
X-MC-Unique: Mt7pIDA1OrOcvuko6lzfqg-1
Received: by mail-wm1-f71.google.com with SMTP id 14-20020a05600c228e00b003b4d065282dso964326wmf.8
        for <linux-ia64@vger.kernel.org>; Mon, 19 Sep 2022 00:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=i/iLQ4kdAhzUU0VWkseG+c5vX7QQyvDlfGs9j2AsJDU=;
        b=F4xzd/3S7sHn5VCriPC6bokcCI9WwC0F6P9kP3VOHyq6XJGTnbzIXzBV7d5urLKcKG
         H89CB2S3Fp0relIVuonlxKia76OkO8d1F6XsYTpnl8Vn5MlctpDyFOP4g6LwbBRi6TVT
         SX5K/wEpRHj/pqovzM8PDBN15pr8H2mowKUkQuIPphFBStNZp7duovW4RKJ+2nDwfo9J
         uiJlWeLhfVBcHYsghiFegAq3k68aJ0DbQGtTssORIV/Sq4MMa/giapWyIDwwc7S3uCKH
         y23s5+73zZ4g/Rqg36LqS4BJxmAKe3owkY6vMxdKD7drQ7ddxUZOWY28SamP7Wr9Miwo
         3JzQ==
X-Gm-Message-State: ACrzQf0Owwt5DU0CvK5+eQpMPGOfwdKq5vIwk8TfwJJuzlKYqhgKbEd0
        IK3PfmjmgW9P3pGHUz0aP0DpmlIaCfTEnHS2yqTDb2iFOY3tQ8hsOCFIm48TGvp3YHPZOOn099s
        JEOiIUFyWvQyZHOw7vNE/ww==
X-Received: by 2002:adf:a50e:0:b0:22a:ede1:57e with SMTP id i14-20020adfa50e000000b0022aede1057emr5797006wrb.63.1663573814676;
        Mon, 19 Sep 2022 00:50:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69yWPQ71p10ovzZwsnci+6il7uBFgZ4x37tHZjCyhjLk1+HnJ2naaRkgKbADZjLobyfndxig==
X-Received: by 2002:adf:a50e:0:b0:22a:ede1:57e with SMTP id i14-20020adfa50e000000b0022aede1057emr5796994wrb.63.1663573814405;
        Mon, 19 Sep 2022 00:50:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:c100:c136:f914:345f:f5f3? (p200300cbc703c100c136f914345ff5f3.dip0.t-ipconnect.de. [2003:cb:c703:c100:c136:f914:345f:f5f3])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d67c2000000b0021badf3cb26sm15174363wrw.63.2022.09.19.00.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 00:50:13 -0700 (PDT)
Message-ID: <3d2fc74b-7496-6691-aec0-8d4ed30df139@redhat.com>
Date:   Mon, 19 Sep 2022 09:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3] hugetlb: simplify hugetlb handling in follow_page_mask
To:     Mike Kravetz <mike.kravetz@oracle.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-ia64@vger.kernel.org
Cc:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Naoya Horiguchi <naoya.horiguchi@linux.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20220919021348.22151-1-mike.kravetz@oracle.com>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220919021348.22151-1-mike.kravetz@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 19.09.22 04:13, Mike Kravetz wrote:
> During discussions of this series [1], it was suggested that hugetlb
> handling code in follow_page_mask could be simplified.  At the beginning
> of follow_page_mask, there currently is a call to follow_huge_addr which
> 'may' handle hugetlb pages.  ia64 is the only architecture which provides
> a follow_huge_addr routine that does not return error.  Instead, at each
> level of the page table a check is made for a hugetlb entry.  If a hugetlb
> entry is found, a call to a routine associated with that entry is made.
> 
> Currently, there are two checks for hugetlb entries at each page table
> level.  The first check is of the form:
>          if (p?d_huge())
>                  page = follow_huge_p?d();
> the second check is of the form:
>          if (is_hugepd())
>                  page = follow_huge_pd().
> 
> We can replace these checks, as well as the special handling routines
> such as follow_huge_p?d() and follow_huge_pd() with a single routine to
> handle hugetlb vmas.
> 
> A new routine hugetlb_follow_page_mask is called for hugetlb vmas at the
> beginning of follow_page_mask.  hugetlb_follow_page_mask will use the
> existing routine huge_pte_offset to walk page tables looking for hugetlb
> entries.  huge_pte_offset can be overwritten by architectures, and already
> handles special cases such as hugepd entries.
> 
> [1] https://lore.kernel.org/linux-mm/cover.1661240170.git.baolin.wang@linux.alibaba.com/
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

