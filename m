Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74DD634623A
	for <lists+linux-ia64@lfdr.de>; Tue, 23 Mar 2021 16:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbhCWPCb (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 23 Mar 2021 11:02:31 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:52057 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232314AbhCWPCL (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 23 Mar 2021 11:02:11 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lOiXo-0016t3-ED; Tue, 23 Mar 2021 16:02:08 +0100
Received: from p57bd9564.dip0.t-ipconnect.de ([87.189.149.100] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lOiXo-00465u-4U; Tue, 23 Mar 2021 16:02:08 +0100
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Frank Scheiner <frank.scheiner@web.de>, linux-ia64@vger.kernel.org
Cc:     hch@lst.de, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
References: <f3d9d882-dd22-1782-6ec8-c88cb1880a83@web.de>
 <1d62aadd-67b6-da13-53cc-4b5213de8937@physik.fu-berlin.de>
Message-ID: <d199ce26-2348-5e2d-8f60-290e6aeff685@physik.fu-berlin.de>
Date:   Tue, 23 Mar 2021 16:02:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1d62aadd-67b6-da13-53cc-4b5213de8937@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.149.100
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi!

On 6/25/19 8:40 AM, John Paul Adrian Glaubitz wrote:
> On 6/21/19 10:08 PM, Frank Scheiner wrote:
>> recent testing of a Debian v4.19.37 kernel showed a problem on my rx2800
>> i2 happening during kernel boot:
>> (...)
>> [1]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=543cea9accd9804307541cb93d3ed7ec94b07237
> 
> Do you have any idea what could be the reason for the issue introduced
> by your above commit? James Clarke has guess that it might be GFP_DMA32
> which isn't being set properly anymore for the affected machines.
> 
> Do you think we could test a kernel which just sets the flag unconditionally
> to see whether this is the problem that causes the issues on these machines?

Just as a heads-up: This issue has magically fixed itself and a current kernel
with some additional minor fixes applied boots fine on these machines again [1].

Adrian

> [1] https://marc.info/?l=linux-ia64&m=161651097316856&w=2

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

