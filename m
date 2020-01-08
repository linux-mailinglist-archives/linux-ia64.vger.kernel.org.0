Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50285134B1F
	for <lists+linux-ia64@lfdr.de>; Wed,  8 Jan 2020 20:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729759AbgAHTAD (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 8 Jan 2020 14:00:03 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34678 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgAHTAC (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 8 Jan 2020 14:00:02 -0500
Received: by mail-ot1-f67.google.com with SMTP id a15so4656073otf.1
        for <linux-ia64@vger.kernel.org>; Wed, 08 Jan 2020 11:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XKG1nbVwzj/tRpstff6fH6LSUuwV4sjHhIFUgWIlV+U=;
        b=s9NJQtCqnectin8Ti+6PJbbfj1iVC29kijEEVzBm9eYM0xqovEdSIvUBRa5QV+2Qzf
         uMjhO+nADZCdf/v+dinki4tHGe/eBYjmY78A0B9gngLOIJZSvsYSGQUcFghNBkzajBm+
         002VIJLs2HYb6/7/565YtsSdwQ7BoFsW7F2g/8JhRZm5aaupLnZ+WjxKHOUtdugZXa+v
         M5Cfg0EYtVYHOoLi8prNlcRFGlvf0CrScWNFvhySDu/GUL/m4BLe/M+OqS31fpVqrUm6
         /h5oOCVTEniuxvpSTmawQh4xsO4jXbtbwJSxpi9ba8XLCoKCbuSjDDKpfn0F41JYkU5K
         2q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XKG1nbVwzj/tRpstff6fH6LSUuwV4sjHhIFUgWIlV+U=;
        b=s6OD0QSh7OTeQmTXvIexmfyxM+b5kHY94J5OU1QiQB/mFWYMLOYAAOkQrYTvJhwTwr
         AjqOHcE1nWZZC4CaU8wLdUK7JJ06ow+0vF3b+DnAyfqH6O8W3ZVXRsH2F+gI4Jr17Zpc
         Qvfh8qV6RljLq7qzPkrsnk2S6VoPqKybN8DTVSgjh25+lxnwDVDhfG6gS/F4E6oP8p5n
         jURzRDiJTKjiSSDAzMnNauh6Bjhd2/S6M5ZSKJjbNHJ++ZaJDwXDk3EyfjizOdUexEYh
         A6gzvu0U0+iYauD+DlMcwya7KfHOvxF7x9xb1qx1H9yB8QZPf8m44Omyqv+0WwFUoGgc
         X8Ng==
X-Gm-Message-State: APjAAAXeDP+y6N6frMiUiABvPO+YxC2POBN1OdM5ZKP+64wkVV5z9EfV
        4bOiWiIJS272HE+0M85YifDI7WWUjErBTK5OUcZ+aA==
X-Google-Smtp-Source: APXvYqxCuOUFRmTIFvW4iH38UfBo5T8KUr6T2q9RXS3eopOSB7fDf5LWtiL93/r45iWPoVq/UfuDWeRs67v8mZX9sdI=
X-Received: by 2002:a9d:68d3:: with SMTP id i19mr4939869oto.71.1578510001998;
 Wed, 08 Jan 2020 11:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20200107205959.7575-1-logang@deltatee.com> <20200107205959.7575-3-logang@deltatee.com>
 <3e432695-e3a9-2aae-e9f5-1b6454886c06@redhat.com> <eef4ec73-8823-9f20-93ed-5c09f18c437a@deltatee.com>
In-Reply-To: <eef4ec73-8823-9f20-93ed-5c09f18c437a@deltatee.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 8 Jan 2020 10:59:51 -0800
Message-ID: <CAPcyv4hdpMs5om4_VrYUz98aWDJ9eRhj7WJr312Jwn6LCmAm9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] mm/memory_hotplug: Rename mhp_restrictions to mhp_modifiers
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
        Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Eric Badger <ebadger@gigaio.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, Jan 8, 2020 at 9:17 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2020-01-08 5:28 a.m., David Hildenbrand wrote:
> > On 07.01.20 21:59, Logan Gunthorpe wrote:
> >> The mhp_restrictions struct really doesn't specify anything resembling
> >> a restriction anymore so rename it to be mhp_modifiers.
> >
> > I wonder if something like "mhp_params" would be even better. It's
> > essentially just a way to avoid changing call chains rough-out all archs
> > whenever we want to add a new parameter.
>
> Sure, that does sound a bit nicer to me. I can change it for v3.

Oh, I was just about to chime in to support "modifiers" because I
would expect all parameters to folded into a "params" struct. The
modifiers seem to be limited to the set of items that are only
considered in a non-default / expert memory hotplug use cases.
