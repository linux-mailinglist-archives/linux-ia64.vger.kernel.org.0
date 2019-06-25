Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDBC4523AF
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 08:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfFYGmu (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 02:42:50 -0400
Received: from verein.lst.de ([213.95.11.211]:59984 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726776AbfFYGmu (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 02:42:50 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id AC1A868B02; Tue, 25 Jun 2019 08:42:18 +0200 (CEST)
Date:   Tue, 25 Jun 2019 08:42:18 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Frank Scheiner <frank.scheiner@web.de>, linux-ia64@vger.kernel.org,
        hch@lst.de, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
Message-ID: <20190625064218.GA29841@lst.de>
References: <f3d9d882-dd22-1782-6ec8-c88cb1880a83@web.de> <1d62aadd-67b6-da13-53cc-4b5213de8937@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d62aadd-67b6-da13-53cc-4b5213de8937@physik.fu-berlin.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, Jun 25, 2019 at 08:40:01AM +0200, John Paul Adrian Glaubitz wrote:
> Hi Christoph!
> 
> On 6/21/19 10:08 PM, Frank Scheiner wrote:
> > recent testing of a Debian v4.19.37 kernel showed a problem on my rx2800
> > i2 happening during kernel boot:
> > (...)
> > [1]:
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=543cea9accd9804307541cb93d3ed7ec94b07237
> 
> Do you have any idea what could be the reason for the issue introduced
> by your above commit? James Clarke has guess that it might be GFP_DMA32
> which isn't being set properly anymore for the affected machines.
> 
> Do you think we could test a kernel which just sets the flag unconditionally
> to see whether this is the problem that causes the issues on these machines?

Might be worth a test.  Do you know what device failed?  Might be one
with a dma mask < 32-bit?
