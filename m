Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F397854E22
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 14:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbfFYMA4 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 08:00:56 -0400
Received: from verein.lst.de ([213.95.11.211]:34210 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732479AbfFYMA4 (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 08:00:56 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 23DA268B05; Tue, 25 Jun 2019 14:00:25 +0200 (CEST)
Date:   Tue, 25 Jun 2019 14:00:24 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Frank Scheiner <frank.scheiner@web.de>,
        Christoph Hellwig <hch@lst.de>, linux-ia64@vger.kernel.org,
        James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
Message-ID: <20190625120024.GA3979@lst.de>
References: <5939b8fa-8f3b-fa30-aeb0-d19c6baf89da@web.de> <cce09bfe-0179-4ce7-4488-09c66b968628@web.de> <20190625081825.GA31752@lst.de> <c5412a03-e3ce-eecd-737f-119c7d955ed3@web.de> <60d38f5f-4867-ee1d-783c-ae162e25bea9@web.de> <20190625103232.GA2132@lst.de> <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de> <20190625104702.GA2569@lst.de> <a2ab92b3-e89d-a610-91d1-5ea626be4995@web.de> <0f76468f-8648-62d8-68d2-455c74c19328@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f76468f-8648-62d8-68d2-455c74c19328@physik.fu-berlin.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, Jun 25, 2019 at 01:21:38PM +0200, John Paul Adrian Glaubitz wrote:
> > Ok, that looks much better now with the second patch:
> > ...even after a second reboot for verification. Great!(
> > (...)
> > I assume this won't affect UMA Itaniums or should I check on one of my
> > other Integrities if this change breaks the kernel on them?
> 
> Nice! I just assume we won't be able to use the patch "as is" as it would
> potentially break other architectures if I'm not mistaken.

It doesn't actually _break_ anything, but it regresses in not doing
node local allocations.  Give me some time to dig through the ia64
code to figure out if I can make sense of this.
