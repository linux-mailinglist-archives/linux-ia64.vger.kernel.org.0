Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65C815522D
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 16:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731144AbfFYOkl (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 10:40:41 -0400
Received: from verein.lst.de ([213.95.11.211]:35468 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730689AbfFYOkl (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 10:40:41 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 61BF368B05; Tue, 25 Jun 2019 16:40:09 +0200 (CEST)
Date:   Tue, 25 Jun 2019 16:40:09 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
Message-ID: <20190625144009.GA7281@lst.de>
References: <20190625081825.GA31752@lst.de> <c5412a03-e3ce-eecd-737f-119c7d955ed3@web.de> <60d38f5f-4867-ee1d-783c-ae162e25bea9@web.de> <20190625103232.GA2132@lst.de> <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de> <20190625104702.GA2569@lst.de> <a2ab92b3-e89d-a610-91d1-5ea626be4995@web.de> <0f76468f-8648-62d8-68d2-455c74c19328@physik.fu-berlin.de> <20190625120024.GA3979@lst.de> <000348b4-0786-9ebc-e79e-28815fa9890c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000348b4-0786-9ebc-e79e-28815fa9890c@web.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Please try this patch instead of the previous one:

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 2c2772e9702a..3516a543450e 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -118,9 +118,10 @@ struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 			page = NULL;
 		}
 	}
-	if (!page)
-		page = alloc_pages_node(dev_to_node(dev), gfp, page_order);
-
+	if (!page) {
+		page = alloc_pages_node(local_memory_node(dev_to_node(dev)),
+					gfp, page_order);
+	}
 	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
 		__free_pages(page, page_order);
 		page = NULL;
