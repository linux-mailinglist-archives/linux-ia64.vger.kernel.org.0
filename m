Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854E62EBCA6
	for <lists+linux-ia64@lfdr.de>; Wed,  6 Jan 2021 11:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbhAFKrk (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 6 Jan 2021 05:47:40 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:43089 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725788AbhAFKrk (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 6 Jan 2021 05:47:40 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1kx6L8-001eES-UM; Wed, 06 Jan 2021 11:46:54 +0100
Received: from p5b13a61e.dip0.t-ipconnect.de ([91.19.166.30] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1kx6L8-000KPC-2m; Wed, 06 Jan 2021 11:46:54 +0100
Subject: Re: [PATCH] ia64: fix xchg() warning
To:     "Luck, Tony" <tony.luck@intel.com>, Arnd Bergmann <arnd@kernel.org>
Cc:     "Yu, Fenghua" <fenghua.yu@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210104085806.4176886-1-arnd@kernel.org>
 <ad54481b-15da-e795-0c1a-bd54d3e8ab87@physik.fu-berlin.de>
 <CAK8P3a3zDB5wh-bdg+fq6nvg9gHrESFhhgss4f47VJ1JOvoE1Q@mail.gmail.com>
 <71274a7cdf7d48bf9c2fda873fa37727@intel.com>
 <CAK8P3a2KhaEZ-ErAXGi0wOr_z2YT-GUV7r5QMhUoV+e+tpc5zw@mail.gmail.com>
 <20210105153603.GA17644@agluck-desk2.amr.corp.intel.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <c49a5ed2-c3d5-8cb4-7d28-7087eea2e707@physik.fu-berlin.de>
Date:   Wed, 6 Jan 2021 11:46:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105153603.GA17644@agluck-desk2.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.166.30
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi!

On 1/5/21 4:36 PM, Luck, Tony wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0f2e55faaf7f..b74093803154 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8432,11 +8432,8 @@ F: drivers/i3c/
>>  F: include/linux/i3c/
>>
>>  IA64 (Itanium) PLATFORM
>> -M: Tony Luck <tony.luck@intel.com>
>> -M: Fenghua Yu <fenghua.yu@intel.com>
>>  L: linux-ia64@vger.kernel.org
>> -S: Odd Fixes
>> -T: git git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git
>> +S: Orphan
>>  F: Documentation/ia64/
>>  F: arch/ia64/
>>
>> Is that what you had in mind? I see that Fenghua Yu has not been
>> actively involved for a long time. If you are both out, that would
>> make the port unmaintained, but that may actually help find someone
>> else to either volunteer as a maintainer or pay someone if they
>> have a commercial interest.
> 
> Yes. Fenghua has moved to working on other things, so that looks good.
> 
> Acked-by: Tony Luck <tony.luck@intel.com>

I wonder whether I can take over maintainership. I'm certainly not experienced as
Tony or Fenghua, but I guess one can grow with the task, can't one?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

