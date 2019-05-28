Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F24E2CCBB
	for <lists+linux-ia64@lfdr.de>; Tue, 28 May 2019 18:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfE1Q4n (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 28 May 2019 12:56:43 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41506 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbfE1Q4n (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 28 May 2019 12:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=nH9/YIiBfyxeQrFyzBKKJqYNW27qg6QsbvfnYAw+DKw=; b=qav5ISjZmam7rg9EDSX9RYJQB
        Mo5WqUiQW2Z4K+uZwuQxxH4pxqCQqWYM0fw5V7AhXgAvn2rKrXxbFYotFODXGvQKiNJHZh1Qozyyn
        1Mf7HYGJ/x/IHFYfwvTJXDmzAQ6oOHxc/M4ybk5u3UpGNtCiuJ3zxJxWUTmPCdLSRdEN9R5df+cgs
        GU4MY8humaAF6GjwHv5l055ocOW9NORHehesY7TMlew/7ENE7peLJsXOkMq6T0FvFXuzX2V+9zr4n
        fpKWmGiqzL/McwSOeLKClVdelqO0z4NX4SuQtxO6vcTc3z1eOZM/HvC2oZ9lHmSUflsxQ1KuLxnuM
        NYzYsP8Lg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hVfP0-00054g-Fi; Tue, 28 May 2019 16:56:42 +0000
Subject: Re: [PATCH - Linus please apply] ia64: fix build errors by exporting
 paddr_to_nid()
To:     "Luck, Tony" <tony.luck@intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     lkp <lkp@intel.com>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "Yu, Fenghua" <fenghua.yu@intel.com>
References: <20190528161430.27697-1-tony.luck@intel.com>
 <CAHk-=whaNQSnV3Mv_-T8jLmPeHQUTZieg+ZYhyUufW4wrPymfw@mail.gmail.com>
 <3908561D78D1C84285E8C5FCA982C28F7E97462E@ORSMSX104.amr.corp.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6ab98945-7163-04d8-0139-6c1c1936e455@infradead.org>
Date:   Tue, 28 May 2019 09:56:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3908561D78D1C84285E8C5FCA982C28F7E97462E@ORSMSX104.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 5/28/19 9:39 AM, Luck, Tony wrote:
>> Just out of curiosity, what caused this error? It doesn't _look_ new,
>> just judging from the patch itself. Is this just a configuration that
>> nobody has noticed before, or something else that changed that caused
>> it to happen now?
> 
> I'm confused by the error because I don't see it using an older (4.6.4) version
> of gcc. But Randy is building with something modern and runs into it.
> 
> So some aggressive optimization/inline?
> 
> -Tony

kbuild test robot reported the build error.  It uses gcc 7.x.
I am using gcc 8.1 from kernel.org crosstools.

-- 
~Randy
