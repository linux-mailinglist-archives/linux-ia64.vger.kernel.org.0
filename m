Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8706554D64
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 13:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbfFYLTq (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 07:19:46 -0400
Received: from mout.web.de ([212.227.17.12]:36145 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727227AbfFYLTq (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 07:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561461581;
        bh=XHP3GcFlgsYP4AA34tRChMSke/EnS+ajFtPA6pJFMR0=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=PKgXV3I/zL3x3955J/93DOaQSTZCIGM0S2gmExIijNJu3aiFSaVC6oWMkkYS49NyQ
         UQ1mucZP03dtJoTdAaKl5doCrkNFamJWpj5Mp4696nJnB9IYU6XILLUEMmakZp8Aao
         bm6kGu1XvI8/GB/5BCcDJUpVGNvecdJtpXySnBkI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.21] ([217.247.38.146]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MEmc2-1hlqAY3iAs-00G0Ch; Tue, 25
 Jun 2019 13:19:40 +0200
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
To:     Christoph Hellwig <hch@lst.de>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com, frank.scheiner@web.de
References: <20190625065003.GA29883@lst.de>
 <87311b3d-748d-57e1-21cc-89774bf71a4a@physik.fu-berlin.de>
 <20190625065905.GA30073@lst.de> <5939b8fa-8f3b-fa30-aeb0-d19c6baf89da@web.de>
 <cce09bfe-0179-4ce7-4488-09c66b968628@web.de> <20190625081825.GA31752@lst.de>
 <c5412a03-e3ce-eecd-737f-119c7d955ed3@web.de>
 <60d38f5f-4867-ee1d-783c-ae162e25bea9@web.de> <20190625103232.GA2132@lst.de>
 <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de> <20190625104702.GA2569@lst.de>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <a2ab92b3-e89d-a610-91d1-5ea626be4995@web.de>
Date:   Tue, 25 Jun 2019 13:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625104702.GA2569@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:X5gGMit/suUcKc4IGDQVvzZbJlZgnz48OlZxpwGhEj87mXHykLp
 mesGzNdjDRhTw0fwfTkQGmxnFqJ2URCem4VMgsbjMRmUzZ1tbB3iR04rA/roZERS3Ea/o7y
 MDPBZuE5B+VDvBVl6XP4titggglhgJ3Bm4CxlWLOy3tg4whpHaR+f699mToaiN6Zka4ymF5
 EmSF4Lb6peEV5ynHF94rQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bGQGluDnYC4=:SHN4vve7pYURKMH6yQRDoi
 x0Ae4DEMEl/e6VjxSggMwDRH28soBmp0wEdHr5ctwho7MD8nqYz9uymndzGpkYHXAd9b+f4yO
 Vd/GRcYBCaAXHwlDGrJ728n7OOopC91he1iaqavb4ZcnbY5yN7nC3LIkNpNWkvW9L9nfEczUr
 4283w0hki9B3xH9QZdIkDfT93o0pRbZbzAFgB6N/Sxuof3MmunakxAYQIUmvoZnsWeJfooTGu
 iHPvdwbiIieJALJXLkGQkc69Mn7SbnBUN+UPnPsB/PRZBqEh7zoP0hQEpJGzoqqRe5wCRN/CL
 zRHZxq/TN2W5xZk2zz1sSPcbLmt8hTzgBSpcmc9c+2No4SLgh9mBRy/dmzj1wEx/AdqP3ZpWa
 Hz1eXRVhL6GH56oBgmh5vqlvtxwmZjQ4tim56Np3rMeoc3YA829dA5PuwaLnRVZfTLX4wqUcO
 tdMccEZW4Zimv9M0l8lnJFDVx31CCl/o4inX5Fm20mNyIgfzFufKRDbh2iBm1vRjsfHR3WHNh
 GWAcepKbl0AaEv69CTg+rkm1pQ9a0uGuBN2Us1Wq//SfVbzy9eLnNspFh44+11iLPulxGxknD
 zrK3d9nrT5tVcH/rboUWIeznP2qzM4crUW4gPaFPN72NULAq7k5pNob9p3YWvWWYyS5OvNqDr
 K+z8cFd8f6hnKLMbzf6aQBfp4a1sGZF5HC4NNUfou39hV00T5zot6mAB+jpdInXsZQyi+zc/d
 TdpYP/bxC7XNjFswt/OOChG/KVKZtidpuvDhdKJ17Z4QJJRrZqowATAWrizgfKQKtOZiovXXz
 08El6x+kwIS6sOqnIe23DbgOc/OwNAW+YKEKV5+wfS7xxKIQF/qr3xr+YlfXolYefcMunergC
 eFEoKMMc4Xa0tHnSQoGmffgnHVq/6LzNtKNjeyAM3vVNNY+zJxROF0BdA0veax0dEEQyWAAgW
 U1Pl3/YL4qk8b3WuB+0T4jg00F7oVp0ZJMIncgx48gP7YdjRdkf+b
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org



On 6/25/19 12:47, Christoph Hellwig wrote:
> On Tue, Jun 25, 2019 at 12:46:39PM +0200, Frank Scheiner wrote:
>> Do you suspect a firmware issue? Because the firmware of that machine i=
s
>> actually quite old (the model was retired in 2015):
>
> No, probably something in the Linux ia64-specific code.
>
>>>    	if (!page)
>>> -		page =3D alloc_pages_node(dev_to_node(dev), gfp, page_order);
>>> +		page =3D alloc_pages(gfp, page_order);
>>>
>>>    	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
>>>    		__free_pages(page, page_order);
>>>
>>
>> Ok, will try that patch - actually (1) in addition or (2) without the
>> first one?
>
> Instead.

Ok, that looks much better now with the second patch:

```
Linux version 5.1.15-dirty (root@rx2800-i2) (gcc version 7.3.0 (Gentoo
7.3.0-r3 p1.4)) #2 SMP Tue Jun 25 13:11:38 CEST 2019
EFI v2.10 by HP:
efi:  SALsystab=3D0xdfdd63a18  ACPI 2.0=3D0x3d3c4014  HCDP=3D0xdffff8798
SMBIOS=3D0x3d368000
booting generic kernel on platform dig
PCDP: v3 at 0xdffff8798
earlycon: uart8250 at I/O port 0x4000 (options '115200n8')
printk: bootconsole [uart8250] enabled
ACPI: Early table checksum verification disabled
ACPI: RSDP 0x000000003D3C4014 000024 (v02 HP    )
ACPI: XSDT 0x000000003D3C4580 000124 (v01 HP     RX2800-2 00000001
01000013)
[...]
Trying to unpack rootfs image as initramfs...
[...]
Detecting Adaptec I2O RAID controllers...
ahci 0000:00:1f.2: AHCI 0001.0200 32 slots 6 ports 3 Gbps 0x3f impl SATA
mode
ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum part ccc ems
scsi host0: ahci
scsi host1: ahci
scsi host2: ahci
scsi host3: ahci
scsi host4: ahci
scsi host5: ahci
[...]
INIT: version 2.93 booting

    OpenRC 0.41.2 is starting up Gentoo Linux (ia64)
[...]
This is rx2800-i2.[...] (Linux ia64 5.1.15-dirty) 13:23:57

rx2800-i2 login:
```

...even after a second reboot for verification. Great!

I assume this won't affect UMA Itaniums or should I check on one of my
other Integrities if this change breaks the kernel on them?
