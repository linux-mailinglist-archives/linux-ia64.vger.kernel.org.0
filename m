Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78CC021B774
	for <lists+linux-ia64@lfdr.de>; Fri, 10 Jul 2020 16:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgGJOA2 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 10 Jul 2020 10:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgGJOA2 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 10 Jul 2020 10:00:28 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0428DC08C5CE
        for <linux-ia64@vger.kernel.org>; Fri, 10 Jul 2020 07:00:28 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id 6so4458150qtt.0
        for <linux-ia64@vger.kernel.org>; Fri, 10 Jul 2020 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DeBGSFa6JpLDSEOobydkMfjCm7xXfWYBIoiGgmJvsiY=;
        b=xtDwzbDKceDPrdb2OHoramfVkpsxDADJ71nfnkU/U11ey7QyoCDreWzdTySdP3Bf95
         ko7FnPp1/f2cIaGMh3ZNzsz0Tk0c89dEXFz4xGd5qoKP5aeVtETNGjgveKn8G+bB5ZCU
         qyeoRvjQsFDUXwssBBeR5gc17mrpKDHaW6DNckwXSdhPayaI4sq6JiGfGAg/1e2NR2+K
         w6m5jVpJb5U2aiGes5SDDt8L5Ld6vOLLHfwgmQEAIJsjgIr3JCFEvBQidjQjLrOvLaeG
         nuz08QDD1+u1/1rB2NI5RZsufXulW3Zf9eAmgXzpRcA2d94ETiaosy+RpJuCDqUAnBzH
         1skA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DeBGSFa6JpLDSEOobydkMfjCm7xXfWYBIoiGgmJvsiY=;
        b=WQd5v399fNjITuol3vgjK3eX+hdeIXoyh/OUrzwJoTWY6BZBDUlLJk7ipUW89wQUv+
         Vu/t49yKC6QvqpagV2CQj38fD9pdR+UG7iHBJDEYYxk6ZZYm2FYtDycIxwn96LDKH9Ug
         Cn+0sXFzK0PdR+jgEwIF/cB4RS2vt4llYkryt/e7PVwL+LBreVBvtACi/6LRCOI2Mk19
         y2hdHiCdIvsymW5UKJbhP9oaV5fBJRvOqC3FgfcPHOP2RouiSe9+3FIiDcGxHn6d38wW
         5l+gq84jJXQtJcZrfOv+SJ7iEpgR9tZxQBD0JzM54mSa2D2HAVTqc6zP47Xp/gtcl/lY
         I/BA==
X-Gm-Message-State: AOAM53300Wwsz5/LVE7i8Kct5uiT7tgwOxg6LBlJig5sZRSkqoIVACAk
        GC1KPeCjQBNKNbefEKL6kui7OLhIhRI3Keg2TPFqyA==
X-Google-Smtp-Source: ABdhPJyl6xq9PxhonQS0J3Dx+J5gbm1PIhxGa1brPjByYujkui0S6cvVgDWfdJGYhmVAV084h8/4qpdI7H3iU+5xBUo=
X-Received: by 2002:ac8:396c:: with SMTP id t41mr71181576qtb.45.1594389627173;
 Fri, 10 Jul 2020 07:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200710031619.18762-1-justin.he@arm.com>
In-Reply-To: <20200710031619.18762-1-justin.he@arm.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 10 Jul 2020 07:00:15 -0700
Message-ID: <CAPcyv4izHex9W0m3voSXM5J69gFWhHj_a-XsmJ4HF01Uh4jp6w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Fix and enable pmem as RAM device on arm64
To:     Jia He <justin.he@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        David Hildenbrand <david@redhat.com>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <bhe@redhat.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ia64@vger.kernel.org, Linux-sh <linux-sh@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        Linux MM <linux-mm@kvack.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kaly Xin <Kaly.Xin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, Jul 9, 2020 at 8:17 PM Jia He <justin.he@arm.com> wrote:
>
> This fixies a few issues when I tried to enable pmem as RAM device on arm64.
>
> To use memory_add_physaddr_to_nid as a fallback nid, it would be better
> implement a general version (__weak) in mm/memory_hotplug. After that, arm64/
> sh/s390 can simply use the general version, and PowerPC/ia64/x86 will use
> arch specific version.
>
> Tested on ThunderX2 host/qemu "-M virt" guest with a nvdimm device. The
> memblocks from the dax pmem device can be either hot-added or hot-removed
> on arm64 guest. Also passed the compilation test on x86.
>
> Changes:
> v4: - remove "device-dax: use fallback nid when numa_node is invalid", wait
>       for Dan Williams' phys_addr_to_target_node() patch

FWIW, I put these patches through a 0-day run overnight and will be
posting them today.
