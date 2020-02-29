Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62464174961
	for <lists+linux-ia64@lfdr.de>; Sat, 29 Feb 2020 21:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbgB2Uop (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 29 Feb 2020 15:44:45 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45048 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbgB2Uoo (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 29 Feb 2020 15:44:44 -0500
Received: by mail-ot1-f65.google.com with SMTP id v22so1444244otq.11
        for <linux-ia64@vger.kernel.org>; Sat, 29 Feb 2020 12:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rqrrnhnAhDxDR8DToJ03L+juASOs6Wy8PQ3rH1ycKSY=;
        b=TYpFojaFQdUqaHBll6wgyaBq0JuxhRQyFCiHl2aCihv5uMBc1KFDLDDeMczLWyt8tD
         qnLbcLplw+2WoNzbCgJnxTLzJUgibDfZbhT9vNbt0/enEuXTff8alC+u6o+URMJGyNJ6
         ou1NISRDvkqJtex7bh+3kcVgLSIao7pALFZD+un2PFXr3PJS3k+VeI1R+qVg2jI4wJXw
         L5hTOFFVEbsKWNM3uV0YKQ+t9u+eM/SZ1W/MR2NG+K24z72IjJI5pZ4CTLDqOY2K4PT1
         nii7SoL/cAdaHD/p50gusTVN3y7GcODdwr9wZ2TLWb8bhxiKX9kOGosaY8MhItMZJRCE
         nAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rqrrnhnAhDxDR8DToJ03L+juASOs6Wy8PQ3rH1ycKSY=;
        b=cH8tw9HBFILCC9qzR0bNvzf1mArXGHqCeGflsM9wC9ad9AsFYpnNhJ95dJN0Ra4f/q
         Q4++eOJ6LYQs7708naab5x/FEJNCnm44bJB+R0PpMSK4KI7hTFw+976eH2F35Bwo5RAC
         qgJH5jaMdw6/ibC4VKej3gNPTRdSxEiSAX54+0o/82AwkomuLt99BlUSWJsYWt+oO/6R
         /D1U0nzIEgeLp339ysOArJDYBJR0aMT3m+ux7tpEOBscNCzuPlvgpLswos9m/HrZkOG0
         BepGf5AKmPftm51GxxeAGCCPOQGV4qgsieODmqL9ws0FhrLM8XWW2du4keR1IwlC2UNR
         OLTA==
X-Gm-Message-State: APjAAAWltLus6mHiZ5u2erhb40+FwSlTNRmt7rif2msQIz8ngQjYuX2H
        daBjdifLf02OICFtZLeyjgNkFtuLK+h/+xd7JqUbgQ==
X-Google-Smtp-Source: APXvYqwuD7hXgqDuHa7bNKr2aGN5ZsRtxcfrMKKpE5k3aRoSjSLBCzEO28z30FjlnmPqDSMCgEWPc3EsieveZxFwGeE=
X-Received: by 2002:a05:6830:134c:: with SMTP id r12mr7849308otq.126.1583009084306;
 Sat, 29 Feb 2020 12:44:44 -0800 (PST)
MIME-Version: 1.0
References: <20200221182503.28317-1-logang@deltatee.com> <20200221182503.28317-3-logang@deltatee.com>
In-Reply-To: <20200221182503.28317-3-logang@deltatee.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Sat, 29 Feb 2020 12:44:29 -0800
Message-ID: <CAPcyv4hLvciwxSnsQRye9SuB-sy9fm+_6CwZSuHifkmbWQs-+g@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] mm/memory_hotplug: Rename mhp_restrictions to mhp_params
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
        Michal Hocko <mhocko@kernel.org>,
        David Hildenbrand <david@redhat.com>,
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

On Fri, Feb 21, 2020 at 10:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
> The mhp_restrictions struct really doesn't specify anything resembling
> a restriction anymore so rename it to be mhp_params as it is a list
> of extended parameters.
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

Tests ok, and looks good to me:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
