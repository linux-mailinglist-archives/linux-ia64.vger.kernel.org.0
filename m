Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4715734651B
	for <lists+linux-ia64@lfdr.de>; Tue, 23 Mar 2021 17:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233226AbhCWQ23 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 23 Mar 2021 12:28:29 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:45875 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233271AbhCWQ2L (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 23 Mar 2021 12:28:11 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lOjt2-001cJc-6N; Tue, 23 Mar 2021 17:28:08 +0100
Received: from p57bd9564.dip0.t-ipconnect.de ([87.189.149.100] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lOjt2-0008Jq-04; Tue, 23 Mar 2021 17:28:08 +0100
Subject: Re: vmlinux link failure on ia64 with zstd
To:     Ben Hutchings <ben@decadent.org.uk>, linux-ia64@vger.kernel.org,
        Nick Terrell <terrelln@fb.com>
References: <f0a93b2d435252b3878ce821142677754f5e434c.camel@decadent.org.uk>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <bf540b24-6111-6523-17f6-aac21349fd8b@physik.fu-berlin.de>
Date:   Tue, 23 Mar 2021 17:28:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f0a93b2d435252b3878ce821142677754f5e434c.camel@decadent.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.149.100
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Ben!

On 9/13/20 9:51 PM, Ben Hutchings wrote:
> Enabling CONFIG_RD_ZSTD (which is enabled by default) resulted in a
> link failure on ia64:
> 
> + ld -r -o vmlinux.o --whole-archive arch/ia64/kernel/head.o init/built-in.a usr/built-in.a arch/ia64/kernel/built-in.a arch/ia64/mm/built-in.a kernel/built-in.a certs/built-in.a mm/built-in.a fs/built-in.a ipc/built-in.a security/built-in.a crypto/built-in.a block/built-in.a lib/built-in.a arch/ia64/lib/built-in.a lib/lib.a arch/ia64/lib/lib.a drivers/built-in.a sound/built-in.a net/built-in.a virt/built-in.a arch/ia64/pci/built-in.a arch/ia64/hp/common/built-in.a --no-whole-archive --start-group --end-group
> ld: lib/zstd/entropy_common.o: linking constant-gp files with non-constant-gp files
> ld: failed to merge target specific data of file lib/zstd/entropy_common.o
> ld: lib/zstd/fse_decompress.o: linking constant-gp files with non-constant-gp files
> ld: failed to merge target specific data of file lib/zstd/fse_decompress.o
> ld: lib/zstd/zstd_common.o: linking constant-gp files with non-constant-gp files
> ld: failed to merge target specific data of file lib/zstd/zstd_common.o

It was suggested on IRC (#debian-ports) that we need to pass "-mconstant-gp" to GCC at
the right places and it seems this issue existed before in the past [1]. Fix seems
trivial.

Adrian

> [1] https://marc.info/?l=linux-kbuild&m=133643269731499&w=2

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

