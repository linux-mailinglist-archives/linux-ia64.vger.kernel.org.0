Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79003AAA3B
	for <lists+linux-ia64@lfdr.de>; Thu, 17 Jun 2021 06:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhFQEmo (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 17 Jun 2021 00:42:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59353 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229565AbhFQEmo (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Thu, 17 Jun 2021 00:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623904837;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jWbrukriN6cmSfjccXk3wRAeX8U39CdrRgGKRGxuZXM=;
        b=XxU4a1Rfe1LR6d4KsjRd90E6DRDH3t/gHqzkkFNTVmZIIF9sTFUwVibgAQq843mxv3k5g/
        yW/p33O3OWJ+5UxLTiuGPQ1t9WYMKOh1yJRXwxG+cS3WWko0WH97uEEpHrnVw55G47i1f2
        Rbi4Uv25DsBNyVDf8ADGKKql0Uq2xr8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-ttE-w6VuNXyfW_P5Lwu7eg-1; Thu, 17 Jun 2021 00:40:35 -0400
X-MC-Unique: ttE-w6VuNXyfW_P5Lwu7eg-1
Received: by mail-qv1-f72.google.com with SMTP id g17-20020a0caad10000b029021886e075f0so1214410qvb.15
        for <linux-ia64@vger.kernel.org>; Wed, 16 Jun 2021 21:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jWbrukriN6cmSfjccXk3wRAeX8U39CdrRgGKRGxuZXM=;
        b=QaQRz3+bkUHjeoUnASGlF3RH+Re0I+VAZCzm+fqInb0UBBF49obaY4Vd29kKHfopSs
         +M5HwNY7Z+HWC9RpVg6uGeemaghG/CWBeOYFUWjJ9RsZGuEg/mb5jS2vcvbrh3xLhHXu
         9WtEVdmREsV8yDRiZqqM9Ls8kDtP4Ik5R5vjUNP3x/shI8K6t/ic9KeCxNpuW+33Qa8/
         0kIc+VW7ZiURJ5bHVf3B0JsKn1ivMSi1sEp+UluR2aIg9/KdWxOEvnPKhXmiyjkgTs6j
         xyJBiF0wwsBXZ5ePeYmyiCctNa/6kPZ89iNo9O+cr/CsAF7+5IoRkYA9/oUsPltRkuW1
         rucg==
X-Gm-Message-State: AOAM53107Cfb9H+NC3DGapJGn+Zqf3UNyEP3edelJGmeQCojc6HTOLOL
        or1JhY9ZOr+R5uAMgortPnXOvT3iL5TdJjIP3NYRJ+2lhJTRL7bY8CeR7VuqUaLYX8lVAGX23Qv
        /XqSTZOukaZJfs1b2neyHDQ==
X-Received: by 2002:a37:a5d6:: with SMTP id o205mr1862536qke.118.1623904835322;
        Wed, 16 Jun 2021 21:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN00OM2lpluu5z6CTMd/YwFORQuwMDU9GwbEcWW+z+9HapLA/PPi+4f0w+tRDNwOQpgs+fzw==
X-Received: by 2002:a37:a5d6:: with SMTP id o205mr1862521qke.118.1623904835109;
        Wed, 16 Jun 2021 21:40:35 -0700 (PDT)
Received: from treble ([68.52.236.68])
        by smtp.gmail.com with ESMTPSA id g15sm50518qtq.70.2021.06.16.21.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 21:40:34 -0700 (PDT)
Date:   Wed, 16 Jun 2021 23:40:32 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, X86 ML <x86@kernel.org>,
        Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org,
        bpf@vger.kernel.org, kuba@kernel.org, mingo@redhat.com,
        ast@kernel.org, tglx@linutronix.de, kernel-team@fb.com, yhs@fb.com,
        linux-ia64@vger.kernel.org,
        Abhishek Sagar <sagar.abhishek@gmail.com>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>
Subject: Re: [PATCH -tip v7 09/13] kprobes: Setup instruction pointer in
 __kretprobe_trampoline_handler
Message-ID: <20210617044032.txng4enhiduacvt6@treble>
References: <162209754288.436794.3904335049560916855.stgit@devnote2>
 <162209762943.436794.874947392889792501.stgit@devnote2>
 <20210617043909.fgu2lhnkxflmy5mk@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210617043909.fgu2lhnkxflmy5mk@treble>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, Jun 16, 2021 at 11:39:11PM -0500, Josh Poimboeuf wrote:
> On Thu, May 27, 2021 at 03:40:29PM +0900, Masami Hiramatsu wrote:
> > To simplify the stacktrace with pt_regs from kretprobe handler,
> > set the correct return address to the instruction pointer in
> > the pt_regs before calling kretprobe handlers.
> > 
> > Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
> > Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> > Tested-by: Andrii Nakryik <andrii@kernel.org>
> > ---
> >  Changes in v3:
> >   - Cast the correct_ret_addr to unsigned long.
> > ---
> >  kernel/kprobes.c |    3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> > index 54e5b89aad67..1598aca375c9 100644
> > --- a/kernel/kprobes.c
> > +++ b/kernel/kprobes.c
> > @@ -1914,6 +1914,9 @@ unsigned long __kretprobe_trampoline_handler(struct pt_regs *regs,
> >  		BUG_ON(1);
> >  	}
> >  
> > +	/* Set the instruction pointer to the correct address */
> > +	instruction_pointer_set(regs, (unsigned long)correct_ret_addr);
> > +
> >  	/* Run them. */
> >  	first = current->kretprobe_instances.first;
> >  	while (first) {
> > 
> 
> Hi Masami,
> 
> I know I suggested this patch, but I believe it would only be useful in
> combination with the use of UNWIND_HINT_REGS in SAVE_REGS_STRING.  But I
> think that would be tricky to pull off correctly.  Instead, we have
> UNWIND_HINT_FUNC, which is working fine.
> 
> So I'd suggest dropping this patch, as the unwinder isn't actually
> reading regs->ip after all.

... and I guess this means patches 6-8 are no longer necessary.

-- 
Josh

