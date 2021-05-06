Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A874375BD9
	for <lists+linux-ia64@lfdr.de>; Thu,  6 May 2021 21:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235303AbhEFTjm (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 6 May 2021 15:39:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58796 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235319AbhEFTjl (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 6 May 2021 15:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620329922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mD9rk0OEj0XYhxeQH5IDJPNbrX+PSqo6PoFdlh4Fuj4=;
        b=XImLsgWo+QKlmyFO/XlEDIt+Ur0g+yEHU0vNvIGZicLxOMFTDhm1SMaHO6kHyvo+R96HLJ
        n8OuKEvm76zWoLN1ebZLdUs0FWjwaxGFUmckZConLy9xqNBdCPnXixRPsDjCcUVmbTzaR/
        j4eieEbJSRhovwhXNb5AA0XnCwnN1kY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-J9RYNThCM2mgvskyRlQYkw-1; Thu, 06 May 2021 15:38:40 -0400
X-MC-Unique: J9RYNThCM2mgvskyRlQYkw-1
Received: by mail-wm1-f72.google.com with SMTP id g199-20020a1c9dd00000b02901355dd71edaso3026066wme.7
        for <linux-ia64@vger.kernel.org>; Thu, 06 May 2021 12:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=mD9rk0OEj0XYhxeQH5IDJPNbrX+PSqo6PoFdlh4Fuj4=;
        b=TbufybYg05KHI6/CEni9T/g2NLzEZrb3dFm4165RiUvGvFXxBI8VNVlV4hJ9Ac4zZu
         0OgpI/sWl0uza2uk7JZg6oZ7w+/sBUkB26qVCDXv6NN8IJ3EIxbT1gkgEHrs1fDJeB6e
         rw8IhbOA7jT3K3x5kaMdm133w/mxwQHelPq16PUdjJ0Lcojzu4c749OSZPNouh4Sji7h
         t1MGQ3EfqPNn1Y2wHobaZSNpUi+uVIJM5TqSCX8IIrPKjNQA0RFj6qNzbLxMd5ogd2bd
         hkdRPvPNH3SEivYCzuOkWHZhUq51ozT1TbepQBEh3ZBiXAEb/E/6IghBN6cuIi4BK2qU
         gpIA==
X-Gm-Message-State: AOAM532lIUNBK4M7nhQ5mWAYsbKFAzW+U3cvOMV74p1z73vlAxszMLUi
        OqVl6FOQrHsMGMZvd48dCWLBfaQnc5uRpf2ryp6f7rrxIAlgUiYNio2m39TA6fZeDQJgb23+JYi
        LRnwKm57n+3xm37Udmo0RLA==
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr7392212wrv.69.1620329919136;
        Thu, 06 May 2021 12:38:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOC06i3MicUKjMNEqxEnGDL/rTRmiJEviad77ONpxe7ogE7ETHVYywYhvhoyD41LPb0MdTmQ==
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr7392182wrv.69.1620329918917;
        Thu, 06 May 2021 12:38:38 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
        by smtp.gmail.com with ESMTPSA id q10sm4494733wmc.31.2021.05.06.12.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 12:38:38 -0700 (PDT)
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Michal Hocko <mhocko@suse.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
 <9D7FD316-988E-4B11-AC1C-64FF790BA79E@nvidia.com>
 <3a51f564-f3d1-c21f-93b5-1b91639523ec@redhat.com>
 <16962E62-7D1E-4E06-B832-EC91F54CC359@nvidia.com>
 <f3a2152c-685b-2141-3e33-b2bcab8b6010@redhat.com>
 <3A6D54CF-76F4-4401-A434-84BEB813A65A@nvidia.com>
 <0e850dcb-c69a-188b-7ab9-09e6644af3ab@redhat.com>
 <20210506193026.GE388843@casper.infradead.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d2e3c89d-a1fe-e7bc-c2ec-586df2073951@redhat.com>
Date:   Thu, 6 May 2021 21:38:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506193026.GE388843@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 06.05.21 21:30, Matthew Wilcox wrote:
> On Thu, May 06, 2021 at 09:10:52PM +0200, David Hildenbrand wrote:
>> I have to admit that I am not really a friend of that. I still think our
>> target goal should be to have gigantic THP *in addition to* ordinary THP.
>> Use gigantic THP where enabled and possible, and just use ordinary THP
>> everywhere else. Having one pageblock granularity is a real limitation IMHO
>> and requires us to hack the system to support it to some degree.
> 
> You're thinking too small with only two THP sizes ;-)  I'm aiming to

Well, I raised in my other mail that we will have multiple different use 
cases, including multiple different THP e.g., on aarch64 ;)

> support arbitrary power-of-two memory allocations.  I think there's a
> fruitful discussion to be had about how that works for anonymous memory --
> with page cache, we have readahead to tell us when our predictions of use
> are actually fulfilled.  It doesn't tell us what percentage of the pages

Right, and I think we have to think about a better approach than just 
increasing the pageblock_order.

> allocated were actually used, but it's a hint.  It's a big lift to go from
> 2MB all the way to 1GB ... if you can look back to see that the previous
> 1GB was basically fully populated, then maybe jump up from allocating
> 2MB folios to allocating a 1GB folio, but wow, that's a big step.
> 
> This goal really does mean that we want to allocate from the page
> allocator, and so we do want to grow MAX_ORDER.  I suppose we could
> do somethig ugly like
> 
> 	if (order <= MAX_ORDER)
> 		alloc_page()
> 	else
> 		alloc_really_big_page()
> 
> but that feels like unnecessary hardship to place on the user.

I had something similar for the sort term in mind, relying on 
alloc_contig_pages() (and maybe ZONE_MOVABLE to make allocations more 
likely to succeed). Devil's in the details (page migration, ...).


-- 
Thanks,

David / dhildenb

