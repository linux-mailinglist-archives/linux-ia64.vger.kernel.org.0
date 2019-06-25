Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94AE154CA3
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 12:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfFYKqq (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 06:46:46 -0400
Received: from mout.web.de ([212.227.17.12]:57517 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbfFYKqp (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 06:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561459600;
        bh=6p5rMWLHjvwa0SZMOtix4O/67I8XYHWXa0Vc440clRg=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=NKAbl/PfElzQEaizszVF3SJ3HpAd+mVGaGhAq3SwpuCUbhB4M2mWTfgyNV1Weq1AS
         kZOxBq9vGo21QCAe07xD83WLnNkO/awXOn66cwXYh8nZS6VFN618UxEsmV2aD9ATBx
         kiXQ2ijdCg4WvGd+5kZPFI4P0f1WTJQPhkV3CBUg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.21] ([217.247.38.146]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lp6xk-1iBTHg39pk-00eqwE; Tue, 25
 Jun 2019 12:46:40 +0200
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
To:     Christoph Hellwig <hch@lst.de>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com, frank.scheiner@web.de
References: <20190625064218.GA29841@lst.de>
 <7f701503-7bd3-28bf-d7e6-d52d3fd168ee@physik.fu-berlin.de>
 <20190625065003.GA29883@lst.de>
 <87311b3d-748d-57e1-21cc-89774bf71a4a@physik.fu-berlin.de>
 <20190625065905.GA30073@lst.de> <5939b8fa-8f3b-fa30-aeb0-d19c6baf89da@web.de>
 <cce09bfe-0179-4ce7-4488-09c66b968628@web.de> <20190625081825.GA31752@lst.de>
 <c5412a03-e3ce-eecd-737f-119c7d955ed3@web.de>
 <60d38f5f-4867-ee1d-783c-ae162e25bea9@web.de> <20190625103232.GA2132@lst.de>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de>
Date:   Tue, 25 Jun 2019 12:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625103232.GA2132@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Dgm1CMFP4e/09vdDmTn1yGTkDBjZyLkdQSVW+dQP1NaktZ4MXdO
 ki4Ud9z2tt/6+syy4HuW3hYFLC5NvsFRiCIcYHMKKDoMFq8BjFX5Ytc7AdzfJrW31CrLnoq
 yGZ3gSqJW3BIQNKzmaFhvPHrHWretHKAPC7olDbgryJyyaG9bNgeO7nCzKohuXzUoOTX367
 4gJjrDDHlDgew38r6ynmg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:npYiu3q0Qb4=:5zrx2P5JMSq2WiWtZMjOoV
 avtmL3y+hFmsYoxJLEzf0NI61aPJa4WpujFQZzSq9mYuPOEPb7TQ34ny/VAh7125fCSOkQIGn
 c3KkNlUx6eNwv08Wz3oXLtoC6zil7Vofgpg4g3/jF5EHIZnEkHfV2Iv3G+4YFt3Cmh7cTPdo5
 LlRBXTL3vTCzUOZIKvMp1aK6TY0FalOAhHtC4bgztP8AFt9oJLvmAO2ATeuGIx21EA6c59OXD
 w8+5arSh0zCNaDzjwP+sxZ4VvRs4sLxdy1jCu1tF9N2fhVGuAyn7aCAUUcUf8mnDStxXa9+2H
 e2saLa14CoRFoiDHetPaojD+7asIdasb39NxWIYfdIixE9Bo3yMHrJOcYbqVel29f0dU9gges
 nsrUlubi1cLeojB4J5dFS3ocnO9JDR3KyLTRvIcvcmwLrWnyzGzX/tQXocXzE6gGIJ4kyb1cq
 65NqflkyDcxN4iV86DudjhHqSeS3b6D5koMVmUgG8p734DcqUUoX0jgAYTloT/PQXSXAVp/az
 9+RYOrs/DFWZ1ShBzlo2S1alwcmcxtV62L/pi+1dXR6JtshDYdxkI/McXjg1CrHDkbXtq/9+a
 tX+wlg+FV+mQLZIlxBzwfOZxEkieYX7OR6c8tgZ13TQzSCISHxtgEMxXW6+D2EW5nsqQf1jeG
 KZM2Hi1eIkgQVB2dYaLz8eTl2b/vvvKHjBKBAjMGWGf1w3ki72ZEavZZpL17WZp+NHbH0mx58
 qv2g66qg7vQbXObfxRLLSrAWBOzn0PEsnyBZB/PdcBDJbEWNORSmab/3cDJE1c39cIzNGCl9p
 oYYBmFUnGWlhXXPwTUIs1HRQPVKXVMG6Uh9Jls4s3f56iNSKAhBtTJbcEFUJGS9OdfWqmAfbm
 Ex+jBv4WuXl5UJ3vOVxI0d7LpLlwdiwdm9tYmMWhOjZwZh6+7MIOGhYQO/a+LJcHUnrkLS7It
 r4O+er96YP291XKiawTl6lpKWlu+rdX80Ko2cy7tsW4KXDwl9RrzG
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org



On 6/25/19 12:32, Christoph Hellwig wrote:
> Thanks Frank.
>
> It seems like there is something odd going on with the zonelist
> on your system.  Maybe there is not actual ZONE_DMA32, or something
> is messed with the numa node setup.

Do you suspect a firmware issue? Because the firmware of that machine is
actually quite old (the model was retired in 2015):

```
***********************************************************
* ROM Version : 01.93
* ROM Date    : Wed Sep 12 22:10:03 PDT 2012
***********************************************************
```

...but since HP has a different opinion about what is considered part of
the hardware and hence should be "corrected" by the manufacturer in any
case without asking for large amounts of money, I have no means to
upgrade it.

>  Below is a band aid patch to
> try theory number two above:
>
>
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index fcdb23e8d2fc..8e3f7b8bdb33 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -119,7 +119,7 @@ struct page *__dma_direct_alloc_pages(struct device =
*dev, size_t size,
>   		}
>   	}
>   	if (!page)
> -		page =3D alloc_pages_node(dev_to_node(dev), gfp, page_order);
> +		page =3D alloc_pages(gfp, page_order);
>
>   	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
>   		__free_pages(page, page_order);
>

Ok, will try that patch - actually (1) in addition or (2) without the
first one?
