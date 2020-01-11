Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C14C5138284
	for <lists+linux-ia64@lfdr.de>; Sat, 11 Jan 2020 17:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730371AbgAKQpn (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 11 Jan 2020 11:45:43 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:50604 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730347AbgAKQpn (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 11 Jan 2020 11:45:43 -0500
X-Greylist: delayed 495 seconds by postgrey-1.27 at vger.kernel.org; Sat, 11 Jan 2020 11:45:42 EST
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
        by vmicros1.altlinux.org (Postfix) with ESMTP id 95A8172CCEA;
        Sat, 11 Jan 2020 19:37:26 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
        id 6F6437CCE30; Sat, 11 Jan 2020 19:37:26 +0300 (MSK)
Date:   Sat, 11 Jan 2020 19:37:26 +0300
From:   "Dmitry V. Levin" <ldv@altlinux.org>
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>
Cc:     Elvira Khabirova <lineprinter@altlinux.org>,
        Eugene Syromyatnikov <esyr@redhat.com>,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PING PATCH] ia64: fix syscall_get_error()
Message-ID: <20200111163726.GB22612@altlinux.org>
References: <20181203031725.GA11573@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181203031725.GA11573@altlinux.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

PING

On Mon, Dec 03, 2018 at 06:17:25AM +0300, Dmitry V. Levin wrote:
> According to documentation in include/asm-generic/syscall.h,
> syscall_get_error() should return -ERRORCODE if the system call failed.
> 
> This change fixes syscall_get_error() implementation on ia64 to match
> its own syscall_set_return_value(), the documentation, and other
> architectures where syscall_get_error() returns a non-positive value.
> 
> Fixes: cfb361f13c81 ("[IA64] utrace syscall.h support for ia64")
> Cc: stable@vger.kernel.org # v2.6.27+
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> ---
>  arch/ia64/include/asm/syscall.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/ia64/include/asm/syscall.h b/arch/ia64/include/asm/syscall.h
> index 1d0b875fec44..4ccf888c083d 100644
> --- a/arch/ia64/include/asm/syscall.h
> +++ b/arch/ia64/include/asm/syscall.h
> @@ -35,7 +35,7 @@ static inline void syscall_rollback(struct task_struct *task,
>  static inline long syscall_get_error(struct task_struct *task,
>  				     struct pt_regs *regs)
>  {
> -	return regs->r10 == -1 ? regs->r8:0;
> +	return regs->r10 == -1 ? -regs->r8 : 0;
>  }
>  
>  static inline long syscall_get_return_value(struct task_struct *task,
> -- 
> ldv

-- 
ldv
