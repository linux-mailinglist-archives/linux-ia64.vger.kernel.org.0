Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0C3D29665
	for <lists+linux-ia64@lfdr.de>; Fri, 24 May 2019 12:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390692AbfEXKyO (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 24 May 2019 06:54:14 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:35936 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390680AbfEXKyM (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 24 May 2019 06:54:12 -0400
Received: by mail-it1-f196.google.com with SMTP id e184so13177116ite.1
        for <linux-ia64@vger.kernel.org>; Fri, 24 May 2019 03:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CfQCPeLhxIRZNFUFprUfxjdraaUe3oFHAGmuDz7teoQ=;
        b=Em430Lcwry47jSvpo2CX3tGth2isfe0jStpDuxS7CMmLdA3d0PXEVPlYO1LA5R1mzt
         HY4rafqjGQJavFGnE3XaT/sGBtGX54ySCbaX7DVDZMmxBcy/N79r+hv4lU4j2oA3k9uH
         3qZj79cuHnNGNu2oYXdLcTSXDzUD2I8KQ+AfcVybt1p+pDbSSV/BxOdIjemHzveC4b7q
         duRReG8ScM5eer/3Afm7cUzTfGgmoE34PFQheJOvRIbKuqLqZGUfkiFLLL9ErcrO39tc
         F/9MwQeUr7EmYtaiFsYdYlVOLNriujpFjX0na3vmEkcAGEzSA9rJkFtPpvRuu71lHiOs
         lhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CfQCPeLhxIRZNFUFprUfxjdraaUe3oFHAGmuDz7teoQ=;
        b=KkdDUheYkwiQeeUAIwBZQHX6Z4jn9On676b4RRr8IlnTcsSzXMuKdtSH4ABpsfwkTW
         d81OTe8fD6oJuUgG0V5nxY4ZKxQyJAZ7nGC2F9m4Yfv5lJlgm8vaV9DofisWiZ5lVCft
         i3bBrwjp0JHbqhmZhQL39yxwftS6f5tUvbFAyiJ5RLOSZB9X7DUdUklvGMva9LSE15Aw
         VkLDOOoLcT6+Gg8eyZgJkX5MWFTpzUV6wJ9OIaPOWLHWb8LzqMhhtmXZ/A77oSi0VCXz
         naxc5huPevajheyOhZxO5QigW2uRRbmJlEcWNPRO0xowi7hp5SptWBi4YuZjOm8nY46F
         h4tg==
X-Gm-Message-State: APjAAAU4/omIeSqzUJXpRokF1JHhX0JzStrROuuGaIKcYkxHI6X+asHf
        2jhk7APXhTMv2obhS8nNjZbx7A==
X-Google-Smtp-Source: APXvYqzek4vSIIuFlylSllnN9c1fb45hmMMLlcQcM2y40ZIswZUPrKTiVfMzOtV1j/enrZtL4iFGng==
X-Received: by 2002:a24:4043:: with SMTP id n64mr17805822ita.25.1558695251429;
        Fri, 24 May 2019 03:54:11 -0700 (PDT)
Received: from brauner.io ([172.56.12.37])
        by smtp.gmail.com with ESMTPSA id f14sm955704itb.31.2019.05.24.03.54.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 24 May 2019 03:54:10 -0700 (PDT)
Date:   Fri, 24 May 2019 12:54:00 +0200
From:   Christian Brauner <christian@brauner.io>
To:     jannh@google.com, oleg@redhat.com, viro@zeniv.linux.org.uk,
        torvalds@linux-foundation.org, arnd@arndb.de
Cc:     akpm@linux-foundation.org, cyphar@cyphar.com, dhowells@redhat.com,
        ebiederm@xmission.com, elena.reshetova@intel.com,
        keescook@chromium.org, luto@amacapital.net, luto@kernel.org,
        tglx@linutronix.de, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, joel@joelfernandes.org,
        dancol@google.com, serge@hallyn.com, surenb@google.com,
        kernel-team@android.com
Subject: Re: [PATCH v3 1/2] pid: add pidfd_open()
Message-ID: <20190524105358.dfnelxhxodkvwbcn@brauner.io>
References: <20190520155630.21684-1-christian@brauner.io>
 <20190521143220.crb2zyvdov3fl4g7@brauner.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190521143220.crb2zyvdov3fl4g7@brauner.io>
User-Agent: NeoMutt/20180716
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, May 21, 2019 at 04:32:20PM +0200, Christian Brauner wrote:
> On Mon, May 20, 2019 at 05:56:29PM +0200, Christian Brauner wrote:
> > This adds the pidfd_open() syscall. It allows a caller to retrieve pollable
> > pidfds for a process which did not get created via CLONE_PIDFD, i.e. for a
> > process that is created via traditional fork()/clone() calls that is only
> > referenced by a PID:
> > 
> > int pidfd = pidfd_open(1234, 0);
> > ret = pidfd_send_signal(pidfd, SIGSTOP, NULL, 0);
> > 
> > With the introduction of pidfds through CLONE_PIDFD it is possible to
> > created pidfds at process creation time.
> > However, a lot of processes get created with traditional PID-based calls
> > such as fork() or clone() (without CLONE_PIDFD). For these processes a
> > caller can currently not create a pollable pidfd. This is a problem for
> > Android's low memory killer (LMK) and service managers such as systemd.
> > Both are examples of tools that want to make use of pidfds to get reliable
> > notification of process exit for non-parents (pidfd polling) and race-free
> > signal sending (pidfd_send_signal()). They intend to switch to this API for
> > process supervision/management as soon as possible. Having no way to get
> > pollable pidfds from PID-only processes is one of the biggest blockers for
> > them in adopting this api. With pidfd_open() making it possible to retrieve
> > pidfds for PID-based processes we enable them to adopt this api.
> > 
> > In line with Arnd's recent changes to consolidate syscall numbers across
> > architectures, I have added the pidfd_open() syscall to all architectures
> > at the same time.
> > 
> > Signed-off-by: Christian Brauner <christian@brauner.io>
> > Reviewed-by: Oleg Nesterov <oleg@redhat.com>
> 
> This now also carries a Reviewed-by from David.
> 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Cc: "Eric W. Biederman" <ebiederm@xmission.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: David Howells <dhowells@redhat.com>
> > Cc: Andy Lutomirsky <luto@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Aleksa Sarai <cyphar@cyphar.com>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Al Viro <viro@zeniv.linux.org.uk>
> > Cc: linux-api@vger.kernel.org
> 
> I've moved pidfd_open() into my for-next branch together with Joel's
> pidfd polling changes. Everything is based on v5.2-rc1.
> 
> The chosen syscall number for now is 434. David is going to send out
> another pile of mount api related syscalls. I'll coordinate with him
> accordingly prior to the 5.3 merge window.

After talking to Arnd, I split the syscall addition and the per-arch
wiring-up of pidfd_open() into two patches. There are no functional
changes and everything is still sitting in for-next.

Thanks!
Christian
