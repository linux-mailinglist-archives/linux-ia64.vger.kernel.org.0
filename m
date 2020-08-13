Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4CF2440C7
	for <lists+linux-ia64@lfdr.de>; Thu, 13 Aug 2020 23:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgHMVgm (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 13 Aug 2020 17:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgHMVgm (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 13 Aug 2020 17:36:42 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27367C061757
        for <linux-ia64@vger.kernel.org>; Thu, 13 Aug 2020 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=7fWn8gbH7OngjDkU5Iy7SVxH91T/zZwGUSoY4uuguys=; b=OomA2hoQQO9phLuXJbJnHe05xH
        tIirJEhABC3QLAcqVr2RgdhQBLiJIUfNV60MMDKGQk0Swsz8z8kNYhxZmi/h4Sg6sKCujvt+MMc9D
        MyUwTljpMHpiQEk608pe3kUC2tLzVLPdy4msK1Kv1NhYdJs4us2AT4wKwHGweqXvrpy6QGYRtBDFM
        uFQbm/lKPb1kSU9s3twSWqSalI4yzDRlKvxWwLx1VZVcBZDyzl0VcNiICrxSoGUaPXkvDo0ozvv2a
        ARiIgvHOF1O9Ds1sZA0XYWAgE0WbKc4fcroqQawCXql8mrWqPxSIO+GMIbUqv1Zyz1NSPQeeCayLH
        CeE8Kgkw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k6Ktj-0004OK-Oh; Thu, 13 Aug 2020 21:36:31 +0000
Date:   Thu, 13 Aug 2020 22:36:31 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Jessica Clarke <jrtc27@jrtc27.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        Anatoly Pugachev <matorola@gmail.com>,
        Sergei Trofimovich <slyfox@gentoo.org>, linux-mm@kvack.org,
        Frank Scheiner <frank.scheiner@web.de>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v5] arch/ia64: Restore arch-specific pgd_offset_k
 implementation
Message-ID: <20200813213631.GQ17456@casper.infradead.org>
References: <20200813205521.5405-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813205521.5405-1-rppt@kernel.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, Aug 13, 2020 at 11:55:21PM +0300, Mike Rapoport wrote:
> +/*
> + * In the kernel's mapped region we know everything is in region number 5, so
> + * as an optimisation its PGD already points to the area for that region.

Is it actually an optimisation?  Are there any benchmarks where this
makes any difference whatsoever?  Or should the comment be closer to

/* ia64 is gratuitously different.  Cope with it. */

I might suggest that pgd be changed to be the same as every other pgd
in the system, and every other architecture.

