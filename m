Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A10F85AB894
	for <lists+linux-ia64@lfdr.de>; Fri,  2 Sep 2022 20:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbiIBSwx (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 2 Sep 2022 14:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbiIBSww (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 2 Sep 2022 14:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47D0DD75A
        for <linux-ia64@vger.kernel.org>; Fri,  2 Sep 2022 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662144771;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k4TiRf0SYDNoIr2Qg83a5142/XxU9MROZO10TeEUAQY=;
        b=OZghKZpxvhjcu06PFznu4/hJPJ+P6pNG+e2SA6ieuN8c5Ekuf0OEokQd7dX1ZB5TQewDYn
        yZBg+AGcbLfZMrhb08MoqzWGTNwtO7AJXK0U9C2fMnkgRyFzWu7ok8iqOD8Zi+0PFCD+oz
        J3ALmaCDcBeq9PQ/tthfAXyAAccVRyE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-ZOCMZWWGO8y8UchIziwV7Q-1; Fri, 02 Sep 2022 14:52:47 -0400
X-MC-Unique: ZOCMZWWGO8y8UchIziwV7Q-1
Received: by mail-wm1-f72.google.com with SMTP id c64-20020a1c3543000000b003a61987ffb3so1540563wma.6
        for <linux-ia64@vger.kernel.org>; Fri, 02 Sep 2022 11:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=k4TiRf0SYDNoIr2Qg83a5142/XxU9MROZO10TeEUAQY=;
        b=NQ1Oq0zPGsSanA6lw23OoZXhtQogK8yMF4jHog3S6CFXmb/0H5WT7BbRCyk7izp8Yj
         VxS8f14sl+Wjt2lSwLS8jQab5lqJGX/y78lCzvaNT/vdx5/LcWE/aaWdNawSIf99dnix
         ZIZQNAahU+INWhQgzIb2u6j0yQQO1kQDYoxiy82euHuezm4gn9gmgBh2swhS3AtKssrf
         zATC1OaB2grzXe9oYWWeWZzV2eWLAXrM82dt3nr9KWYs8ptXP8ontwgKhxTBxLUeT5Yd
         9nxH6Bz7+vzvbjfpf1CikTKhbWYpmn+H495RM8kzaSuCioSKT90neSmgmi+rsAJ5zHrl
         YTxQ==
X-Gm-Message-State: ACgBeo3dcILIJXWzFjOyOELxqqmOdLAA7nhAVHWf3+clebrcr6kB1srh
        SHR0DzYGAN7VZoJX5EFR9mlINyNkzr3JHJq3W3dkTuL9k26EIn1kARERPV4fMh6gk70Eoy9ZKcg
        K1zaGGUz2Tyf4Soi+GFGCQw==
X-Received: by 2002:a5d:40cd:0:b0:225:7425:fac1 with SMTP id b13-20020a5d40cd000000b002257425fac1mr19658351wrq.30.1662144766610;
        Fri, 02 Sep 2022 11:52:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4m3+y82b79Pf+1VPmj4J4yz70TJmSB+VPJmpDbZTLR4/wtAfynWCAurYqCUT7Y7G5Q5TLdcA==
X-Received: by 2002:a5d:40cd:0:b0:225:7425:fac1 with SMTP id b13-20020a5d40cd000000b002257425fac1mr19658336wrq.30.1662144766329;
        Fri, 02 Sep 2022 11:52:46 -0700 (PDT)
Received: from ?IPV6:2003:cb:c714:4800:2077:1bf6:40e7:2833? (p200300cbc714480020771bf640e72833.dip0.t-ipconnect.de. [2003:cb:c714:4800:2077:1bf6:40e7:2833])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c501200b003a32251c3f9sm10099660wmr.5.2022.09.02.11.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 11:52:45 -0700 (PDT)
Message-ID: <323fdb0f-c5a5-e0e5-1ff4-ab971bc295cc@redhat.com>
Date:   Fri, 2 Sep 2022 20:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
Content-Language: en-US
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        inuxppc-dev@lists.ozlabs.org, linux-ia64@vger.kernel.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Naoya Horiguchi <naoya.horiguchi@linux.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20220829234053.159158-1-mike.kravetz@oracle.com>
 <608934d4-466d-975e-6458-34a91ccb4669@redhat.com> <Yw5AOZ/Kc5f3UP+s@monkey>
 <Yw6Bpsow+gUMlHCU@monkey> <739dc825-ece3-a59f-adc5-65861676e0ae@redhat.com>
 <YxJQfGSsbXd3W4m/@monkey>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YxJQfGSsbXd3W4m/@monkey>
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

>>> Adding Christophe on Cc:
>>>
>>> Christophe do you know if is_hugepd is true for all hugetlb entries, not
>>> just hugepd?
>>>
>>> On systems without hugepd entries, I guess ptdump skips all hugetlb entries.
>>> Sigh!
>>
>> IIUC, the idea of ptdump_walk_pgd() is to dump page tables even outside
>> VMAs (for debugging purposes?).
>>
>> I cannot convince myself that that's a good idea when only holding the
>> mmap lock in read mode, because we can just see page tables getting
>> freed concurrently e.g., during concurrent munmap() ... while holding
>> the mmap lock in read we may only walk inside VMA boundaries.
>>
>> That then raises the questions if we're only calling this on special MMs
>> (e.g., init_mm) whereby we cannot really see concurrent munmap() and
>> where we shouldn't have hugetlb mappings or hugepd entries.
>>
> 
> This is going to require a little more thought.
> 
> Since Baolin's patch for stable releases is moving forward, I want to
> get the cleanup provided by this patch in ASAP.  So, I am going to rebase
> this patch on Baolin's with the other fixups.
> 
> Will come back to this cleanup later.

Sure, no need to do it all at once (I was just bringing it up while
thinking about it).

-- 
Thanks,

David / dhildenb

