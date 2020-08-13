Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4ABD2440D7
	for <lists+linux-ia64@lfdr.de>; Thu, 13 Aug 2020 23:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgHMVpC (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 13 Aug 2020 17:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgHMVpC (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 13 Aug 2020 17:45:02 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E96C061757
        for <linux-ia64@vger.kernel.org>; Thu, 13 Aug 2020 14:45:01 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k20so6285148wmi.5
        for <linux-ia64@vger.kernel.org>; Thu, 13 Aug 2020 14:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=p8TH69X43ZoFa7TDNNdb8nvvKKgned+SBGLxGIyaQIk=;
        b=bNWbLyoOu82fU7kVnT3ZayQDi98ttuUf/Yw4TjLRLSjcsGQESo6+Kl2izVidCwWQMA
         u22NvhLahNT9G6BLdZ4TlzurmlKb7DVZyTdowFw8e3XCWbaUwqpIe87i4nkdc/0FxAaC
         8JOMIARo5bbz9qzHLiuemhmoA3vnT2Xm0aNne+s2hwiEvnFt123bm0csqj6SjyUp9wGC
         qnrpr+6vnn1MhxU/7LC0hn4on80/7lSHfsGXw7kM95iBCy4vjVayFK3J9Yt1wDth4lMD
         L78DRFX3jtXzdmEj/4QLPWajkjc7gDH74pvy5yMnzlxlWbSHkxaq0yFr1dG5PfxReu2M
         WUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=p8TH69X43ZoFa7TDNNdb8nvvKKgned+SBGLxGIyaQIk=;
        b=G4xo45ln+TVR1XnvBrJhUGyJz/nAgyby0BNG0IUkrPktaTOcrfYo0K0bALJa2/KBU/
         umHhEHo5akhSW716R1Dr+9W9hWj6qYn7ofKD+qGt8WEQvFRZ+NdPlZjt+phv9q5dpEex
         f088/MnNKrHjCiuzgVOzb2tI8dAc3EV5mHzE4k8kZ65HWgXqOhuJe8cXCzKfniHFD5DG
         j70vMZvN4PtsSGGq3nJ06sGmPY5wu5or0lssiOGoXpa05gu7n66hK2aZ8Cn3wBNEGZeo
         Md5IWcoojCX1raeZEl5QE8ACUArKhUC6BfeNg3uRAnM9kqSsSJYByIuC4jZ/HGkl7OHI
         4ffA==
X-Gm-Message-State: AOAM530D9jG2sSB7Vz3tPK37TyOqwd8vP2+xWHtlsYOgbQ0KXDJu8dGm
        BQgNa9uha+9JTiPZdRrIWgrCsA==
X-Google-Smtp-Source: ABdhPJwx2+0bEDzLcaPS2qe2PUICAIhLX12rlbl/1ppV9mFyJdhGqiyaa+dqAD/Ocj/4C/vcQ3D5bg==
X-Received: by 2002:a7b:c150:: with SMTP id z16mr5739020wmi.136.1597355100329;
        Thu, 13 Aug 2020 14:45:00 -0700 (PDT)
Received: from [192.168.149.251] (trinity-students-nat.trin.cam.ac.uk. [131.111.193.104])
        by smtp.gmail.com with ESMTPSA id c14sm11458522wrw.85.2020.08.13.14.44.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2020 14:44:59 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v5] arch/ia64: Restore arch-specific pgd_offset_k
 implementation
From:   Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20200813213631.GQ17456@casper.infradead.org>
Date:   Thu, 13 Aug 2020 22:44:58 +0100
Cc:     Mike Rapoport <rppt@kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        Anatoly Pugachev <matorola@gmail.com>,
        Sergei Trofimovich <slyfox@gentoo.org>,
        Linux MM <linux-mm@kvack.org>,
        Frank Scheiner <frank.scheiner@web.de>,
        Mike Rapoport <rppt@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4600526-D387-4147-A1BA-435FCA2C6618@jrtc27.com>
References: <20200813205521.5405-1-rppt@kernel.org>
 <20200813213631.GQ17456@casper.infradead.org>
To:     Matthew Wilcox <willy@infradead.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 13 Aug 2020, at 22:36, Matthew Wilcox <willy@infradead.org> wrote:
>=20
> On Thu, Aug 13, 2020 at 11:55:21PM +0300, Mike Rapoport wrote:
>> +/*
>> + * In the kernel's mapped region we know everything is in region =
number 5, so
>> + * as an optimisation its PGD already points to the area for that =
region.
>=20
> Is it actually an optimisation?  Are there any benchmarks where this
> makes any difference whatsoever?  Or should the comment be closer to
>=20
> /* ia64 is gratuitously different.  Cope with it. */
>=20
> I might suggest that pgd be changed to be the same as every other pgd
> in the system, and every other architecture.

IA-64 is just weird. There's an optional hardware page table walker,
and two different options for how to use it within that, short-format
and long-format. My understanding is that Linux uses the short-format,
and that means that the VHPTs (Virtual Hashed Page Table) are
per-region. My assumption therefore is that the kernel's PGD is a
completely separate allocation from the userspace ones, and it's not
just a case of "moving the pointer back to the start" but that "that is
all there is", so unifying the two would be a significant undertaking
that avoids one special case at the cost of invasive refactoring and a
performance hit by duplication and/or unused space. My knowledge of
IA-64 translation is pretty limited, that's about all I know (and this
likely has mistakes in it), but I know enough to avoid finding out too
much more. Never make the mistake of assuming IA-64 can be made to look
like any other architecture :)

Jess

