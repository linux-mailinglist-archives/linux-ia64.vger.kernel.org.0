Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8C95AD71C
	for <lists+linux-ia64@lfdr.de>; Mon,  5 Sep 2022 18:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiIEQJL (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 5 Sep 2022 12:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiIEQJK (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 5 Sep 2022 12:09:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8C052FC4
        for <linux-ia64@vger.kernel.org>; Mon,  5 Sep 2022 09:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662394148;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HvFO3QtE1Se36l/1RKgnERmp1CkIVhI/og6sBHbBfFQ=;
        b=VFWYFgbuVGG31EJ84Wb4xcOJSvMsTdj18yj9FrXODQYJu0JU3UaW+L8CASJYJrxJMbaEtD
        tgwZN2C0WYTTcemvATYwQccEENjYyKfjEQR/WU8vitt7Ws+qIFDzKqF94WCUVI2Izr8m11
        bVl3+gPFdr1QKxTkfwrHBrwMJ2SyPLs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-HY4QW0rNPraWGO2glc8Tdg-1; Mon, 05 Sep 2022 12:09:07 -0400
X-MC-Unique: HY4QW0rNPraWGO2glc8Tdg-1
Received: by mail-wr1-f70.google.com with SMTP id e2-20020adfc842000000b0022861d95e63so884692wrh.14
        for <linux-ia64@vger.kernel.org>; Mon, 05 Sep 2022 09:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=HvFO3QtE1Se36l/1RKgnERmp1CkIVhI/og6sBHbBfFQ=;
        b=f8kCOrJI97Dr0Mk0vhmmdGpf7z95k/n39n9fHG6arNzdfLEM4ZjZM29JspE6ObhWdr
         tJPcP+tRuBCie0LSWGlFWNoUskb/0hRuWQJICv9fkHSnXPpwkaWvytxluLrQ5Yd6mIHF
         RAWBd7HO7I2dOJ8iKBO2yaD/tP09xvKRlzcI0AgAQ6wxdbhnKfhf43hWPDcYmjLtdQ+/
         T7zPDMz0wwOi8ARnAlpvdw/XOzdH8hrGxALHWih4BZF21naCoWm9GHBh691jRpEGb6kQ
         7oXyfB2YAk8GYcrWDS0DzE9jqg5Ko4AZdJkTZyNtKG0ZyCMhfxHVGQhp/QDdn47JeLjO
         Urkg==
X-Gm-Message-State: ACgBeo17lipABLsCTxH5p3XEetlbYVmBBmt9sn0Tip4TbmlG9Wt/7ZdF
        1RLIrLsfBPMcYMVPuN4tTPDw6vwGIDbaf5CZ87ndEnE3o2xvzsKFEjKSuDeECW9dYslqRt8ChtF
        i10dSPGAov4NmU7sq1M3Jww==
X-Received: by 2002:adf:f6cf:0:b0:228:9b2f:c305 with SMTP id y15-20020adff6cf000000b002289b2fc305mr2572062wrp.427.1662394146164;
        Mon, 05 Sep 2022 09:09:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ohwqxY+wBtcsFagHz8bENdY8sctEHMZyiRaFAd2huipxEXx5fxFV3/e85Vn4JOXXyl4JJAQ==
X-Received: by 2002:adf:f6cf:0:b0:228:9b2f:c305 with SMTP id y15-20020adff6cf000000b002289b2fc305mr2572051wrp.427.1662394145900;
        Mon, 05 Sep 2022 09:09:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0? (p200300d82f0dba00c95131d7b2b08ba0.dip0.t-ipconnect.de. [2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600018c300b002206203ed3dsm9771415wrq.29.2022.09.05.09.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 09:09:05 -0700 (PDT)
Message-ID: <362e6361-e2b7-16eb-83c8-203738f7b5d0@redhat.com>
Date:   Mon, 5 Sep 2022 18:09:04 +0200
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
 <5f6a7c6b-5073-f050-8dae-6ee279a8bb0b@redhat.com>
 <ac9ef726-c465-ccec-363e-9cfb60c170e7@csgroup.eu>
 <e54a4004-3de9-7ddf-9368-e98e0dc45425@redhat.com>
 <bb05ac8a-6847-0dcc-1f71-dc7c3f141f11@csgroup.eu>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <bb05ac8a-6847-0dcc-1f71-dc7c3f141f11@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

> Yes I think the assumption is correct for user pages hence for GUP.
> 
> By the way the discussion started with PTDUMP. For PTDUMP we need huge
> page directories to be taken into account. And for anything that
> involves kernel pages like VMAP or VMALLOC.

Yes, makes perfect sense to me now that you explained how/where hugepd 
is actually used -- thanks!

-- 
Thanks,

David / dhildenb

