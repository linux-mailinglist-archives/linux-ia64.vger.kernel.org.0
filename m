Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41F0562C76C
	for <lists+linux-ia64@lfdr.de>; Wed, 16 Nov 2022 19:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238685AbiKPSQ6 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 16 Nov 2022 13:16:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239090AbiKPSQz (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 16 Nov 2022 13:16:55 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC166627E8
        for <linux-ia64@vger.kernel.org>; Wed, 16 Nov 2022 10:16:54 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id i12so12456827qvs.2
        for <linux-ia64@vger.kernel.org>; Wed, 16 Nov 2022 10:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PBgZn+u117R7gFQNpsnvlIYlwSeo0LUTLoxlFKr3wyI=;
        b=eH0YS14VezMu1YoYc8i9L/9V4Rda12NtBPhbyEQG9con1K8dLIyV9b4KNCmIq0wzpX
         WqxRC9GRz2SSVMeoKLZbZ25GRVxvk4TLZwapfzc9KJm3PzFnUZgrmijMI3uqPEOn38/b
         +5K39+JbiCr6klzOuT84Gyzf87KIYKFM/ltfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBgZn+u117R7gFQNpsnvlIYlwSeo0LUTLoxlFKr3wyI=;
        b=hODcJfq3MW+lTlRcbDKnCjpa0yTGPzAGasK/C+SZ9GeNXVx3vz3X8KHH4lY37ILZv0
         UD06LikBOU6iKhTGbksiOog/Ir1JE4oBisIGOiGrtZFhBkhItVcZdbQt8QMuYjiAiLT6
         qtYCtitPtn7i1xc65ADarSmZYE69XJeffY06EZqoDkSa2PzocpQK8jQE+hWWRTMzF11d
         Y+73301nIDPaWuNPmboRxKVM50WQ5wnE+OsBoHfvORpmtVqZ5uZDeFUCyOcYRhFyll4a
         zldB8wQc+SZ7oD0tkH/Ph91AroNU9N0WpT2Qw4uTs3MPh1JOHlEoQ4ryuadGkTJdj78i
         4krg==
X-Gm-Message-State: ANoB5pllc1pKFJ7XKVTR+xU7Hcz7dX7Y2xmV+ZbdddMeNewXGm92ZhP0
        YPnbUyD+n6Ah90sAusWshnTwliVUzXTgNQ==
X-Google-Smtp-Source: AA0mqf7a+Es3SPWVbGFdK6vQ3rUJxixUoqTMlwgZvndlzCAZaGIMClpX8xTdTtjDciM8CJQ3s0KOzg==
X-Received: by 2002:a0c:fa4b:0:b0:4aa:a2b3:6c84 with SMTP id k11-20020a0cfa4b000000b004aaa2b36c84mr21752289qvo.50.1668622613524;
        Wed, 16 Nov 2022 10:16:53 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id o26-20020ac8699a000000b003a50b9f099esm9029955qtq.12.2022.11.16.10.16.51
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 10:16:51 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id a27so11211025qtw.10
        for <linux-ia64@vger.kernel.org>; Wed, 16 Nov 2022 10:16:51 -0800 (PST)
X-Received: by 2002:a05:622a:1c15:b0:3a5:49fa:3983 with SMTP id
 bq21-20020a05622a1c1500b003a549fa3983mr21860304qtb.436.1668622610752; Wed, 16
 Nov 2022 10:16:50 -0800 (PST)
MIME-Version: 1.0
References: <20221116102659.70287-1-david@redhat.com> <20221116102659.70287-21-david@redhat.com>
In-Reply-To: <20221116102659.70287-21-david@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 16 Nov 2022 10:16:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
Message-ID: <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Shuah Khan <shuah@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@infradead.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Biederman <ebiederm@xmission.com>,
        Kees Cook <keescook@chromium.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Kentaro Takeda <takedakn@nttdata.co.jp>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
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

On Wed, Nov 16, 2022 at 2:30 AM David Hildenbrand <david@redhat.com> wrote:
>
> Let's make it clearer that functionality provided by FOLL_FORCE is
> really only for ptrace access.

I'm not super-happy about this one.

I do understand the "let's rename the bit so that no new user shows up".

And it's true that the main traditional use is ptrace.

But from the patch itself it becomes obvious that no, it's not *just*
ptrace. At least not yet.

It's used for get_arg_page(), which uses it to basically look up (and
install) pages in the newly created VM.

Now, I'm not entirely sure why it even uses FOLL_FORCE, - I think it
might be historical, because the target should always be the new stack
vma.

Following the history of it is a big of a mess, because there's a
number of renamings and re-organizations, but it seems to go back to
2007 and commit b6a2fea39318 ("mm: variable length argument support").

Before that commit, we kept our own array of "this is the set of pages
that I will install in the new VM". That commit basically just inserts
the pages directly into the VM instead, getting rid of the array size
limitation.

So at a minimum, I think that FOLL_FORCE would need to be removed
before any renaming to FOLL_PTRACE, because that's not some kind of
small random case.

It *might* be as simple as just removing it, but maybe there's some
reason for having it that I don't immediately see.

There _are_ also small random cases too, like get_cmdline(). Maybe
that counts as ptrace, but the execve() case most definitely does not.

                Linus
