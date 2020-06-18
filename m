Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160011FFC00
	for <lists+linux-ia64@lfdr.de>; Thu, 18 Jun 2020 21:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbgFRTsq (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 18 Jun 2020 15:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbgFRTsn (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 18 Jun 2020 15:48:43 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD84DC0613EF
        for <linux-ia64@vger.kernel.org>; Thu, 18 Jun 2020 12:48:42 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w15so4176996lfe.11
        for <linux-ia64@vger.kernel.org>; Thu, 18 Jun 2020 12:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAj23S3Mp6rRGO4SN+Gp5C3WPkcIYgiIEGIXxkjYIf0=;
        b=O8vGhvfOfOq9wLj1E8rP/VwqEBx1zwNPyHW+trZ6ABPefealuQSSUilZwTmE1SLwx3
         zEwIy5hJ4gIay72KjTq2B1QzBGNJ+P/4jwxTdP42XjdJJEBlYBl/eBUwneIpV2J18exN
         a/r+v/+JeACo1IVMd6iMfbPGsYHL+wiwfVYwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAj23S3Mp6rRGO4SN+Gp5C3WPkcIYgiIEGIXxkjYIf0=;
        b=VZMOdaBiiGkE9Y5L3yvVb5s0mTNmKHf6ChOGGvOZcwa/+p6znAxUs/U3tXDQAnP/Vi
         PDh4dHULLQOuEa7Er2CGwetUIdxUR/JdVT6C3dK7OWNZwFwlzCIFecdRCwzyQ4vIimme
         RM0V/uhFNFwaw2H4B0PyXVpajJJoWUiZ6BTzOgEVWWsnnJSaw1md+535o8bM65Il5+wt
         URxcBo+Vtc636z/8FUxHcWnOumpSvC38Kf/IGr4dYnPRUMmWNpPN9kN4LnnIgx9nESPR
         dWukSrr09nfzI4E8rP9pds4eQ9CP2lOGK8OQo0b9BgoBH3AN+wwwW+TQfmzdVeiODcF7
         JlrA==
X-Gm-Message-State: AOAM532Uapi4hN96gsSv8cZGlh19DsZRyu6J7XDJvkKRNBmDjFDCUWAs
        twbIXRtCxDBkkOVL/UGXiIBdxd5tDT4=
X-Google-Smtp-Source: ABdhPJw8c/tKyzkn4MmSGzXT3RefwbDVlO8zkniSeD0MxI7SMvr6YYNkDYSi0ezUIjX0XiI0WfYXJA==
X-Received: by 2002:a05:6512:318f:: with SMTP id i15mr3235849lfe.203.1592509720600;
        Thu, 18 Jun 2020 12:48:40 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2sm567121lfr.48.2020.06.18.12.48.38
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 12:48:39 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id i3so8762733ljg.3
        for <linux-ia64@vger.kernel.org>; Thu, 18 Jun 2020 12:48:38 -0700 (PDT)
X-Received: by 2002:a2e:8e78:: with SMTP id t24mr9039ljk.314.1592509718255;
 Thu, 18 Jun 2020 12:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200617073755.8068-1-hch@lst.de>
In-Reply-To: <20200617073755.8068-1-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 18 Jun 2020 12:48:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpnu=882iD9ck9Ywt6R1LYX_Hv-oS7dBMsWZwDRGZ5jA@mail.gmail.com>
Message-ID: <CAHk-=wjpnu=882iD9ck9Ywt6R1LYX_Hv-oS7dBMsWZwDRGZ5jA@mail.gmail.com>
Subject: Re: rename probe_kernel_* and probe_user_*
To:     Christoph Hellwig <hch@lst.de>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>, Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

[ Explicitly added architecture lists and developers to the cc to make
this more visible ]

On Wed, Jun 17, 2020 at 12:38 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Andrew and I decided to drop the patches implementing your suggested
> rename of the probe_kernel_* and probe_user_* helpers from -mm as there
> were way to many conflicts.  After -rc1 might be a good time for this as
> all the conflicts are resolved now.

So I've merged this renaming now, together with my changes to make
'get_kernel_nofault()' look and act a lot more like 'get_user()'.

It just felt wrong (and potentially dangerous) to me to have a
'get_kernel_nofault()' naming that implied semantics that we're all
familiar with from 'get_user()', but acting very differently.

But part of the fixups I made for the type checking are for
architectures where I didn't even compile-test the end result. I
looked at every case individually, and the patch looks sane, but I
could have screwed something up.

Basically, 'get_kernel_nofault()' doesn't do the same automagic type
munging from the pointer to the target that 'get_user()' does, but at
least now it checks that the types are superficially compatible.
There should be build failures if they aren't, but I hopefully fixed
everything up properly for all architectures.

This email is partly to ask people to double-check, but partly just as
a heads-up so that _if_ I screwed something up, you'll have the
background and it won't take you by surprise.

               Linus
