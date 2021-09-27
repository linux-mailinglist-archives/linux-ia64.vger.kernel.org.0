Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B875C419EC1
	for <lists+linux-ia64@lfdr.de>; Mon, 27 Sep 2021 20:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbhI0S7C (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 27 Sep 2021 14:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236136AbhI0S7B (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 27 Sep 2021 14:59:01 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CDBC061714
        for <linux-ia64@vger.kernel.org>; Mon, 27 Sep 2021 11:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=As20ET0yHWEcNeKUAlVHfVnK+1oUqLdGDH5prpgujwg=; b=z5Ny+UEsOhsvyGzATU3S6luhX+
        7klGEkECyKGIC6jibC6Joq+lrgU3MY0mSSLQXlTN7F0Pjg0NntTBMs3vhhWRTzRHYiX58vJXbKurS
        j1rK5xJUhlc1xBtMV34TdNZ1AwCJqlDPxQl/VPa++MZiSKhON/XckNQc3p/cMOYqnB+3rnSGzjD1k
        NEF9HIjxo/RCDi09kZwce+TCBqEAGTrRemqry8x7GdNR2H5VHl8WuSUg84Ocaxm3dl3+KEEVnAHvj
        H050RK7nZdb7r1qs2C1bOgCBbO9hVIn89RNnrI2mskPpPPnJuCsbbY3md0/eM6OpkAcFUS7NfLfDn
        8UIooKpg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mUvoU-003s6p-LH; Mon, 27 Sep 2021 18:57:18 +0000
Subject: Re: [PATCH v2] ia64: don't do IA64_CMPXCHG_DEBUG without
 CONFIG_PRINTK
To:     Petr Mladek <pmladek@suse.com>
Cc:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        linux-ia64@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Tony Luck <tony.luck@intel.com>,
        Chris Down <chris@chrisdown.name>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20210926171224.27019-1-rdunlap@infradead.org>
 <20210927032234.GA20607@windriver.com>
 <69ba95ea-a9f3-0739-f64a-a590a61cda58@infradead.org> <YVGn3ptoeDsXs58J@alley>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <076c71da-e072-69f6-dd94-9882636b1beb@infradead.org>
Date:   Mon, 27 Sep 2021 11:57:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVGn3ptoeDsXs58J@alley>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 9/27/21 4:15 AM, Petr Mladek wrote:
> On Sun 2021-09-26 21:53:33, Randy Dunlap wrote:
>> On 9/26/21 8:22 PM, Paul Gortmaker wrote:
>>> [[PATCH v2] ia64: don't do IA64_CMPXCHG_DEBUG without CONFIG_PRINTK] On 26/09/2021 (Sun 10:12) Randy Dunlap wrote:
>>>
>>>> When CONFIG_PRINTK is not set, the CMPXCHG_BUGCHECK() macro calls
>>>> _printk(), but _printk() is a static inline function, not available
>>>> as an extern.
>>>> Since the purpose of the macro is to print the BUGCHECK info,
>>>> make this config option depend on PRINTK.
>>>>
>>>> Fixes multiple occurrences of this build error:
>>>>
>>>> ../include/linux/printk.h:208:5: error: static declaration of '_printk' follows non-static declaration
>>>>     208 | int _printk(const char *s, ...)
>>>>         |     ^~~~~~~
>>>> In file included from ../arch/ia64/include/asm/cmpxchg.h:5,
>>>> ../arch/ia64/include/uapi/asm/cmpxchg.h:146:28: note: previous declaration of '_printk' with type 'int(const char *, ...)'
>>>>     146 |                 extern int _printk(const char *fmt, ...);
>>>>
>>>> Fixes: 85f8f7759e41 ("ia64: populate the cmpxchg header with appropriate code")
>>>
>>> I don't think this fixes tag makes sense either as it was just a
>>> straightforward code relocation.  As pointed out elsewhere, it will
>>> probably be back even further where CONFIG_PRINTK was introduced, which
>>> would be d59745ce3e7a (2005 vintage).  The ia64 debug option predates
>>> git, so it isn't at fault (and you can't blame it anyway).
>>>
>>> Honestly, realize this is just for a randconfig for ia64 where PRINTK is
>>> disabled - something that will never be done in any of the remaining
>>> ia64 deployments out there (if there is any).  So I'd just recommend
>>> dropping the Fixes tag and move on.  It isn't like there is a lot of
>>> people out there doing randconfig builds on linux-stable releases.
>>>
>>
>> Yes, I like the idea of dropping the Fixes: tag also. Thanks.
>> Guess I'll send a v3.
> 
> I could take it via printk tree. I am going to wait 2-3 more days
> just in case anyone has a comment.
> 
> Feel free to send v3 but I could just remove the tag when pushing v2.

Hi Petr,

Please just remove the Fixes: tag after waiting a few more days
for comments.

thanks.

-- 
~Randy
