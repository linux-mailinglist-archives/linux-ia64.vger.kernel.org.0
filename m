Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDC1683887
	for <lists+linux-ia64@lfdr.de>; Tue, 31 Jan 2023 22:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbjAaVUU (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 31 Jan 2023 16:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbjAaVUT (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 31 Jan 2023 16:20:19 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06B21969D
        for <linux-ia64@vger.kernel.org>; Tue, 31 Jan 2023 13:20:18 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id m8so6535072edd.10
        for <linux-ia64@vger.kernel.org>; Tue, 31 Jan 2023 13:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lhMaGcwmHnowthLDK6+cq9UUV5li22+d5YjfiOKs0xk=;
        b=Dpi5P8qHqM77HLr6Rm7qlkY2hnNNuC+GOleUP2NCen/4mi28taFHpUtYN0cOaJeZqx
         TB+exnjSVIKaLaZsJwKH3MCWKlHsO2N7zm25f17K7ur8C/IEegLECG6U0Z6AXLDaZrfK
         1kGvyREHSxwc1BrFIiYNgaqGXrqrtBtRmci5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhMaGcwmHnowthLDK6+cq9UUV5li22+d5YjfiOKs0xk=;
        b=cwds0ZUQrA0LO1iI06qjsuV/9zYX2A7+27ZejNKiHQ+8GqnG+2/aeQ7OvNx+Vr1gZX
         uG0i673CvUYA0nG5vPtsLnDG0MncrOxidVzUXChyxQHxaqBn/E8JSFwylwslqCoGl0gS
         5izMYwkBEl9eea4RuDG7H9F/KCZa7lf3xn4OGoNI/cmVEKb77qN5hs1vrOZlWJ7uys64
         5EotPRKee7LY6vGeeC2kFMs+NXxt02fTJ0+/VuKumiDUbwZAZZ7URSWj3/CfOBv52h21
         2zlpXVI8gWn54PMgA+wZVsCHcdvI7NSXkX8l+Sk5b9JkDkAYqNggklCcxjEPRdriU0qp
         PRuw==
X-Gm-Message-State: AO0yUKVY1ngUDb0FHT2YSW3fg3NfYNs4tuX29qGVEBMyckGeJkWujYhc
        D+LRKidDUMrhI6aEO00smpTA4CgNdzXmEtaFj4Y=
X-Google-Smtp-Source: AK7set8hlyl5I+QwKlQMV40q+Nne4gu46iXby5iueOXq9zY0xegUsDgWnUT/BVH8vZOXK7zU8+eAsA==
X-Received: by 2002:a05:6402:3485:b0:49d:efdc:4f77 with SMTP id v5-20020a056402348500b0049defdc4f77mr6401663edc.38.1675200016929;
        Tue, 31 Jan 2023 13:20:16 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id i1-20020a056402054100b0049ef05260besm8861680edx.59.2023.01.31.13.20.16
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 13:20:16 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id qw12so29662576ejc.2
        for <linux-ia64@vger.kernel.org>; Tue, 31 Jan 2023 13:20:16 -0800 (PST)
X-Received: by 2002:a17:906:1e94:b0:889:2908:a9c8 with SMTP id
 e20-20020a1709061e9400b008892908a9c8mr2233010ejj.82.1675200015978; Tue, 31
 Jan 2023 13:20:15 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
In-Reply-To: <Y9mD1qp/6zm+jOME@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 31 Jan 2023 13:19:59 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
Message-ID: <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
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

On Tue, Jan 31, 2023 at 1:10 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Umm...  What about the semantics of get_user() of unmapped address?
> Some architectures do quiet EFAULT; some (including alpha) hit
> the sucker with SIGBUS, no matter what.

I think we should strive to just make this all common.

The reason alpha is different is almost certainly not intentional, but
a combination of "pure accident" and "nobody actually cares".

> Are we free to modify that behaviour, or is that part of arch-specific
> ABI?

I'd just unify this all, probably with a preference for existing
semantics on x86 (because of "biggest and most varied user base").

That whole "send SIGBUS even for kernel faults" is certainly bogus and
against the usual rules. And I may well be to blame for it (I have
this memory of disliking how EFAULT as a return code didn't actually
return the faulting address). And realistically, it's also just not
something that any normal application will ever hit.  Giving invalid
addresses to system calls is basically always a bug, although there
are always special software that do all the crazy corner cases (ie
things like emulators tend to do odd things).

I doubt such special software exists on Linux/alpha, though.

So I wouldn't worry about those kinds of oddities overmuch.

*If* somebody then finds a load that cares, we can always fix it
later, and I'll go "mea culpa, I didn't think it would matter, and I
was wrong".

         Linus
