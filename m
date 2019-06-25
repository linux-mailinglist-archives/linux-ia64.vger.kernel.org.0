Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94D075281C
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 11:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbfFYJbG (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 05:31:06 -0400
Received: from mout.web.de ([212.227.17.12]:56673 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727329AbfFYJbG (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 05:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561455060;
        bh=0T5zvUx8MH+MZl/s4NhSFPxhsGbClkcus1OgJzKLowg=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Pef8KeWA2PG91ycD26IC532kyu0+NQVcSaVsh0Md0wDa3jkz8iy7x4fzYrRE3/M9c
         2q0Du4qHHJ753ymh7zpQLaACvmHmGPrUoLs9re/rb0FX4mrEqWdvOBN7EIETlnjMNY
         Z+hKkvDAMAk8Kkp8LOxhho8N9kCbNDBWi+JVlJXo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.21] ([217.247.38.146]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LxODe-1idQ9m36ra-01714B; Tue, 25
 Jun 2019 11:31:00 +0200
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
To:     Christoph Hellwig <hch@lst.de>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
References: <f3d9d882-dd22-1782-6ec8-c88cb1880a83@web.de>
 <1d62aadd-67b6-da13-53cc-4b5213de8937@physik.fu-berlin.de>
 <20190625064218.GA29841@lst.de>
 <7f701503-7bd3-28bf-d7e6-d52d3fd168ee@physik.fu-berlin.de>
 <20190625065003.GA29883@lst.de>
 <87311b3d-748d-57e1-21cc-89774bf71a4a@physik.fu-berlin.de>
 <20190625065905.GA30073@lst.de> <5939b8fa-8f3b-fa30-aeb0-d19c6baf89da@web.de>
 <cce09bfe-0179-4ce7-4488-09c66b968628@web.de> <20190625081825.GA31752@lst.de>
 <c5412a03-e3ce-eecd-737f-119c7d955ed3@web.de>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <60d38f5f-4867-ee1d-783c-ae162e25bea9@web.de>
Date:   Tue, 25 Jun 2019 11:30:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c5412a03-e3ce-eecd-737f-119c7d955ed3@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+cYlHVOuONpEuknM8qW2py0LaWCI2AMNHlXe9s3120X4Utasu/j
 GOUR5ge//co/UYHIng3MTIJzkH/pXaBcdspSrQ2dHqn6ayuv3mHfqULS3fxcxWBHzgyb+o2
 5VEGlgr50CxaBkWXhFI2vXw8fex3GjZI+BA4RzxcnjTnm7k9b0jnveJiKBA+pYB6u7azVec
 EhXOroQ9Mguls9q2WPc7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VdShv7Pvmxs=:B3CLeA2OntQNCed5vOTRLI
 lY6SqQs0WBnR+fZ0msyZnMqotpaCwmG+6K+k4n4nwWDEPm0M8whhy1b9Xm8iJiBtCK9TuuVDZ
 VkNwJerilq0F9qUU/7SwGEZdcx4kI/VLOOu3AzPOmsk0zCYB59WY4j6IBFxHJHPV5jJGqkWdj
 j8zdbzSwK3lWD+NimCaUvQoEI5i65cLLLGTKcQ4jPByPdq6wq8D+Wmc+z388UjVKaWnA1ep4A
 DEC0JuAFEsRBN7HgAaCYW8wxenjEjeH/6s6p2w25hMfHM6aMsvIvH56EvPep0XZ0b2KkImxqT
 YLG9jgnT1E7NI1BevZJnmQnvevGPxDgdnkRhCO0L5DH7/TnNLV7GmXX3w/hlab/Vhyu509gUv
 5Hez2suXZggOTSJ3X0SuOV92/9SDhpMu7ytman1A3DcC1NyH4nkoJEulHIRY6roy149xXXAG5
 /GwHuO0dXjp7BMb9CbAMf9ih3mSVyt+X3W4e3dqJk8ozRmbWeloSwCbVu5s+0Dnhv3pSx8519
 hCGkUJOESyWSL3CsSBs7BgzxFtj42XrwPQWZ+WiJ39DbrLVISLdbDKdVOjfgiC8ZfZh8Ush50
 V2JJDyMrtvTPEXrm/NHu2bx4LTIP5y0bnj/KUed/PyDwBMHRmpyk5rYWKUHhbWv93R09qz+zL
 Js7h0QEzmX9VDyfhyhEO5IFdeUF5BqZequ1ur1RZpSQw4fe3oNe5LdQkAMaXrwI5is2KeyO2g
 3C89lo+95ddLED9IxosZR9XrSZ71yICqmoNCzhdH+g4Ix5n+YSAtSMzZtQBzN3+e99ojLHJSL
 9xiZjl2e7V8zPjztuhGGUBURDWdZAn//KbqdAnCnBt8TATXVUEogTZoAhxnv6/93kLfMqc2Il
 wUH2Ulami6NGZS1gt0s0siDzg3b19rbXmfljJGyDYfhjJfW/mL7rmvPWSwVLiamO2TGx9h7FF
 CiQUQT5bU24woC9NHFLUoSfI6Y5IrHJAJBKgt9daslkIkiYUi6CCr
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 6/25/19 10:38, Frank Scheiner wrote:
> On 6/25/19 10:18, Christoph Hellwig wrote:
>> On Tue, Jun 25, 2019 at 10:16:22AM +0200, Frank Scheiner wrote:
>>> Looks like this patch is not enough or not related, a kernel v5.1.15
>>> with that patch applied yields the following:
>>
>> Can you use gdb to disassemle the faulting addresss?
>>
>> Something like:
>>
>> gdb vmlinux
>>
>> The in gdb:
>>
>> l *(__alloc_pages_nodemask+0x281)
>
> Will do. I didn't have gdb installed so it might take some time to
> emerge it. Will report back with the requested information then.

Here's what I get:

```
# gdb ./vmlinux
GNU gdb (Gentoo 8.1 p1) 8.1
[...]
Reading symbols from ./vmlinux...done.
[...]
(gdb) l *(__alloc_pages_nodemask+0x281)
0xa00000010017b901 is in __alloc_pages_nodemask
(./include/linux/mmzone.h:993).
988	 */
989	static __always_inline struct zoneref *next_zones_zonelist(struct
zoneref *z,
990						enum zone_type highest_zoneidx,
991						nodemask_t *nodes)
992	{
993		if (likely(!nodes && zonelist_zone_idx(z) <=3D highest_zoneidx))
994			return z;
995		return __next_zones_zonelist(z, highest_zoneidx, nodes);
996	}
997
```

Sorry, it took longer than expected, as I was compiling in a ramdisk and
I once again forgot to save that state **before** the reboot with the
v5.1.15 kernel. So I had to recompile the kernel, too (the faulting
address stays the same with the newly compiled kernel!). :-/ But maybe
that was needed anyhow, as my original `.config` had `CONFIG_DEBUG_INFO`
unset.

Cheers,
Frank
