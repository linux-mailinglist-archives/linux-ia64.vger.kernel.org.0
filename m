Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E493AC063
	for <lists+linux-ia64@lfdr.de>; Fri, 18 Jun 2021 03:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbhFRBFe (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 17 Jun 2021 21:05:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33239 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233042AbhFRBFd (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Thu, 17 Jun 2021 21:05:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623978205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mjShbIWKCZQVRmdNqhrQzmVe9lJ6ZH5t7Eg4I15LJXU=;
        b=U+UES6kqpscHicsKcr5OYPCoYDqcLev2sppf3FH1gHVoZB+rU6gu5dfADUK+uIGitUEUJi
        +64QzOqmlPXczTCSvevvXGm9SvvSa1wHMvaaqrUnEG5QzaxSIPWlXvF2Ip/5t/9lGWhP7S
        iDXFheOzdbcganwtVe9zPX3Dp3DOE5E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-ngz_WOgLP_2XLbUcmtqyDg-1; Thu, 17 Jun 2021 21:03:23 -0400
X-MC-Unique: ngz_WOgLP_2XLbUcmtqyDg-1
Received: by mail-qk1-f200.google.com with SMTP id y5-20020a37af050000b02903a9c3f8b89fso3789690qke.2
        for <linux-ia64@vger.kernel.org>; Thu, 17 Jun 2021 18:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mjShbIWKCZQVRmdNqhrQzmVe9lJ6ZH5t7Eg4I15LJXU=;
        b=BsUXLv5RIPseTMO+sOzshq91YfJ2FZV15YV0duigft26PqBrG8pWkA4M1xsHpxUtu0
         MLFccohN5Y0XuLgOK3PA90lPa2FYHo8+fJ54UAgARW229gtWam25XaCQ9+iS/pQweJIe
         TGVr3JWRpn2rOIpMFbw7FMVa3rGZFtFHhjRFtKNlRKQw6bfBKbXwiHDGgTKagidxiUtj
         pYKC1eq9nNfwaqa6KBf93gZl4jF6Vk+D1cuzDLvFSQuDNNPJfTu9zahRS9uPZuAT1oNY
         ZMZXG3Hd3h1mA4VKYLf+hpoKjqMqt0LbMLgaFPGQ226UCcHUQknUYgx8+FU1cA1P1dFc
         ad+A==
X-Gm-Message-State: AOAM531rk0hc3XehF/ueMK0XLgqg5Nm+wNKsorf3dceNeXhMwaSRfLRE
        Hut5r2VnxsAiCuT29b2YQ0avVc5nk4PW1xwIkum0OtDdQzFkqxubug4oIZkD66Sk3Gf2s+jQAtp
        4lW6cGWT/hKZ/CitnwWi//g==
X-Received: by 2002:a37:7485:: with SMTP id p127mr6756481qkc.323.1623978203260;
        Thu, 17 Jun 2021 18:03:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy87LGgsHd5QeVSDVAGI3hCroljrNariPmX2JZIk5fpNzoXhBx20jQ2zhMrZ+/JX21iqNWpiA==
X-Received: by 2002:a37:7485:: with SMTP id p127mr6756461qkc.323.1623978203061;
        Thu, 17 Jun 2021 18:03:23 -0700 (PDT)
Received: from treble ([68.52.236.68])
        by smtp.gmail.com with ESMTPSA id m199sm3032018qke.71.2021.06.17.18.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 18:03:22 -0700 (PDT)
Date:   Thu, 17 Jun 2021 20:03:20 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, X86 ML <x86@kernel.org>,
        Daniel Xu <dxu@dxuuu.xyz>,
        open list <linux-kernel@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kernel Team <kernel-team@fb.com>, Yonghong Song <yhs@fb.com>,
        linux-ia64@vger.kernel.org,
        Abhishek Sagar <sagar.abhishek@gmail.com>
Subject: Re: [PATCH -tip v7 09/13] kprobes: Setup instruction pointer in
 __kretprobe_trampoline_handler
Message-ID: <20210618010320.5pjpmq5dillhlube@treble>
References: <20210617043909.fgu2lhnkxflmy5mk@treble>
 <20210617044032.txng4enhiduacvt6@treble>
 <20210617234001.54cd2ff60410ff82a39a2020@kernel.org>
 <20210618000239.f95de17418beae6d84ce783d@kernel.org>
 <CAEf4Bzbob_M0aS-GUY5XaqePZr_prxUag3RLHtp=HY8Uu__10g@mail.gmail.com>
 <20210617182159.ka227nkmhe4yu2de@treble>
 <CAEf4BzbQxxAWEvE7BfrBPCPzBjrAEVL9cg-duwbFNzEmbPPW2w@mail.gmail.com>
 <20210617192608.4nt6sdass6gw5ehl@treble>
 <CAEf4BzbGp6aGuv9CY_uAJ9JxeQy9uNDNYRCtgZSksorEcSWp6A@mail.gmail.com>
 <20210618093313.de8528635c61880cccf743d7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618093313.de8528635c61880cccf743d7@kernel.org>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Fri, Jun 18, 2021 at 09:33:13AM +0900, Masami Hiramatsu wrote:
> On Thu, 17 Jun 2021 12:46:19 -0700
> Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:
> 
> > On Thu, Jun 17, 2021 at 12:26 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> > >
> > > On Thu, Jun 17, 2021 at 11:31:03AM -0700, Andrii Nakryiko wrote:
> > > > On Thu, Jun 17, 2021 at 11:22 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> > > > >
> > > > > On Thu, Jun 17, 2021 at 10:45:41AM -0700, Andrii Nakryiko wrote:
> > > > > > > > > > I know I suggested this patch, but I believe it would only be useful in
> > > > > > > > > > combination with the use of UNWIND_HINT_REGS in SAVE_REGS_STRING.  But I
> > > > > > > > > > think that would be tricky to pull off correctly.  Instead, we have
> > > > > > > > > > UNWIND_HINT_FUNC, which is working fine.
> > > > > > > > > >
> > > > > > > > > > So I'd suggest dropping this patch, as the unwinder isn't actually
> > > > > > > > > > reading regs->ip after all.
> > > > > > > > >
> > > > > > > > > ... and I guess this means patches 6-8 are no longer necessary.
> > > > > > > >
> > > > > > > > OK, I also confirmed that dropping those patche does not make any change
> > > > > > > > on the stacktrace.
> > > > > > > > Let me update the series without those.
> > > > > > >
> > > > > > > Oops, Andrii, can you also test the kernel without this patch?
> > > > > > > (you don't need to drop patch 6-8)
> > > > > >
> > > > > > Hi Masami,
> > > > > >
> > > > > > Dropping this patch and leaving all the other in place breaks stack
> > > > > > traces from kretprobes for BPF. I double checked with and without this
> > > > > > patch. Without this patch we are back to having broken stack traces. I
> > > > > > see either
> > > > > >
> > > > > >   kretprobe_trampoline+0x0
> > > > > >
> > > > > > or
> > > > > >
> > > > > >   ftrace_trampoline+0xc8
> > > > > >   kretprobe_trampoline+0x0
> > >
> > > Do the stack traces end there?  Or do they continue normally after that?
> > 
> > That's the entire stack trace.
> 
> So, there are 2 cases of the stacktrace from inside the kretprobe handler.
> 
> 1) Call stack_trace_save() in the handler. This will unwind stack from the
>   handler's context. This is the case of the ftrace dynamic events.
> 
> 2) Call stack_trace_save_regs(regs) in the handler with the pt_regs passed
>   by the kretprobe. This is the case of ebpf.
> 
> For the case 1, these patches can be dropped because ORC can unwind the
> stack with UNWIND_HINT_FUNC. For the case 2, regs->ip must be set to the
> correct (return) address so that ORC can find the correct entry from that
> ip.

Agreed!  I get it now.  Thanks :-)

-- 
Josh

