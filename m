Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C856613420E
	for <lists+linux-ia64@lfdr.de>; Wed,  8 Jan 2020 13:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgAHMoF (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 8 Jan 2020 07:44:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52955 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728075AbgAHMoF (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 8 Jan 2020 07:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578487443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=FlLAwZ5fqwHBJXyRiPabuWKe15jbJzHg7LgdOAui+VE=;
        b=ikN6azyjieWxg/IdONkcRZgazz1XDzOWzYf3gfUjXAtGzQKOHyevY6c/oNFXUM/NAQWwTQ
        w4hWj9z9VDhpbW/YIvL6noH59Sv5Xz0YWOjDDTjQYhrzpjMJfmjNoZr88idEbTDQFUq9t7
        ddrPeC1Bcv7DRTKJl1TT6xRFYRdRnMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-HFFavnQeNnqQGws89fqgVg-1; Wed, 08 Jan 2020 07:44:00 -0500
X-MC-Unique: HFFavnQeNnqQGws89fqgVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 167CD800D41;
        Wed,  8 Jan 2020 12:43:57 +0000 (UTC)
Received: from [10.36.117.90] (ovpn-117-90.ams2.redhat.com [10.36.117.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 435D660E1C;
        Wed,  8 Jan 2020 12:43:52 +0000 (UTC)
Subject: Re: [PATCH v2 6/8] s390/mm: Thread pgprot_t through
 vmem_add_mapping()
To:     Logan Gunthorpe <logang@deltatee.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        Dan Williams <dan.j.williams@intel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Eric Badger <ebadger@gigaio.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
References: <20200107205959.7575-1-logang@deltatee.com>
 <20200107205959.7575-7-logang@deltatee.com>
From:   David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <a5501f2a-ff8d-cea2-1540-1a70ea6bc2d2@redhat.com>
Date:   Wed, 8 Jan 2020 13:43:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200107205959.7575-7-logang@deltatee.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 07.01.20 21:59, Logan Gunthorpe wrote:
> In prepartion to support a pgprot_t argument for arch_add_memory().
> 
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  arch/s390/include/asm/pgtable.h |  3 ++-
>  arch/s390/mm/extmem.c           |  3 ++-
>  arch/s390/mm/init.c             |  2 +-
>  arch/s390/mm/vmem.c             | 10 +++++-----
>  4 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index 7b03037a8475..e667a1a96879 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -1640,7 +1640,8 @@ static inline swp_entry_t __swp_entry(unsigned long type, unsigned long offset)
>  
>  #define kern_addr_valid(addr)   (1)
>  
> -extern int vmem_add_mapping(unsigned long start, unsigned long size);
> +extern int vmem_add_mapping(unsigned long start, unsigned long size,
> +			    pgprot_t prot);
>  extern int vmem_remove_mapping(unsigned long start, unsigned long size);
>  extern int s390_enable_sie(void);
>  extern int s390_enable_skey(void);
> diff --git a/arch/s390/mm/extmem.c b/arch/s390/mm/extmem.c
> index fd0dae9d10f4..6cf7029a7b35 100644
> --- a/arch/s390/mm/extmem.c
> +++ b/arch/s390/mm/extmem.c
> @@ -313,7 +313,8 @@ __segment_load (char *name, int do_nonshared, unsigned long *addr, unsigned long
>  		goto out_free;
>  	}
>  
> -	rc = vmem_add_mapping(seg->start_addr, seg->end - seg->start_addr + 1);
> +	rc = vmem_add_mapping(seg->start_addr, seg->end - seg->start_addr + 1,
> +			      PAGE_KERNEL);
>  
>  	if (rc)
>  		goto out_free;
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index a0c88c1c9ad0..ef19522ddad2 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -277,7 +277,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  	if (WARN_ON_ONCE(modifiers->altmap))
>  		return -EINVAL;
>  
> -	rc = vmem_add_mapping(start, size);
> +	rc = vmem_add_mapping(start, size, PAGE_KERNEL);
>  	if (rc)
>  		return rc;
>  
> diff --git a/arch/s390/mm/vmem.c b/arch/s390/mm/vmem.c
> index b403fa14847d..8a5e95f184a2 100644
> --- a/arch/s390/mm/vmem.c
> +++ b/arch/s390/mm/vmem.c
> @@ -66,7 +66,7 @@ pte_t __ref *vmem_pte_alloc(void)
>  /*
>   * Add a physical memory range to the 1:1 mapping.
>   */
> -static int vmem_add_mem(unsigned long start, unsigned long size)
> +static int vmem_add_mem(unsigned long start, unsigned long size, pgprot_t prot)
>  {
>  	unsigned long pgt_prot, sgt_prot, r3_prot;
>  	unsigned long pages4k, pages1m, pages2g;
> @@ -79,7 +79,7 @@ static int vmem_add_mem(unsigned long start, unsigned long size)
>  	pte_t *pt_dir;
>  	int ret = -ENOMEM;
>  
> -	pgt_prot = pgprot_val(PAGE_KERNEL);
> +	pgt_prot = pgprot_val(prot);
>  	sgt_prot = pgprot_val(SEGMENT_KERNEL);
>  	r3_prot = pgprot_val(REGION3_KERNEL);

So, if we map as huge/gigantic pages, the protection would be discarded?
That looks wrong.

s390x does not support ZONE_DEVICE yet. Maybe simply bail out for s390x
as you do for sh to make your life easier?

[...]

-- 
Thanks,

David / dhildenb

