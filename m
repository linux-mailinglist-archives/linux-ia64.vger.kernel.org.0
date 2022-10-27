Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6A56101BC
	for <lists+linux-ia64@lfdr.de>; Thu, 27 Oct 2022 21:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235586AbiJ0Tex (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 27 Oct 2022 15:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235729AbiJ0Tev (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 27 Oct 2022 15:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF74DF17
        for <linux-ia64@vger.kernel.org>; Thu, 27 Oct 2022 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666899289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tx2gESFAK3253ffbrGpKyhHhqag34Mq8L8Hseba/Seg=;
        b=Vu9bkJw8TRa/D5xfIylb0gcMA5meH752mnJN5pmyznU+RWclfRaHKke1VVGKfe+ztI65un
        jdwHBevLdQ3HJi8CZvYyc8B9FjFp+uB0OyQ0SFnO/oUxJf7H4K6fROYE9UtiSTNWwgn7Hn
        47YDqzTXmudDTzTDM2N5K4z2o7fpPgc=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-ErnPvePGOG6QNJnUj2WgHA-1; Thu, 27 Oct 2022 15:34:47 -0400
X-MC-Unique: ErnPvePGOG6QNJnUj2WgHA-1
Received: by mail-il1-f198.google.com with SMTP id f15-20020a056e020b4f00b002fa34db70f0so2254027ilu.2
        for <linux-ia64@vger.kernel.org>; Thu, 27 Oct 2022 12:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tx2gESFAK3253ffbrGpKyhHhqag34Mq8L8Hseba/Seg=;
        b=gb5V6AJpsFgWFHv+ukK8wySPJ7/vuf3EdydMv7Mi79wHOk0BIoIp0Fd6aJSr65AaDx
         Wn3lsZiFELOXc1+8WpRRNGzo2JEumJkY9AR44TxjrqlXQvKOeMAZYM6TAbfZu84KFaIM
         Jryb1zOTwEWFsyEnr/cIJ/y1nN5l7QkTOVUtlN8vYJ6QR1ErYZGk6epWL+0f+pzH+7ps
         y+G+8U1AgBa35tfOwsOz4NMqNZgco+gvic0GjT3wMDWO4OFIjGmOqIVOEoUSKQNDAJG8
         ILKIodH4nJQ8R80I2iIvroqzfHm81JVxh4y6T6clo4H1rTdBBYCVcyIY9dF2Pcnr/jzA
         0WLA==
X-Gm-Message-State: ACrzQf1YrHAWsW6asKENhJTggv07SNDAwpNuTeyQ9O1YzuWqS7SMbi/X
        X6D6t15J4OYKL+i999dw3VW82uv5mrLNUuStwAgcw6ekM+wqKqmL7gwAiLX3jkTFwHZF8e2zWMX
        Lc9u1nfQDgfYZstBDWPuZaw==
X-Received: by 2002:a6b:c5c4:0:b0:6a2:4ab2:6490 with SMTP id v187-20020a6bc5c4000000b006a24ab26490mr29199022iof.129.1666899286611;
        Thu, 27 Oct 2022 12:34:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6cGzT9i6Rfwi656plZyQuUAv9OHOayiwU9jMYHr7uBSa1oyZ7maHvd2m5rccwbYfR9LbeHzg==
X-Received: by 2002:a6b:c5c4:0:b0:6a2:4ab2:6490 with SMTP id v187-20020a6bc5c4000000b006a24ab26490mr29199002iof.129.1666899286241;
        Thu, 27 Oct 2022 12:34:46 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id n4-20020a056638110400b00374ff5df5ccsm868543jal.167.2022.10.27.12.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 12:34:45 -0700 (PDT)
Date:   Thu, 27 Oct 2022 15:34:44 -0400
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
Message-ID: <Y1rdVLMDD4PMt3s3@x1n>
References: <20220919021348.22151-1-mike.kravetz@oracle.com>
 <Y1mtz7dFAlhGRsAd@x1n>
 <Y1nR/KToV44GKZ5G@monkey>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y1nR/KToV44GKZ5G@monkey>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, Oct 26, 2022 at 05:34:04PM -0700, Mike Kravetz wrote:
> On 10/26/22 17:59, Peter Xu wrote:
> > Hi, Mike,
> > 
> > On Sun, Sep 18, 2022 at 07:13:48PM -0700, Mike Kravetz wrote:
> > > +struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
> > > +				unsigned long address, unsigned int flags)
> > > +{
> > > +	struct hstate *h = hstate_vma(vma);
> > > +	struct mm_struct *mm = vma->vm_mm;
> > > +	unsigned long haddr = address & huge_page_mask(h);
> > > +	struct page *page = NULL;
> > > +	spinlock_t *ptl;
> > > +	pte_t *pte, entry;
> > > +
> > > +	/*
> > > +	 * FOLL_PIN is not supported for follow_page(). Ordinary GUP goes via
> > > +	 * follow_hugetlb_page().
> > > +	 */
> > > +	if (WARN_ON_ONCE(flags & FOLL_PIN))
> > > +		return NULL;
> > > +
> > > +retry:
> > > +	/*
> > > +	 * vma lock prevents racing with another thread doing a pmd unshare.
> > > +	 * This keeps pte as returned by huge_pte_offset valid.
> > > +	 */
> > > +	hugetlb_vma_lock_read(vma);
> > 
> > I'm not sure whether it's okay to take a rwsem here, as the code can be
> > called by e.g. FOLL_NOWAIT?
> 
> I think you are right.  This is possible even thought not called this
> way today,
> 
> > I'm wondering whether it's fine to just drop this anyway, just always walk
> > it lockless.  IIUC gup callers should be safe here because the worst case
> > is the caller will fetch a wrong page, but then it should be invalidated
> > very soon with mmu notifiers.  One thing worth mention is that pmd unshare
> > should never free a pgtable page.
> 
> You are correct in that pmd unshare will not directly free a pgtable page.
> However, I think a 'very worst case' race could be caused by two threads(1,2)
> in the same process A, and another process B.  Processes A and B share a PMD.
> - Process A thread 1 gets a *ptep via huge_pte_offset and gets scheduled out.
> - Process A thread 2 calls mprotect to change protection and unshares
>   the PMD shared with process B.
> - Process B then unmaps the PMD shared with process A and the PMD page
>   gets deleted.

[2]

> - The *ptep in Process A thread 1 then points into a freed page.
> This is VERY unlikely, but I do think it is possible and is the reason I
> may be overcautious about protecting against races with pmd unshare.

Yes this is possible, I just realized that actually huge_pte_offset() is a
soft pgtable walker too.  Thanks for pointing that out.

If we want to use the vma read lock to protect here as the slow gup path,
then please check again with below [1] - I think we'll also need to protect
it with fast-gup (probably with trylock only, because fast-gup cannot
sleep) or it'll encounter the same race, iiuc.

Actually, instead of using vma lock, I really think this is another problem
and needs standalone fixing.  The problem is we allows huge_pte_offset() to
walk the process pgtable without any protection, while pmd unsharing can
drop a page anytime.  huge_pte_offset() is always facing use-after-free
when walking the PUD page.

We may want RCU lock to protect the pgtable pages from getting away when
huge_pte_offset() is walking it, it'll be safe then because pgtable pages
are released in RCU fashion only (e.g. in above example, process [2] will
munmap() and release the last ref to the "used to be shared" pmd and the
PUD that maps the shared pmds will be released only after a RCU grace
period), and afaict that's also what's protecting fast-gup from accessing
freed pgtable pages.

If with all huge_pte_offset() callers becoming RCU-safe, then IIUC we can
drop the vma lock in all GUP code, aka, in hugetlb_follow_page_mask() here,
because both slow and fast gup should be safe too in the same manner.

Thanks,

> > IIUC it's also the same as fast-gup - afaiu we don't take the read vma lock
> > in fast-gup too but I also think it's safe.  But I hope I didn't miss
> > something.

[1]

-- 
Peter Xu

