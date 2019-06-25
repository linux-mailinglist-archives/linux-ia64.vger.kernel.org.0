Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAEB9523D9
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 08:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728529AbfFYG7h (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 02:59:37 -0400
Received: from verein.lst.de ([213.95.11.211]:60068 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727112AbfFYG7g (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 02:59:36 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 8AEB368B02; Tue, 25 Jun 2019 08:59:05 +0200 (CEST)
Date:   Tue, 25 Jun 2019 08:59:05 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        Frank Scheiner <frank.scheiner@web.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
Message-ID: <20190625065905.GA30073@lst.de>
References: <f3d9d882-dd22-1782-6ec8-c88cb1880a83@web.de> <1d62aadd-67b6-da13-53cc-4b5213de8937@physik.fu-berlin.de> <20190625064218.GA29841@lst.de> <7f701503-7bd3-28bf-d7e6-d52d3fd168ee@physik.fu-berlin.de> <20190625065003.GA29883@lst.de> <87311b3d-748d-57e1-21cc-89774bf71a4a@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87311b3d-748d-57e1-21cc-89774bf71a4a@physik.fu-berlin.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, Jun 25, 2019 at 08:54:11AM +0200, John Paul Adrian Glaubitz wrote:
> Okay, thanks. I'll whip up a patch for Frank to test.

The one below should do it, but from looking at the ia64 zone
initialization I'm not sure this will be the culprit.

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 2c2772e9702a..3e802f4580b3 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -82,9 +82,7 @@ static gfp_t __dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
 	 */
 	if (*phys_mask <= DMA_BIT_MASK(ARCH_ZONE_DMA_BITS))
 		return GFP_DMA;
-	if (*phys_mask <= DMA_BIT_MASK(32))
-		return GFP_DMA32;
-	return 0;
+	return GFP_DMA32;
 }
 
 static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
