Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84214612C80
	for <lists+linux-ia64@lfdr.de>; Sun, 30 Oct 2022 20:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiJ3TqE (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 30 Oct 2022 15:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiJ3TqD (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 30 Oct 2022 15:46:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1CB5616C
        for <linux-ia64@vger.kernel.org>; Sun, 30 Oct 2022 12:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667159112;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bT5+mtm9SvOiSWB+WL0RWSIeohhjPs4i/ZgPi5EI8zo=;
        b=USj4vfK9IkKZSrhcrCTEWD8e8siyW4xHWParwPRfqXjzYdREywKXWkC/VT4MURE6I8NdNh
        2YMh42Fn6yKHJID7PzNQjAOTgdVC0RBLgUt4c9/nuAeSXrzO6hyc49XFpI+z5SX3yyjpAP
        Xp7PxbwE+ToZcX2A7rP+UJQoSTMYvVs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-511-enwHvBJbOYe70sIw6bUe2Q-1; Sun, 30 Oct 2022 15:45:05 -0400
X-MC-Unique: enwHvBJbOYe70sIw6bUe2Q-1
Received: by mail-qk1-f199.google.com with SMTP id bj1-20020a05620a190100b006fa12a05188so3711733qkb.4
        for <linux-ia64@vger.kernel.org>; Sun, 30 Oct 2022 12:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bT5+mtm9SvOiSWB+WL0RWSIeohhjPs4i/ZgPi5EI8zo=;
        b=fixy76LZhVE3WQy0ObEZeKJ8mdonnVzt1bLtzxCH0ySY94ejs1IestWmFWCJd4+wz/
         pFBMmvGWHj9weoNFDkdMjoQr1xIsdGIOXQ7u8xnCcDfFvqJn9ukNclZTi9kMHAAYN2Zk
         V/mEsrZ36D+hR0OUpbJL8MbTnx7CCt4zNPzatL5KL9izpIqT8XklRKg1xeFolPYgCKyR
         /bOwXX6zGLZ+XoezQlmp5PHphLAmwvNS9yAEjf9H0nZzfEemhFJ4RoeRSn4rBkG8uEjL
         SinqXDMKLhEmeI1hJ4Ewi8LaumrDQrJCvI+uA2szYTrl9Tn/WtWP2KRxRnMUd0nS9G7P
         xYGw==
X-Gm-Message-State: ACrzQf0Hze8Qzt/LoKIMbDySiLdxBqkOMxE1+OB0EV741xSWuzrIU3SZ
        Tv+E06ZC547gdwoNQ1ZUMRa/qVl4Homrm+l1T+D4RvBZghzmNshy4tdBqApF2c+SSwnk1wVaBVo
        7fQHGEUrd02M9KFCoKRc9jA==
X-Received: by 2002:ac8:5b05:0:b0:399:9b82:77b4 with SMTP id m5-20020ac85b05000000b003999b8277b4mr7916919qtw.681.1667159104710;
        Sun, 30 Oct 2022 12:45:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7DGRAbhY7ngHol5WrR3s5q5A6o6BjH1ZsifAnGgA9PVQrmUO3jQvhvJGCv8i15sQG8OQjvCA==
X-Received: by 2002:ac8:5b05:0:b0:399:9b82:77b4 with SMTP id m5-20020ac85b05000000b003999b8277b4mr7916896qtw.681.1667159104500;
        Sun, 30 Oct 2022 12:45:04 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id fu38-20020a05622a5da600b0039953dcc480sm2596227qtb.88.2022.10.30.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 12:45:03 -0700 (PDT)
Date:   Sun, 30 Oct 2022 15:45:02 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-ia64@vger.kernel.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        David Hildenbrand <david@redhat.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Naoya Horiguchi <naoya.horiguchi@linux.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4] hugetlb: simplify hugetlb handling in follow_page_mask
Message-ID: <Y17UPk9CBjPumcz6@x1n>
References: <20221028181108.119432-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028181108.119432-1-mike.kravetz@oracle.com>
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Fri, Oct 28, 2022 at 11:11:08AM -0700, Mike Kravetz wrote:
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
> +	pte = huge_pte_offset(mm, haddr, huge_page_size(h));
> +	if (!pte)
> +		return NULL;
> +
> +	ptl = huge_pte_lock(h, mm, pte);
> +	entry = huge_ptep_get(pte);
> +	if (pte_present(entry)) {
> +		page = pte_page(entry) +
> +				((address & ~huge_page_mask(h)) >> PAGE_SHIFT);
> +		/*
> +		 * Note that page may be a sub-page, and with vmemmap
> +		 * optimizations the page struct may be read only.
> +		 * try_grab_page() will increase the ref count on the
> +		 * head page, so this will be OK.
> +		 *
> +		 * try_grab_page() should always succeed here, because we hold
> +		 * the ptl lock and have verified pte_present().
> +		 */
> +		if (WARN_ON_ONCE(!try_grab_page(page, flags))) {
> +			page = NULL;
> +			goto out;
> +		}
> +	} else {
> +		if (is_hugetlb_entry_migration(entry)) {
> +			spin_unlock(ptl);
> +			hugetlb_vma_unlock_read(vma);

Just noticed it when pulled the last mm-unstable: this line seems to be a
left-over of v3, while not needed now?

> +			__migration_entry_wait_huge(pte, ptl);
> +			goto retry;
> +		}
> +		/*
> +		 * hwpoisoned entry is treated as no_page_table in
> +		 * follow_page_mask().
> +		 */
> +	}
> +out:
> +	spin_unlock(ptl);
> +	return page;
> +}

-- 
Peter Xu

