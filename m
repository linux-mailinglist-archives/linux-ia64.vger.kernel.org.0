Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 278F159514
	for <lists+linux-ia64@lfdr.de>; Fri, 28 Jun 2019 09:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfF1Hfe (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 28 Jun 2019 03:35:34 -0400
Received: from mout.web.de ([217.72.192.78]:45423 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726671AbfF1Hfd (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Fri, 28 Jun 2019 03:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561707326;
        bh=IJJHe5NXr/PciL/SzBwKp5MzVuV8WFLQKo4Rnl9Xzq4=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=mvIeiadqFuUOkyz6rkFNREA3Q7NOIt+cDgLnX4iWMHWQF+lNSxuDJTTKiu7LQNexr
         DtBs00/L5FASVZLQsEEYcvzCwdx5j4YtuBMpULJRkuBieIDOiBQyheUw4ZAnx2dvtO
         z18qjBwtjVAiOTJo5SpXbGog1unQ7TGUi8OzEHbw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.21] ([217.247.36.246]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LgHPM-1iJBDm0bXY-00nj4v; Fri, 28
 Jun 2019 09:35:26 +0200
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
To:     Christoph Hellwig <hch@lst.de>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com
References: <60d38f5f-4867-ee1d-783c-ae162e25bea9@web.de>
 <20190625103232.GA2132@lst.de> <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de>
 <20190625104702.GA2569@lst.de> <a2ab92b3-e89d-a610-91d1-5ea626be4995@web.de>
 <0f76468f-8648-62d8-68d2-455c74c19328@physik.fu-berlin.de>
 <20190625120024.GA3979@lst.de> <000348b4-0786-9ebc-e79e-28815fa9890c@web.de>
 <20190625144009.GA7281@lst.de> <80470803-d475-815a-c95a-f9961fde5d97@web.de>
 <20190628062619.GA27873@lst.de>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <6ecf5f63-6b77-2836-79ee-258438ba4bd0@web.de>
Date:   Fri, 28 Jun 2019 09:35:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190628062619.GA27873@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2Ud2m1TleJ5YxpWFa4XSBPkUQK3H9bHPfmvE9kgpM7r11qNqpuQ
 YEzwyDmL2T7Mdmd9Wt+F87HQxmm1nxJDLq+LVuh1RrRYpfw2lo3kQpQvDGzPTLQOKTexChY
 3eO+3no61E32Wa3/Jg3RB21V2rH0j+m6w+s1YVNXJsNs9FhIX6lObfyB226qg3Og7fLq579
 dTC+NON/YLeKA2o9BEUdQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iDCjDJ2c9A8=:fCkCBzNO8T0R8ApNPODODC
 pWV8VTgZEGY+P6BpW2dCfNBdK3FSTjNruvnA32LveESKZYWmrUiXuIyLr3jFbOrx2+6h35i3R
 XoH2zGpqFfnJlG17xuzUHbDLSKZSvN/qY3MmPyQOP6hOz3Ky+Bc8YnFGb40N85QD1MqCYeg06
 3Kzckk2mzrHdDfaJujVg/e26+KhP+AG9dosm7pGn1r55RWTUU9W7vCwig9xiNq4D4hsa9E2M9
 F8Ki2mV4H7cmuf/bSoF8tAeoDvyANFMLvA76B03s8hSxowsrFU0rznm7Unybh8/MQad495xkb
 KeeaS4K/YDtTqjgEqpDOxlYkff0huBr/9EelPLDz8LoA3mK/qHqakX3NaAv9KHvIHrapYbXaW
 Jzvi9pidz1hz2QHRWY+jR7da1MEmQtqigvR+PnPYbEdZv5cScce1Q1+N701dDKJb0Ws6rNIYd
 oMZOQKuY5tIh6CNxyb1CZhIjV+ITRhiHVDF3I88XOrhWVY+9/2mdLi2xUCSFfUs+DJ6NowFv5
 OjdgGGTMNttCt7C4sVCwpH0W6fkb6F+POpEQHc8YFp30JBWqJ4v1IgzHdWQrE1O6k4HqaX6wm
 Qk6BxLufK2L4t18LVzQG9oQU1E/vo8EdZBjwoZRmWw6AT3P1cT26j5RO4pEVn5W2/6qjgS9ZB
 v2Ppkw6AD4oY9qQtb+Fc3w/u3G85ZHM9daCMhZ0JH8EMikZmZUcdqebEdFnTGUUe9Ikldc8nx
 UJjcdlTuJxezhH14DZYqqndsZ1h3aYIU3jutWRGmiAzzJlIE0Ssyv4WKR56Q6wXE2zpX99tds
 Tv+I59E4SFM/bzOTNetxZJETQJvpMsbGdy8Njk1CaQIkjWDXOjEmZR5wcm8NJZYkMaHx6N4FZ
 za1dNgqpaE53tmrFyaTcVbQgT11si368/yluRY8+1w0yi1V6wX5sVDQvA4MjwyTlDvcw5yWqH
 J22GIhlidDh3OixgAFUquXZz9pCgSqavKZuPkibRIgGUg6TSeB9c6RUC53WbhqVoSpv+3TWTD
 4C+Q+dNbaTJyG9afxFYRzWkR1kIS3MVrL8nHfXk3SKSdWlkN8a36bO9J4ZiEdgByOfPNTexUe
 iX8zfhgjyUuyWQCv3AdD62mfSF+hfgclihg
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 6/28/19 08:26, Christoph Hellwig wrote:
> Btw, as a workaround you could try to disable CONFIG_NUMA in
> your .config - as far as I can tell the rx2800 i2 is not actually
> a NUMA system.

Actually I think it is a NUMA system. Maybe it's not acting like one in
my configuration, as I only have a single processor installed. But the
Tukwila has its memory controller integrated into the processor and
interconnects with other processors or chipset components via QPI like
the Nehalem. This can be compared to Opterons and HyperTransport.

Cheers,
Frank
