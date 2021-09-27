Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0598F4192ED
	for <lists+linux-ia64@lfdr.de>; Mon, 27 Sep 2021 13:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233960AbhI0LRY (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 27 Sep 2021 07:17:24 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:53976 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbhI0LRY (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 27 Sep 2021 07:17:24 -0400
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
        by smtp-out1.suse.de (Postfix) with ESMTP id CAD9A22150;
        Mon, 27 Sep 2021 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1632741345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CHfZyJGuEVTZ8cf97NFx9tFZeLSdeUndSXLsc10ewWc=;
        b=W5iJOz6bMZUYV5oz43hG7HPQpRJE39Lb819N2ojHhhX5O3Nh4efYua88eQ7LUvFXGxc9M8
        IbSFtVESC4TPNNpfrJgtSiexQGIDlqN8Jyf4z61ew1ZC9fRZ+OTwwPCsHMvDQSj9ZmWvVS
        jDMqlglym+VYCXkQxpBl283Pf8ApV9M=
Received: from suse.cz (unknown [10.100.216.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay1.suse.de (Postfix) with ESMTPS id 7026625D42;
        Mon, 27 Sep 2021 11:15:45 +0000 (UTC)
Date:   Mon, 27 Sep 2021 13:15:42 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        linux-ia64@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Tony Luck <tony.luck@intel.com>,
        Chris Down <chris@chrisdown.name>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2] ia64: don't do IA64_CMPXCHG_DEBUG without
 CONFIG_PRINTK
Message-ID: <YVGn3ptoeDsXs58J@alley>
References: <20210926171224.27019-1-rdunlap@infradead.org>
 <20210927032234.GA20607@windriver.com>
 <69ba95ea-a9f3-0739-f64a-a590a61cda58@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69ba95ea-a9f3-0739-f64a-a590a61cda58@infradead.org>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Sun 2021-09-26 21:53:33, Randy Dunlap wrote:
> On 9/26/21 8:22 PM, Paul Gortmaker wrote:
> > [[PATCH v2] ia64: don't do IA64_CMPXCHG_DEBUG without CONFIG_PRINTK] On 26/09/2021 (Sun 10:12) Randy Dunlap wrote:
> > 
> > > When CONFIG_PRINTK is not set, the CMPXCHG_BUGCHECK() macro calls
> > > _printk(), but _printk() is a static inline function, not available
> > > as an extern.
> > > Since the purpose of the macro is to print the BUGCHECK info,
> > > make this config option depend on PRINTK.
> > > 
> > > Fixes multiple occurrences of this build error:
> > > 
> > > ../include/linux/printk.h:208:5: error: static declaration of '_printk' follows non-static declaration
> > >    208 | int _printk(const char *s, ...)
> > >        |     ^~~~~~~
> > > In file included from ../arch/ia64/include/asm/cmpxchg.h:5,
> > > ../arch/ia64/include/uapi/asm/cmpxchg.h:146:28: note: previous declaration of '_printk' with type 'int(const char *, ...)'
> > >    146 |                 extern int _printk(const char *fmt, ...);
> > > 
> > > Fixes: 85f8f7759e41 ("ia64: populate the cmpxchg header with appropriate code")
> > 
> > I don't think this fixes tag makes sense either as it was just a
> > straightforward code relocation.  As pointed out elsewhere, it will
> > probably be back even further where CONFIG_PRINTK was introduced, which
> > would be d59745ce3e7a (2005 vintage).  The ia64 debug option predates
> > git, so it isn't at fault (and you can't blame it anyway).
> > 
> > Honestly, realize this is just for a randconfig for ia64 where PRINTK is
> > disabled - something that will never be done in any of the remaining
> > ia64 deployments out there (if there is any).  So I'd just recommend
> > dropping the Fixes tag and move on.  It isn't like there is a lot of
> > people out there doing randconfig builds on linux-stable releases.
> > 
> 
> Yes, I like the idea of dropping the Fixes: tag also. Thanks.
> Guess I'll send a v3.

I could take it via printk tree. I am going to wait 2-3 more days
just in case anyone has a comment.

Feel free to send v3 but I could just remove the tag when pushing v2.

Best Regards,
Petr
