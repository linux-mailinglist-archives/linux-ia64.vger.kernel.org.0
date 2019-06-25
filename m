Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBDA52650
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 10:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728644AbfFYIS5 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 04:18:57 -0400
Received: from verein.lst.de ([213.95.11.211]:60765 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727887AbfFYIS5 (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 04:18:57 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id A9D6A68B02; Tue, 25 Jun 2019 10:18:25 +0200 (CEST)
Date:   Tue, 25 Jun 2019 10:18:25 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
Message-ID: <20190625081825.GA31752@lst.de>
References: <f3d9d882-dd22-1782-6ec8-c88cb1880a83@web.de> <1d62aadd-67b6-da13-53cc-4b5213de8937@physik.fu-berlin.de> <20190625064218.GA29841@lst.de> <7f701503-7bd3-28bf-d7e6-d52d3fd168ee@physik.fu-berlin.de> <20190625065003.GA29883@lst.de> <87311b3d-748d-57e1-21cc-89774bf71a4a@physik.fu-berlin.de> <20190625065905.GA30073@lst.de> <5939b8fa-8f3b-fa30-aeb0-d19c6baf89da@web.de> <cce09bfe-0179-4ce7-4488-09c66b968628@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cce09bfe-0179-4ce7-4488-09c66b968628@web.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, Jun 25, 2019 at 10:16:22AM +0200, Frank Scheiner wrote:
> Looks like this patch is not enough or not related, a kernel v5.1.15
> with that patch applied yields the following:

Can you use gdb to disassemle the faulting addresss?

Something like:

gdb vmlinux

The in gdb:

l *(__alloc_pages_nodemask+0x281)
