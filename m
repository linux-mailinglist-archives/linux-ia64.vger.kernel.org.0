Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3801B23B04
	for <lists+linux-ia64@lfdr.de>; Mon, 20 May 2019 16:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392079AbfETOs3 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 20 May 2019 10:48:29 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35900 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392085AbfETOs1 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 20 May 2019 10:48:27 -0400
Received: by mail-wm1-f66.google.com with SMTP id j187so13355398wmj.1
        for <linux-ia64@vger.kernel.org>; Mon, 20 May 2019 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N7wB0bhMnAowtyDk7cjOKmaZEhZ6/2E0ef5LypbT5pM=;
        b=DauQZ4rgS8TTJobEVuVF04IQ8OrrQsWx/7I3dVssObK0ub6Wu5l3OX+dW7klHHK0qm
         VTzmbSB41r23etZTCBjrd8m+r36Fu5u/KMx97MMxNxqrc49IzLJgxrXuPKJbtCw731N2
         2I/Or4zAH6edPPIHVOmx0J8f7ho+EcxpE4+E0tEGBsS3gW21YphO/NArsQ/NQg3lEiKL
         oDh24dU1R+R5HUs2yW4HElupA/gn8GbEgZeLHFFkjPe+prcmClURRdntkwM4xCV3R301
         oyEP0r/asVzA0N6Yse3cdeLbDHxEh1gQMX/6fsFKeqmxjgm0wnRNCfyORqg0I7sZtKZ1
         ZpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N7wB0bhMnAowtyDk7cjOKmaZEhZ6/2E0ef5LypbT5pM=;
        b=Zb3AjQOJOd1hzF+xgCiQbgn1za/FsV3xdhWoQTxkPmeLYqurNunaBoyAjNiunKSba2
         mJ3KzI7OrxHZMFYfK7O279OXVEg2W225CbYR/FXCJRqGv23coXDG1IdWnTzS1CVIGz+V
         KnyuLEwppOK6QLWyjDpSqKrZ9mfMF6SXK3VzFQUfjH/WKbMKGFNlpFWiX726zBw/PnkK
         kxR/bYw6Dws4sK3cW5dGgdLcMq3cXATMOwnDWHdcDTURRd7Pg1TFquGyZkP6TuVb5fVm
         /JGM/7sIKVaua1LYKcCVeDhyaFE9CyOdzY7TD0Oz7cFvNlK+MIU8FFbaolbk1jCz5A68
         dHeQ==
X-Gm-Message-State: APjAAAUfHnVM2Azl6jK8aaTmCPtXC8UUzUCP6/+nu7UWRJw54jbQq0tS
        Sy+1K23gitZSieSATOzdSNjUoA==
X-Google-Smtp-Source: APXvYqzgUfAfX/fOEqJpAu0H05y9iE6v85VXR9NGZP9lcwztHn9oG8QSJSLuvfJRMuYHnyshwQXXCQ==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr17177633wmc.69.1558363705786;
        Mon, 20 May 2019 07:48:25 -0700 (PDT)
Received: from brauner.io ([212.91.227.56])
        by smtp.gmail.com with ESMTPSA id z1sm3308970wrl.91.2019.05.20.07.48.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 20 May 2019 07:48:25 -0700 (PDT)
Date:   Mon, 20 May 2019 16:48:23 +0200
From:   Christian Brauner <christian@brauner.io>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jann Horn <jannh@google.com>, Oleg Nesterov <oleg@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, cyphar@cyphar.com,
        David Howells <dhowells@redhat.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        "Reshetova, Elena" <elena.reshetova@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Colascione <dancol@google.com>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Android Kernel Team <kernel-team@android.com>
Subject: Re: [PATCH v2 1/2] pid: add pidfd_open()
Message-ID: <20190520144822.xfaifawi65jus6ng@brauner.io>
References: <20190520134605.29116-1-christian@brauner.io>
 <CAK8P3a1cZZ6SQe5mGjhga=MgTvCGF6OKyjvosR8J6z6EpH+rVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a1cZZ6SQe5mGjhga=MgTvCGF6OKyjvosR8J6z6EpH+rVA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, May 20, 2019 at 04:37:03PM +0200, Arnd Bergmann wrote:
> On Mon, May 20, 2019 at 3:46 PM Christian Brauner <christian@brauner.io> wrote:
> >
> > In line with Arnd's recent changes to consolidate syscall numbers across
> > architectures, I have added the pidfd_open() syscall to all architectures
> > at the same time.
> 
> Thanks! I've checked that the ones you have added are all
> done correctly. However, double-checking that you got all of them,
> I noticed that you missed mips-o32 and mips-n64. With those added:
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Perfect, will plumb mips-o32 and mips-n64 and resend once more with your
ack added.
Sidenote: You plan on merging the common syscall tables or will there be
a script to do this work per-arch in the future?
