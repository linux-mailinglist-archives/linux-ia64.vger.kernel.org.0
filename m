Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1EAB1F596C
	for <lists+linux-ia64@lfdr.de>; Wed, 10 Jun 2020 18:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729088AbgFJQub (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 10 Jun 2020 12:50:31 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60992 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726855AbgFJQub (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Wed, 10 Jun 2020 12:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591807829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EMwUauau342Zml1K34QLPe12sp1DuwpV44r+JLoVGLk=;
        b=Z38WZdtyg+yuvmWZqlSR2DIgwxdH9J3PBF6TceTvikJk8f8qYiQsPCDZ0cFi7cpZI48ENs
        S9/ncr7uVLCY2My2vf6jb5qGc4pQCyhXUC5OCZ+jd3QG4cTQvQMzgZc5TVTruq4FNFWMFA
        lAMwd+t+MHnHgK8FxBlka6yJWzPVUm8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-IaISvakGPXeuhZdmui45pg-1; Wed, 10 Jun 2020 12:50:27 -0400
X-MC-Unique: IaISvakGPXeuhZdmui45pg-1
Received: by mail-qv1-f70.google.com with SMTP id j4so2288462qvt.20
        for <linux-ia64@vger.kernel.org>; Wed, 10 Jun 2020 09:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EMwUauau342Zml1K34QLPe12sp1DuwpV44r+JLoVGLk=;
        b=CsUpHXL+MwACtfPPUR5t9O9jSXTzeZ3rAGrlwVpO7YQY9z6nZ6cl4dcVVT2Ul2ZYlx
         w0hBcM9jBef3dpeAttVtqwSjlQ3S8wofIu9UzHgL1zTDB5QfTguKBy4BgbX6t2xp3hvb
         PbAXbv1K3raeHI2fUdB6d7pumFh6HiXAH/rXU/J4cQDbOvssdc6WfuT5iz/zs6Ljp3V+
         MvNjQ0p3gBi/WjjdxkQtHVdqwR8EPMtkhLrFgzXjAwsSWLvWIQ31EbqeAzWqz8h0VesZ
         FaU7rn9/pvwjY6ymOUrTfRSJ2c7/kGee0TbZgapPAVTY9BtK4xb2mroICnJ4VNmRDmm8
         dwKA==
X-Gm-Message-State: AOAM530jrTwiSiEa1/woy/iUhqoEVkyxULBxtBI1KUOi5/OQsTZcwgYD
        yQEzyrRu5g9DgyT7QIsNeabe40We08hQW/Ru1wd9YGXDDNG36Oja7x9ZxacRHq6gq9X4biTIkKT
        diZzowJ2EDjXtlJUx4Saykg==
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr3987569qke.236.1591807826877;
        Wed, 10 Jun 2020 09:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn20TLNz7hD3Ni4blZzJN/2PX0jI8mrO6z2/UHNbD+ObHKXkY/kSbOK73eCMc/XFP0Ereokw==
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr3987535qke.236.1591807826580;
        Wed, 10 Jun 2020 09:50:26 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id 207sm149672qki.134.2020.06.10.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 09:50:25 -0700 (PDT)
Date:   Wed, 10 Jun 2020 12:50:23 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc:     linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Guan Xuetao <gxt@pku.edu.cn>, linux-xtensa@linux-xtensa.org,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: Possible duplicate page fault accounting on some archs after
 commit 4064b9827063
Message-ID: <20200610165023.GA67179@xz-x1>
References: <20200610174811.44b94525@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200610174811.44b94525@thinkpad>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, Jun 10, 2020 at 05:48:11PM +0200, Gerald Schaefer wrote:
> Hi,

Hi, Gerald,

> 
> Some architectures have their page fault accounting code inside the fault
> retry loop, and rely on only going through that code once. Before commit
> 4064b9827063 ("mm: allow VM_FAULT_RETRY for multiple times"), that was
> ensured by testing for and clearing FAULT_FLAG_ALLOW_RETRY.
> 
> That commit had to remove the clearing of FAULT_FLAG_ALLOW_RETRY for all
> architectures, and introduced a subtle change to page fault accounting
> logic in the affected archs. It is now possible to go through the retry
> loop multiple times, and the affected archs would then account multiple
> page faults instead of just one.
> 
> This was found by coincidence in s390 code, and a quick check showed that
> there are quite a lot of other architectures that seem to be affected in a
> similar way. I'm preparing a fix for s390, by moving the accounting behind
> the retry loop, similar to x86. It is not completely straight-forward, so
> I leave the fix for other archs to the respective maintainers.

Sorry for not noticing this before.  The accounting part should definitely be
put at least into a check against fault_flag_allow_retry_first() to mimic what
was done before.  And I agree it would be even better to put it after the retry
logic, so if any of the page faults gets a major fault, it'll be accounted as a
major fault which makes more sense to me, just like what x86 is doing now with:

	major |= fault & VM_FAULT_MAJOR;

I'm not sure what's the preference of the arch maintainers, just let me know if
it's preferred to use a single series to address this issue for all affected
archs (or the archs besides s390), then I'll do.

Thanks!

-- 
Peter Xu

