Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7F2E24FF3
	for <lists+linux-ia64@lfdr.de>; Tue, 21 May 2019 15:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfEUNS4 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 21 May 2019 09:18:56 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53348 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfEUNS4 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 21 May 2019 09:18:56 -0400
Received: by mail-wm1-f65.google.com with SMTP id 198so2968038wme.3
        for <linux-ia64@vger.kernel.org>; Tue, 21 May 2019 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m/t4nh9Qn5eHvWriEo2lAzUTm+cejgZEB4hMcOrCq4Y=;
        b=Qzja+tqWdJKwhlDJv7ZeHS1krNqDAM++eYcwAp+RKkbv8p1KDPWxxZhzOpavU0EOHV
         kYWbjNPEjkxc3aEKZdrk9785qJNa6FxJtfkDGm1FLt3j0bk9/8YvawePnukWGCyjpFii
         0DMW2p0x+5xPdVsJRuiSOe+/dtlaOGa52u2fWdq9QaNK4Tve8leR5ZqhEKAiqjWW0X06
         oTZk1e1uxbJPDBZIKsNtQKeWDeRpwtxnoV5XKv/I6zW+K9rGYAZZ7B8YjZBRwD4kYhWa
         WgDiIxwS5iY9PCvzQxN+w34XvRhk0st2I0ChEGvAZh7Cr4yOtxIXjdk5keUvD29dcq/r
         WLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m/t4nh9Qn5eHvWriEo2lAzUTm+cejgZEB4hMcOrCq4Y=;
        b=b/pdWtpT2lHinKY0AUROL8Jqyot9Q5CtFn/2QLG0qKQI29dKwOwhrPQ5aeeRuoFDKF
         0sIP6HtZ7otIPZPq0xa7TX94jrRZJO82qIFcytLmp3y64ouv7/OD1sFIgtG6mzx7J1Ab
         wYKKPPEOiIy1IDN5IKuIVkMCgfFwKAn7oiv/uPFXxHUs1yI9QvtO+00UucSB6VmwH8hK
         tnME/V+aYbkHavii6qZFlHN8ZSdhIM5GRzKsVr4Gz4A70KWzuNcCZ7lpaYYPV5EnqXFH
         0a/6lmzRfXshceNrndiBDedw6nXkRC+DxaLwjp8oQFZV0hsS8ohiiFUOHb/v3QRXypeu
         gZIQ==
X-Gm-Message-State: APjAAAVRVQpEDfEwf071pLaKQGnTa+oHrYOTSwRpSd4xLhABNvlgbaFn
        paW9AQLVsD36giWdSKW9kcdZTQ==
X-Google-Smtp-Source: APXvYqyfKPZSJeUKKvR/WsITTIjBfoMQuzQ5Xtre6YfbYN0C4pHfHkECFwZ8Y50hJAsIDs/Jg3fbyg==
X-Received: by 2002:a1c:9c8c:: with SMTP id f134mr3258598wme.95.1558444734225;
        Tue, 21 May 2019 06:18:54 -0700 (PDT)
Received: from brauner.io (p548C9938.dip0.t-ipconnect.de. [84.140.153.56])
        by smtp.gmail.com with ESMTPSA id n4sm2071899wmk.24.2019.05.21.06.18.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 21 May 2019 06:18:53 -0700 (PDT)
Date:   Tue, 21 May 2019 15:18:50 +0200
From:   Christian Brauner <christian@brauner.io>
To:     Florian Weimer <fweimer@redhat.com>
Cc:     viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        jannh@google.com, oleg@redhat.com, tglx@linutronix.de,
        torvalds@linux-foundation.org, arnd@arndb.de, shuah@kernel.org,
        dhowells@redhat.com, tkjos@android.com, ldv@altlinux.org,
        miklos@szeredi.hu, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH 1/2] open: add close_range()
Message-ID: <20190521131849.2mguu5sszhbxhvgu@brauner.io>
References: <20190521113448.20654-1-christian@brauner.io>
 <87tvdoau12.fsf@oldenburg2.str.redhat.com>
 <20190521130438.q3u4wvve7p6md6cm@brauner.io>
 <87h89o9cng.fsf@oldenburg2.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h89o9cng.fsf@oldenburg2.str.redhat.com>
User-Agent: NeoMutt/20180716
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, May 21, 2019 at 03:10:11PM +0200, Florian Weimer wrote:
> * Christian Brauner:
> 
> >> Solaris has an fdwalk function:
> >> 
> >>   <https://docs.oracle.com/cd/E88353_01/html/E37843/closefrom-3c.html>
> >> 
> >> So a different way to implement this would expose a nextfd system call
> >
> > Meh. If nextfd() then I would like it to be able to:
> > - get the nextfd(fd) >= fd
> > - get highest open fd e.g. nextfd(-1)
> 
> The highest open descriptor isn't istering for fdwalk because nextfd
> would just fail.
> 
> > But then I wonder if nextfd() needs to be a syscall and isn't just
> > either:
> > fcntl(fd, F_GET_NEXT)?
> > or
> > prctl(PR_GET_NEXT)?
> 
> I think the fcntl route is a bit iffy because you might need it to get
> the *first* valid descriptor.

Oh, how would that be difficult? Maybe I'm missing context.
Couldn't you just do

fcntl(0, F_GET_NEXT)

> 
> >> to userspace, so that we can use that to implement both fdwalk and
> >> closefrom.  But maybe fdwalk is just too obscure, given the existence of
> >> /proc.
> >
> > Yeah we probably don't need fdwalk.
> 
> Agreed.  Just wanted to bring it up for completeness.  I certainly don't
> want to derail the implementation of close_range.

No, that's perfectly fine. I mean, you clearly need this and are one of
the major stakeholders. For example, Rust (probably also Python) will
call down into libc and not use the syscall directly. They kinda do this
with getfdtable<sm> rn already.
So what you say makes sense for libc has some relevance for the other
tools as well.

Christian
