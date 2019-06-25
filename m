Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D59952FEC
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 12:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfFYKdE (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 06:33:04 -0400
Received: from verein.lst.de ([213.95.11.211]:33621 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726414AbfFYKdE (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 06:33:04 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id A94BC68B05; Tue, 25 Jun 2019 12:32:32 +0200 (CEST)
Date:   Tue, 25 Jun 2019 12:32:32 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
Message-ID: <20190625103232.GA2132@lst.de>
References: <20190625064218.GA29841@lst.de> <7f701503-7bd3-28bf-d7e6-d52d3fd168ee@physik.fu-berlin.de> <20190625065003.GA29883@lst.de> <87311b3d-748d-57e1-21cc-89774bf71a4a@physik.fu-berlin.de> <20190625065905.GA30073@lst.de> <5939b8fa-8f3b-fa30-aeb0-d19c6baf89da@web.de> <cce09bfe-0179-4ce7-4488-09c66b968628@web.de> <20190625081825.GA31752@lst.de> <c5412a03-e3ce-eecd-737f-119c7d955ed3@web.de> <60d38f5f-4867-ee1d-783c-ae162e25bea9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60d38f5f-4867-ee1d-783c-ae162e25bea9@web.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Thanks Frank.

It seems like there is something odd going on with the zonelist
on your system.  Maybe there is not actual ZONE_DMA32, or something
is messed with the numa node setup.  Below is a band aid patch to
try theory number two above:


diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index fcdb23e8d2fc..8e3f7b8bdb33 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -119,7 +119,7 @@ struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 		}
 	}
 	if (!page)
-		page = alloc_pages_node(dev_to_node(dev), gfp, page_order);
+		page = alloc_pages(gfp, page_order);
 
 	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
 		__free_pages(page, page_order);
