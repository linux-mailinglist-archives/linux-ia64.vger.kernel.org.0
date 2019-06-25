Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6E54526C9
	for <lists+linux-ia64@lfdr.de>; Tue, 25 Jun 2019 10:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbfFYIiZ (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 25 Jun 2019 04:38:25 -0400
Received: from mout.web.de ([212.227.17.12]:55621 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728774AbfFYIiZ (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 25 Jun 2019 04:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561451898;
        bh=agI5tCpB5n1kukCClC3NqMoyM7ASjRnDKdl8BZkUqMk=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=lryjpAlWYc/k+i9RcP6o4qDypUeL202J+qJ6O9XLMcVtMECqXJdyjjFC1GCghyq33
         8kuZFUKSYquIXXufKsOAC1wB+XmuY7nxV+eiDuM/mpfJ1ZQYo8GqkdnuX+eAVLJuga
         paG30HX82tIQt9XlNylb/8XBpWx5MTCkhczxSHUo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.21] ([217.247.38.146]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Leca2-1iN0aa0ewI-00qRZD; Tue, 25
 Jun 2019 10:38:18 +0200
Subject: Re: Regression in 543cea9a - was: Re: Kernel problem on rx2800 i2
To:     Christoph Hellwig <hch@lst.de>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-ia64@vger.kernel.org, James Clarke <jrtc27@debian.org>,
        Jason Duerstock <jason.duerstock@gmail.com>,
        tony.luck@gmail.com, frank.scheiner@web.de
References: <f3d9d882-dd22-1782-6ec8-c88cb1880a83@web.de>
 <1d62aadd-67b6-da13-53cc-4b5213de8937@physik.fu-berlin.de>
 <20190625064218.GA29841@lst.de>
 <7f701503-7bd3-28bf-d7e6-d52d3fd168ee@physik.fu-berlin.de>
 <20190625065003.GA29883@lst.de>
 <87311b3d-748d-57e1-21cc-89774bf71a4a@physik.fu-berlin.de>
 <20190625065905.GA30073@lst.de> <5939b8fa-8f3b-fa30-aeb0-d19c6baf89da@web.de>
 <cce09bfe-0179-4ce7-4488-09c66b968628@web.de> <20190625081825.GA31752@lst.de>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <c5412a03-e3ce-eecd-737f-119c7d955ed3@web.de>
Date:   Tue, 25 Jun 2019 10:38:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625081825.GA31752@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YZYMFra4WVWVi8jFWe/WS9Qh8r0VzmYS9D3btcYkH6r5pTDjzp5
 BJiVARq6pQ4ZaQsGgSPUo8v1FfGdK66Y4Sh29Nf/WUFLICNFExa4FOT4GtEzhBkFxE5/FQd
 fmGvVXo+Kfbji5oig9Qoj97j9tweXYwOOx8KQvAmsMvAt66+FsdMn1gWJ3II/oVr6JH3TB5
 N4+F3UbuG/8heIaAgkyTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NaXPeD6jnII=:ZX6Nb7GZe1pswkeseR9Qsk
 xxXbB6RIOIntUrIlGmN4g4HhSrqyykdHv6y6Z1Kh3Gw8DcdTkRUvhUJAU5a7VOoUuj0LTS3C6
 8pLrcEnR/IlDBBMJTsE9VoLolPGpVP5VM3pxpkp/tUVB5sKTTGosKtcYQrt4SGkpi6o5Hyryy
 t5D44nn7gAh9px9hPhOHODIYuBY/sinyCmpKwR+V4fdvXhUZTrHeD5OepZFRV39v6smBrEAoG
 oU1BIk2o+IA6y3R0DZpwAWJ2O3STgbRjtPbyVCPFpJ1LkGkulBsB3JVogjww50J3XoAL66ocK
 IJ5cMtDu9fWIe6RIbhMwBCZLFETLMB7p0MNItXTeqgvixJXxC2u2JG5arJT1Ed66J2ghwe+FA
 bzTaVdcCpCcmGObOevb2Kqs19ROsyAL9a886fosinFMArOkbhwUXd/Ti17+Uv0jTnSLh2Zq/m
 6d0EXjows3V9GObIcm8sD4K7/QpEtuAdnl2y0j7jGqy24npKvvUlvRPPrWfHAqjPFF7gLHQTW
 1S+IskiK24TNte1zKY55mlSh/P5zc5CTuCOyG/OWCuzcNUt752q2of5QVuOmdJxdNhX186nNq
 heDFh07L1KU0CMNSOkJHC67OY7BcVjvJIReY0flXKpPvKx7vu/pbDS6HyN3Dzdb74fJFEc3vi
 TyvT4QA8BEDyFxMsXUfK2LZkKgDc/hOxqGl3I0FTTnEFuo8TXSuUQNjd4g0qFU+dqwiLyWS8J
 Bt3JeyJMrX4M1hK+SkKsboIAw++fHAys5ouejlyyDkbb31j177mT32263ZvTNMYdmVv/bki6V
 JbgTFMMa/Pm69ZKo8HfiqVnpvqIY0bGG80Cf0oVBifpNZN03zmDiNPUXMCGWNN0Yuidla7f+2
 N4jpUtmnA7bZMX4XRnZfvKqp7bAOYevDCzbVA6ZX9NorMi70DRhJyB72+aYTnO7xd+kHVOpIY
 RzMkuNu/h4hTmca4w1XU3/kLAZrKfTNf13XeFk47/Q42H8Ty9G22Y
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 6/25/19 10:18, Christoph Hellwig wrote:
> On Tue, Jun 25, 2019 at 10:16:22AM +0200, Frank Scheiner wrote:
>> Looks like this patch is not enough or not related, a kernel v5.1.15
>> with that patch applied yields the following:
>
> Can you use gdb to disassemle the faulting addresss?
>
> Something like:
>
> gdb vmlinux
>
> The in gdb:
>
> l *(__alloc_pages_nodemask+0x281)

Will do. I didn't have gdb installed so it might take some time to
emerge it. Will report back with the requested information then.

