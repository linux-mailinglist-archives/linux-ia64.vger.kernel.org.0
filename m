Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3D6D100BB
	for <lists+linux-ia64@lfdr.de>; Tue, 30 Apr 2019 22:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfD3UZC (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 30 Apr 2019 16:25:02 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46324 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbfD3UZC (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 30 Apr 2019 16:25:02 -0400
Received: by mail-pf1-f196.google.com with SMTP id j11so7606005pff.13
        for <linux-ia64@vger.kernel.org>; Tue, 30 Apr 2019 13:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cZbWR8UVfZ8GI/ZAitfCAp4Uvgb8pmAiiJi8Ym1dyi0=;
        b=mPxLMpoXrjW84+Q+dAXzwjWJ9L1mxjS352qOAnO+1VCFDzPfebz3qqp2pN4tHOfFLB
         9gPyAEyVAoUBTWi9vlizYePWV/gIED0jBojgBoKtfkl0THUjpDKUvk+cx9EAx2t+YQ8I
         i+CVzWSecEmDbyCzSu/GmIJE3TROPyjQc+hd/u/Wi1pSM9sf0nMrBb5itinoLOoJNW2S
         FBNpyGM1d8oMm58eSxSTVOO3Qi1vpAiPg0bXUOOSnzcRXhHymgOVxuYjdED9DhMpa6do
         PLdlvIUGLSOnOolrYC/RrfrHLkLkaPftYndaxR5NWQyMvdnJzaK0+J1TqWglKBwnXuIb
         NpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cZbWR8UVfZ8GI/ZAitfCAp4Uvgb8pmAiiJi8Ym1dyi0=;
        b=f46BEsfB6LQ7uA0IXbqwvV/4B9yNsIPWtgkJYd+ubJD9x866nChKm50lJN3ZeEGyF2
         3zVUPddKOF+nbyd/tVRxtKMh1AjALjYo6Ym4dJ2SnfXGaR6Z+hryU2+Ut8ACDs85ltYy
         D5AiDTdHXIMfDSQHNDwJR6Pxl1fnpfrRkvbShBAkL6OIwm7pAHzotVc65DTm2RztOmuq
         Gf7BfJfBcAIvLwXaw+V5+N28u6RoXS+5PIFUVl8rD16fGIkwKxy0XOewbGyEcvqXG98t
         p+8CJfx/6m14itKjCqy1iWAfmDB6/85hjxyUaPAkfmZsws5hm6lXdTswMzg0nB9WekVN
         7vdw==
X-Gm-Message-State: APjAAAU9T8dCpV83G/4cDsBNVo9uCOvDrs4QkBxCz8d0qyInRyZ/r/mM
        giKFADCKtDXh7b+tuUfUENajHYjDFdytIF95TEn8aFqF5yg=
X-Google-Smtp-Source: APXvYqwcrOTSBIpt8uvCRs55U+qx6snTYGoytm6Fw7QoPc1UUSu1WG0QFpUFlFgyfNfj7Pzb+675wZlbrF28unvbtZ0=
X-Received: by 2002:a63:4558:: with SMTP id u24mr65997972pgk.225.1556655900784;
 Tue, 30 Apr 2019 13:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190423204821.241925-1-ndesaulniers@google.com>
In-Reply-To: <20190423204821.241925-1-ndesaulniers@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 30 Apr 2019 13:24:49 -0700
Message-ID: <CAKwvOd=ws1D95ydQjGtK0U0KQ-5poyj8Oek5Yka6-cvtCdpJ-g@mail.gmail.com>
Subject: Re: [PATCH] ia64: require -Wl,--hash-style=sysv
To:     tony.luck@intel.com, fenghua.yu@intel.com
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-ia64@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, Apr 23, 2019 at 1:48 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Towards the goal of removing cc-ldoption, it seems that --hash-style=
> was added to binutils 2.17.50.0.2 in 2006. The minimal required version
> of binutils for the kernel according to
> Documentation/process/changes.rst is 2.20.
>
> Link: https://gcc.gnu.org/ml/gcc/2007-01/msg01141.html
> Cc: clang-built-linux@googlegroups.com
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/ia64/kernel/Makefile.gate | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/ia64/kernel/Makefile.gate b/arch/ia64/kernel/Makefile.gate
> index f53faf48b7ce..846867bff6d6 100644
> --- a/arch/ia64/kernel/Makefile.gate
> +++ b/arch/ia64/kernel/Makefile.gate
> @@ -11,7 +11,7 @@ quiet_cmd_gate = GATE    $@
>        cmd_gate = $(CC) -nostdlib $(GATECFLAGS_$(@F)) -Wl,-T,$(filter-out FORCE,$^) -o $@
>
>  GATECFLAGS_gate.so = -shared -s -Wl,-soname=linux-gate.so.1 \
> -                    $(call cc-ldoption, -Wl$(comma)--hash-style=sysv)
> +                    -Wl,--hash-style=sysv
>  $(obj)/gate.so: $(obj)/gate.lds $(obj)/gate.o FORCE
>         $(call if_changed,gate)
>
> --
> 2.21.0.593.g511ec345e18-goog
>

bumping for review

-- 
Thanks,
~Nick Desaulniers
