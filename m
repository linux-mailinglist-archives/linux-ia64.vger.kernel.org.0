Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28C2254E60
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 14:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbfFYMII (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 08:08:08 -0400
Received: from mout.web.de ([212.227.15.4]:44367 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726928AbfFYMII (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 08:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561464483;
        bh=YA/wDOGu6IzqREWpYD9KN2XOcYXp/Jx+zXNrwmRaNrA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ViT4xbY6Ynr+TPSPYCLpwE7pZPLC6P5YdijKmn3vv1bGixmNYogylGD8UM9AyvKsT
         4anrEmEqYGBmWhOdFG53xQwWws8QkzMjgaXb/fKj9mmu40qcCkwQCNNIxMc3Lvwdwy
         IMdFIEKqYLPrN1upyv9TWKj1EXiM4FKWx5YDDSyk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.21] ([217.247.38.146]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MC1RI-1hoZvf1pYW-008q7Q; Tue, 25
 Jun 2019 14:08:03 +0200
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
To:     Christoph Hellwig <hch@lst.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com, frank.scheiner@web.de
References: <5939b8fa-8f3b-fa30-aeb0-d19c6baf89da@web.de>
 <cce09bfe-0179-4ce7-4488-09c66b968628@web.de> <20190625081825.GA31752@lst.de>
 <c5412a03-e3ce-eecd-737f-119c7d955ed3@web.de>
 <60d38f5f-4867-ee1d-783c-ae162e25bea9@web.de> <20190625103232.GA2132@lst.de>
 <e6b720e2-e603-a867-e738-f9e6b9f906e1@web.de> <20190625104702.GA2569@lst.de>
 <a2ab92b3-e89d-a610-91d1-5ea626be4995@web.de>
 <0f76468f-8648-62d8-68d2-455c74c19328@physik.fu-berlin.de>
 <20190625120024.GA3979@lst.de>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <000348b4-0786-9ebc-e79e-28815fa9890c@web.de>
Date:   Tue, 25 Jun 2019 14:08:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625120024.GA3979@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2Lj5J6kko/aIe3CA8eTqx3/yahwMSkbqE0a/hWxWkZBCoRxVnuL
 fyNwg1VOaxdk0qx/Q6e0PCtg4GPLXXrUQ/w1O+1LMg//4oy6Y+rfoyoj2L6iSqNJepZD2W7
 DoxK0Srn4TNPRAv9rcH4PsxonJGKpNGwtl5R5UjFSSLiTS7er/EC/ba/bLs/KqmwYmj9yDY
 UsG6NKm3hcxFMAmsxzgEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NyMtLPJTTSQ=:pbT30mX4iQ42fahGHuymXv
 L7L33oWoTkO95bjoLi79QEStbSvcKocJAEVvcE2NdaBNQ5lvzGuqDPqdveGL0UBhaKzPZSMlY
 nj+8hzF4TUmmOya/Ru0VglwFdkmLa7BtnwCejUi29P12ibfdZiGSCLwWiatNti1Ulb+6jFe1O
 Btn05IGrxiqcROk6CFv6XVAwWPisHRp6TtntgJeJWmbZ1cgeh3g0mwQxt5qzprATanRVxhfF3
 GPpkoDCJYOVZowHMawHJlUJq4/uvDitZNin6bd/LMrduYUiCS/ZpfG7x6AjtJRuk912RhdutJ
 rqZG5j7ix1tu6gJYQSf41DUbAtu//SS8eXO7mXdCxZlALLN15SSRm3hkydoWLTLKhPJBMRCX8
 TES0LKak6PzKYPWi0fJjIy5inABMNlbdlQX/cjVh65X2dM9TNTKLdSPw0lOChLIJVry5Kd4Uf
 V38swGJAJmdeKxZ/+Zkf5lnsQqS0Q/sU4ShBCi+y0MgCE5wBoy4MSS4rm1nuUaO1tGVJ3gTNI
 XKyKfX5MJ9p2hY2QBqiSdEYmeBuuxZrRnMhLRnL1zpJcuPu1R+ABTk+XnmWJSKC7cGKli9nmZ
 SWh5hlmUSdMnZZB0Y7O+GwDahCXa+vck0RSjqxMsFySPqxdIC8Zr5qjRXd88Dhc922ACuekbh
 c78kKVWR6dkgyUS6qjo7MmvFCxNqUSghGe10vk52y850PpGUTFkUfBr0cSkkCnIXtw5qyJUIw
 AV2ZirXtDgl0JJ4vr7TmKIjL1Z1dRAemF3pQh4n76QxenELJTrWQN+j+Bd/k8ipp3fISSdVPD
 WAvhGj52onpoUjB97FbhNHBoYbtDo+yOR5h0E7ynxQ4vMjaB5TNqzLYcXaUYok2AP88xXZ/Gy
 DiM4uSQXg6bzasmF3ah5Sav99OwPjxCrXgmTOLYn1yKWIAI5Q0eF7Qf1GH/xlDRP3ijKt3N5T
 b7ndihIOz7igvDGDzzymbh9CUI1D3cz71XogQzUT4tALnhFWUcmqS
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org



On 6/25/19 14:00, Christoph Hellwig wrote:
> On Tue, Jun 25, 2019 at 01:21:38PM +0200, John Paul Adrian Glaubitz wrot=
e:
>>> Ok, that looks much better now with the second patch:
>>> ...even after a second reboot for verification. Great!(
>>> (...)
>>> I assume this won't affect UMA Itaniums or should I check on one of my
>>> other Integrities if this change breaks the kernel on them?
>>
>> Nice! I just assume we won't be able to use the patch "as is" as it wou=
ld
>> potentially break other architectures if I'm not mistaken.
>
> It doesn't actually _break_ anything, but it regresses in not doing
> node local allocations.  Give me some time to dig through the ia64
> code to figure out if I can make sense of this.

Thanks for your help and support. I'm happy to test what you come up with.

Cheers,
Frank
