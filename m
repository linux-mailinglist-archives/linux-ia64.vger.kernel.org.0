Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212EB24B790
	for <lists+linux-ia64@lfdr.de>; Thu, 20 Aug 2020 12:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731466AbgHTK5A (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 20 Aug 2020 06:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730916AbgHTKNy (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 20 Aug 2020 06:13:54 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00D8C061757
        for <linux-ia64@vger.kernel.org>; Thu, 20 Aug 2020 03:13:53 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id jp10so1867141ejb.0
        for <linux-ia64@vger.kernel.org>; Thu, 20 Aug 2020 03:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pbe+IJf4ZBxt6yUxRRrQR1l3UQTW2eLx6AT4PE1gQKg=;
        b=foA95pAMne0k+ZduK2+JsEaA0Kd3Xk6AJeP12ZUtsQO8oCEqpY6AC2jWiQeJjjQrKA
         n//Z/S/hwU9sUSwrh2bpFx9EjO5w8H5vkm5cyHDHvlSF0L7E3fVBHC7P2Ym9zd8UwQZN
         UTTFBKoIkLT88Lc8FZLz7dV6a5Tegh0nandB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pbe+IJf4ZBxt6yUxRRrQR1l3UQTW2eLx6AT4PE1gQKg=;
        b=Koj+roMYGyHIrU6J7FBL70Cv0f+VdX8t3u+opC00VFMgmMTVXzUO1+MyQGaVlS6spK
         2Oa9TmCoe6Az2OWHnVOe5zXWfNL5jLKziDyks7eHNyEFU7Hxc9m5FxXnF3asRbaYMIId
         6rl5XelCBTjkXAxlPmE6nXQPKK3/Kgo3Pv1qBglqiabkpgrlbVyVUHhkNS4P68uUqJYx
         iiWgyEC27na2Mlfs28r9Fetyili1Oanj/aYR2q+OGxCXYHM0hZAejJhr028jYBWxUE+u
         61Rc0H4bjqKFGI0mDymzBixpIk4ct82dTxvC1MBX8E0veVbfelF5wyjB0tYtUmOtaDxH
         TXLg==
X-Gm-Message-State: AOAM530MpSvb4pK/ESinYzeOCOP0HrxvMFP6lpUviGv3gbWdpT1gZZGS
        Q5rjvMQ/fRsQ1fHE3WSdEQljuyi9U54/XO8i
X-Google-Smtp-Source: ABdhPJxhV939jog6oNdZVIKqpj8gUxZbGGaSpcSRMYYpwqnUTzPK+ECene0CzvOCt5TurcxG/s7DqA==
X-Received: by 2002:a17:906:cb8c:: with SMTP id mf12mr2460734ejb.3.1597918432106;
        Thu, 20 Aug 2020 03:13:52 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id k6sm1136969ejg.81.2020.08.20.03.13.51
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 03:13:51 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id d6so1835666ejr.5
        for <linux-ia64@vger.kernel.org>; Thu, 20 Aug 2020 03:13:51 -0700 (PDT)
X-Received: by 2002:a5d:6744:: with SMTP id l4mr2628495wrw.105.1597917944145;
 Thu, 20 Aug 2020 03:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <20200819135454.GA17098@lst.de> <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
 <20200820044347.GA4533@lst.de> <20200820052004.GA5305@lst.de>
In-Reply-To: <20200820052004.GA5305@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 20 Aug 2020 12:05:29 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com>
Message-ID: <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To:     Christoph Hellwig <hch@lst.de>
Cc:     alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
        linux-mips@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-mm@kvack.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        linux-scsi@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Pawel Osciak <pawel@osciak.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, Aug 20, 2020 at 7:20 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Aug 20, 2020 at 06:43:47AM +0200, Christoph Hellwig wrote:
> > On Wed, Aug 19, 2020 at 03:57:53PM +0200, Tomasz Figa wrote:
> > > > > Could you explain what makes you think it's unused? It's a feature of
> > > > > the UAPI generally supported by the videobuf2 framework and relied on
> > > > > by Chromium OS to get any kind of reasonable performance when
> > > > > accessing V4L2 buffers in the userspace.
> > > >
> > > > Because it doesn't do anything except on PARISC and non-coherent MIPS,
> > > > so by definition it isn't used by any of these media drivers.
> > >
> > > It's still an UAPI feature, so we can't simply remove the flag, it
> > > must stay there as a no-op, until the problem is resolved.
> >
> > Ok, I'll switch to just ignoring it for the next version.
>
> So I took a deeper look.  I don't really think it qualifies as a UAPI
> in our traditional sense.  For one it only appeared in 5.9-rc1, so we
> can trivially expedite the patch into 5.9-rc and not actually make it
> show up in any released kernel version.  And even as of the current
> Linus' tree the only user is a test driver.  So I really think the best
> way to go ahead is to just revert it ASAP as the design wasn't thought
> out at all.

The UAPI and V4L2/videobuf2 changes are in good shape and the only
wrong part is the use of DMA API, which was based on an earlier email
guidance anyway, and a change to the synchronization part . I find
conclusions like the above insulting for people who put many hours
into designing and implementing the related functionality, given the
complexity of the videobuf2 framework and how ill-defined the DMA API
was, and would feel better if such could be avoided in future
communication.

That said, we can revert it on the basis of the implementation issues,
but I feel like we wouldn't get anything by doing so, because as I
said, the design is sane and most of the implementation is fine as
well. Instead. I'd suggest simply removing the use of the attribute
being removed, so that the feature stays no-op until the DMA API
provides a way to implement it or we just migrate videobuf2 to stop
using the DMA API as much as possible, like many drivers in the DRM
subsystem did.

Best regards,
Tomasz
