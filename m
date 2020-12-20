Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920D22DF685
	for <lists+linux-ia64@lfdr.de>; Sun, 20 Dec 2020 19:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgLTSmf (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 20 Dec 2020 13:42:35 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:48451 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726805AbgLTSmf (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Sun, 20 Dec 2020 13:42:35 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1kr3eT-000cVP-K0; Sun, 20 Dec 2020 19:41:53 +0100
Received: from p5b13a238.dip0.t-ipconnect.de ([91.19.162.56] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1kr3eT-000cIC-Er; Sun, 20 Dec 2020 19:41:53 +0100
Subject: Re: where to start with ia64 kernel
To:     Anatoly Pugachev <matorola@gmail.com>
References: <CADxRZqwfMr9==xFQaaEOk7jYVoROEEyQ_12KpBCtwL3SXoCM-A@mail.gmail.com>
Cc:     linux-ia64@vger.kernel.org
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <202178aa-7f8d-5c77-115d-3390614e7500@physik.fu-berlin.de>
Date:   Sun, 20 Dec 2020 19:41:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CADxRZqwfMr9==xFQaaEOk7jYVoROEEyQ_12KpBCtwL3SXoCM-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.162.56
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Anatoly!

On 12/20/20 7:13 PM, Anatoly Pugachev wrote:
> I have Integrity BL870c i4 blade installed with debian sid, somewhat
> working 4.15/4.14.x kernel series...
> 
> 4.16.x kernel (and more recent ones, including latest git) does not boot ...
> tried to bisect (but some kernel revisions does not even compile - git
> bisect skip).

Any kernel newer than 4.14.x will not boot on large ia64 NUMA systems due
to the changes in 543cea9a [1][2]. This bug does not affect systems like
the RX-2600 which boot Linux 5.9 just fine.

There are two minor regressions in 5.10, one has already been bisected [3]

> Does it make sense to try to start reporting bugs and hangs with ia64
> 4.x kernel series, being 5.10 is out...

Not really as 5.9.0 boots on smaller systems like the RX-2600 and the issue
with the larger systems has already been bisected to 543cea9a.

The problem with the regression you are seeing is that multiple attempts to
fix the issue have so far failed and we haven't found a working fix yet.

Adrian

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=543cea9accd9804307541cb93d3ed7ec94b07237
> [2] https://marc.info/?l=linux-ia64&m=156144480821712&w=2
> [3] https://marc.info/?l=linux-arm-kernel&m=160832710326221&w=2

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

