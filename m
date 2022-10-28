Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9D1611E14
	for <lists+linux-ia64@lfdr.de>; Sat, 29 Oct 2022 01:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiJ1XZY (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 28 Oct 2022 19:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiJ1XZW (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 28 Oct 2022 19:25:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C59C4DB0D
        for <linux-ia64@vger.kernel.org>; Fri, 28 Oct 2022 16:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666999462;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cRyNGp9vBF4GSRr09z30VvDe1naMezW0SypBh95qjuw=;
        b=ezCbbW+fUw6C/btLTjIcrDPmsx0pesNlWLId9pf/bM+PeNukgR+lMJvL9LNjZFgiuVfvHJ
        fM9zYLWkyTFst1G+vmqczc2t3UON9r6rBvvjYIPw1GKxZ4vvKG5jiup7XOSEhHyDtTzJCd
        DVn99c0Qd3TvdoqdOltn4elHXXIZihA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-K6x8sORBNlKfd8vjWxeF_Q-1; Fri, 28 Oct 2022 19:24:21 -0400
X-MC-Unique: K6x8sORBNlKfd8vjWxeF_Q-1
Received: by mail-qk1-f200.google.com with SMTP id j13-20020a05620a288d00b006be7b2a758fso4754580qkp.1
        for <linux-ia64@vger.kernel.org>; Fri, 28 Oct 2022 16:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRyNGp9vBF4GSRr09z30VvDe1naMezW0SypBh95qjuw=;
        b=IquNS0/0X4acXvVwT/TIOaPNH6JcOKNEAj97asHUjxvvKmXN05E3t+KILD36qDeGJ7
         s/pewKRATutOS23iEAbUxISvRXrXzI1k9xp1N4JfPEwFQSFzk3TSEVJSM3kzclnTsPA1
         UNdrEwnnJElFaW7JG0UyrKPcv9Np97r61VGJJ6p88qipjSNf7WOQod4aHTO8aXJtfPiu
         oMSezJxBofllGAvwkzehIXZy+R3nnhlGOwzhgIC/rUXULht5yKO0yt5D+XbStqsVMwbV
         /ETmkLd4p1Oh3Pm8zp3GpgCZ3rru74wGbO1nE9ODiclG8fL1hQhpHbNMfhi9/HRCU539
         pOuQ==
X-Gm-Message-State: ACrzQf1T38958P1BeR6OxfNe7LC47XAn94CX8wRf1bg7JOx9OzYCdK5q
        61Yqj38PPzHkE6YVflJEWStZibXErrdM6vDgrPuiINC78cEENCAa5+T72zSSL1nGLR7J6EgOVZa
        lDKZ8ZAyKPkHPmmmMdaPE8A==
X-Received: by 2002:ad4:4ea2:0:b0:4b7:e8a3:e043 with SMTP id ed2-20020ad44ea2000000b004b7e8a3e043mr1727878qvb.34.1666999460664;
        Fri, 28 Oct 2022 16:24:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5O9D8mCa0VSNsJWqYFF4hzhXh38xZVkwpvXIFKcJlS4quyWCJ+vSPpcEiNhIciaQuZzCKa1g==
X-Received: by 2002:ad4:4ea2:0:b0:4b7:e8a3:e043 with SMTP id ed2-20020ad44ea2000000b004b7e8a3e043mr1727871qvb.34.1666999460480;
        Fri, 28 Oct 2022 16:24:20 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id d9-20020a05620a240900b006b8e8c657ccsm3976351qkn.117.2022.10.28.16.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 16:24:19 -0700 (PDT)
Date:   Fri, 28 Oct 2022 19:24:18 -0400
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
Message-ID: <Y1xkonJ2DkQQbAaT@x1n>
References: <20221028181108.119432-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028181108.119432-1-mike.kravetz@oracle.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Fri, Oct 28, 2022 at 11:11:08AM -0700, Mike Kravetz wrote:
> v4 -    Remove vma (pmd sharing) locking as this can be called with
> 	FOLL_NOWAIT. Peter

Thanks, Mike.  For the gup safety on pmd unshare, I'll prepare a few small
patches and post hopefully early next week (will be off-work on Mon & Tue,
but maybe I'll still try).

-- 
Peter Xu

