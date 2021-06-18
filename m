Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5513ACD06
	for <lists+linux-ia64@lfdr.de>; Fri, 18 Jun 2021 16:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbhFROGr (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 18 Jun 2021 10:06:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48944 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231685AbhFROGr (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Fri, 18 Jun 2021 10:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624025077;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=o4/MAAO2RBJYfBGbAHmWoKr3dKd/cHorzGFyg6HuH7A=;
        b=KHWY4ouLAtx0e1a8WmKU2JpFBBl1HJGxfKf2CaT54X1MzQ2XZe7MYzMdF9CH/QrTztmExG
        IMbzlDweS5HbwGEnbUvFEpjOG2gJ6tooTBJly1Ivph/zqebtVgmu2BUwEQPYBhccWBspdM
        onBt32cqOKBfLUrMa/+M45/MGMxhx6Q=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-R4mZ7tGPMUGpl2diMWBBcw-1; Fri, 18 Jun 2021 10:04:36 -0400
X-MC-Unique: R4mZ7tGPMUGpl2diMWBBcw-1
Received: by mail-qt1-f198.google.com with SMTP id t6-20020ac80dc60000b029024e988e8277so7394326qti.23
        for <linux-ia64@vger.kernel.org>; Fri, 18 Jun 2021 07:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o4/MAAO2RBJYfBGbAHmWoKr3dKd/cHorzGFyg6HuH7A=;
        b=GBgwUTd73xm0cp46l1Smr5HxpoHpQOTTpoCWmLtp3gaShHkcw+zPHX6F+DjgUuPZzc
         E8O4m6q2hm8o4eTWdNmawLANtAMK1LNC8PmPLu8y6ehGGhSZL+93rkCMrLof3ddwR9UF
         3Y/o26WKtnn/zzU3rKAubLwy9aY5ytxGDaj2YKgu4kg7RCYaa8rEBGvAKHcwgQxItv7D
         JsmI6pF2Gqmjn4t04OsaUoPDuU+c1mmZePt6J6/NnqO6URncMV7MHkzCVl4NCzv7zs3H
         YLClNx0fClHwrDPtlJd329Mzn0q2TMjtShNx+1iN2wikZY/IgYB2K9II3AYFBIFy3prZ
         XgEg==
X-Gm-Message-State: AOAM533gA7gwDtrqHoG0iF0QUmIx9RKsgXuxUYQ2ZTXSbSqOAIfd7iqs
        hxk4uQY6dqgGLonIFWGnZkEFrbflVhzKMF3G4n0R6ohGhBFAqkYlsRLwEEdqliFDX/LRfeVYHpp
        hsObX7MKCnVE7uyjk1CvheA==
X-Received: by 2002:a05:6214:17d2:: with SMTP id cu18mr1856566qvb.48.1624025075808;
        Fri, 18 Jun 2021 07:04:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWdjn/e3bp8k2qYtJ4JSPdpyPJOcw95bpeOHzfwYoo753l01h+N2vR+P8ZKMV6jt/Xa60Msg==
X-Received: by 2002:a05:6214:17d2:: with SMTP id cu18mr1856524qvb.48.1624025075512;
        Fri, 18 Jun 2021 07:04:35 -0700 (PDT)
Received: from treble ([68.52.236.68])
        by smtp.gmail.com with ESMTPSA id 7sm5415837qtx.33.2021.06.18.07.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 07:04:35 -0700 (PDT)
Date:   Fri, 18 Jun 2021 09:04:32 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, X86 ML <x86@kernel.org>,
        Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org,
        bpf@vger.kernel.org, kuba@kernel.org, mingo@redhat.com,
        ast@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>, kernel-team@fb.com,
        yhs@fb.com, linux-ia64@vger.kernel.org,
        Abhishek Sagar <sagar.abhishek@gmail.com>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>
Subject: Re: [PATCH -tip v8 09/13] kprobes: Enable stacktrace from pt_regs in
 kretprobe handler
Message-ID: <20210618140432.icuopdgxt2urngmy@treble>
References: <162399992186.506599.8457763707951687195.stgit@devnote2>
 <162400000592.506599.4695807810528866713.stgit@devnote2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <162400000592.506599.4695807810528866713.stgit@devnote2>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Fri, Jun 18, 2021 at 04:06:46PM +0900, Masami Hiramatsu wrote:
> Since the ORC unwinder from pt_regs requires setting up regs->ip
> correctly, set the correct return address to the regs->ip before
> calling user kretprobe handler.
> 
> This allows the kretrprobe handler to trace stack from the
> kretprobe's pt_regs by stack_trace_save_regs() (eBPF will do
> this), instead of stack tracing from the handler context by
> stack_trace_save() (ftrace will do this).
> 
> Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> Tested-by: Andrii Nakryik <andrii@kernel.org>

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

> ---
>  Changes in v8:
>   - Update comment to clarify why this is needed.
>  Changes in v3:
>   - Cast the correct_ret_addr to unsigned long.
> ---
>  kernel/kprobes.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 650cbe738666..ba729ed05cb3 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1896,6 +1896,9 @@ unsigned long __kretprobe_trampoline_handler(struct pt_regs *regs,
>  		BUG_ON(1);
>  	}
>  
> +	/* Set the instruction pointer to the correct address */
> +	instruction_pointer_set(regs, (unsigned long)correct_ret_addr);
> +
>  	/* Run them. */
>  	first = current->kretprobe_instances.first;
>  	while (first) {
> 

-- 
Josh

