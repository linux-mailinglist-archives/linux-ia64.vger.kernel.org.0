Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE3A2FAE76
	for <lists+linux-ia64@lfdr.de>; Tue, 19 Jan 2021 02:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbhASBve (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 18 Jan 2021 20:51:34 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:52647 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392748AbhASBvZ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Mon, 18 Jan 2021 20:51:25 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1l1gAL-0035kK-1y; Tue, 19 Jan 2021 02:50:40 +0100
Received: from p5b13a61e.dip0.t-ipconnect.de ([91.19.166.30] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1l1gAK-002IqR-Ec; Tue, 19 Jan 2021 02:50:40 +0100
Subject: Re: [PATCH] ia64: add support for TIF_NOTIFY_SIGNAL
To:     Jens Axboe <axboe@kernel.dk>
References: <d3a2aa1e-0fae-1d3f-519f-d32adc608c38@kernel.dk>
Cc:     linux-ia64@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <71d32a91-c429-7405-f4a6-58c74eb898bf@physik.fu-berlin.de>
Date:   Tue, 19 Jan 2021 02:50:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d3a2aa1e-0fae-1d3f-519f-d32adc608c38@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.166.30
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Jens!

On 10/29/20 5:15 PM, Jens Axboe wrote:
> Wire up TIF_NOTIFY_SIGNAL handling for ia64.
> 
> Cc: linux-ia64@vger.kernel.org
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
> 
> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
> for details:
> 
> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
> 
> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
> as that will enable a set of cleanups once all of them support it. I'm
> happy carrying this patch if need be, or it can be funelled through the
> arch tree. Let me know.
> 
>  arch/ia64/include/asm/thread_info.h | 4 +++-
>  arch/ia64/kernel/process.c          | 3 ++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/ia64/include/asm/thread_info.h b/arch/ia64/include/asm/thread_info.h
> index 64a1011f6812..759d7d68a5f2 100644
> --- a/arch/ia64/include/asm/thread_info.h
> +++ b/arch/ia64/include/asm/thread_info.h
> @@ -104,6 +104,7 @@ struct thread_info {
>  #define TIF_SYSCALL_AUDIT	3	/* syscall auditing active */
>  #define TIF_SINGLESTEP		4	/* restore singlestep on return to user mode */
>  #define TIF_NOTIFY_RESUME	6	/* resumption notification requested */
> +#define TIF_NOTIFY_SIGNAL	7	/* signal notification exist */
>  #define TIF_MEMDIE		17	/* is terminating due to OOM killer */
>  #define TIF_MCA_INIT		18	/* this task is processing MCA or INIT */
>  #define TIF_DB_DISABLED		19	/* debug trap disabled for fsyscall */
> @@ -115,6 +116,7 @@ struct thread_info {
>  #define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
>  #define _TIF_SYSCALL_TRACEAUDIT	(_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT|_TIF_SINGLESTEP)
>  #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
> +#define _TIF_SIGNAL_NOTIFY	(1 << TIF_SIGNAL_NOTIFY)
>  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
>  #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
>  #define _TIF_MCA_INIT		(1 << TIF_MCA_INIT)
> @@ -124,7 +126,7 @@ struct thread_info {
>  
>  /* "work to do on user-return" bits */
>  #define TIF_ALLWORK_MASK	(_TIF_SIGPENDING|_TIF_NOTIFY_RESUME|_TIF_SYSCALL_AUDIT|\
> -				 _TIF_NEED_RESCHED|_TIF_SYSCALL_TRACE)
> +				 _TIF_NEED_RESCHED|_TIF_SYSCALL_TRACE|_TIF_NOTIFY_SIGNAL)
>  /* like TIF_ALLWORK_BITS but sans TIF_SYSCALL_TRACE or TIF_SYSCALL_AUDIT */
>  #define TIF_WORK_MASK		(TIF_ALLWORK_MASK&~(_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT))
>  
> diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
> index 6b61a703bcf5..0e0146daa88d 100644
> --- a/arch/ia64/kernel/process.c
> +++ b/arch/ia64/kernel/process.c
> @@ -171,7 +171,8 @@ do_notify_resume_user(sigset_t *unused, struct sigscratch *scr, long in_syscall)
>  	}
>  
>  	/* deal with pending signal delivery */
> -	if (test_thread_flag(TIF_SIGPENDING)) {
> +	if (test_thread_flag(TIF_SIGPENDING) ||
> +	    test_thread_flags(TIF_NOTIFY_SIGNAL)) {
>  		local_irq_enable();	/* force interrupt enable */
>  		ia64_do_signal(scr, in_syscall);
>  	}
> 

This change broke the hpsa driver on my RX-2600 ia64 workstation in the sense that the
driver no longer loads and hence hard disks are no longer recognized.

Any idea what could be wrong?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

