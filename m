Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8DF5712FAE
	for <lists+linux-ia64@lfdr.de>; Sat, 27 May 2023 00:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244259AbjEZWBW (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 26 May 2023 18:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244268AbjEZWBV (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 26 May 2023 18:01:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C2210E0
        for <linux-ia64@vger.kernel.org>; Fri, 26 May 2023 15:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=rxgcndgMSN5ndKoJQZCgXez5RGjJ53F9fp++HgaEDk0=; b=KcNZ9EaJjirv7ZXhuJP4G8q+uN
        y6OqexL7hFJI84XRRqxY1RFNLBT/p8t0dfB0XaY2asKUAgITeHJz4C4a/uu0WMdXCj9sQz1lBKX7V
        tYI1bDuRrLwAQ/dC5gAkbj1g6QX98vaCAW+7IUMV0WH44xzJkuABjTd8v3YRqIDzE/y+WJoyy6X38
        X15c/T1w6mEOMIZ7QeCEr7lh+q/BoEoJ897fSn/sssNZg+OjNG4w7ZzHIe+MDeDadHlVd0TJHaZLe
        qWVVOCiTY+7RovmonBTaWqEMwlH+AXmDD4CMPnpLnGH6bvsNnUajXthhr7tE1V7JHrgtgQWYAx9N/
        p3kOKCvQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1q2fSs-00440J-1M;
        Fri, 26 May 2023 21:59:14 +0000
Date:   Fri, 26 May 2023 14:59:14 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Frank Scheiner <frank.scheiner@web.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-ia64@vger.kernel.org, song@kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Boot regression in Linux v6.4-rc3
Message-ID: <ZHErssbUSbSznTVA@bombadil.infradead.org>
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Fri, May 26, 2023 at 12:55:14PM +0200, Frank Scheiner wrote:
> Dear all,
> 
> there is a boot regression in effect in Linux v6.4-rc3 that affects at
> least:
> 
> * rx2620 (w/2 x Montecito and zx1)
> * rx2800-i2 (w/1 x Tukwila)

Jesus, ia64 is even dropped from qemu as of 2.11. We're now around qemu
7.11 to give some perspective. I'm just wondering how to reproduce
testing easily instead of this ping pong back and forth for this
architecture for some oddball architectures.

Through commit 96ec72a3425d1 ("ia64: Mark architecture as orphaned")
it was noted even the old maintainer no longer had access to working
machines and so it was orphan'd.

Not saying that debugging commit ac3b4328392344 ("module: replace
module_layout with module_memory") is going to be impossible, quite
the contrary I think it would be good to root cause it, if possible,
as perhaps it may also be similar to some other future oddball arch
bug later that may come up.

But certainly just trying to see what options we have to test this
architecture.

And what's the status of removal for ia64 anyway?

  Luis
