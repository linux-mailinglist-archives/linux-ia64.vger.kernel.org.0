Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0630514570
	for <lists+linux-ia64@lfdr.de>; Fri, 29 Apr 2022 11:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355149AbiD2Jcy (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 29 Apr 2022 05:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356603AbiD2Jcx (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 29 Apr 2022 05:32:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE5D2C4023
        for <linux-ia64@vger.kernel.org>; Fri, 29 Apr 2022 02:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651224575;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QgB5yaRKGIdlayUhadpAeJYzfWS9JALUqL7mNuN6Qd8=;
        b=CAhtVp3zNbd5IpGLIyzp6OKgW4wohBslgsOsmBvRCbG4E7i4DJgbW+Ic0ZxQJE5qIsury/
        SMhLkUCeOKyRYigQUNPOjrZSfc9UWaPVxvSqaimLLvYr/HP2R/NO5wst3WUIwpcFsdtBRe
        pp7Vw6RyiRtzgRAy3Ks8ikK2sagjcNs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-MU6YkRIqMJaiwmWHgM3U9A-1; Fri, 29 Apr 2022 05:29:33 -0400
X-MC-Unique: MU6YkRIqMJaiwmWHgM3U9A-1
Received: by mail-wm1-f71.google.com with SMTP id c125-20020a1c3583000000b0038e3f6e871aso2740140wma.8
        for <linux-ia64@vger.kernel.org>; Fri, 29 Apr 2022 02:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=QgB5yaRKGIdlayUhadpAeJYzfWS9JALUqL7mNuN6Qd8=;
        b=71DwWtMhmUbrGgGqwNfarJiYt+NejziBlLruCO/1yHCc9KTjGtnVdRv7a3oDoqWz1O
         0hq1B9R/2oNUaV0gC+wzUkIeKq/WaGA2qsHq3+4UXRBL3mTZ7Kr+9hAkdAFS04clnH0V
         eiS7CoXsrSx7bUgtwgmm7zkaH5zL6+Kf/6VP5MCDdCEOhuJCJSOKXAYEqB3F/S5xe2v+
         8cAaUybXzv82eUUHg0qTf0oYhai1Jq3ohEfZQB+OVRuBgGdk1XnuoX6BFbKlezILnWbT
         mfwxvJQcmO6S8fMnDHwpdOBmV+m9TID2UfZhNBzjC0F6P27prnGFfpO7YF4ZcQzFBsN7
         gd3Q==
X-Gm-Message-State: AOAM531kSIzLYHfg40raQwowfaY0/Pmk/oGYXVQijwyZ6/HfBaZFzN/f
        MhTlrBltvAYs/kOdpiEHRxFS+5o5V5y0D1afOB8WT9V+cN1gkBYj6/8XwCu0BHiD7Y0FiRFNAI2
        QRVB26DwGASYkak17g/ex4A==
X-Received: by 2002:a05:600c:1e1d:b0:394:2183:e75c with SMTP id ay29-20020a05600c1e1d00b003942183e75cmr1449458wmb.203.1651224572514;
        Fri, 29 Apr 2022 02:29:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkEWzgTJZjaYtD3yVNYsqURSYJbIbWoBwBM9HWJh9gbQs/M7ikohXN+kV9+WxpKCCTka/Prw==
X-Received: by 2002:a05:600c:1e1d:b0:394:2183:e75c with SMTP id ay29-20020a05600c1e1d00b003942183e75cmr1449435wmb.203.1651224572300;
        Fri, 29 Apr 2022 02:29:32 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:fe00:bbeb:98e6:617a:dea1? (p200300cbc707fe00bbeb98e6617adea1.dip0.t-ipconnect.de. [2003:cb:c707:fe00:bbeb:98e6:617a:dea1])
        by smtp.gmail.com with ESMTPSA id q14-20020a1cf30e000000b0038986a18ec8sm2140400wmq.46.2022.04.29.02.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 02:29:31 -0700 (PDT)
Message-ID: <95216c6f-0614-cadc-d256-92a172d8b8cd@redhat.com>
Date:   Fri, 29 Apr 2022 11:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4] mm: Using for_each_online_node and node_online instead
 of open coding
Content-Language: en-US
To:     Peng Liu <liupeng256@huawei.com>, mike.kravetz@oracle.com,
        akpm@linux-foundation.org, yaozhenguo1@gmail.com,
        baolin.wang@linux.alibaba.com, songmuchun@bytedance.com,
        liuyuntao10@huawei.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
        dave@stgolabs.net, wangborong@cdjrlc.com,
        linux-ia64@vger.kernel.org, adobriyan@gmail.com
References: <20220413032915.251254-4-liupeng256@huawei.com>
 <20220429030218.644635-1-liupeng256@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220429030218.644635-1-liupeng256@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 29.04.22 05:02, Peng Liu wrote:
> Use more generic functions to deal with issues related to online
> nodes. The changes will make the code simplified.
> 
> Signed-off-by: Peng Liu <liupeng256@huawei.com>
> Suggested-by: Davidlohr Bueso <dave@stgolabs.net>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb

