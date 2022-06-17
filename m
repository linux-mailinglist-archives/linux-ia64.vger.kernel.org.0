Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46E9054F8FE
	for <lists+linux-ia64@lfdr.de>; Fri, 17 Jun 2022 16:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382656AbiFQOPo (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 17 Jun 2022 10:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381868AbiFQOPn (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 17 Jun 2022 10:15:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BD4D951E5A
        for <linux-ia64@vger.kernel.org>; Fri, 17 Jun 2022 07:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655475339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=45WsYeBZBgVP+tO+Yp5wRnejBKTYaIp3okpekaDuC30=;
        b=exSbu3g2/R4OGiKaC+iCLPWAArp3zQ1sb3m25obkVyrTKXoF/RCGdte30TOtE6K7xBcEOM
        /1nC6q982RJ5wp2vrfKIVKiuvQutUJ7n57m85BWXJD0v8BZjzasVyb/YDmDIiqdCMdeHJr
        QrxYOAlWvgVEB5AD0K22SHYk3lEyzkI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-DmKzH8AYNX-nttiuXlzdxQ-1; Fri, 17 Jun 2022 10:15:38 -0400
X-MC-Unique: DmKzH8AYNX-nttiuXlzdxQ-1
Received: by mail-io1-f71.google.com with SMTP id p3-20020a6b8d03000000b00669c6d6c089so2594938iod.1
        for <linux-ia64@vger.kernel.org>; Fri, 17 Jun 2022 07:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=45WsYeBZBgVP+tO+Yp5wRnejBKTYaIp3okpekaDuC30=;
        b=CoBxaqpXRMgsqUrPLKxv5/PXkjtmHfB4CdFcj1qdeIJ0xAd/S2CjQP4s2nHg4mtiTB
         RLCz0NC6M4ZisJeARpJzCB0ydog3ev7o/MIuKWot3/ZUOrf3di//2x6pPcD8YCVlZxY5
         3VwQcwXCZDD54YyxpfCPcHZuj9F11wqvImk6RjgVGH63T4Xsr7kdYIWGXkZ18ToHlVEh
         6fd8tZDXSjve47FRfDOrOLe/3m+Rp69iCZl0OvfTrv3AXgVJpquBSGqkWaNuWvZYWLrq
         i6Nnnc5DN1Zs8zSH+FkU7VS2XBQafJU8FfQ56idzntYoJJi81ixGvTeTMNToUjbrWcDo
         rQjw==
X-Gm-Message-State: AJIora8x0ruLfb8/cvlOf+CTLOGKnBG1zXtfWbiY1OCjHCQVEEzoBd1a
        QqziFHjwl6ZIIa2Dbeq15EoBnHoQca7fj3ybigQYqVRUZ3eYvAJGuW/VCGldY0zH4G1XGHtt6k5
        HA/AEuAT/j8zcbv+NhZAqFQ==
X-Received: by 2002:a92:da4c:0:b0:2d5:4942:151c with SMTP id p12-20020a92da4c000000b002d54942151cmr5595297ilq.54.1655475337981;
        Fri, 17 Jun 2022 07:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5+pBPw8qcp/W9vVk3R5y0UpR770R+5zi051+5lmo73AcdTcYx/JcpFCItROcYKy2t53b2mA==
X-Received: by 2002:a92:da4c:0:b0:2d5:4942:151c with SMTP id p12-20020a92da4c000000b002d54942151cmr5595259ilq.54.1655475337682;
        Fri, 17 Jun 2022 07:15:37 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id h22-20020a02c736000000b0033792143bf5sm649986jao.67.2022.06.17.07.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 07:15:36 -0700 (PDT)
Date:   Fri, 17 Jun 2022 10:15:34 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Muchun Song <songmuchun@bytedance.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Michal Hocko <mhocko@suse.com>,
        Naoya Horiguchi <naoya.horiguchi@linux.dev>,
        James Houghton <jthoughton@google.com>,
        Mina Almasry <almasrymina@google.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        catalin.marinas@arm.com, will@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/4] hugetlb: skip to end of PT page mapping when pte not
 present
Message-ID: <YqyMhmAjrQ4C+EyA@xz-m1.local>
References: <20220616210518.125287-1-mike.kravetz@oracle.com>
 <20220616210518.125287-2-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220616210518.125287-2-mike.kravetz@oracle.com>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi, Mike,

On Thu, Jun 16, 2022 at 02:05:15PM -0700, Mike Kravetz wrote:
> @@ -6877,6 +6896,39 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
>  	return (pte_t *)pmd;
>  }
>  
> +/*
> + * Return a mask that can be used to update an address to the last huge
> + * page in a page table page mapping size.  Used to skip non-present
> + * page table entries when linearly scanning address ranges.  Architectures
> + * with unique huge page to page table relationships can define their own
> + * version of this routine.
> + */
> +unsigned long hugetlb_mask_last_page(struct hstate *h)
> +{
> +	unsigned long hp_size = huge_page_size(h);
> +
> +	switch (hp_size) {
> +	case P4D_SIZE:
> +		return PGDIR_SIZE - P4D_SIZE;
> +	case PUD_SIZE:
> +		return P4D_SIZE - PUD_SIZE;
> +	case PMD_SIZE:
> +		return PUD_SIZE - PMD_SIZE;
> +	default:

Should we add a WARN_ON_ONCE() if it should never trigger?

> +		break; /* Should never happen */
> +	}
> +
> +	return ~(0UL);
> +}
> +
> +#else
> +
> +/* See description above.  Architectures can provide their own version. */
> +__weak unsigned long hugetlb_mask_last_page(struct hstate *h)
> +{
> +	return ~(0UL);

I'm wondering whether it's better to return 0 rather than ~0 by default.
Could an arch with !CONFIG_ARCH_WANT_GENERAL_HUGETLB wrongly skip some
valid address ranges with ~0, or perhaps I misread?

Thanks,

-- 
Peter Xu

