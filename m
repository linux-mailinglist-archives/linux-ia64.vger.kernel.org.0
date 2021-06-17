Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309C83AAA47
	for <lists+linux-ia64@lfdr.de>; Thu, 17 Jun 2021 06:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhFQEnh (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 17 Jun 2021 00:43:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39227 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229515AbhFQEng (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Thu, 17 Jun 2021 00:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623904889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Gu9+RkggD0yW39knD2c9KhK9b8LU7wFL1uvtc5L0v/I=;
        b=ilFsCmkIzeIKBGPT+xJSzcry2t5llFitmC87q5iLRCT0KGbOq7iLqSLXoLHn1uBqYsOhMi
        rAxEo4nPQAjyA4F5HXVRMXX9q8s0ksRrhDDT0+hovVAG/o0vBwT8rfY7ntlQHTLezgMrBC
        cRZcxfFmjtXZq12Ag3dpyhf0viB9bZk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-yuEGleIrM5SIkDKKC9-ikg-1; Thu, 17 Jun 2021 00:41:27 -0400
X-MC-Unique: yuEGleIrM5SIkDKKC9-ikg-1
Received: by mail-qt1-f200.google.com with SMTP id d12-20020ac8668c0000b0290246e35b30f8so356274qtp.21
        for <linux-ia64@vger.kernel.org>; Wed, 16 Jun 2021 21:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gu9+RkggD0yW39knD2c9KhK9b8LU7wFL1uvtc5L0v/I=;
        b=EQyE9kQlCPWgsiKwJjtiNHAOo04bq/DeEPSjD9CLfAAoIsVoeqH7lUFJxVvpC+yn7O
         hfDgs/VMwvHVB0sKBhT6zCW2e1SbJc2OUbqzs7yGhPQpuR/Fs1bShXHyoS72+KdOKLde
         2j5MMpjeZVjlbyKLtiBGuIqwVbS0iaoMrZbygUppYuoMkLN/feioHOjihOLlSlj9W9Fs
         DykuR0/9mBO8GOkWirmlZVaBt9qnwli0Kudalq4YbLrBsYE8/angZj4Iz9Uq937dcqr1
         LKKWD4RbCUGZxaW5Suttq3cgyY1XlCSD2lDuP51n+07pFTCSEVLOHFxenzQCgsM4zr68
         KcgQ==
X-Gm-Message-State: AOAM533GtE7hfRRK/sBGtxAnHLxCkJ0SISBNXwy27N7anxRqNc70K6Y0
        ssT7Ev488dkKIey3HJ1U+fL1ekJjmlA22ZPgtAdxOcn6+/mHMu5qeKkBLBiaIN41O14vTmGeflh
        vbY+6/mvRfw+iM8jASVFI3Q==
X-Received: by 2002:a0c:f3c8:: with SMTP id f8mr3937939qvm.58.1623904886762;
        Wed, 16 Jun 2021 21:41:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2qJtGnUR5miTCWdvpT+hUy6c3l8oz/W+oT4ExJgMBBwY8BO4EAFQCDcDFXS8OOF7P0cwfAA==
X-Received: by 2002:a0c:f3c8:: with SMTP id f8mr3937928qvm.58.1623904886602;
        Wed, 16 Jun 2021 21:41:26 -0700 (PDT)
Received: from treble ([68.52.236.68])
        by smtp.gmail.com with ESMTPSA id h2sm979060qkf.106.2021.06.16.21.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 21:41:26 -0700 (PDT)
Date:   Wed, 16 Jun 2021 23:41:24 -0500
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
Subject: Re: [PATCH -tip v7 11/13] x86/unwind: Recover kretprobe trampoline
 entry
Message-ID: <20210617044124.pv4xm47cum4faaeo@treble>
References: <162209754288.436794.3904335049560916855.stgit@devnote2>
 <162209764814.436794.15907711942126944591.stgit@devnote2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <162209764814.436794.15907711942126944591.stgit@devnote2>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, May 27, 2021 at 03:40:48PM +0900, Masami Hiramatsu wrote:
> Since the kretprobe replaces the function return address with
> the kretprobe_trampoline on the stack, x86 unwinders can not
> continue the stack unwinding at that point, or record
> kretprobe_trampoline instead of correct return address.
> 
> To fix this issue, find the correct return address from task's
> kretprobe_instances as like as function-graph tracer does.
> 
> With this fix, the unwinder can correctly unwind the stack
> from kretprobe event on x86, as below.
> 
>            <...>-135     [003] ...1     6.722338: r_full_proxy_read_0: (vfs_read+0xab/0x1a0 <- full_proxy_read)
>            <...>-135     [003] ...1     6.722377: <stack trace>
>  => kretprobe_trace_func+0x209/0x2f0
>  => kretprobe_dispatcher+0x4a/0x70
>  => __kretprobe_trampoline_handler+0xca/0x150
>  => trampoline_handler+0x44/0x70
>  => kretprobe_trampoline+0x2a/0x50
>  => vfs_read+0xab/0x1a0
>  => ksys_read+0x5f/0xe0
>  => do_syscall_64+0x33/0x40
>  => entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> 
> Reported-by: Daniel Xu <dxu@dxuuu.xyz>
> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Tested-by: Andrii Nakryik <andrii@kernel.org>

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

