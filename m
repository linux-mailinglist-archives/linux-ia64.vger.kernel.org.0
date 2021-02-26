Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF46A326387
	for <lists+linux-ia64@lfdr.de>; Fri, 26 Feb 2021 14:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhBZNsI (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 26 Feb 2021 08:48:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbhBZNsI (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 26 Feb 2021 08:48:08 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D59BC06174A
        for <linux-ia64@vger.kernel.org>; Fri, 26 Feb 2021 05:47:22 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id f12so4838451wrx.8
        for <linux-ia64@vger.kernel.org>; Fri, 26 Feb 2021 05:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vTw5pV8CppqaFWYeiTnc7rI0doZYk4bhQx1gn2PUM+c=;
        b=rQwYdC4L1ZQNePU5zXmJj4yQMRJzUx75u9nGyOrtOTzEf4kcM0mqcJefmV6wmB46ig
         UxyjFkKq76yoz7mM854sr4iiDzvbgXSWYQeaVk2kmsJA6h7PVkE2ScDqX7mhdZv3t6t6
         HYgQKCePp2o2dBRyWr2il29WE3zXnkf8Dv3u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vTw5pV8CppqaFWYeiTnc7rI0doZYk4bhQx1gn2PUM+c=;
        b=QnFoj0wQ/BEbhxJnxrkeEPYA+avNAmanpSIZGIuC5BvoQDgZVoL0k6kEJ4VsUqs2ca
         TqBv6rhVhe7WaTNDaa7c6XbAXb2tiu90N99UeXpQV8R9NEhcZtVUbnLha7+UDI2bdeyU
         qY5n4+hCvJmwrGYF7sZXK9FzK6RLpYcyy3mFmwy69D8lzufMIzLLOyyexWFj+D6O4M6n
         sTsxYCuKfP72fh20bSQDjiV7RrkRVOWkJWilhX4rM8g7238Afp4AfX273NWsg16evvap
         9Rq/GQsdxA6FqdHjYmwJuFnWPINg8WHnSufqEw21MKKn1prbrXxi/1qMwXu1M1rMTWfN
         1JDw==
X-Gm-Message-State: AOAM532TO2ejLGL5G9M4zJ/tRCPXuclUn/YAaqRlhmc6eVY0540zQFw0
        M4dY2nC5kJvhIjheKKf0/mO5Lw==
X-Google-Smtp-Source: ABdhPJyPIZy8UwWq69q/gkkLW4ZIRBWdSesqrIV6aqBwCubu5YLuWEdVDHMLcKWfhMLfOO/m6Jmv9g==
X-Received: by 2002:adf:fe09:: with SMTP id n9mr3390807wrr.104.1614347240990;
        Fri, 26 Feb 2021 05:47:20 -0800 (PST)
Received: from localhost ([2620:10d:c093:400::4:87b5])
        by smtp.gmail.com with ESMTPSA id c11sm12808490wrs.28.2021.02.26.05.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:47:20 -0800 (PST)
Date:   Fri, 26 Feb 2021 13:47:20 +0000
From:   Chris Down <chris@chrisdown.name>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@fb.com
Subject: Re: [PATCH] ia64: Depend on non-static printk for cmpxchg debug
Message-ID: <YDj76FjQCL7YgQq+@chrisdown.name>
References: <YCflN5zTvo5mxvKY@chrisdown.name>
 <YDjt/lI82VzZcCgq@chrisdown.name>
 <20210226130029.GC2723601@casper.infradead.org>
 <YDj0T7H4ZbuEAYwK@chrisdown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YDj0T7H4ZbuEAYwK@chrisdown.name>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Chris Down writes:
>I must confess I have no idea of the history of why it was `extern 
>int` in the first place -- my fear was somehow we use cmpxchg.h from a 
>different context.  Do you have any idea? :-)

Ok, found where it's introduced in the pre-git archives: "New file 
asm-ia64/intrinsics.h." from David Mosberger <davidm@tiger.hpl.hp.com>, Dec 9 
2002. No indication why it's extern, but it's been there since the dawn of 
ia64.
