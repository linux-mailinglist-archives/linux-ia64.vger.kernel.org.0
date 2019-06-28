Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2400459435
	for <lists+linux-ia64@lfdr.de>; Fri, 28 Jun 2019 08:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbfF1Gbx (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 28 Jun 2019 02:31:53 -0400
Received: from verein.lst.de ([213.95.11.210]:45504 "EHLO newverein.lst.de"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726749AbfF1Gbx (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Fri, 28 Jun 2019 02:31:53 -0400
X-Greylist: delayed 330 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Jun 2019 02:31:52 EDT
Received: by newverein.lst.de (Postfix, from userid 2407)
        id EE3B668CFE; Fri, 28 Jun 2019 08:26:19 +0200 (CEST)
Date:   Fri, 28 Jun 2019 08:26:19 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
Message-ID: <20190628062619.GA27873@lst.de>
References: <60d38f5f-4867-ee1d-783c-ae162e25bea9@web.de> <20190625103232.GA2132@lst.de> <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de> <20190625104702.GA2569@lst.de> <a2ab92b3-e89d-a610-91d1-5ea626be4995@web.de> <0f76468f-8648-62d8-68d2-455c74c19328@physik.fu-berlin.de> <20190625120024.GA3979@lst.de> <000348b4-0786-9ebc-e79e-28815fa9890c@web.de> <20190625144009.GA7281@lst.de> <80470803-d475-815a-c95a-f9961fde5d97@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80470803-d475-815a-c95a-f9961fde5d97@web.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Btw, as a workaround you could try to disable CONFIG_NUMA in
your .config - as far as I can tell the rx2800 i2 is not actually
a NUMA system.
