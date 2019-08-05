Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA364813FF
	for <lists+linux-ia64@lfdr.de>; Mon,  5 Aug 2019 10:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfHEIQT (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 5 Aug 2019 04:16:19 -0400
Received: from mout.web.de ([212.227.15.14]:42149 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726659AbfHEIQT (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Mon, 5 Aug 2019 04:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1564992973;
        bh=z5b7MRiiwhYhDx9UNM3ui8KDb4Zp7pZDbMnheGyK40k=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=eriSW88LNTWl3oQi3Dp6Wlml4lLU966tQozzXWIAsA6+YziYxhfofnfR7qVA59ClQ
         hjQqSL8FJI65IMPv7kdPadjw3LGPuHF9Cuk/EX9hKEI0zGWw3I/HT80yJ4N6f7lxLi
         4yUVuFlYJQqedlAmVE5Y02SIeOAo+lQt9AwTzVbI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.21] ([217.247.40.188]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M3jof-1iBfLA1njV-00rKNI; Mon, 05
 Aug 2019 10:16:13 +0200
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
To:     Christoph Hellwig <hch@lst.de>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
References: <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de>
 <20190625104702.GA2569@lst.de> <a2ab92b3-e89d-a610-91d1-5ea626be4995@web.de>
 <0f76468f-8648-62d8-68d2-455c74c19328@physik.fu-berlin.de>
 <20190625120024.GA3979@lst.de> <000348b4-0786-9ebc-e79e-28815fa9890c@web.de>
 <20190625144009.GA7281@lst.de> <80470803-d475-815a-c95a-f9961fde5d97@web.de>
 <20190628062619.GA27873@lst.de> <6ecf5f63-6b77-2836-79ee-258438ba4bd0@web.de>
 <20190805071012.GA15366@lst.de>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <a837ce98-3357-65b5-17aa-86acdb0e92a4@web.de>
Date:   Mon, 5 Aug 2019 10:16:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190805071012.GA15366@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c35Pfnlnkt3fmtPY2OdRFrWRLeuBgnWLvP9fCdO7VuznlecRJ57
 lagwLXZKIV0e5F/m1iFZdWWxTlQW8HXKq8HePhEJm52R8iZ8G0i7Sw5WKu3oeapNLkuFEUt
 StSwMEsKzfmWLZpuPHw5TDJa7kT5qEe8pgppC9sfRV4j1/7Vbytbx28t2lfV/35E/RipDl5
 7sBPDB+r3J2Uuo1bPXBNg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TH9YZP0kmNM=:jrqdGOq9X47g9WrTDpR/BR
 3v0q6JJ2o3RXDkFr5b8m1O2Jh4De9d0DN0GS4EWrqUi9gga0zW15ymyM9SPZlQDpSYJW47enJ
 4TBMWU47smKIs6g34ZRqwxo5jAtNWHjo2KXDESnpTVLJim6JNW63m+jl5VMEH81bsnAljxvdx
 7N5iRigcrdgAVRh535zbzjGJtz9HMHQMJKqEkIn0NmZQEwQfvNqM2YArF5FqeIcehstMk+o5N
 iemxJrCx537/8EPzyhq8J3LO/qbf7716Es1D4ihAcykU6HCD/HQxzmKYzQVN7elAB+duLWFF0
 r+5BbM3awtRZHZMaXZVDR2tWdTgCcnPwHnGtZw8oYv6kEZyF/EghfBXyFPjDeJ6+kfSOw77Zg
 Bc1iMl5169CaWXT/nRE8PxBnNNwaDBEN1yygmhe1079fQtCpV60sR+kzUTDvCTOtk1dvb02zY
 cPKXZan9kI0Grcwtp8rbev48R4beol8gxECItJplmPzyS6ekl0fZQ5vTEMuUZhjwRTpO/Ypgj
 tyOT0hHSax77iLqvVdQ6kMMCQU5lcqpA1e1fRnysDl3/5CvqZGApj2OTkBU2tKiGyJ3zl7Zg1
 r0zzDUyx7cKDpcPTP9gK6lRNyE7gAoEvw1uUJkGNXfe7qlgvzLrmKq7QNe0K5U9/DV19zr7WF
 IsgAGIdDReP7hMdGkX27dFqXw2iKdFCC2HbAgO+0WKodMIxv2u74BH8R6pHS/oYk5mpaSFfim
 4aQxVc3mtR7jvzNh8JQHBRvTdboX+JqnqFhYl10wzGqxXAFf5+DfwgfKlauM0oDr7fDBBP68F
 8fk/nIaCwoYpo+mLDE+7IdvcU4wvxhcAR5nmzurZ0yRM9nYzJQItovdcIF8tD4DWeie1kd5jI
 UQTOlPIEvnGjyUKyr/tKTTYtBl1ZRnqddH9gr1TOSxe3ThcxaNlVQJVBpMP48n6s+z1szYioL
 Kl8K6nybWfcz2UfucI9GTnkO4GuaqAXxSLtbkfDVTMzUfuI2eblda1y02VThIPok5li4lUchK
 3MEzHngAOZR+F77KJ1e7tdCDrzPbzhgpwgDELmpam9CiUOcawlxptQbN3VIkbuZJPtadBZWPm
 hiOxGkQoICkyfvYyWa8r27GYXLu3xFJtQf7YjtH98sI135qKpr9FnIowXEGdwn71NBoD7qsOf
 oG9dE=
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 8/5/19 09:10, Christoph Hellwig wrote:
> Seems like we dropped the ball on this..

I still need to test the possible "disable CONFIG_NUMA" workaround. If
that works for my single processor rx2800 i2 it could be a good
workaround for now, as I assume the older Itanium systems (<=3D Montvale)
won't be affected by such a config change unless they're using those
ccNUMA sx1000/sx2000 chipsets.

>
> Did I give you a patch like this (for 5.2 and probably earlier, won't
> apply to 5.3-rc) to test before as that is anther idea?
>
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 2c2772e9702a..e471158c7c6e 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -119,7 +119,8 @@ struct page *__dma_direct_alloc_pages(struct device =
*dev, size_t size,
>   		}
>   	}
>   	if (!page)
> -		page =3D alloc_pages_node(dev_to_node(dev), gfp, page_order);
> +		page =3D alloc_pages_node(local_memory_node(dev_to_node(dev)),
> +				gfp, page_order);
>
>   	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
>   		__free_pages(page, page_order);
>

It's not the exact same patch as from [1], but the resulting code is
identical if I didn't make an error.

Cheers,
Frank

[1]: https://marc.info/?l=3Dlinux-ia64&m=3D156147364328197&w=3D2
