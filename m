Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBA42FD523
	for <lists+linux-ia64@lfdr.de>; Wed, 20 Jan 2021 17:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391260AbhATQLp (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 20 Jan 2021 11:11:45 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:57169 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391331AbhATQKx (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Wed, 20 Jan 2021 11:10:53 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1l2G3M-0033lr-Hp; Wed, 20 Jan 2021 17:09:52 +0100
Received: from p5b13a61e.dip0.t-ipconnect.de ([91.19.166.30] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1l2G3L-002oCu-Tz; Wed, 20 Jan 2021 17:09:52 +0100
Subject: Re: [PATCH] ia64: add support for TIF_NOTIFY_SIGNAL
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-ia64@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <d3a2aa1e-0fae-1d3f-519f-d32adc608c38@kernel.dk>
 <71d32a91-c429-7405-f4a6-58c74eb898bf@physik.fu-berlin.de>
 <477eb7cf-cbf8-540e-c355-41b7e5ed558f@kernel.dk>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <17cd57b5-c728-193f-3776-d6fcceeedcbb@physik.fu-berlin.de>
Date:   Wed, 20 Jan 2021 17:09:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <477eb7cf-cbf8-540e-c355-41b7e5ed558f@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.166.30
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 1/20/21 5:08 PM, Jens Axboe wrote:
>> This change broke the hpsa driver on my RX-2600 ia64 workstation in the sense that the
>> driver no longer loads and hence hard disks are no longer recognized.
> 
> What does "no longer loads" mean? Does it hang?

It does not load at all. The driver no longer shows up in the kernel message buffer
and therefore no disks are found.

>> Any idea what could be wrong?
> 
> Can you try current -git? There's a task_work related fix in there which is
> related to this series, maybe that's it...

I can. However, I already tested 5.11-rc4 before I sent the mail.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

