Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2733462AD
	for <lists+linux-ia64@lfdr.de>; Tue, 23 Mar 2021 16:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232314AbhCWPTe (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 23 Mar 2021 11:19:34 -0400
Received: from mout.web.de ([212.227.15.3]:47477 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232733AbhCWPTd (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 23 Mar 2021 11:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1616512772;
        bh=2EiBmYz7QBjO0jusrGK9kSY1CPYiwLCsmkPvol1L7BM=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=EFkAk96Q+DP7oSIY2e+eratRp3obgr81KA+YVKRG8Wz93uCiuOUsqB5yipl4OuKlI
         lEavIrTfEYDo56xYPtB5+LLRufT9BvDrDWTcVhAm7KDckjhiwn8LwXPhYtoVsQ8Jwd
         N4haHgGdsAlronbCzFyJXqqLoqHzc5AtDNXkRAYU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.22] ([217.247.37.206]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MCIYT-1lXpQ62vLt-009Cck; Tue, 23
 Mar 2021 16:14:15 +0100
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org
Cc:     hch@lst.de, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
References: <f3d9d882-dd22-1782-6ec8-c88cb1880a83@web.de>
 <1d62aadd-67b6-da13-53cc-4b5213de8937@physik.fu-berlin.de>
 <d199ce26-2348-5e2d-8f60-290e6aeff685@physik.fu-berlin.de>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <52397fc7-a701-7bcf-ea74-1fd2875a62ac@web.de>
Date:   Tue, 23 Mar 2021 16:14:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d199ce26-2348-5e2d-8f60-290e6aeff685@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WIQxHNrtn4wN6szkP/11WZ7eDQaYwxXzLW6U7qIOREx6VyU/nQf
 mt2uuUQ6NEduUplGkkXYZ4njTQCSaPw8uQ/2y+J1DL9kawp+K8fEar+3fB+TBRcmSwJfPBD
 SyXuXBSNyBiwzJtA1W+baiYyZY6QLUetnZYb7TdXXcPtygPHzLGNm+BOAejgiPoQ4Hy/PCI
 r+8ZQ90e6DoYzzB/TZMBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D1LE06/iiaY=:noMi8GPtqA7tTlerBnt9NQ
 hmIhVeJUz/kc1PNll1Nz6eaCOFRkb5Fi9xVu23lccRZVVrG62zdNEKtpLjLpuL9yLqws4aAPu
 2d3ejp9/2JHA0BzA5cXm4vnpR75p8tTmJIYMBuVLMD1filYEmSKJFJVVKHiFVNXVB+gcl7vDQ
 1dHssbOHYczkrkCS3EBReWDEpRH9C05dBdn2z6PkkVe4uMNc41r8QKdxDdgXfOnDOEhXDL8et
 L9o6OQ7AwOO8TwFUExnudtz6nmoCsacKdyYPXI6KnrXG2nxExHjgsQkzL7tF1WqQ7Kf2dc3fF
 zq9kUfMX2m4BxgNYl5/AlXvaZdQ3+hCLnDWfXI5kjVfl1aS0PA5j5pHxCaXOkiEWSQxY8fjfE
 WefUyL4tafYGHhEvU9kJaXFkdNt2MGt8EzCtl97yQT+XUYfc8/Z32GWggmoMNd8paiMUYcaJw
 SvWjqIbu5YsyB9/QgWfA0Mpd9pZNotBSDkoyC29FV7jEj3ES22Civ1XhA/pzD/TJ+Gf3NBnIp
 czyJyTtJFpRn+jY0/n/8ybsIpcG5OR3feAqf7Pb5NSGpSVrRfnilz1A32rWCKx3YsCy4Gah+H
 ekEBeggylRK6QcIAk9rvx41I9jx4kHWqFnmX/+f2s2bXo2TUZ+TGH6JjwKIjd0gkzpJGhkUtg
 BcBnZlMgMeQIorwXmuIlSaarO88wBNEIo0tP+2ZDzRcB5D/5lPFnbB8LDPtqvUD10m6nZPI/h
 +HP6ia5Yimh+nd3lqyG01NV2979OsqK/dVo9AaWu0NVL1w3vIiJCANxI6KfTPTGa7GBNWkfdz
 8n8ziEY+ucq5ujEauHT2EFngoZkswKD0PsNxS67p4NhNgf+SDfClDFpos/Y/k68H50aghTpUt
 xq1+nxjEnZs6uIMbaJREGcQQR+M4LbAFn3zJhqOgCoPltjnrWH4YqeCtZ1OXcxTXkbrWo3Oeo
 IZJJzXt0+wtSnSB6tNd0H1NMyEfPLABM/o9Po6tP2F5jJ6qbvzsNdcXetvOZ0cQ1ulgPtrsYl
 48WdVkQntOfzKOYAwmYctrhvycKhomyIDnHwyx57XZFQZtyG3nrqmDWjPZSgjGExHiEViUTVm
 S2AqtDo2PmjBYnh8xu5bwGzYONmtjOExONaBesyY6kpKCym/1uZnpRoaN24EYUve3LpRzKjfc
 v6nJOfOWI4ZuXYk26HSijk7Sj+CuiEcrzaJriECV/pqNiVkLA1xvRiZhqWFm3QPqxbt2N6DNQ
 DiEr84swDLFtHGS5O
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Adrian,

On 23.03.21 16:02, John Paul Adrian Glaubitz wrote:
> Hi!
>
> On 6/25/19 8:40 AM, John Paul Adrian Glaubitz wrote:
>> On 6/21/19 10:08 PM, Frank Scheiner wrote:
>>> recent testing of a Debian v4.19.37 kernel showed a problem on my rx28=
00
>>> i2 happening during kernel boot:
>>> (...)
>>> [1]:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commi=
t/?id=3D543cea9accd9804307541cb93d3ed7ec94b07237
>>
>> Do you have any idea what could be the reason for the issue introduced
>> by your above commit? James Clarke has guess that it might be GFP_DMA32
>> which isn't being set properly anymore for the affected machines.
>>
>> Do you think we could test a kernel which just sets the flag unconditio=
nally
>> to see whether this is the problem that causes the issues on these mach=
ines?
>
> Just as a heads-up: This issue has magically fixed itself and a current =
kernel
> with some additional minor fixes applied boots fine on these machines ag=
ain [1].

Thanks for he pointer, I already noticed your email to the debian-ia64
list some minutes ago. That's great news! :-)

If time allows today I might give it a try in my rx2800 i2, which ATM
just sits a meter away from me, but I'm still testing kernels on one of
my V245 machines.

Cheers,
Frank
