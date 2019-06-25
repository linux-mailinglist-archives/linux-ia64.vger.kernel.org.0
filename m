Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE4CD54CA4
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 12:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfFYKre (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 06:47:34 -0400
Received: from verein.lst.de ([213.95.11.211]:33702 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbfFYKre (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 06:47:34 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id C9DD068B05; Tue, 25 Jun 2019 12:47:02 +0200 (CEST)
Date:   Tue, 25 Jun 2019 12:47:02 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
Message-ID: <20190625104702.GA2569@lst.de>
References: <20190625065003.GA29883@lst.de> <87311b3d-748d-57e1-21cc-89774bf71a4a@physik.fu-berlin.de> <20190625065905.GA30073@lst.de> <5939b8fa-8f3b-fa30-aeb0-d19c6baf89da@web.de> <cce09bfe-0179-4ce7-4488-09c66b968628@web.de> <20190625081825.GA31752@lst.de> <c5412a03-e3ce-eecd-737f-119c7d955ed3@web.de> <60d38f5f-4867-ee1d-783c-ae162e25bea9@web.de> <20190625103232.GA2132@lst.de> <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, Jun 25, 2019 at 12:46:39PM +0200, Frank Scheiner wrote:
> Do you suspect a firmware issue? Because the firmware of that machine is
> actually quite old (the model was retired in 2015):

No, probably something in the Linux ia64-specific code.

>>   	if (!page)
>> -		page = alloc_pages_node(dev_to_node(dev), gfp, page_order);
>> +		page = alloc_pages(gfp, page_order);
>>
>>   	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
>>   		__free_pages(page, page_order);
>>
>
> Ok, will try that patch - actually (1) in addition or (2) without the
> first one?

Instead.
