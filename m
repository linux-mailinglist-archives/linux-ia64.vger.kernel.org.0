Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7EF260EB15
	for <lists+linux-ia64@lfdr.de>; Wed, 26 Oct 2022 23:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233715AbiJZV75 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 26 Oct 2022 17:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbiJZV7y (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 26 Oct 2022 17:59:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2C417A92
        for <linux-ia64@vger.kernel.org>; Wed, 26 Oct 2022 14:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666821590;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QNXqWwBEWZqwUkNcA15/4+3p4mEEOSR1ir8+lCD/vgI=;
        b=KZXaVzkL1lV8VPN0AH8fIyi5lq4tG6vHBxmPsDtg/Wu4hCyLPPuNJ2fpVd9BiHFHEOSA1/
        cEfMi4dr2eN/NSBwTi0RhtKsI/ZoHeBZKsEZbYr3YzicR+Q2u3OY6xp6yUfvvWvLlB98XB
        mM/g2+wYl667L5Zlgq0LHAclyNu9ivQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-nuk76WXsNKqCnoKSIPQKUg-1; Wed, 26 Oct 2022 17:59:46 -0400
X-MC-Unique: nuk76WXsNKqCnoKSIPQKUg-1
Received: by mail-qk1-f200.google.com with SMTP id bi38-20020a05620a31a600b006eeb2862816so15144895qkb.0
        for <linux-ia64@vger.kernel.org>; Wed, 26 Oct 2022 14:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNXqWwBEWZqwUkNcA15/4+3p4mEEOSR1ir8+lCD/vgI=;
        b=OV/6hS50LGeclstSLvD0zbQ5h3C3v0dyJxvPMoU1wBXSwnGMSjwzP8YYPbwmicXU5q
         VO606W3miceiZJTPdR6OOUVGxGebU68K14FZ27GWITB5IWl+qaMcxLjrLykRZ3btR7C8
         F1eR+hlrQzjVrwjb5hs6FbZnQr0/ljwReypB/WIk5Lz/xMESOQ3wcC3eY0NTx54jip+Y
         wgnOMMQ6pXykCmmcEK1IX95UKZyJT6Cky8jnNSByw9ppCa9XO1m47yLOsWuqmDpS8OEO
         ImbdVkiW3autH0FkWI0is0Mr8d8l3CLQDb4QPj5QPuX/E62AxlCs0H3wmzHcwBLOgMjH
         bANA==
X-Gm-Message-State: ACrzQf3LicAqw/ENXoJ2zWuwRzZUiDm387emxxSEifxzDameJYORtnJm
        IZUVejrwf8vH2OsZ1N/C/Eo4jS+aEsim9F47S+g5zWDLKbwqGxTQG22GV5dIhTfeaQAgsiqdFz6
        9/T9EkTkdDwYwe6xe5E6j8Q==
X-Received: by 2002:a05:6214:258f:b0:4bb:96dc:9081 with SMTP id fq15-20020a056214258f00b004bb96dc9081mr3792319qvb.56.1666821585876;
        Wed, 26 Oct 2022 14:59:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6clLhoqa4dyYP9jIEoFLifg0EVVqBR8GsJ2D+FA1fUGq9jZpwSidSVqlrnZh8mjpv+r4IZSQ==
X-Received: by 2002:a05:6214:258f:b0:4bb:96dc:9081 with SMTP id fq15-20020a056214258f00b004bb96dc9081mr3792307qvb.56.1666821585663;
        Wed, 26 Oct 2022 14:59:45 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id gd27-20020a05622a5c1b00b0039c37a7914csm2840053qtb.23.2022.10.26.14.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 14:59:45 -0700 (PDT)
Date:   Wed, 26 Oct 2022 17:59:43 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-ia64@vger.kernel.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Hildenbrand <david@redhat.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Naoya Horiguchi <naoya.horiguchi@linux.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3] hugetlb: simplify hugetlb handling in follow_page_mask
Message-ID: <Y1mtz7dFAlhGRsAd@x1n>
References: <20220919021348.22151-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220919021348.22151-1-mike.kravetz@oracle.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi, Mike,

On Sun, Sep 18, 2022 at 07:13:48PM -0700, Mike Kravetz wrote:
> +struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
> +				unsigned long address, unsigned int flags)
> +{
> +	struct hstate *h = hstate_vma(vma);
> +	struct mm_struct *mm = vma->vm_mm;
> +	unsigned long haddr = address & huge_page_mask(h);
> +	struct page *page = NULL;
> +	spinlock_t *ptl;
> +	pte_t *pte, entry;
> +
> +	/*
> +	 * FOLL_PIN is not supported for follow_page(). Ordinary GUP goes via
> +	 * follow_hugetlb_page().
> +	 */
> +	if (WARN_ON_ONCE(flags & FOLL_PIN))
> +		return NULL;
> +
> +retry:
> +	/*
> +	 * vma lock prevents racing with another thread doing a pmd unshare.
> +	 * This keeps pte as returned by huge_pte_offset valid.
> +	 */
> +	hugetlb_vma_lock_read(vma);

I'm not sure whether it's okay to take a rwsem here, as the code can be
called by e.g. FOLL_NOWAIT?

I'm wondering whether it's fine to just drop this anyway, just always walk
it lockless.  IIUC gup callers should be safe here because the worst case
is the caller will fetch a wrong page, but then it should be invalidated
very soon with mmu notifiers.  One thing worth mention is that pmd unshare
should never free a pgtable page.

IIUC it's also the same as fast-gup - afaiu we don't take the read vma lock
in fast-gup too but I also think it's safe.  But I hope I didn't miss
something.

-- 
Peter Xu

