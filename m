Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32B127138AD
	for <lists+linux-ia64@lfdr.de>; Sun, 28 May 2023 10:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjE1IKL (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 28 May 2023 04:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjE1IKK (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 28 May 2023 04:10:10 -0400
Received: from mout.web.de (mout.web.de [212.227.15.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96BE6DC
        for <linux-ia64@vger.kernel.org>; Sun, 28 May 2023 01:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1685261366; i=frank.scheiner@web.de;
        bh=qX+KYhxxln/HqtSW5Vj6Ejg3mUm/0nigGsweWYz/DIM=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=e8bYjqjfkmIfWipTecpZ/+/bwGHPuyPT5bQfqEltFGgxaS9ycKsSUtq12w6zDtKTb
         oHFQfRH3CV/cnXK0+diXNgO1T/n2CGg2TbbNvneVcyx1Lz/QkfDbKBsMTZfz2Dlrfw
         JAbi3Sz58kBTdMPXi/W8hU41+nAYDq0B6DkeHX6dZLI0HioMQaFoliGz4Gh0ydIgp8
         Bo7FBxb60J8DQDGUqbA2AYjJjT9HD1Q+7g32x7EHi/jsKDwRdQa1JntNSGSrMfhzJr
         wQp61934uM6DCLEdTZifnJ0DQSwRF9OACfxYYLIRoxgD7+DlqKm9W7gh8/zoLQERtE
         rs9lIvFtw8w0g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([217.247.35.47]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MYLig-1pXxUF46d8-00VU3u; Sun, 28
 May 2023 10:09:26 +0200
Message-ID: <42e4fbe4-2b4d-4f9a-222f-1d14d4836da3@web.de>
Date:   Sun, 28 May 2023 10:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Boot regression in Linux v6.4-rc3
Content-Language: en-US
From:   Frank Scheiner <frank.scheiner@web.de>
To:     Song Liu <song@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
        linux-ia64@vger.kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
 <ZHErssbUSbSznTVA@bombadil.infradead.org>
 <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
 <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de>
 <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
 <b2b47c19-d527-fbd2-1666-801f173b6174@web.de>
 <CAHk-=wjDQZ8snU__Y8qJ8M5H--1FtAwNq-oHKmY4CJuomWPvDw@mail.gmail.com>
 <CAPhsuW7Gcd7hkrD6RtBdJDMdVnaN8Bv_kVNdpyccUiuD-TqYDw@mail.gmail.com>
 <ea6bb10a-f830-1a9f-19b1-07269a073876@web.de>
In-Reply-To: <ea6bb10a-f830-1a9f-19b1-07269a073876@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:CrfMwePgsRD1iV+ZLCEOirWt/6pHVxw8S2cQRaUAIZr5Wqbm+Jg
 rM3fMEBt/m5zLxNCTsBbj9UTwIYC1DXoCfkOq8elYbS7q1NF4uMPv1RPIbBg/hSx16Abjcc
 3u63/hKcbpCuN36AU2/eoe/iZ7wzqFr9/0i8cA6PnlD1pbxn8x5Icv4L2f178ize4WERz++
 MRplv2JSrNdBVBQ4VzQ1w==
UI-OutboundReport: notjunk:1;M01:P0:HWGYg0oDqpk=;1JVq/XLzDcOLSUX+3CmT8qKbXAH
 aeYDmQXRxK/klIdAyuBo8IJSGS9D8oLENqMkxOM32OBMH8kBLcXwP6RsQza18gzGaErsXfGrr
 R6Hd8gzCLfv+ZTMbfLI/UsZQ9rIeTlk17QABTb1cJzG3qI3GMXvb9VHM44H5y/DaSvliTi4rk
 O91Ux8YVfg1Ae01L3m1IRwN73lJNp7Ey0k6ISlNxgWTHu+e87FoQVbvMjFfyAZCz/AyXtTfGy
 zfqwVs+btbiPVH+m8CznZM8A99zuJMv053BtxSFN58KV6ypkUpNpN0TjwXPrpWk5Dvw9sHxoi
 0CKuU5SkJGYAJZaLhDdBCPTY/LuBPIGrRucgcGpOIuP1de/ZiDHJ/aV27YQcyVrrpU/rcuBzI
 Prt2OQNdXNfpn6uWCF2/mCwC1Qw4mI9/z3o1sFb8JCVKLWnMQLyscc5wR/7GcfrP9RrWTn58g
 T6fIapFCgcXH2CvndJN03usbagX3FObUl8u1BB9l9+mFLLAGOaNbc1xkVRDv1AYq54Lnc5wIh
 0iLIOk4GaJGxD/EmLjBncaSeTBXRM2adCv6XI7X0ue60BTNd6x9yprkecSreASPeiKbZb5ws+
 OAmUCRRh9gfyWmGBp21RTqL8Pqf5NoLhpWR1fx52gW54/VeyD8lCyh7pnBcXkTSaREGTvmhYc
 LzRB3mBwlw12BJPwpy1PwVf+1lHz3oX5RXVBymzOJk1gs1ExxRqLyeE37aHQdVnB59bVN65uY
 jgJhGep7+hPe+JEqBWcRmXxk8mMDFG8eQHB3iW/z8UFoWhiaopgHtntSQbiYthawrwtFBZQTN
 hOJhkvs77KdvptAbZEujlrdh2W5+2Me79oo0ldZdi3ktozLRygsSxzP4DTfyzkFMXH3LfkmPi
 jh0nYUvKzMc4AQz+33hVVEY2IdRvhL35gXVhoz7Rt3Hbo537RzYhzZ/FvaIouFPBiqcUBvKjs
 g21ZKYxNTnWThBcIeq086QIQXJU=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

SGkgYWdhaW4sDQoNCk9uIDI4LjA1LjIzIDA5OjMwLCBGcmFuayBTY2hlaW5lciB3cm90ZToN
Cj4gWy4uLl0NCj4gVGhhbmtzLCB0aGF0IHBhdGNoIChhcyAtcGF0Y2g0IG9uIHRvcCBvZiB2
Ni40LXJjMykgZml4ZXMgdGhlIGJvb3QgDQo+IHJlZ3Jlc3Npb24gZm9yIG1lIG9uIHRoZSBy
eDI2MjA6DQo+IA0KPiBbLi4uXQ0KPiANCj4gR3JlYXQhIEknbGwgZ2l2ZSBpdCBhIHRyeSBv
biBteSByeDI4MDAtaTIsIHRvbywgYnV0IGFzc3VtZSBpdCB3aWwgd29yayANCj4gdGhlcmUs
IHRvby4NCg0KSW5kZWVkLCAtcGF0Y2g0IGFsc28gbWFrZXMgaXQgd29yayBvbiB0aGUgcngy
ODAwLWkyOg0KDQpgYGANCkVMSUxPIHYzLjE2IGZvciBFRkkvSUEtNjQNCi4uDQpVbmNvbXBy
ZXNzaW5nIExpbnV4Li4uIGRvbmUNCkxvYWRpbmcgZmlsZSBBQzEwMDI3Qi5pbml0cmQuaW1n
Li4uZG9uZQ0KWyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiANCjYuNC4wLXJjMy00NGMw
MjZhNzNiZTgwMzhmMDNkYmRlZWYwMjhiNjQyODgwY2YxNTExLXBhdGNoNCAocm9vdEB4NDI3
MCkgDQooaWE2NC1saW51eC1nY2MgKEdDQykgMTIuMi4wLCBHTlUgbGQgKEdOVSBCaW51dGls
cykgMi4zOSkgIzEgU01QIFN1biBNYXkgDQoyOCAwOTowODo0NCBDRVNUIDIwMjMNClsgICAg
MC4wMDAwMDBdIGVmaTogRUZJIHYyLjEgYnkgSFANClsgICAgMC4wMDAwMDBdIGVmaTogU0FM
c3lzdGFiPTB4ZGZkZDYzYTE4IEVTST0weGRmZGQ2M2YxOCBBQ1BJIA0KMi4wPTB4M2QzYzQw
MTQgSENEUD0weGRmZmZmODc5OCBTTUJJT1M9MHgzZDM2ODAwMA0KWyAgICAwLjAwMDAwMF0g
UENEUDogdjMgYXQgMHhkZmZmZjg3OTgNClsgICAgMC4wMDAwMDBdIGVhcmx5Y29uOiB1YXJ0
ODI1MCBhdCBJL08gcG9ydCAweDQwMDAgKG9wdGlvbnMgJzExNTIwMG44JykNClsgICAgMC4w
MDAwMDBdIHByaW50azogYm9vdGNvbnNvbGUgW3VhcnQ4MjUwXSBlbmFibGVkDQpbICAgIDAu
MDAwMDAwXSBBQ1BJOiBFYXJseSB0YWJsZSBjaGVja3N1bSB2ZXJpZmljYXRpb24gZGlzYWJs
ZWQNClsgICAgMC4wMDAwMDBdIEFDUEk6IFJTRFAgMHgwMDAwMDAwMDNEM0M0MDE0IDAwMDAy
NCAodjAyIEhQICAgICkNClsgICAgMC4wMDAwMDBdIEFDUEk6IFhTRFQgMHgwMDAwMDAwMDNE
M0M0NTgwIDAwMDEyNCAodjAxIEhQICAgICBSWDI4MDAtMiANCjAwMDAwMDAxICAgICAgMDEw
MDAwMTMpDQpbLi4uXQ0KWyAgIDM2LjY0OTUzMV0gUnVuIC9pbml0IGFzIGluaXQgcHJvY2Vz
cw0KTG9hZGluZywgcGxlYXNlIHdhaXQuLi4NClN0YXJ0aW5nIHN5c3RlbWQtdWRldmQgdmVy
c2lvbiAyNTIuNi0xDQpbICAgMzYuODY1NjM1XSBwcHNfY29yZTogTGludXhQUFMgQVBJIHZl
ci4gMSByZWdpc3RlcmVkDQpbICAgMzYuODY5MzIxXSBwcHNfY29yZTogU29mdHdhcmUgdmVy
LiA1LjMuNiAtIENvcHlyaWdodCAyMDA1LTIwMDcgDQpSb2RvbGZvIEdpb21ldHRpIDxnaW9t
ZXR0aUBsaW51eC5pdD4NClsgICAzNi44ODUwMjVdIFBUUCBjbG9jayBzdXBwb3J0IHJlZ2lz
dGVyZWQNClsgICAzNi45MTA4NTJdIEFDUEk6IGJ1cyB0eXBlIFVTQiByZWdpc3RlcmVkDQpb
ICAgMzYuOTE4MTk4XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVy
IHVzYmZzDQpbICAgMzYuOTI0NzYyXSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZh
Y2UgZHJpdmVyIGh1Yg0KWyAgIDM2LjkyMjEzM10gaWdiOiBJbnRlbChSKSBHaWdhYml0IEV0
aGVybmV0IE5ldHdvcmsgRHJpdmVyDQpbICAgMzYuOTMxMzg2XSB1c2Jjb3JlOiByZWdpc3Rl
cmVkIG5ldyBkZXZpY2UgZHJpdmVyIHVzYg0KWyAgIDM2LjkzODE0OV0gaWdiOiBDb3B5cmln
aHQgKGMpIDIwMDctMjAxNCBJbnRlbCBDb3Jwb3JhdGlvbi4NClsuLi5dDQpbICBPSyAgXSBG
aW5pc2hlZCBhcHQtZGFpbHktdXBncmFkZeKApiBhcHQgdXBncmFkZSBhbmQgY2xlYW4gYWN0
aXZpdGllcy4NCg0KRGViaWFuIEdOVS9MaW51eCAxMiByeDI4MDAtaTIgLQ0KDQpyeDI4MDAt
aTIgbG9naW46DQpgYGANCg0KSSdsbCB0cnkgdG8gdGVzdCB0aGlzIG9uIG90aGVyIG1hY2hp
bmVzIChyeDQ2NDAgdy9NYWRpc29uLCByeDI2NjAgDQp3L01vbnRlY2l0by9Nb250dmFsZSwg
cng2NjAwIHcvTW9udHZhbGUpIGFzIHdlbGwsIHN0YXJ0aW5nIG9uIFR1ZXNkYXkgaWYgDQpw
b3NzaWJsZS4NCg0KKioqKg0KDQpUaGVyZSBpcyBhbiBpc3N1ZSAtIG9ubHkgZm9yIHRoZSBy
eDI4MDAtaTIgLSBzZWVtaW5nbHkgcmVsYXRlZCB0byBpdCdzIA0KUENJZSBOSUMocykgYW5k
IE1TSXMsIGJ1dCB0aGlzIGlzIGFscmVhZHkgdGhlcmUgaW4gNi4zLnggKHNlZSBmaXJzdCBw
YXJ0IA0Kb2YgWzFdKSBhbmQgKipub3QgcmVsYXRlZCB0byB0aGUgcHJvYmxlbSBvZiB0aGlz
IHRocmVhZCAoQUZBSUNUKSoqIGFuZCAtIA0KbW9yZSBpbXBvcnRhbnQgLSBkb2Vzbid0IGFm
ZmVjdCBvcGVyYXRpb246IFRoZSBtYWNoaW5lIGlzIHdvcmtpbmcgDQpkaXNrbGVzcyB1c2lu
ZyBvbmUgb2YgdGhvc2UgaW50ZXJmYWNlcyBzbyBpdCBjYW4ndCBiZSB0aGF0IGJhZC4gSSds
bCANCmxvb2sgaW50byBiaXNlY3RpbmcgdGhhdCBpc3N1ZSBhcyB3ZWxsLg0KDQpbMV06IGh0
dHBzOi8vbGlzdHMuZGViaWFuLm9yZy9kZWJpYW4taWE2NC8yMDIzLzA1L21zZzAwMDEwLmh0
bWwNCg0KQ2hlZXJzLA0KRnJhbmsNCg==
