Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 417F2812C2
	for <lists+linux-ia64@lfdr.de>; Mon,  5 Aug 2019 09:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfHEHKR (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 5 Aug 2019 03:10:17 -0400
Received: from verein.lst.de ([213.95.11.211]:43602 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbfHEHKQ (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Mon, 5 Aug 2019 03:10:16 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 904E468B05; Mon,  5 Aug 2019 09:10:12 +0200 (CEST)
Date:   Mon, 5 Aug 2019 09:10:12 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
Message-ID: <20190805071012.GA15366@lst.de>
References: <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de> <20190625104702.GA2569@lst.de> <a2ab92b3-e89d-a610-91d1-5ea626be4995@web.de> <0f76468f-8648-62d8-68d2-455c74c19328@physik.fu-berlin.de> <20190625120024.GA3979@lst.de> <000348b4-0786-9ebc-e79e-28815fa9890c@web.de> <20190625144009.GA7281@lst.de> <80470803-d475-815a-c95a-f9961fde5d97@web.de> <20190628062619.GA27873@lst.de> <6ecf5f63-6b77-2836-79ee-258438ba4bd0@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ecf5f63-6b77-2836-79ee-258438ba4bd0@web.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Seems like we dropped the ball on this..

Did I give you a patch like this (for 5.2 and probably earlier, won't
apply to 5.3-rc) to test before as that is anther idea?

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 2c2772e9702a..e471158c7c6e 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -119,7 +119,8 @@ struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 		}
 	}
 	if (!page)
-		page = alloc_pages_node(dev_to_node(dev), gfp, page_order);
+		page = alloc_pages_node(local_memory_node(dev_to_node(dev)),
+				gfp, page_order);
 
 	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
 		__free_pages(page, page_order);
