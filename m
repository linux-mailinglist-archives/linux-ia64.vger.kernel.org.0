Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244733475D3
	for <lists+linux-ia64@lfdr.de>; Wed, 24 Mar 2021 11:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbhCXKVS (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 24 Mar 2021 06:21:18 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:58189 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230452AbhCXKUr (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Wed, 24 Mar 2021 06:20:47 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lP0d4-001nkY-29; Wed, 24 Mar 2021 11:20:46 +0100
Received: from suse-laptop.physik.fu-berlin.de ([160.45.32.140])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lP0d3-002kEf-SP; Wed, 24 Mar 2021 11:20:46 +0100
Subject: Re: [PATCH] ia64: mca: allocate early mca with GFP_ATOMIC
To:     Sergei Trofimovich <slyfox@gentoo.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org
References: <20210315085045.204414-1-slyfox@gentoo.org>
 <f351183c-7d70-359f-eed7-4d1722cf41c5@physik.fu-berlin.de>
 <20210323174724.78b61c02@sf>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <4f7ccc08-7355-63a0-7239-16a5fb29207f@physik.fu-berlin.de>
Date:   Wed, 24 Mar 2021 11:20:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323174724.78b61c02@sf>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 160.45.32.140
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Sergei!

On 3/23/21 6:47 PM, Sergei Trofimovich wrote:
> On Tue, 23 Mar 2021 16:15:06 +0100
> John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:
> 
>> Hi Andrew!
>>
>> On 3/15/21 9:50 AM, Sergei Trofimovich wrote:
>>> The sleep warning happens at early boot right at
>>> secondary CPU activation bootup:
>>>
>>>     smp: Bringing up secondary CPUs ...
>>>     BUG: sleeping function called from invalid context at mm/page_alloc.c:4942
>>>     in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
>>>     CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.12.0-rc2-00007-g79e228d0b611-dirty #99
>>>
>>>     Call Trace:
>>>      [<a000000100014d10>] show_stack+0x90/0xc0
>>>      [<a000000101111d90>] dump_stack+0x150/0x1c0
>>>      [<a0000001000cbec0>] ___might_sleep+0x1c0/0x2a0
>>>      [<a0000001000cc040>] __might_sleep+0xa0/0x160
>>>      [<a000000100399960>] __alloc_pages_nodemask+0x1a0/0x600
>>>      [<a0000001003b71b0>] alloc_page_interleave+0x30/0x1c0
>>>      [<a0000001003b9b60>] alloc_pages_current+0x2c0/0x340
>>>      [<a00000010038c270>] __get_free_pages+0x30/0xa0
>>>      [<a000000100044730>] ia64_mca_cpu_init+0x2d0/0x3a0
>>>      [<a000000100023430>] cpu_init+0x8b0/0x1440
>>>      [<a000000100054680>] start_secondary+0x60/0x700
>>>      [<a00000010111e1d0>] start_ap+0x750/0x780
>>>     Fixed BSP b0 value from CPU 1
>>>
>>> As I understand interrupts are not enabled yet and system has a lot
>>> of memory. There is little chance to sleep and switch to GFP_ATOMIC
>>> should be a no-op.
>>>
>>> CC: Andrew Morton <akpm@linux-foundation.org>
>>> CC: linux-ia64@vger.kernel.org
>>> Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
>>> ---
>>>  arch/ia64/kernel/mca.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/ia64/kernel/mca.c b/arch/ia64/kernel/mca.c
>>> index d4cae2fc69ca..adf6521525f4 100644
>>> --- a/arch/ia64/kernel/mca.c
>>> +++ b/arch/ia64/kernel/mca.c
>>> @@ -1824,7 +1824,7 @@ ia64_mca_cpu_init(void *cpu_data)
>>>  			data = mca_bootmem();
>>>  			first_time = 0;
>>>  		} else
>>> -			data = (void *)__get_free_pages(GFP_KERNEL,
>>> +			data = (void *)__get_free_pages(GFP_ATOMIC,
>>>  							get_order(sz));
>>>  		if (!data)
>>>  			panic("Could not allocate MCA memory for cpu %d\n",
>>>   
>>
>> Has this one been picked up for your tree already?
> 
> Should be there: https://www.ozlabs.org/~akpm/mmotm/series
> 
>> #NEXT_PATCHES_START mainline-later (next week, approximately)
>> ia64-mca-allocate-early-mca-with-gfp_atomic.patch

Great, thanks. We're still missing Valentin's patch for the NUMA enumeration issue
though. Should Valentin send the patch again with Andrew CC'ed?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

