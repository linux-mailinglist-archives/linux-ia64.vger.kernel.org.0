Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23B954CD929
	for <lists+linux-ia64@lfdr.de>; Fri,  4 Mar 2022 17:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234137AbiCDQfZ (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 4 Mar 2022 11:35:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiCDQfY (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 4 Mar 2022 11:35:24 -0500
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A836D4F7;
        Fri,  4 Mar 2022 08:34:36 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
        id E2BFF68AFE; Fri,  4 Mar 2022 17:34:30 +0100 (CET)
Date:   Fri, 4 Mar 2022 17:34:30 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stefano Stabellini <sstabellini@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
        x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Joerg Roedel <joro@8bytes.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
        linux-pci@vger.kernel.org
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Message-ID: <20220304163430.GA12317@lst.de>
References: <20220301105311.885699-1-hch@lst.de> <20220301105311.885699-12-hch@lst.de> <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop> <20220302081500.GB23075@lst.de> <alpine.DEB.2.22.394.2203021709470.3261@ubuntu-linux-20-04-desktop> <20220303105931.GA15137@lst.de> <alpine.DEB.2.22.394.2203031447120.3261@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2203031447120.3261@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, Mar 03, 2022 at 02:49:29PM -0800, Stefano Stabellini wrote:
> On Thu, 3 Mar 2022, Christoph Hellwig wrote:
> > On Wed, Mar 02, 2022 at 05:25:10PM -0800, Stefano Stabellini wrote:
> > > Thinking more about it we actually need to drop the xen_initial_domain()
> > > check otherwise some cases won't be functional (Dom0 not 1:1 mapped, or
> > > DomU 1:1 mapped).
> > 
> > Hmm, but that would be the case even before this series, right?
> 
> Before this series we only have the xen_swiotlb_detect() check in
> xen_mm_init, we don't have a second xen_initial_domain() check.
> 
> The issue is that this series is adding one more xen_initial_domain()
> check in xen_mm_init.

In current mainline xen_mm_init calls xen_swiotlb_init unconditionally.
But xen_swiotlb_init then calls xen_swiotlb_fixup after allocating
the memory, which in turn calls xen_create_contiguous_region.
xen_create_contiguous_region fails with -EINVAL for the
!xen_initial_domain() and thus caues xen_swiotlb_fixup and
xen_swiotlb_init to unwind and return -EINVAL.

So as far as I can tell there is no change in behavior, but maybe I'm
missing something subtle?
