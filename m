Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE8E2A961B
	for <lists+linux-ia64@lfdr.de>; Thu,  5 Sep 2019 00:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbfIDWRN (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 4 Sep 2019 18:17:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36880 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730914AbfIDWRM (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 4 Sep 2019 18:17:12 -0400
Received: by mail-lj1-f194.google.com with SMTP id t14so309822lji.4
        for <linux-ia64@vger.kernel.org>; Wed, 04 Sep 2019 15:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+6eZ5jXr9FHa9aXBFBl0ghBEbFlLODFrE967a3DFmE=;
        b=hfyCSdKgCY/Fe6ZhOgmUuzH+l1Av9MeoieBRJhOHgspd/HlfkJB3tRok9F33ql8Uzt
         YCi53+gSbOv7WH3zYmMiTF0zGBnANwxV7c7oClcZwaNIXXqds0cxD5Xcu535ms7QpKLP
         zDVTwLMuj95aI+DpS0Y7tzdH7BHLTHU6tmSJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+6eZ5jXr9FHa9aXBFBl0ghBEbFlLODFrE967a3DFmE=;
        b=k+j/znMZc2S+mZsMQeNvDYZvG0LyEHQqiTqaPHDYqj+0WjTPHseCVtV6POpTmkGKDO
         866h9Z5LiPBE1SEvQX+Ryoczuq1TEDWjzyF7s4y4zJygOqTWL5HTMszZPDByMG64ZMgW
         CwDTYnifxdbIhOav/ZcAaH1trs0ZRtQ+v3cMGQmX1jep87orZlxOHuDayzyVJJ1D+WO4
         HYUP1ecPfZ1foXQ1ggvKViCudLrYSq9kDY4jxzXafntJqUTnEn291o9dWZfRdTdpwe8O
         nOAWyWAV56BE3MAL7xDVL48xca+IZWmjh2EoN5HCBL1BvebTVp1AiAiEKKc2DvdZRjon
         LB5Q==
X-Gm-Message-State: APjAAAUQvBufqLUjls/nY6C/cyOvbqwdqAD/1Dm9O5j3kM4jybAA6fQG
        60KajIUeOBkUf1Xe/hGu9YQxOyFzWpg=
X-Google-Smtp-Source: APXvYqwr79T9Inxvs4hQxx0SmBRlkRA7QKi9LP1Cma3ddmV8Ndp803sWdea7QTTCCqDiIJWho15GWw==
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr6476016ljl.79.1567635429413;
        Wed, 04 Sep 2019 15:17:09 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id t5sm31982lfl.91.2019.09.04.15.17.06
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 15:17:08 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id d5so274112lja.10
        for <linux-ia64@vger.kernel.org>; Wed, 04 Sep 2019 15:17:06 -0700 (PDT)
X-Received: by 2002:a2e:9a84:: with SMTP id p4mr24283824lji.52.1567635425244;
 Wed, 04 Sep 2019 15:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190904201933.10736-1-cyphar@cyphar.com> <20190904201933.10736-11-cyphar@cyphar.com>
 <CAHk-=wiod1rQMU+6Zew=cLE8uX4tUdf42bM5eKngMnNVS2My7g@mail.gmail.com> <20190904214856.vnvom7h5xontvngq@yavin.dot.cyphar.com>
In-Reply-To: <20190904214856.vnvom7h5xontvngq@yavin.dot.cyphar.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 4 Sep 2019 15:16:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgcJq21Hydh7Tx5-o8empoPp7ULDBw0Am-du_Pa+fcftQ@mail.gmail.com>
Message-ID: <CAHk-=wgcJq21Hydh7Tx5-o8empoPp7ULDBw0Am-du_Pa+fcftQ@mail.gmail.com>
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

On Wed, Sep 4, 2019 at 2:49 PM Aleksa Sarai <cyphar@cyphar.com> wrote:
>
> Hinting to userspace to do a retry (with -EAGAIN as you mention in your
> other mail) wouldn't be a bad thing at all, though you'd almost
> certainly get quite a few spurious -EAGAINs -- &{mount,rename}_lock are
> global for the entire machine, after all.

I'd hope that we have some future (possibly very long-term)
alternative that is not quite system-global, but yes, right now they
are.

Which is one reason I'd rather see EAGAIN in user space - yes, it
probably makes it even easier to trigger, but it also means that user
space might be able to do something about it when it does trigger.

For example, maybe user space can first just use an untrusted path
as-is, and if it gets EAGAIN or EXDEV, it may be that user space can
simplify the path (ie turn "xyz/.../abc" into just "abc".

And even if user space doesn't do anything like that, I suspect a
performance problem is going to be a whole lot easier to debug and
report when somebody ends up seeing excessive retries happening. As a
developer you'll see it in profiles or in system call traces, rather
than it resulting in very odd possible slowdowns for the kernel.

And yeah, it would probably be best to then at least delay doing
option 3 indefinitely, just to make sure user space knows about and
actually has a test-case for that EAGAIN happening.

              Linus
