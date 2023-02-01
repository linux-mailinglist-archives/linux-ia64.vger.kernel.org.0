Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFE31686F4B
	for <lists+linux-ia64@lfdr.de>; Wed,  1 Feb 2023 20:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbjBATv7 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 1 Feb 2023 14:51:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbjBATv4 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 1 Feb 2023 14:51:56 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682FC7E6EC
        for <linux-ia64@vger.kernel.org>; Wed,  1 Feb 2023 11:51:54 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id x7so15626011edr.0
        for <linux-ia64@vger.kernel.org>; Wed, 01 Feb 2023 11:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vLOt8Htpi1Up/DCPSKgd2HVLgjbb3KJvZ9wNHdxeIi0=;
        b=F70AJ99pkUxssTeL0XhQsULJ+i1q3hIfT9mQJxKYXMRcGN/4hPjNKQXfjgd8TBqpBG
         BetUorZ/VTlYCLAfd+XP2RRKW0JVrfaxYcX4T9dpsWXY9GYLSKeTv64OlMI8Kd6WjuJ/
         BWyXoO4myVBwLlBRPvXQouhFGSPXaEWcUSKkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLOt8Htpi1Up/DCPSKgd2HVLgjbb3KJvZ9wNHdxeIi0=;
        b=UJCjK6O6rJqRhOJyC7jPeL7R5Dr4mMb7JYA5OV6qD1P9eYDs8tRdxWWeyce5ebVVU2
         llanojljv6zgU8z489/t+JuRG5OAi9R6qfv3aWVTN6uXZeoNh6VmlyOiZ2EuHMODvvvk
         7bxXq1pm/2hwZ3LsyLEVGJNlSovkoLRof7a5wMnjhCP29WxocXQDNPCRqwqeYnLraL8z
         JiZAYM1h4sbB7aWvVWz6tTBc3HYFZZD5ur2rhcCb0jiyTQZ+Gd9lDqU9DqetUA4J+x7S
         Dj3zlGIwjvWsPkIXm3Pdf7By5/X7dBUH9vU46kHpjSXRil1pnDpQHQEmSoeKo1qqlFsk
         s25Q==
X-Gm-Message-State: AO0yUKW9L4MIXToREP0/lzzjrdMVWnUQ4CZ7JQkbQAGKsTScXC5MUfHd
        tcQwkQipBe9530emAgqUD0aoioqZHo0jdW3vN2E=
X-Google-Smtp-Source: AK7set++QNXvYP6UZaNJH9pZx99mua2ATkon5s+4J+/msETYuad197yNuDDBj9DA+D3+VuOMi4DPGg==
X-Received: by 2002:a50:a6c1:0:b0:4a2:6660:96c8 with SMTP id f1-20020a50a6c1000000b004a2666096c8mr3361389edc.21.1675281112529;
        Wed, 01 Feb 2023 11:51:52 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id d3-20020a50fe83000000b004a26665b962sm2984645edt.89.2023.02.01.11.51.51
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 11:51:51 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id qw12so38758853ejc.2
        for <linux-ia64@vger.kernel.org>; Wed, 01 Feb 2023 11:51:51 -0800 (PST)
X-Received: by 2002:a17:906:f8d4:b0:878:51a6:ff35 with SMTP id
 lh20-20020a170906f8d400b0087851a6ff35mr995069ejb.43.1675281111261; Wed, 01
 Feb 2023 11:51:51 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV> <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <8f60f7d8-3e2f-2a91-c7a3-6a005d36d7d3@gmx.de>
In-Reply-To: <8f60f7d8-3e2f-2a91-c7a3-6a005d36d7d3@gmx.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 1 Feb 2023 11:51:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=whYidrLJSq80s8C0LSui_h9164cxG6WNV1M77Tk_2QFug@mail.gmail.com>
Message-ID: <CAHk-=whYidrLJSq80s8C0LSui_h9164cxG6WNV1M77Tk_2QFug@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To:     Helge Deller <deller@gmx.de>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, Peter Xu <peterx@redhat.com>,
        linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, Feb 1, 2023 at 12:21 AM Helge Deller <deller@gmx.de> wrote:
>
> AFAICS, the only applications which really care about the return
> code are
> - testsuites like LTP (i.e. the fstat05 testcase)

Those have actually shown issues with various library implementations,
exactly because real system calls act very differently in this area
from library wrappers.

Things like the vdso implementation of gettimeofday() get a SIGSEGV if
the timeval or timezone pointer is invalid, while the "real system
call" version returns -1/EFAULT instead.

And very similar things happen when glibc ends up wrapping system
calls and converting buffers manually. At some point, glibc had a
special 'struct stat' and basically converted the native system call
to it, so you did 'stat()' on something, and it ended up actually
using a private on-stack buffer for the system call, followed by a
"convert that kernel 'struct stat' to the glibc 'struct stat'" phase.
So once again, instead of -1/EFAULT, you'd first have a successful
system call, and then get a SIGSEGV  in glibc.

And as you say, test suites would notice. But no actual normal app
would ever care.

Of course, there's always the abnormal apps. There _are_ the odd cases
that actually catch faults and fix them up, and can then be confused
by changes like that.

It's very very rare, but it happens - things like emulators do tend to
do some really strange things.

         Linus
