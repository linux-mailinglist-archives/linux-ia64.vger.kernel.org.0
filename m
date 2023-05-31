Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C257189F7
	for <lists+linux-ia64@lfdr.de>; Wed, 31 May 2023 21:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjEaTRh (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 31 May 2023 15:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjEaTRe (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 31 May 2023 15:17:34 -0400
Received: from mout.web.de (mout.web.de [212.227.15.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B38133
        for <linux-ia64@vger.kernel.org>; Wed, 31 May 2023 12:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1685560612; i=frank.scheiner@web.de;
        bh=mRjVEvt0Y50O/uceHxQFnHYkwTJwSVbFu0vgU8+n9PM=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=cjTiIRU7QeXpHiJCtcufazT+6S++IVBxeykwS5wUhqXN19d8E4xfUhCBIJC6f572A
         Y5Q0RvRI8xtgLEgJBcMLwq/8GRGCRKtNhRhwI3Nnx1taqjz5G0l9Uk6MdYv+SOeBtC
         uobsBEnOHhF1FvjJS3UmGIPYr8fTYzV7BFPxwQ2fsjdjrSn6qNazRKJ52cTuJW5uSZ
         4IRoGHLWjthjoQV9UiTPjz0ogPBsImgH5aUuk8IDy5bIxsvrd+nk9Yviq3hvNdEeVO
         DjD2z29oKQ6+4OqZdNbcVId5gSQ5cVsoeASSH+XoztaJslKBHANgAv2yAJ9ofLBJOE
         BsC1kZjkxB1uw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([79.200.219.36]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLijs-1pmuSi2Xia-00Hf8c; Wed, 31
 May 2023 21:16:52 +0200
Message-ID: <6a480ba1-0357-3a3b-be8c-5ce5491a40b4@web.de>
Date:   Wed, 31 May 2023 21:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Boot regression in Linux v6.4-rc3
Content-Language: en-US
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Song Liu <song@kernel.org>, linux-ia64@vger.kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
 <ZHErssbUSbSznTVA@bombadil.infradead.org>
 <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
 <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de>
 <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
 <b2b47c19-d527-fbd2-1666-801f173b6174@web.de>
 <CAHk-=wjDQZ8snU__Y8qJ8M5H--1FtAwNq-oHKmY4CJuomWPvDw@mail.gmail.com>
 <CAPhsuW7Gcd7hkrD6RtBdJDMdVnaN8Bv_kVNdpyccUiuD-TqYDw@mail.gmail.com>
 <ea6bb10a-f830-1a9f-19b1-07269a073876@web.de>
 <42e4fbe4-2b4d-4f9a-222f-1d14d4836da3@web.de>
 <CAPhsuW5VdZiLwAax1Ax3OVD=Kp2y2i-U9Ap3LS3jY6jz59Nawg@mail.gmail.com>
 <b74bda58-8804-4456-eb52-b476e7b29f78@web.de>
 <CAB=NE6UXgiPwBCt-TFM3xvXmFuQUDDqiXgMbv1-xGCNKWiQTwg@mail.gmail.com>
From:   Frank Scheiner <frank.scheiner@web.de>
In-Reply-To: <CAB=NE6UXgiPwBCt-TFM3xvXmFuQUDDqiXgMbv1-xGCNKWiQTwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:aCF2ehX49tydRt2mryUqD7c/+0hz+Bzn3pJtWOWLkqkcojRAQBy
 CGUq41DaeveR6IJAiwJt7pA4P9hrQfHWVuzZE/BZc8j6iNKrI51QdPDy3Njl8dOHR+eBSTa
 qoolZBlemHBGy37Oktt2z3ZGcwd6vAfc0XB2q4d6WpXin2X7e4Bj+6iIEPMpmsdjo8/UXJV
 dDZyFYfxynUlPY6Tus3rg==
UI-OutboundReport: notjunk:1;M01:P0:glW3fMzdfWI=;DqmRqgvOohD/EC5aQ+iW9iMW9hD
 wCC9hMtLvclU/SBlq/UdF2rtxM5OSIIfkJ6cm3b/ENQIqbkst/+KfPyylqDRhiWe8sfDK2kij
 trL+/0WzuHWBjE5p0H/f3XqWL4QiIV2+uAh2zKySrjLwFPA4ESOWGYmaBqNvhsmrX8Wo/aWRG
 kMmMEDXDPUST7MqT8O9sxhFMlr9taAEPL6Bc5IWYGl+eyG5ZyS/mYeIK9HIooCUqClhteZPEO
 DH/NKBhAmxc5vJyFW32rib4odbseC2N6/w6Nyigm273wE1oryXSZ1h51dgZKJsz5ySAV7Evyp
 CBQ0aPbHRD/BbwQqoUb8d+A9gGax/NoZaTDsfzNR79yGpK0ueGLsfuLx844foiXJHRNVnb3ob
 WqWnqqs0ksza0kTmgigxEEjdirN5o8gqQp8KEv+YOBbKT5J42vHTMedtp4YP27j+kHxTd5nHu
 sEoiA+eS+RP8nZt5ptj+w/9Ezrko03wFaFgVix6zlnpPsRK/NqfeJy/MbXoqVxu4P4wtccpax
 b1btVP7w3MQpSbhZWmaXUQsd4Zjq99qmnVlxjS91p9YgikoxHYaIBW9XJ5DiP6MNd3Oj2nxsF
 /S7PdDOJh5vTbYkYUWgT5/rynXzkQOxn96GncA1lAOCbu2xGKGq1h6lWRRHh5sx1lSja9QnKF
 FKaOH39dekOGjPogVyAdM1Z3bjBnQhKR4Q3hnQVEg5pURWWWBiS4QXjZYdkdhyIfLj8Norf/F
 icfE2dS2D2mfOyVkHm23kG56xP10FgpAFTcQQ6IuADlhlWqu/dcKbeDm50aaubv0jymW0xk4b
 69F18TiiVQVlAq1RVro12uUljJwMJldPnmx1soXJne+2BbL1H07sKqAzKq0KS3E0afVAa960Q
 fNv6MrbPnfdpBuY88SEnnSqJsRlTd2ntl4xjoj5AfabUH/kqPPWGYJKXW729m/m6VwtwUo89O
 a0e4r9+7B+3UnA5oA4a6UUq8Dlc=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

T24gMzEuMDUuMjMgMjE6MTQsIEx1aXMgQ2hhbWJlcmxhaW4gd3JvdGU6DQo+IE9uIFdlZCwg
TWF5IDMxLCAyMDIzIGF0IDExOjE24oCvQU0gRnJhbmsgU2NoZWluZXIgPGZyYW5rLnNjaGVp
bmVyQHdlYi5kZT4gd3JvdGU6DQo+PiBMb29raW5nIGZvcndhcmQgdG8gdGhlIG5leHQgb2Nj
YXNpb24gLSBmb3IgeW91ciBzYWtlIG1heWJlIG9uIGFub3RoZXINCj4+IGFyY2hpdGVjdHVy
ZSwgYnV0IGNhbid0IHByb21pc2UuLi4gOy0pDQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGJl
IHBydWRlbnQgZm9yIFNvbmcgdG8gYWxzbyBhc2sgeW91IHRvIHRlc3QgaGlzDQo+IGZ1dHVy
ZSB1cGNvbWluZyBtb2R1bGVzIHBhdGNoZXMgb24gaWE2NCBnaXZlbiBob3cgaGFyZCBpdCBp
cyB0bw0KPiBwcm9jdXJlIHN1Y2ggaGFyZHdhcmUgdG9vLg0KDQpTdXJlIQ0KDQpDaGVlcnMs
DQpGcmFuaw0K
