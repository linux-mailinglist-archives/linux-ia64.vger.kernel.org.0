Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A82D52455
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 09:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfFYH0N (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 03:26:13 -0400
Received: from mout.web.de ([212.227.17.11]:37799 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbfFYH0N (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 03:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561447562;
        bh=YC2DXzHLnPyIZiWvSbPNQfw8h/ubC3eKuDZdws0Drps=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Bn1QJoVxrmdCFNHdlWnIseYL3YRppD8iBaNdFMm9hF5eDVbeSOl08yCiEMIvZqQuy
         qFs0rei/z+6WtuEBb6oZoqFrgBEV3eGeSHW+/8hjHJuyufV3qZ6LEg6WzesAbdeEKr
         m42tz3oOnvvqS/NgBZULgGLl8fkkh4bvne/sq604=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.21] ([217.247.38.146]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MEVYz-1hm2hn07L7-00Fk0v; Tue, 25
 Jun 2019 09:26:02 +0200
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
To:     Christoph Hellwig <hch@lst.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
References: <f3d9d882-dd22-1782-6ec8-c88cb1880a83@web.de>
 <1d62aadd-67b6-da13-53cc-4b5213de8937@physik.fu-berlin.de>
 <20190625064218.GA29841@lst.de>
 <7f701503-7bd3-28bf-d7e6-d52d3fd168ee@physik.fu-berlin.de>
 <20190625065003.GA29883@lst.de>
 <87311b3d-748d-57e1-21cc-89774bf71a4a@physik.fu-berlin.de>
 <20190625065905.GA30073@lst.de>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <5939b8fa-8f3b-fa30-aeb0-d19c6baf89da@web.de>
Date:   Tue, 25 Jun 2019 09:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625065905.GA30073@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5RquG9qFvKzdmFqgSr+hqYkaynUbROaNuHVp742aF71uP+5ab1T
 x8JGz/3aawqnlGdZZIsOzhyDeYwMs7j4Yeetk4EI+bSDQv6e5f5bcJ2ADV3JrZLSsyUO8xd
 IYdU1mRYfl4LWsI4n++4E6fRZynr4KRJaJDRYPo5THDfdWoFjmVPzoTdnmlfgsNpOKIYc01
 NlAAyJQ05Xd56yGxmKs/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VxEmpDnXHo4=:FvU6+VbN2xC/9c6aHVqoxN
 eY8tG1CvMoUxqsA9wzDfxyHtpO/rSZF8Xjk4vAqdU3KboBpGSfAx0Sr/QTIm2f/3VCPWZg/7K
 ovlWOJcJC8xH8YQ9HIzxaaTaF0noq4PHw9jYwVm7adGx8DoGpbTSxe62u1tEEZL/8Ri0qasQS
 Y/lTy39DFrthLpZIQs0BKc3b8c+m2rd3z8w18bHeKOCBvBi8sDIH4FSu2bc4Pl9a6tn9XUWcb
 Jdy/OVvS56A0Pf0VFZql8BtFlop7Crp7Y8f9pB5vIxli7qCeqbH9QCMpbnuSbfmF1yrkHUxyG
 RcMlMOGdmkHDVLBC4KGnwTZuRLZgkvGWg2jHwHJS8FPUyQyr6ESCjWFDC2F+nMJAz9wCE5Qni
 g7HrUEvcJp5V+uczqyMDFdkCUxpjpjNsOue9DT18Lcf/6oTi9k/ttn2v9fVHsoSy8LILHsTHx
 5M629roDzA9ivcPUicxPhOUceVqe539dCIsZWVz/6SQXB8UIdcbuIuuA/08kvvj1aomduXOaT
 xZBdf7BBDxlkqcSqppVq4zEXoXI/wpx4Yy2ZNuSp+Fr1fI/34amQSnXF7qk4UGiy7NLE7L79Y
 W51HrpDAO2EX1uKpmD/x+2wgx/6FLEipr7CY74kpOckuxGQ1GEb0KpBItFw4G1D3BBIhMeT6E
 uLYn2NW9QyU4HZvtLiYjEKshE8lYsaDRRukH799o+zVPGpQiP0EnbupaVVzE4Ybp/8UaKAV9y
 8j2ZMXuf307a1MmRKbjC6D0m8XWcU2tkk8Qoc4aIVpt9cq80H81QKAKQIBoY2WkNhrXLjpZge
 QKJ0AUrxEFyWNVX+9y+lAk7JU/xanEcpA2rqJR3d2smJfwnGyjdfGL4QnKum+eREt8M+nxUYP
 0uWG94sadgA0jQXsvxHNBuBxjTbj6H6eoxfrpzp7t5waK5eyYUqTXh3uRLB9EfsmWVYiML9FB
 2BFHhhJZNo/hWUGLGAmvqTel5GkpvHR7tUY22/C3SpmdEklov+9qeXUCA8tl+ptnUIuUJZy5s
 aNhcephDpcg0pAKCGtktCaW5hUj0xsoKq54shbI9rBHdwlaswgqSdb2x61F9QsFNhGxAMMufH
 NRH/kTfEtHoXGyaiwDBGfpTJCLeVz+nQMcV
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 6/25/19 08:59, Christoph Hellwig wrote:
> On Tue, Jun 25, 2019 at 08:54:11AM +0200, John Paul Adrian Glaubitz wrot=
e:
>> Okay, thanks. I'll whip up a patch for Frank to test.
>
> The one below should do it, but from looking at the ia64 zone
> initialization I'm not sure this will be the culprit.
>
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 2c2772e9702a..3e802f4580b3 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -82,9 +82,7 @@ static gfp_t __dma_direct_optimal_gfp_mask(struct devi=
ce *dev, u64 dma_mask,
>   	 */
>   	if (*phys_mask <=3D DMA_BIT_MASK(ARCH_ZONE_DMA_BITS))
>   		return GFP_DMA;
> -	if (*phys_mask <=3D DMA_BIT_MASK(32))
> -		return GFP_DMA32;
> -	return 0;
> +	return GFP_DMA32;
>   }
>
>   static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size=
_t size)
>

Ok, will apply that to the most recent non-rc kernel source and give it
a try. Should take about 45 mins or so.

Cheers,
Frank
