Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3BBE308197
	for <lists+linux-ia64@lfdr.de>; Thu, 28 Jan 2021 23:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhA1W4d (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 28 Jan 2021 17:56:33 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:43667 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231703AbhA1Wv7 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Thu, 28 Jan 2021 17:51:59 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1l5G8C-002ISL-IH; Thu, 28 Jan 2021 23:51:16 +0100
Received: from dynamic-089-014-136-247.89.14.pool.telefonica.de ([89.14.136.247] helo=[192.168.1.10])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1l5G8C-001NCV-3r; Thu, 28 Jan 2021 23:51:16 +0100
Subject: Re: [PATCH] ia64: add support for TIF_NOTIFY_SIGNAL
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-ia64@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <d3a2aa1e-0fae-1d3f-519f-d32adc608c38@kernel.dk>
 <71d32a91-c429-7405-f4a6-58c74eb898bf@physik.fu-berlin.de>
 <477eb7cf-cbf8-540e-c355-41b7e5ed558f@kernel.dk>
 <4c01b344-b5bf-df4f-24f3-325de354ce50@physik.fu-berlin.de>
 <30e8ec23-476a-89f6-3ec0-3724bfcff3b4@kernel.dk>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <82f1e3d1-c16b-8974-2781-31214d229a11@physik.fu-berlin.de>
Date:   Thu, 28 Jan 2021 23:51:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <30e8ec23-476a-89f6-3ec0-3724bfcff3b4@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 89.14.136.247
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 1/28/21 11:42 PM, Jens Axboe wrote:
>> I just tried Linus' current tree (ge5ff2cb9cf67) and the problem still persists.
> 
> Funky... Can you see if this helps?
> 
> diff --git a/arch/ia64/kernel/signal.c b/arch/ia64/kernel/signal.c
> index e67b22fc3c60..7de57ace4799 100644
> --- a/arch/ia64/kernel/signal.c
> +++ b/arch/ia64/kernel/signal.c
> @@ -358,9 +358,6 @@ ia64_do_signal (struct sigscratch *scr, long in_syscall)
>  			 */
>  			restart = 0;
>  
> -		if (ksig.sig <= 0)
> -			break;
> -
>  		if (unlikely(restart)) {
>  			switch (errno) {
>  			case ERESTART_RESTARTBLOCK:
> @@ -381,6 +378,9 @@ ia64_do_signal (struct sigscratch *scr, long in_syscall)
>  			}
>  		}
>  
> +		if (ksig.sig <= 0)
> +			break;
> +
>  		/*
>  		 * Whee!  Actually deliver the signal.  If the delivery failed, we need to
>  		 * continue to iterate in this loop so we can deliver the SIGSEGV...

This one doesn't help. Will try the other in a minute.

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

