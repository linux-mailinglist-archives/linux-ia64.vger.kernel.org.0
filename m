Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6869552DEC6
	for <lists+linux-ia64@lfdr.de>; Thu, 19 May 2022 22:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239017AbiESUww (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 19 May 2022 16:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234953AbiESUwv (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 19 May 2022 16:52:51 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD102BE3
        for <linux-ia64@vger.kernel.org>; Thu, 19 May 2022 13:52:48 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y32so11122481lfa.6
        for <linux-ia64@vger.kernel.org>; Thu, 19 May 2022 13:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w7n9soc+YeiEuDs+/wVe5880ZbNB6SfvRzmD9yZCDg0=;
        b=DBEkcJxwMHgrSW6HcJcRibGMLRAHktxTfe210zz70+cSSKn6ZpUgiva+kk1wpf11Zn
         AEG+Mgw1hd0KW2hE0Q1vG6WOtJs0wkwyzpBg39QhS4doVKGMJsExBp8t3Mh2Q11oNnXz
         Uj83mLI19GvO9WWx9wIiJ6kgKwKQLuX9IR+/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w7n9soc+YeiEuDs+/wVe5880ZbNB6SfvRzmD9yZCDg0=;
        b=paCPLGGDoHGmQxBMV6z31si8Ub4j8l3OXDS2mN4LujESkEgeRRBlvoHk40rTJ13xf9
         rIPic5VDq6UHHvzjXaadNA0mY4qWRCTF5Nn4dv+WwGrUaTGCzqCWW2IcyLlsk5My92SF
         2QtYt4owzZqCnXXrAsGSBlqpM3iVDVJs1EoyjQhCT67zx88nXKxwTB0+UYahYwYb6lAU
         PRuvAggCcEJFWe8wEvOx+faIlFPmOsLmdyZQuEVEVZQQA7Vag+ir5U++0QdH49h8D3Nh
         IG+D9EsHDKdwEjPwhP0MD4Cyl3yw5wvs4JCVVe5OTrcP3dNLfQSK3iyxta+yENEQCMCm
         Rv1Q==
X-Gm-Message-State: AOAM532VEPj5xzUXeMTpMLjcjv3gNtQabo1FDcQvnVGaqvoJYI/tN6aS
        2PcuMctgdCYmmmqEbjIPBnXE0+I/FllGGYXV
X-Google-Smtp-Source: ABdhPJzQ5ADTnp59uqU4+nI55hPw3SjbZ0Xsz5Fu+7YFpt8NuOdoMnLLdx5oGY9sB+gJDhv8Nphb+w==
X-Received: by 2002:a05:6512:1393:b0:474:12f6:decc with SMTP id p19-20020a056512139300b0047412f6deccmr4569277lfa.62.1652993567064;
        Thu, 19 May 2022 13:52:47 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id k17-20020a2e8891000000b00253d84812edsm41199lji.2.2022.05.19.13.52.45
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 13:52:45 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id g16so7610781lja.3
        for <linux-ia64@vger.kernel.org>; Thu, 19 May 2022 13:52:45 -0700 (PDT)
X-Received: by 2002:a05:6000:2c1:b0:20c:5e37:3ed1 with SMTP id
 o1-20020a05600002c100b0020c5e373ed1mr5575002wry.342.1652993554192; Thu, 19
 May 2022 13:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <871qwq5ucx.fsf_-_@email.froward.int.ebiederm.org> <20220518225355.784371-3-ebiederm@xmission.com>
In-Reply-To: <20220518225355.784371-3-ebiederm@xmission.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 19 May 2022 13:52:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UFK7h0oHGJ23y37ShO+z4vt9ubGE9E4m=jMECgNAAHgA@mail.gmail.com>
Message-ID: <CAD=FV=UFK7h0oHGJ23y37ShO+z4vt9ubGE9E4m=jMECgNAAHgA@mail.gmail.com>
Subject: Re: [PATCH 03/16] kdb: Use real_parent when displaying a list of processes
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Oleg Nesterov <oleg@redhat.com>,
        Ingo Molnar <mingo@kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mel Gorman <mgorman@suse.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Will Deacon <will@kernel.org>, Tejun Heo <tj@kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, linux-ia64@vger.kernel.org,
        Robert OCallahan <roc@pernos.co>, Kyle Huey <khuey@pernos.co>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Miller <dougmill@linux.vnet.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi,

On Wed, May 18, 2022 at 3:54 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> kdb has a bug that when using the ps command to display a list of
> processes, if a process is being debugged the debugger as the parent
> process.
>
> This is silly, and I expect it never comes up in ptractice.  As there
> is very little point in using gdb and kdb simultaneously.  Update the
> code to use real_parent so that it is clear kdb does not want to
> display a debugger as the parent of a process.

So I would tend to defer to Daniel, but I'm not convinced that the
behavior you describe for kdb today _is_ actually silly.

If I was in kdb and I was listing processes, I might actually want to
see that a process's parent was set to gdb. Presumably that would tell
me extra information that might be relevant to my debug session.

Personally, I'd rather add an extra piece of information into the list
showing the real parent if it's not the same as the parent. Then
you're not throwing away information.

-Doug
