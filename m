Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017E323D2FF
	for <lists+linux-ia64@lfdr.de>; Wed,  5 Aug 2020 22:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgHEU14 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ia64@lfdr.de>); Wed, 5 Aug 2020 16:27:56 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36200 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgHEU1y (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 5 Aug 2020 16:27:54 -0400
Received: by mail-wm1-f68.google.com with SMTP id 3so7597292wmi.1
        for <linux-ia64@vger.kernel.org>; Wed, 05 Aug 2020 13:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=0LE1ZE1UxP93Ci13F2rCsrvVzU2P0OqwQwQLBkekRrI=;
        b=TNNV6bbft86oNISeVSUO1tl1idmQ5gIQt3r59geoKGRxLcdFSk8N7+t6cgLaYaFEOX
         n+LIofRTZhsiKpcXC0yWx5+FcpCZ13vWZoMj0L7gx9ynigK25ZWNWpePH+wwcyIAfDSf
         AjYm/7lxH05URq/6h7LgWN9o8H9k7XvHcvShni4ti5UWcT+N5TUqN1CeecE8ORd163KA
         XxIjFKjoEZBGEuZ4CtuCPjCn4yulJ2MV31dOxDYtZVKGq0lHOJ36uvvATHweQY7KGuFn
         ybbZyjwlY8/uWQY+ydRVicjg8nC5eR4hEw2MQgxjAiEovh/g7VvNgRKh2C0aLYOTNuQg
         A3mw==
X-Gm-Message-State: AOAM531WcyVG/NQxdAHgF3QidmzUQ/+rukUws4PGZU+rhQ7ekqSigd5p
        YCuXRcA57u3nNB+EzhJS5pBbyg==
X-Google-Smtp-Source: ABdhPJwRdIRzlbSOGWzPS5xCBfWYWC9L6DLR25iy6mtcq6rgJgTDOuyWD7rjs/nPmrW9meQ6qD0XgQ==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr4713548wmk.86.1596659272537;
        Wed, 05 Aug 2020 13:27:52 -0700 (PDT)
Received: from [192.168.149.251] (trinity-students-nat.trin.cam.ac.uk. [131.111.193.104])
        by smtp.gmail.com with ESMTPSA id 130sm3983365wme.26.2020.08.05.13.27.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Aug 2020 13:27:51 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
From:   Jessica Clarke <jrtc27@debian.org>
In-Reply-To: <c1a5313b-47ec-462e-bdc7-5615c05e0d8d@physik.fu-berlin.de>
Date:   Wed, 5 Aug 2020 21:27:51 +0100
Cc:     Christoph Hellwig <hch@lst.de>,
        Frank Scheiner <frank.scheiner@web.de>,
        linux-ia64@vger.kernel.org,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
Content-Transfer-Encoding: 8BIT
Message-Id: <62A3A375-6B2C-431B-BEAD-EDC23FDEC987@debian.org>
References: <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de>
 <20190625104702.GA2569@lst.de> <a2ab92b3-e89d-a610-91d1-5ea626be4995@web.de>
 <0f76468f-8648-62d8-68d2-455c74c19328@physik.fu-berlin.de>
 <20190625120024.GA3979@lst.de> <000348b4-0786-9ebc-e79e-28815fa9890c@web.de>
 <20190625144009.GA7281@lst.de> <80470803-d475-815a-c95a-f9961fde5d97@web.de>
 <20190628062619.GA27873@lst.de> <6ecf5f63-6b77-2836-79ee-258438ba4bd0@web.de>
 <20190805071012.GA15366@lst.de>
 <c1a5313b-47ec-462e-bdc7-5615c05e0d8d@physik.fu-berlin.de>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 5 Aug 2020, at 20:43, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:
> 
> Hi Christoph!
> 
> On 8/5/19 9:10 AM, Christoph Hellwig wrote:
>> Seems like we dropped the ball on this..
>> 
>> Did I give you a patch like this (for 5.2 and probably earlier, won't
>> apply to 5.3-rc) to test before as that is anther idea?
>> 
>> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
>> index 2c2772e9702a..e471158c7c6e 100644
>> --- a/kernel/dma/direct.c
>> +++ b/kernel/dma/direct.c
>> @@ -119,7 +119,8 @@ struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>> 		}
>> 	}
>> 	if (!page)
>> -		page = alloc_pages_node(dev_to_node(dev), gfp, page_order);
>> +		page = alloc_pages_node(local_memory_node(dev_to_node(dev)),
>> +				gfp, page_order);
>> 
>> 	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
>> 		__free_pages(page, page_order);
> 
> I just applied this patch on top of 4.19.137 and it's crashing with this trace
> when trying to load the "hpsa" module. It definitely looks like an issue with
> dma_direct_alloc():

My guess is dev_to_node gave NUMA_NO_NODE for a random PCI device. Try:

    int nid = dev_to_node(dev);
    if (nid >= 0)
        nid = local_memory_node(nid);

and then pass nid to alloc_pages_node instead.

Jess

