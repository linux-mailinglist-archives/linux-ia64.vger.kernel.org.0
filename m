Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0031523BC
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 08:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729530AbfFYGuh (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 02:50:37 -0400
Received: from verein.lst.de ([213.95.11.211]:60018 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbfFYGuh (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 02:50:37 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 5081D68B02; Tue, 25 Jun 2019 08:50:03 +0200 (CEST)
Date:   Tue, 25 Jun 2019 08:50:03 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        Frank Scheiner <frank.scheiner@web.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
Message-ID: <20190625065003.GA29883@lst.de>
References: <f3d9d882-dd22-1782-6ec8-c88cb1880a83@web.de> <1d62aadd-67b6-da13-53cc-4b5213de8937@physik.fu-berlin.de> <20190625064218.GA29841@lst.de> <7f701503-7bd3-28bf-d7e6-d52d3fd168ee@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f701503-7bd3-28bf-d7e6-d52d3fd168ee@physik.fu-berlin.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, Jun 25, 2019 at 08:46:57AM +0200, John Paul Adrian Glaubitz wrote:
> I can reproduce the crash when trying to load the module for the USB controllers,
> for example. Loading the kernel module for the SATA controllers provokes the
> backtrace as well.
> 
> I have skimmed through the code a bit , but I'm not sure whether I understand
> the code in kernel/dma/direct.c correctly, so my suggestion would be to just
> set GFP_DMA32 in __dma_direct_alloc_pages() unconditionally for a test. Would
> that be enough for a test?

Yes.
