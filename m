Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C39823D041
	for <lists+linux-ia64@lfdr.de>; Wed,  5 Aug 2020 21:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729443AbgHETqp (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 5 Aug 2020 15:46:45 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:51787 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729111AbgHETqp (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 5 Aug 2020 15:46:45 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.93)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1k3PJz-001tOm-Bh; Wed, 05 Aug 2020 21:43:31 +0200
Received: from p57ae5336.dip0.t-ipconnect.de ([87.174.83.54] helo=[192.168.178.23])
          by inpost2.zedat.fu-berlin.de (Exim 4.93)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1k3PJz-0010C6-1q; Wed, 05 Aug 2020 21:43:31 +0200
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
To:     Christoph Hellwig <hch@lst.de>,
        Frank Scheiner <frank.scheiner@web.de>
Cc:     linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
References: <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de>
 <20190625104702.GA2569@lst.de> <a2ab92b3-e89d-a610-91d1-5ea626be4995@web.de>
 <0f76468f-8648-62d8-68d2-455c74c19328@physik.fu-berlin.de>
 <20190625120024.GA3979@lst.de> <000348b4-0786-9ebc-e79e-28815fa9890c@web.de>
 <20190625144009.GA7281@lst.de> <80470803-d475-815a-c95a-f9961fde5d97@web.de>
 <20190628062619.GA27873@lst.de> <6ecf5f63-6b77-2836-79ee-258438ba4bd0@web.de>
 <20190805071012.GA15366@lst.de>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Autocrypt: addr=glaubitz@physik.fu-berlin.de; keydata=
 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
 scOkTAZQGVpD/8AaLH4v1w==
Message-ID: <c1a5313b-47ec-462e-bdc7-5615c05e0d8d@physik.fu-berlin.de>
Date:   Wed, 5 Aug 2020 21:43:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20190805071012.GA15366@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.174.83.54
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Christoph!

On 8/5/19 9:10 AM, Christoph Hellwig wrote:
> Seems like we dropped the ball on this..
> 
> Did I give you a patch like this (for 5.2 and probably earlier, won't
> apply to 5.3-rc) to test before as that is anther idea?
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 2c2772e9702a..e471158c7c6e 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -119,7 +119,8 @@ struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>  		}
>  	}
>  	if (!page)
> -		page = alloc_pages_node(dev_to_node(dev), gfp, page_order);
> +		page = alloc_pages_node(local_memory_node(dev_to_node(dev)),
> +				gfp, page_order);
>  
>  	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
>  		__free_pages(page, page_order);

I just applied this patch on top of 4.19.137 and it's crashing with this trace
when trying to load the "hpsa" module. It definitely looks like an issue with
dma_direct_alloc():

[    2.352364] HP HPSA Driver (v 3.4.20-125)                                                                                                                                                                      
[    2.386832] hpsa 0000:02:00.0: Logical aborts not supported                                                                                                                                                    
[    2.420644] hpsa 0000:02:00.0: HP SSD Smart Path aborts not supported                                                                                                                                          
[    2.482838] Unable to handle kernel NULL pointer dereference (address 0000000000001688)                                                                                                                        
[    2.531221] swapper/0[1]: Oops 11012296146944 [1]                                                                                                                                                              
[    2.535221] Modules linked in:                                                                                                                                                                                 
[    2.535221]                                                                                                                                                                                                    
[    2.535221] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.19.137-dirty #7                                                                                                                                        
[    2.535221] Hardware name: hp Integrity BL870c i4 nPar, BIOS 02.64 03/03/2016                                                                                                                                  
[    2.535221] psr : 00001210084a6010 ifs : 8000000000000207 ip  : [<a00000010019acc1>]    Not tainted (4.19.137-dirty)                                                                                           
[    2.535221] ip is at local_memory_node+0x51/0xd0                                                                                                                                                               
[    2.535221] unat: 0000000000000000 pfs : 0000000000000793 rsc : 0000000000000003                                                                                                                               
[    2.535221] rnat: c00000005805cc60 bsps: 0000000000000000 pr  : a6a6aa956aaa9959                                                                                                                               
[    2.535221] ldrs: 0000000000000000 ccv : 0000000000000000 fpsr: 0009804c8a70433f                                                                                                                               
[    2.535221] csd : 0000000000000000 ssd : 0000000000000000                                                                                                                                                      
[    2.535221] b0  : a00000010011aab0 b6  : a00000010011c870 b7  : a00000010003a5e0                                                                                                                               
[    2.535221] f6  : 10012bffff00000000000 f7  : 1003e00000000000bffff                                                                                                                                            
[    2.535221] f8  : 1003e0000000000002560 f9  : 1003e0000000000000054                                                                                                                                            
[    2.535221] f10 : 1003e00000000000000c0 f11 : 1003e0000000000003f00                                                                                                                                            
[    2.535221] r1  : a0000001013dd060 r2  : e000000001919980 r3  : e000000001919988                                                                                                                               
[    2.535221] r8  : 0000000000000008 r9  : e000000001919990 r10 : 0000000000000000                                                                                                                               
[    2.535221] r11 : 0000000000001688 r12 : e000000f8363fcc0 r13 : e000000f83638000                                                                                                                               
[    2.535221] r14 : fffffffffffc04b8 r15 : 00000000ffffffff r16 : 0000000000ffffff                                                                                                                               
[    2.535221] r17 : 0000000000000000 r18 : 0000000000000000 r19 : 0000000000000000                                                                                                                               
[    2.535221] r20 : fffffffffffcdd50 r21 : 0000000000000010 r22 : e00000000114dd50                                                                                                                               
[    2.535221] r23 : 0000000000000003 r24 : 0000000000000015 r25 : 0000000000000015                                                                                                                               
[    2.535221] r26 : 0000000000000800 r27 : 0000000000000c00 r28 : a000000100f1f0e8                                                                                                                               
[    2.535221] r29 : a00000010003a5e0 r30 : a00000010011c870 r31 : 0000000000000081                                                                                                                               
[    2.535221]                                                                                                                                                                                                    
[    2.535221] Call Trace:                                                                                                                                                                                        
[    2.535221]  [<a000000100013570>] show_stack+0x40/0x90                                                                                                                                                         
[    2.535221]                                 sp=e000000f8363f870 bsp=e000000f83639838                                                                                                                           
[    2.535221]  [<a000000100013f80>] show_regs+0x9c0/0x9f0                                                                                                                                                        
[    2.535221]                                 sp=e000000f8363fa40 bsp=e000000f836397d0
[    2.535221]  [<a000000100024530>] die+0x1a0/0x2f0
[    2.535221]                                 sp=e000000f8363fa60 bsp=e000000f83639790
[    3.750837] random: crng init done
[    2.535221]  [<a00000010004bb80>] ia64_do_page_fault+0x830/0x9d0
[    2.535221]                                 sp=e000000f8363fa60 bsp=e000000f836396f8
[    2.535221]  [<a00000010000c460>] ia64_leave_kernel+0x0/0x270
[    2.535221]                                 sp=e000000f8363faf0 bsp=e000000f836396f8
[    2.535221]  [<a00000010019acc0>] local_memory_node+0x50/0xd0
[    2.535221]                                 sp=e000000f8363fcc0 bsp=e000000f836396c0
[    2.535221]  [<a00000010011aab0>] dma_direct_alloc+0x110/0x280
[    2.535221]                                 sp=e000000f8363fcc0 bsp=e000000f83639648
[    2.535221]  [<a00000010011c8c0>] swiotlb_alloc+0x50/0x2a0
[    2.535221]                                 sp=e000000f8363fcc0 bsp=e000000f836395e8
[    2.535221]  [<a0000001007b4550>] hpsa_init_one+0x25f0/0x4670
[    2.535221]                                 sp=e000000f8363fcc0 bsp=e000000f83639320
[    2.535221]  [<a00000010056f6f0>] local_pci_probe+0x90/0x150
[    2.535221]                                 sp=e000000f8363fd40 bsp=e000000f836392e0
[    2.535221]  [<a000000100570dc0>] pci_device_probe+0x300/0x320
[    2.535221]                                 sp=e000000f8363fd40 bsp=e000000f836392a8
[    2.535221]  [<a0000001006c7a70>] really_probe+0x480/0x680
[    2.535221]                                 sp=e000000f8363fd60 bsp=e000000f83639240
[    2.535221]  [<a0000001006c8130>] driver_probe_device+0x1e0/0x1f0
[    2.535221]                                 sp=e000000f8363fd60 bsp=e000000f83639208
[    2.535221]  [<a0000001006c82d0>] __driver_attach+0x190/0x230
[    2.535221]                                 sp=e000000f8363fd60 bsp=e000000f836391d0
[    2.535221]  [<a0000001006c3950>] bus_for_each_dev+0xd0/0x130
[    2.535221]                                 sp=e000000f8363fd60 bsp=e000000f83639190
[    2.535221]  [<a0000001006c6ba0>] driver_attach+0x40/0x60
[    2.535221]                                 sp=e000000f8363fd70 bsp=e000000f83639170
[    2.535221]  [<a0000001006c60a0>] bus_add_driver+0x400/0x4a0
[    2.535221]                                 sp=e000000f8363fd70 bsp=e000000f83639120
[    2.535221]  [<a0000001006c9600>] driver_register+0x220/0x2b0
[    2.535221]                                 sp=e000000f8363fd70 bsp=e000000f836390f8
[    2.535221]  [<a00000010056ef80>] __pci_register_driver+0xa0/0xc0
[    2.535221]                                 sp=e000000f8363fd70 bsp=e000000f836390c8
[    2.535221]  [<a000000100f930b0>] hpsa_init+0x80/0xc0
[    2.535221]                                 sp=e000000f8363fd70 bsp=e000000f836390a0
[    2.535221]  [<a00000010000a6a0>] do_one_initcall+0x100/0x2d0
[    2.535221]                                 sp=e000000f8363fd70 bsp=e000000f83639068
[    2.535221]  [<a000000100f49c60>] kernel_init_freeable+0x5c0/0x5d0
[    2.535221]                                 sp=e000000f8363fdb0 bsp=e000000f83639000
[    2.535221]  [<a000000100c6a880>] kernel_init+0x20/0x280
[    2.535221]                                 sp=e000000f8363fe30 bsp=e000000f83638fd8
[    2.535221]  [<a00000010000c250>] call_payload+0x50/0x80
[    2.535221]                                 sp=e000000f8363fe30 bsp=e000000f83638fc0
[    2.535221] Disabling lock debugging due to kernel taint
[    5.711378] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    5.711378] 
[    5.766837] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    5.766837]  ]---

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
