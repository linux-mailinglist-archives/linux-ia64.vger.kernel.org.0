Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94095F9251
	for <lists+linux-ia64@lfdr.de>; Tue, 12 Nov 2019 15:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbfKLO0t (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 12 Nov 2019 09:26:49 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42876 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbfKLO0t (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 12 Nov 2019 09:26:49 -0500
Received: by mail-oi1-f194.google.com with SMTP id i185so14917056oif.9
        for <linux-ia64@vger.kernel.org>; Tue, 12 Nov 2019 06:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vOq3Ga6TU7d+OBIVxdc75mj6tT8YQYRdorOOD6OFfXY=;
        b=BxRrXJzCCx1hIyEvZSBVA0yZXvf4Od5JT6l96C9dyN0qzywU8gAzJY+k+1FXxp5U8b
         mjqYVSvosbEgInhTINXOvCrJh8KWb8Cq/gr9rEqAPGz2C4d7Q6wn4rqp9tqzAZjAWs82
         j6Ape7bP7RYA6XvgX0LqZl9CF1t26JVGPpTz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vOq3Ga6TU7d+OBIVxdc75mj6tT8YQYRdorOOD6OFfXY=;
        b=Hd8ecxi4lQemPSrcJyWGBAx3d7+LI3DR0YuvHJrQ6TyRecQ8qZ52FZYv3ow2k1HaBB
         thbeWJ8iCLKjOSy08uNvIBsaAMQYlPLQVZ8uNOFAXBaIAzgHtg7Ya3nHleDPfuZHA07j
         XlImJWpyikofKWUpDakTmR86KrKg5DUm51+SLV2aWNRjOzXFu6DFHsuf0VyKfRccEpA/
         EpN4SM+V+uluCIsoe4GML7Zv248STb1u1Bp+40RqcCthVp4EfWMuyOvxOu/r90wN8DlE
         5+xb+D6aDt6pusZP3ktZLIEIqUtqlXsV9yAqSXk6tyfs0XInaoNI8cgEns47cxKyc/K+
         3Yeg==
X-Gm-Message-State: APjAAAUzKSULJai6zIvPj5mh/cYGxbBZOnojhYo7Ag4SVWpCXOmAnbOT
        EAHofuZxG19CYCFZPw3ZB5Nk28WxudXP92Bl/MqmFQ==
X-Google-Smtp-Source: APXvYqzxht4Kq/NUweMLOm8iFPqZy+ybMvdqrPmbR2Vb2ZUVHK8mNb/HzPnUuK+o0IXo9qRHecPgclqQzte2uFHRgyY=
X-Received: by 2002:aca:ead7:: with SMTP id i206mr4359423oih.128.1573568807592;
 Tue, 12 Nov 2019 06:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20191111192258.2234502-1-arnd@arndb.de> <20191112105507.GA7122@lst.de>
 <CAKMK7uEEz1n+zuTs29rbPHU74Dspaib=prpMge63L_-rUk_o4A@mail.gmail.com> <20191112140631.GA10922@lst.de>
In-Reply-To: <20191112140631.GA10922@lst.de>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 12 Nov 2019 15:26:35 +0100
Message-ID: <CAKMK7uFaA607rOS6x_FWjXQ2+Qdm8dQ1dQ+Oi-9if_Qh_wHWPg@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: atyfb: only use ioremap_uc() on i386 and ia64
To:     Christoph Hellwig <hch@lst.de>, Tuowen Zhao <ztuowen@gmail.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Roman Gilg <subdiff@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        X86 ML <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, linux-ia64@vger.kernel.org,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, Nov 12, 2019 at 3:06 PM Christoph Hellwig <hch@lst.de> wrote:
> On Tue, Nov 12, 2019 at 02:04:16PM +0100, Daniel Vetter wrote:
> > Wut ... Maybe I'm missing something, but from how we use mtrr in other
> > gpu drivers it's a) either you use MTRR because that's all you got or
> > b) you use pat. Mixing both sounds like a pretty bad idea, since if
> > you need MTRR for performance (because you dont have PAT) then you
> > can't fix the wc with the PAT-based ioremap_uc. And if you have PAT,
> > then you don't really need an MTRR to get wc.
> >
> > So I'd revert this patch from Luis and ...
>
> Sounds great to me..
>
> > ... apply this one. Since the same reasoning should apply to anything
> > that's running on any cpu with PAT.
>
> Can you take a look at "mfd: intel-lpss: Use devm_ioremap_uc for MMIO"
> in linux-next, which also looks rather fishy to me?  Can't we use
> the MTRR APIs to override the broken BIOS MTRR setup there as well?

Hm so that's way out of my knowledge, but I think mtrr_cleanup() was
supposed to fix up messy/broken MTRR setups by the bios. So maybe they
simply didn't enable that in their .config with CONFIG_MTRR_SANITIZER.

An explicit cleanup is currently not possible for drivers, since the
only interface exported to drivers is arch_phys_wc_add/del (which
short-circuits if pat works since you don't need mtrr in that case).
Adding everyone from that commit, plus Luis. Drivers really shouldn't
assume/work around the bios setting up superflous/wrong MTRR.

> With that we could kill ioremap_uc entirely.

So yeah removing that seems definitely like the right thing.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
