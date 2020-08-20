Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8356424C49C
	for <lists+linux-ia64@lfdr.de>; Thu, 20 Aug 2020 19:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730632AbgHTRe1 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 20 Aug 2020 13:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730637AbgHTReJ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 20 Aug 2020 13:34:09 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95A5C061388
        for <linux-ia64@vger.kernel.org>; Thu, 20 Aug 2020 10:34:06 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id c10so2273718edk.6
        for <linux-ia64@vger.kernel.org>; Thu, 20 Aug 2020 10:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=++DU+mGMau0wCVk26WL7BRudLdRoW/TdcNVBaFfSVeo=;
        b=WJVp6ukadTpNcM9SYJpDROIRN+tD3gRH5NoPQs0+HAsQmLtJTImp5dRFMc7wGC3HgN
         R/lFt0vUnPt7BGWZ9GyHNRaZ0vNwnvZs2Kqg3u8nexS2ZBfKmw9OlPBaaVZioiS7BHsl
         YQ4r7w5vrJPUKxgqdugvjbGIbRfRLzSot++CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=++DU+mGMau0wCVk26WL7BRudLdRoW/TdcNVBaFfSVeo=;
        b=XK9R6x2OsS5R5lK+oSATsbteO6ThVgFU9UNV3jc9qWJCP+do3kCzpFsC1ffHA64LA/
         vJPS00Mo+F58pXucWkOxCATSVF5kl63IWPOUIwUY7ThbXKHwD8WL2H7JbGMRfX1lk8aj
         Xwq/ZYlZe4u9ms7g8wgni+bxKR85BM5EQZNRkh11rR3mlJkRs+Kedy2jy/4FbBg2ptE7
         GzJ18bdruDVzrBTICFP5s5n8H8c068mJ7aVfC4IsGcY/lQCGW3ZcWUgUcnG2gBMbS3xh
         9P3VM8VbKtz7SjqAiJUBDMWTL0lp05AP4BWmhgFybJ7XT6pqZRHl2R1SRdgszOLx2Yfr
         nDwQ==
X-Gm-Message-State: AOAM533rntep4/ysiZORUGjxDKWz/OvZoVx3BLrGeSKPkjqFssTgezCl
        UEKlOlD4yfFdgQdkQIb3fuD3NqJ5CTwebg==
X-Google-Smtp-Source: ABdhPJyJ/7JUD5ukBFGVfwOh+Dqh/zFio5QRAbd+qptmBDM0vBzMzH/XdfoNxJoS8dpqCsDd9oPElg==
X-Received: by 2002:a50:e087:: with SMTP id f7mr4129457edl.174.1597944845041;
        Thu, 20 Aug 2020 10:34:05 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id sd8sm1776759ejb.58.2020.08.20.10.34.02
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 10:34:02 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id f7so2855172wrw.1
        for <linux-ia64@vger.kernel.org>; Thu, 20 Aug 2020 10:34:02 -0700 (PDT)
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr4013793wrn.385.1597944841643;
 Thu, 20 Aug 2020 10:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <20200819135454.GA17098@lst.de> <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
 <20200820044347.GA4533@lst.de> <20200820052004.GA5305@lst.de>
 <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com> <20200820165407.GD12693@lst.de>
In-Reply-To: <20200820165407.GD12693@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 20 Aug 2020 19:33:48 +0200
X-Gmail-Original-Message-ID: <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
Message-ID: <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
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

On Thu, Aug 20, 2020 at 6:54 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Aug 20, 2020 at 12:05:29PM +0200, Tomasz Figa wrote:
> > The UAPI and V4L2/videobuf2 changes are in good shape and the only
> > wrong part is the use of DMA API, which was based on an earlier email
> > guidance anyway, and a change to the synchronization part . I find
> > conclusions like the above insulting for people who put many hours
> > into designing and implementing the related functionality, given the
> > complexity of the videobuf2 framework and how ill-defined the DMA API
> > was, and would feel better if such could be avoided in future
> > communication.
>
> It wasn't meant to be too insulting, but I found this out when trying
> to figure out how to just disable it.  But it also ends up using
> the actual dma attr flags for it's own consistency checks, so just
> not setting the flag did not turn out to work that easily.
>

Yes, sadly the videobuf2 ended up becoming quite counterintuitive
after growing for the long years and that is reflected in the design
of this feature as well. I think we need to do something about it.

> But in general it helps to add a few more people to the Cc list for
> such things that do stranger things.  Especially if you think you did
> it based on the advice of those people.

Indeed, we should have CCed you and other DMA folks. Sergey who worked
on this series is quite new to these areas of the kernel (although not
to the kernel itself) and it's my fault for not explicitly letting him
know to do that.

Best regards,
Tomasz
