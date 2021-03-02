Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2AA532AE7E
	for <lists+linux-ia64@lfdr.de>; Wed,  3 Mar 2021 03:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbhCBXiL (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 2 Mar 2021 18:38:11 -0500
Received: from foss.arm.com ([217.140.110.172]:44122 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1576082AbhCBEXt (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Mon, 1 Mar 2021 23:23:49 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4931BED1;
        Mon,  1 Mar 2021 20:00:59 -0800 (PST)
Received: from [10.163.67.84] (unknown [10.163.67.84])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 287403F73B;
        Mon,  1 Mar 2021 20:00:55 -0800 (PST)
Subject: Re: [PATCH] mm: Generalize HUGETLB_PAGE_SIZE_VARIABLE
To:     kernel test robot <lkp@intel.com>, linux-mm@kvack.org
Cc:     kbuild-all@lists.01.org, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <1614577853-7452-1-git-send-email-anshuman.khandual@arm.com>
 <202103011736.uYkOLJKy-lkp@intel.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <eaa998f0-248f-59d9-c410-873e12a79afe@arm.com>
Date:   Tue, 2 Mar 2021 09:31:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202103011736.uYkOLJKy-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org



On 3/1/21 3:22 PM, kernel test robot wrote:
> Hi Anshuman,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on linus/master v5.12-rc1 next-20210301]
> [cannot apply to hnaz-linux-mm/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-Generalize-HUGETLB_PAGE_SIZE_VARIABLE/20210301-135205
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: ia64-randconfig-r003-20210301 (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/fe78e3508e5221ac13aa288136e2a6506211be68
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Anshuman-Khandual/mm-Generalize-HUGETLB_PAGE_SIZE_VARIABLE/20210301-135205
>         git checkout fe78e3508e5221ac13aa288136e2a6506211be68
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=ia64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/ia64/include/asm/pgtable.h:154,
>                     from include/linux/pgtable.h:6,
>                     from include/linux/mm.h:33,
>                     from mm/page_alloc.c:19:
>    arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
>    arch/ia64/include/asm/mmu_context.h:127:41: warning: variable 'old_rr4' set but not used [-Wunused-but-set-variable]
>      127 |  unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
>          |                                         ^~~~~~~
>    In file included from include/linux/kconfig.h:7,
>                     from <command-line>:
>    mm/page_alloc.c: At top level:
>>> ./include/generated/autoconf.h:269:36: error: expected identifier or '(' before numeric constant
>      269 | #define CONFIG_FORCE_MAX_ZONEORDER 11
>          |                                    ^~
>    include/linux/mmzone.h:29:19: note: in expansion of macro 'CONFIG_FORCE_MAX_ZONEORDER'
>       29 | #define MAX_ORDER CONFIG_FORCE_MAX_ZONEORDER
>          |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:48:27: note: in expansion of macro 'MAX_ORDER'
>       48 | #define pageblock_order  (MAX_ORDER-1)
>          |                           ^~~~~~~~~
>    mm/page_alloc.c:250:14: note: in expansion of macro 'pageblock_order'
>      250 | unsigned int pageblock_order __read_mostly;
>          |              ^~~~~~~~~~~~~~~
>    mm/page_alloc.c:2618:5: warning: no previous prototype for 'find_suitable_fallback' [-Wmissing-prototypes]
>     2618 | int find_suitable_fallback(struct free_area *area, unsigned int order,
>          |     ^~~~~~~~~~~~~~~~~~~~~~
>    mm/page_alloc.c:3596:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
>     3596 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
>          |               ^~~~~~~~~~~~~~~~~~~~~~
>    mm/page_alloc.c:6257:23: warning: no previous prototype for 'memmap_init' [-Wmissing-prototypes]
>     6257 | void __meminit __weak memmap_init(unsigned long size, int nid,
>          |                       ^~~~~~~~~~~
>    mm/page_alloc.c: In function 'set_pageblock_order':
>>> mm/page_alloc.c:6798:6: error: 'HPAGE_SHIFT' undeclared (first use in this function); did you mean 'PAGE_SHIFT'?
>     6798 |  if (HPAGE_SHIFT > PAGE_SHIFT)
>          |      ^~~~~~~~~~~
>          |      PAGE_SHIFT
>    mm/page_alloc.c:6798:6: note: each undeclared identifier is reported only once for each function it appears in
>>> mm/page_alloc.c:6799:11: error: 'HUGETLB_PAGE_ORDER' undeclared (first use in this function)
>     6799 |   order = HUGETLB_PAGE_ORDER;
>          |           ^~~~~~~~~~~~~~~~~~
>>> mm/page_alloc.c:6808:18: error: lvalue required as left operand of assignment
>     6808 |  pageblock_order = order;
>          |                  ^
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for HUGETLB_PAGE_SIZE_VARIABLE
>    Depends on HUGETLB_PAGE
>    Selected by
>    - IA64

This shows that HUGETLB_PAGE_SIZE_VARIABLE could be selected without HUGETLB_PAGE
being enabled, which was not intended. The dependency on HUGETLB_PAGE need to be
explicit for HUGETLB_PAGE_SIZE_VARIABLE.
