Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0CA116D0F
	for <lists+linux-ia64@lfdr.de>; Tue,  7 May 2019 23:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbfEGVTi (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 7 May 2019 17:19:38 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37118 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbfEGVTe (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 7 May 2019 17:19:34 -0400
Received: by mail-ot1-f68.google.com with SMTP id u3so10949863otq.4
        for <linux-ia64@vger.kernel.org>; Tue, 07 May 2019 14:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3hK5kgswQ8wv2TZkCFoSuWyjsyMg02YpSTLcE/+WG/U=;
        b=JB3/ofVKMzM47vp5cpkgsnhZ8ZoLv1EVoO9+f31886li2wtHIqmVJSjWZgBJwXVWkQ
         BX8fXeuRngRf/Ks+w1ntTvElqYBed9sGLskf82OMafAfaVt9JAi0cGsgfLfsvJoqqDNr
         leYUf1Qr603j9SX7YPOMJQJ/cTCjxhAKYRdtUuxeKEq3ug1IPoCPnsVf+3r99jUb+zmR
         INxH8W2mrFhA3n0T4xrdVH8dH6T52i5DTkq3iyhP8i9MzOP7NEL5WL7OGtJR7yWG5TTZ
         DDa00gAnvg3r1yMN6dj4XSo/K//hjnmaEZqeXhVR8JHWgv3lVtO0ckrsHunC8Zyn08k4
         ovPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3hK5kgswQ8wv2TZkCFoSuWyjsyMg02YpSTLcE/+WG/U=;
        b=LQlXyI7EeA2lkLfpwO63vBt9EvFu3Jga4EXO6CSIEeagdxi4dHLTVcX9jvPUPKNMRU
         LHOsYMgrihfCSnnPZ+5JnIApKwnUFzryGInhCf+i8NUYLtHKxA/FuwekOaJjOeNgWMvq
         a1+vHTLI/ITreSIvmTEW9WrtJvy6LjPvaEGEM+/q726o6XWOfvok+t/bdWGXo5ffbhop
         +Odsjq9JYez85E0VFw32MK4l1Y66lkPtvrsAtiimw20b9QScBmsPmikPKjFUUuPpDWua
         18HSy6gKOwps1SPKGvPSYP+HgSzbyigPWpin+1ta+1ZqyLPkdzRjEJ8HnAficwZ0+QaD
         CPXg==
X-Gm-Message-State: APjAAAUMTWib+O6icAm1KgjgKrAtwpkdi3TlXtWSib3BGaL8+25GZi1H
        OdYb2qpz09OJHRA/LdwBYagwykOYfnyQKxsqZ0NTtQ==
X-Google-Smtp-Source: APXvYqw7pnu1SJKRDXTAG+qXmcSugmMrCCEKA6B2yg/hWV1/XWlJZJvmUs9rNfdS4aafceF7Ulls7pnfgUmoZQnK/CQ=
X-Received: by 2002:a9d:222c:: with SMTP id o41mr23286782ota.353.1557263973069;
 Tue, 07 May 2019 14:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com> <20190507183804.5512-6-david@redhat.com>
In-Reply-To: <20190507183804.5512-6-david@redhat.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 7 May 2019 14:19:22 -0700
Message-ID: <CAPcyv4ge1pSOopfHof4USn=7Skc-UV4Xhd_s=h+M9VXSp_p1XQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] mm/memory_hotplug: Drop MHP_MEMBLOCK_API
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Wei Yang <richard.weiyang@gmail.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, Qian Cai <cai@lca.pw>,
        Arun KS <arunks@codeaurora.org>,
        Mathieu Malaterre <malat@debian.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, May 7, 2019 at 11:38 AM David Hildenbrand <david@redhat.com> wrote:
>
> No longer needed, the callers of arch_add_memory() can handle this
> manually.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Oscar Salvador <osalvador@suse.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Qian Cai <cai@lca.pw>
> Cc: Arun KS <arunks@codeaurora.org>
> Cc: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/memory_hotplug.h | 8 --------
>  mm/memory_hotplug.c            | 9 +++------
>  2 files changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 2d4de313926d..2f1f87e13baa 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -128,14 +128,6 @@ extern void arch_remove_memory(int nid, u64 start, u64 size,
>  extern void __remove_pages(struct zone *zone, unsigned long start_pfn,
>                            unsigned long nr_pages, struct vmem_altmap *altmap);
>
> -/*
> - * Do we want sysfs memblock files created. This will allow userspace to online
> - * and offline memory explicitly. Lack of this bit means that the caller has to
> - * call move_pfn_range_to_zone to finish the initialization.
> - */
> -
> -#define MHP_MEMBLOCK_API               (1<<0)
> -
>  /* reasonably generic interface to expand the physical pages */
>  extern int __add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
>                        struct mhp_restrictions *restrictions);
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index e1637c8a0723..107f72952347 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -250,7 +250,7 @@ void __init register_page_bootmem_info_node(struct pglist_data *pgdat)
>  #endif /* CONFIG_HAVE_BOOTMEM_INFO_NODE */
>
>  static int __meminit __add_section(int nid, unsigned long phys_start_pfn,
> -               struct vmem_altmap *altmap, bool want_memblock)
> +                                  struct vmem_altmap *altmap)
>  {
>         int ret;
>
> @@ -293,8 +293,7 @@ int __ref __add_pages(int nid, unsigned long phys_start_pfn,
>         }
>
>         for (i = start_sec; i <= end_sec; i++) {
> -               err = __add_section(nid, section_nr_to_pfn(i), altmap,
> -                               restrictions->flags & MHP_MEMBLOCK_API);
> +               err = __add_section(nid, section_nr_to_pfn(i), altmap);
>
>                 /*
>                  * EEXIST is finally dealt with by ioresource collision
> @@ -1066,9 +1065,7 @@ static int online_memory_block(struct memory_block *mem, void *arg)
>   */
>  int __ref add_memory_resource(int nid, struct resource *res)
>  {
> -       struct mhp_restrictions restrictions = {
> -               .flags = MHP_MEMBLOCK_API,
> -       };
> +       struct mhp_restrictions restrictions = {};

With mhp_restrictions.flags no longer needed, can we drop
mhp_restrictions and just go back to a plain @altmap argument?
