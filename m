Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E6124412D
	for <lists+linux-ia64@lfdr.de>; Fri, 14 Aug 2020 00:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgHMWVS (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 13 Aug 2020 18:21:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:40346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgHMWVS (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Thu, 13 Aug 2020 18:21:18 -0400
Received: from kernel.org (unknown [87.70.91.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 472A2205CB;
        Thu, 13 Aug 2020 22:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597357277;
        bh=vs8lJM0eKVG8946mLVhSWB3Q/20CNgAkEixAfgafkMc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FDc3lnf8lOFLTrY5pc7ZQGrj1KIKJs236WNcPF2mT821/WHgYyhu/zGUtxpK5cvpB
         cOEXrbfJPmQ3aJL/v72534XZ9CdHsIbKPMj64V522NBhGi3zP9gWllEa+r0+H3W9Yo
         As+2sFdoxOm9en+mCav8U+hx019LXy7LqQTz7j7s=
Date:   Fri, 14 Aug 2020 01:21:10 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jessica Clarke <jrtc27@jrtc27.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        Anatoly Pugachev <matorola@gmail.com>,
        Sergei Trofimovich <slyfox@gentoo.org>, linux-mm@kvack.org,
        Frank Scheiner <frank.scheiner@web.de>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v5] arch/ia64: Restore arch-specific pgd_offset_k
 implementation
Message-ID: <20200813222110.GE752365@kernel.org>
References: <20200813205521.5405-1-rppt@kernel.org>
 <20200813213631.GQ17456@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813213631.GQ17456@casper.infradead.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, Aug 13, 2020 at 10:36:31PM +0100, Matthew Wilcox wrote:
> On Thu, Aug 13, 2020 at 11:55:21PM +0300, Mike Rapoport wrote:
> > +/*
> > + * In the kernel's mapped region we know everything is in region number 5, so
> > + * as an optimisation its PGD already points to the area for that region.
> 
> Is it actually an optimisation?  Are there any benchmarks where this
> makes any difference whatsoever?  Or should the comment be closer to
> 
> /* ia64 is gratuitously different.  Cope with it. */

It better suits arch/ia64/Kconfig ;-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 5b4ec80bf586..205cdb91a6d5 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -62,6 +62,7 @@ config IA64
          the 32-bit X86 line.  The IA-64 Linux project has a home
          page at <http://www.linuxia64.org/> and a mailing list at
          <linux-ia64@vger.kernel.org>.
+         IA-64 is gratuitously different. Cope with it.

> I might suggest that pgd be changed to be the same as every other pgd
> in the system, and every other architecture.
 
I did some grepping and got lost in IA-64 assembly, so I agree with
Jessica that it would open a can of worms.

-- 
Sincerely yours,
Mike.
