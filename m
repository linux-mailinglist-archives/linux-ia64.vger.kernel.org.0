Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02F5CA953E
	for <lists+linux-ia64@lfdr.de>; Wed,  4 Sep 2019 23:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbfIDVhL (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 4 Sep 2019 17:37:11 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43797 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfIDVhL (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 4 Sep 2019 17:37:11 -0400
Received: by mail-lf1-f68.google.com with SMTP id q27so188158lfo.10
        for <linux-ia64@vger.kernel.org>; Wed, 04 Sep 2019 14:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=afyKDAGEEGBbAV94gj2UOZt2XiwokGAAZY9fEg48q/g=;
        b=NaaXzsE03/A0aggT0JGsMPgqMPOgw689sbkH2wUyL6Wp3qKaZ1pKjDt9q3nSCqMPah
         2e4dX/SHASPLfri+fuLDS7WlObVzMB0uCQ613gb+lr0h/VEtc5FGRP26lR62YK8De+Ct
         /QjcaW9K7a4FCLT2Siyb/L/tVCZoNkYi2RP38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=afyKDAGEEGBbAV94gj2UOZt2XiwokGAAZY9fEg48q/g=;
        b=frxALefhrnGCM9HcRCh+UFdMbUjFHSDsbbmaIjp+ATE+5A6FqzaaeluUmoFtnsF/Vp
         NZYybLfWTddymEuQMsh91nfldcW3OUY+BtnzGRqPU18rYkt481xvtconNsLQeuIFXiQm
         pL7w9mHiOg/JMHsUF0jy2YmFa1Pz4YUniJtAFh3tt/HZ1B8M3U4TH0foGcRIxPZfBc2w
         FUl4l9FiwXdjlIJyMHYPIeneNZWM6XCIyTU7J3Y9UHfk3C15Jqe9JmybW6TzBGcJMCaQ
         1TGnnJ6Shx4DVJzKwwRJtqckw9yGc8InnxO8lbXKWj19rVcUNbk1m7mtikWhswRLIEUz
         0GGg==
X-Gm-Message-State: APjAAAWNts77Z3S8KJr19fAflmdOGLrGZiyf4Bkq33Mna2JVKx4hrITy
        0tOayOgIvXtAoVvZ7rh4Rs1Yvj4ym+E=
X-Google-Smtp-Source: APXvYqxPsO1vl24MmcxHeX3Q67KEDTZF+2yPF+waAJ7h3oE2OF+tOdMVQ4XrZpLe2r7FFbrSh+Vbig==
X-Received: by 2002:ac2:52b6:: with SMTP id r22mr156433lfm.19.1567633028881;
        Wed, 04 Sep 2019 14:37:08 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id b30sm11867lfq.59.2019.09.04.14.37.05
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 14:37:07 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id z21so226552lfe.1
        for <linux-ia64@vger.kernel.org>; Wed, 04 Sep 2019 14:37:05 -0700 (PDT)
X-Received: by 2002:a05:6512:512:: with SMTP id o18mr154625lfb.170.1567633024273;
 Wed, 04 Sep 2019 14:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190904201933.10736-1-cyphar@cyphar.com> <20190904201933.10736-11-cyphar@cyphar.com>
 <CAHk-=wiod1rQMU+6Zew=cLE8uX4tUdf42bM5eKngMnNVS2My7g@mail.gmail.com> <CAHk-=wiHRW3Z9xPRiExi9jLjB0cdGhM=3vaW+b80mjuRcbORyw@mail.gmail.com>
In-Reply-To: <CAHk-=wiHRW3Z9xPRiExi9jLjB0cdGhM=3vaW+b80mjuRcbORyw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 4 Sep 2019 14:36:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiExfaVhUTvKj7hR6DG4C2+oy6usz0Sa6QbPr5EgDH28w@mail.gmail.com>
Message-ID: <CAHk-=wiExfaVhUTvKj7hR6DG4C2+oy6usz0Sa6QbPr5EgDH28w@mail.gmail.com>
Subject: Re: [PATCH v12 10/12] namei: aggressively check for nd->root escape
 on ".." resolution
To:     Aleksa Sarai <cyphar@cyphar.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Jeff Layton <jlayton@kernel.org>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian@brauner.io>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Tycho Andersen <tycho@tycho.ws>,
        David Drysdale <drysdale@google.com>,
        Chanho Min <chanho.min@lge.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Aleksa Sarai <asarai@suse.de>,
        Linux Containers <containers@lists.linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, Sep 4, 2019 at 2:35 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Sep 4, 2019 at 2:09 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > So you'd have three stages:
> >
> >  1) ".." always returns -EXDEV
> >
> >  2) ".." returns -EXDEV if there was a concurrent rename/mount
> >
> >  3) ".." returns -EXDEV if there was a concurrent rename/mount and we
> > reset the sequence numbers and check if you escaped.
>
> In fact, I wonder if this should return -EAGAIN instead - to say that
> "retrying may work".

And here "this" was meant to be "case 2" - I was moving the quoted
text around and didn't fix my wording, so now it is ambiguous or
implies #3, which would be crazy.

Sorry for the confusion,

            Linus
