Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B93A418E80
	for <lists+linux-ia64@lfdr.de>; Mon, 27 Sep 2021 06:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbhI0EzW (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 27 Sep 2021 00:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232526AbhI0EzW (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 27 Sep 2021 00:55:22 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47922C061570
        for <linux-ia64@vger.kernel.org>; Sun, 26 Sep 2021 21:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=vBqNb3Jh2dup43JWLwY/PvY6hmbWGivK0H8TqqJfsCY=; b=uPyzBkHkzBrgE25NbbFyQogGOf
        l8+/zTDgzikVf5XrpIhAl433ABpwdBUQ/sr2UDPczO9S4LZpV0puOdZ+S0N59mZQyoO1ZhIfOzyUZ
        DKPPWZOTOMg2uLBHNTKSsFCpyCNbhmD8+Hi39FPIV2ysKk4s1+MoXpkHwp4fDCF4IDt/cT4gNKCLP
        CU052ioKZbOZyix5oX0pkP5syy+sXxD7GWMm6a9bNRwho2kH55kLBC6u0/qS5p/zwkPjOPnfbIPlW
        ZELHTQtRoktDMPzQ76GEXWqu2sZTZKtqmVxXXG8UiBXH4Hqp/4TRzX7vMJN48JKWLM77n9KIxLYi/
        tpE+3f8g==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mUidx-001Z9E-Qt; Mon, 27 Sep 2021 04:53:33 +0000
Subject: Re: [PATCH v2] ia64: don't do IA64_CMPXCHG_DEBUG without
 CONFIG_PRINTK
To:     Paul Gortmaker <paul.gortmaker@windriver.com>
Cc:     linux-ia64@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tony Luck <tony.luck@intel.com>,
        Chris Down <chris@chrisdown.name>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20210926171224.27019-1-rdunlap@infradead.org>
 <20210927032234.GA20607@windriver.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <69ba95ea-a9f3-0739-f64a-a590a61cda58@infradead.org>
Date:   Sun, 26 Sep 2021 21:53:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927032234.GA20607@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 9/26/21 8:22 PM, Paul Gortmaker wrote:
> [[PATCH v2] ia64: don't do IA64_CMPXCHG_DEBUG without CONFIG_PRINTK] On 26/09/2021 (Sun 10:12) Randy Dunlap wrote:
> 
>> When CONFIG_PRINTK is not set, the CMPXCHG_BUGCHECK() macro calls
>> _printk(), but _printk() is a static inline function, not available
>> as an extern.
>> Since the purpose of the macro is to print the BUGCHECK info,
>> make this config option depend on PRINTK.
>>
>> Fixes multiple occurrences of this build error:
>>
>> ../include/linux/printk.h:208:5: error: static declaration of '_printk' follows non-static declaration
>>    208 | int _printk(const char *s, ...)
>>        |     ^~~~~~~
>> In file included from ../arch/ia64/include/asm/cmpxchg.h:5,
>> ../arch/ia64/include/uapi/asm/cmpxchg.h:146:28: note: previous declaration of '_printk' with type 'int(const char *, ...)'
>>    146 |                 extern int _printk(const char *fmt, ...);
>>
>> Fixes: 85f8f7759e41 ("ia64: populate the cmpxchg header with appropriate code")
> 
> I don't think this fixes tag makes sense either as it was just a
> straightforward code relocation.  As pointed out elsewhere, it will
> probably be back even further where CONFIG_PRINTK was introduced, which
> would be d59745ce3e7a (2005 vintage).  The ia64 debug option predates
> git, so it isn't at fault (and you can't blame it anyway).
> 
> Honestly, realize this is just for a randconfig for ia64 where PRINTK is
> disabled - something that will never be done in any of the remaining
> ia64 deployments out there (if there is any).  So I'd just recommend
> dropping the Fixes tag and move on.  It isn't like there is a lot of
> people out there doing randconfig builds on linux-stable releases.
> 

Yes, I like the idea of dropping the Fixes: tag also. Thanks.
Guess I'll send a v3.

> --
> 
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: linux-ia64@vger.kernel.org
>> Cc: Petr Mladek <pmladek@suse.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Tony Luck <tony.luck@intel.com>
>> Cc: Chris Down <chris@chrisdown.name>
>> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
>> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>> ---
>> v2: correct the Fixes: commit info
>>
>>   arch/ia64/Kconfig.debug |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> --- linux-next-20210917.orig/arch/ia64/Kconfig.debug
>> +++ linux-next-20210917/arch/ia64/Kconfig.debug
>> @@ -39,7 +39,7 @@ config DISABLE_VHPT
>>   
>>   config IA64_DEBUG_CMPXCHG
>>   	bool "Turn on compare-and-exchange bug checking (slow!)"
>> -	depends on DEBUG_KERNEL
>> +	depends on DEBUG_KERNEL && PRINTK
>>   	help
>>   	  Selecting this option turns on bug checking for the IA-64
>>   	  compare-and-exchange instructions.  This is slow!  Itaniums


-- 
~Randy
