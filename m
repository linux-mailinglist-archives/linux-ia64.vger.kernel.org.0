Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8182371385A
	for <lists+linux-ia64@lfdr.de>; Sun, 28 May 2023 09:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjE1Hbe (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 28 May 2023 03:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjE1Hbd (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 28 May 2023 03:31:33 -0400
Received: from mout.web.de (mout.web.de [212.227.15.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79681D9
        for <linux-ia64@vger.kernel.org>; Sun, 28 May 2023 00:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1685259045; i=frank.scheiner@web.de;
        bh=6bqRSWCkmuY2G07TssCmNfcQk+TqoRLubq/C/EDijCo=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=pOiThrSeu1ug5x0KTq80OgNbA1iSSZPEd13I2gUW9CoWJUZsctvyh6JgO6RYiO0Pb
         sUk3vcItxPEU79f3eKG1EpH3fN9kL/1TNAoyPzZfl2wyeE4JK147KmduzMHxQJLNkE
         HA9Vqw1n+UXjtR3Dc1iV7OKtgQCT6GVmo5XckA+SJeZW8Y+Vva9ubjfCuTWMfe1Hmd
         H982pDYy5NcN26Rbime77iqZrtqsMpleG0ceHsE5lcA5AIAOtW5q6Yx9npvhNT7cTW
         rjUBkZNsN7yR0ABW95oKGtOPlh+JB9qy9IjbrmaMcMiFBClCIn1fHXSrid7GaoVaI3
         Ic00Ce5lrbEOQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([217.247.35.47]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N79RI-1qB93p2v8u-017nQh; Sun, 28
 May 2023 09:30:45 +0200
Message-ID: <ea6bb10a-f830-1a9f-19b1-07269a073876@web.de>
Date:   Sun, 28 May 2023 09:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Boot regression in Linux v6.4-rc3
Content-Language: en-US
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
From:   Frank Scheiner <frank.scheiner@web.de>
In-Reply-To: <CAPhsuW7Gcd7hkrD6RtBdJDMdVnaN8Bv_kVNdpyccUiuD-TqYDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:iNe4bm7ZOv5ibHNxMXCf5JYnGFW/wiiRe39hH2FRg4AtiPQKyhJ
 uiYFuerMT/chZs2xIn++ydtMXS2Sbfj6ubohihBpkgA+SAf3BP0MA+WYIRByITSgtYtcs1J
 fNqIpKZnwyI2AE5c0PmPAHcn268RYELeQtiEtiprju+HqZqj0X6gG7Ya0JUUjw6Fhl1esm1
 llWf+7ONoXvAinVVHiApg==
UI-OutboundReport: notjunk:1;M01:P0:0Nd1C9/SZX8=;bLaPv6ilDiWvG3NuPnwypYbNQnN
 kKyMylJMBURNUJZG4bRaVP6vm8Rku0cyYHxxz2uapfVf5rNsxCLXZY+6biBtXy0aYFIcs5PvI
 B3lG1LitP+82nZucWoMEuRSrLFSJWqWeGZtDPFleznkkXx8gJt6JZ7R9Oaz/eS1fCVqEVjxtd
 jDYMqqyBB4dzczkGUZ0pAxvyjsqxk69RdXbfX6wdQlA9QKkPpSDqrMR+I1hWLBJheA2lAF9QP
 ua0bmo26ZHNJq/1C3gNylh2nuV1gCFnzYyOc/jW/dcC8PZVJOdDXBmd19CSobpvpQwEGCcpJG
 F1sLooDQZ3tqfpAeePtQ6679RI74rlhuWooacaHjh7u7d/c39BSN8JbNl1wJCszEEEmb+Bp94
 klJHBGaCOWn8fxq0XQEh0J9g52RZmPHkAfpjM3+ahvegUbhoGS14dCKnIFomqQ27w8sNb3kXq
 4Qi0BsYsFTWRduq1D/SFiYkbwMA+0J3aY1Z8iVg6weDeHQGfRZyWSEr8sZK41wONzeEDDF262
 WctjuuokF/2RPuO7XTwlBQgeET3Ixf+pMgSDBnQ4IAnmi5wYTXOH3Dprn8qP1vLpRQqtJYp3O
 ilu0H9UYk//gwhME0wxjrdIkEQJ4360mdb7WTIpdBa4xUvK65BMFdd3fESc4SMTqLzVLzpGGF
 BlyGVGRxCf82ylQVC56/b8DbgvSqHIgF/JT0v1HC9Xt6IVMx/xx2sTtOc0n3jGsu4c5sZ8uly
 a8SBLUepVGaOlVYq6my3oJpFZtrD4mMRzorI1uzcaSpZLlA/IgKIAh7PWL57BaEsQyhpbXjun
 vdlJJcZTgg6JV2t+4k8vFfxklymuzIhjRTHq6UMTVJYhZIM5hAtgvNyT3oiZyYBEBAeRi/hNJ
 fGaXo4KoCXOBtA65t4YybbHmQmvutiu6zJazk8fExki2uFzhPmNdKag0YvZJ+0zNZZbE/BGN5
 YYodYg==
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

SGkgU29uZywgTGludXMsDQoNCk9uIDI4LjA1LjIzIDA3OjI0LCBTb25nIExpdSB3cm90ZToN
Cj4gQUZBSUNULCAgLmdvdCBzaG91bGQgZ28gdG8gcm9kYXRhLCB3aGlsZSAuc2RhdGEgYW5k
IC5zYnNzIHNob3VsZCBnbw0KPiB0byAocncpZGF0YS4gSG93ZXZlciwgcmVhZGluZyB0aGUg
Y29kZSBiZWZvcmUgdGhlIG1vZHVsZV9tZW1vcnkNCj4gY2hhbmdlLCBJIHRoaW5rIHRoZXkg
d2VyZSBhbGwgY29waWVkIHRvIChydylkYXRhLCB3aGljaCBpcyBub3QgaWRlYWwgYnV0DQo+
IG1vc3QgbGlrZWx5IE9LLg0KPiANCj4gVG8gbWF0Y2ggdGhlIGJlaGF2aW9yIGJlZm9yZSB0
aGUgbW9kdWxlX21lbW9yeSBjaGFuZ2UsIEkgdGhpbmsNCj4gd2UgbmVlZCBzb21ldGhpbmcg
bGlrZSB0aGUgZm9sbG93aW5nLg0KPiANCj4gRnJhbmssIGNvdWxkIHlvdSBwbGVhc2UgZ2l2
ZSBpdCBhIHRyeT8NCj4gDQo+IFRoYW5rcywNCj4gU29uZw0KPiANCj4gZGlmZiAtLWdpdCBp
L2tlcm5lbC9tb2R1bGUvbWFpbi5jIHcva2VybmVsL21vZHVsZS9tYWluLmMNCj4gaW5kZXgg
MGY5MTgzZjFjYTlmLi5lNGU3MjNlMWViMjEgMTAwNjQ0DQo+IC0tLSBpL2tlcm5lbC9tb2R1
bGUvbWFpbi5jDQo+ICsrKyB3L2tlcm5lbC9tb2R1bGUvbWFpbi5jDQo+IEBAIC0xNTE0LDE0
ICsxNTE0LDE0IEBAIHN0YXRpYyB2b2lkIF9fbGF5b3V0X3NlY3Rpb25zKHN0cnVjdCBtb2R1
bGUNCj4gKm1vZCwgc3RydWN0IGxvYWRfaW5mbyAqaW5mbywgYm9vbCBpDQo+ICAgICAgICAg
ICAgICAgICAgTU9EX1JPREFUQSwNCj4gICAgICAgICAgICAgICAgICBNT0RfUk9fQUZURVJf
SU5JVCwNCj4gICAgICAgICAgICAgICAgICBNT0RfREFUQSwNCj4gLSAgICAgICAgICAgICAg
IE1PRF9JTlZBTElELCAgICAvKiBUaGlzIGlzIG5lZWRlZCB0byBtYXRjaCB0aGUgbWFza3Mg
YXJyYXkgKi8NCj4gKyAgICAgICAgICAgICAgIE1PRF9EQVRBLA0KPiAgICAgICAgICB9Ow0K
PiAgICAgICAgICBzdGF0aWMgY29uc3QgaW50IGluaXRfbV90b19tZW1fdHlwZVtdID0gew0K
PiAgICAgICAgICAgICAgICAgIE1PRF9JTklUX1RFWFQsDQo+ICAgICAgICAgICAgICAgICAg
TU9EX0lOSVRfUk9EQVRBLA0KPiAgICAgICAgICAgICAgICAgIE1PRF9JTlZBTElELA0KPiAg
ICAgICAgICAgICAgICAgIE1PRF9JTklUX0RBVEEsDQo+IC0gICAgICAgICAgICAgICBNT0Rf
SU5WQUxJRCwgICAgLyogVGhpcyBpcyBuZWVkZWQgdG8gbWF0Y2ggdGhlIG1hc2tzIGFycmF5
ICovDQo+ICsgICAgICAgICAgICAgICBNT0RfSU5JVF9EQVRBLA0KPiAgICAgICAgICB9Ow0K
PiANCj4gICAgICAgICAgZm9yIChtID0gMDsgbSA8IEFSUkFZX1NJWkUobWFza3MpOyArK20p
IHsNCg0KVGhhbmtzLCB0aGF0IHBhdGNoIChhcyAtcGF0Y2g0IG9uIHRvcCBvZiB2Ni40LXJj
MykgZml4ZXMgdGhlIGJvb3QgDQpyZWdyZXNzaW9uIGZvciBtZSBvbiB0aGUgcngyNjIwOg0K
DQpgYGANCkVMSUxPIHYzLjE2IGZvciBFRkkvSUEtNjQNCi4uDQpVbmNvbXByZXNzaW5nIExp
bnV4Li4uIGRvbmUNCkxvYWRpbmcgZmlsZSBBQzEwMDIyMS5pbml0cmQuaW1nLi4uZG9uZQ0K
WyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiANCjYuNC4wLXJjMy00NGMwMjZhNzNiZTgw
MzhmMDNkYmRlZWYwMjhiNjQyODgwY2YxNTExLXBhdGNoNCAocm9vdEB4NDI3MCkgDQooaWE2
NC1saW51eC1nY2MgKEdDQykgMTIuMi4wLCBHTlUgbGQgKEdOVSBCaW51dGlscykgMi4zOSkg
IzEgU01QIFN1biBNYXkgDQoyOCAwOTowODo0NCBDRVNUIDIwMjMNClsgICAgMC4wMDAwMDBd
IGVmaTogRUZJIHYxLjEgYnkgSFANClsgICAgMC4wMDAwMDBdIGVmaTogU0FMc3lzdGFiPTB4
M2VlN2EwMDAgQUNQSSAyLjA9MHgzZmUyYTAwMCANCkVTST0weDNlZTdiMDAwIFNNQklPUz0w
eDNlZTdjMDAwIEhDRFA9MHgzZmUyODAwMA0KWyAgICAwLjAwMDAwMF0gUENEUDogdjMgYXQg
MHgzZmUyODAwMA0KWyAgICAwLjAwMDAwMF0gZWFybHljb246IHVhcnQ4MjUwIGF0IE1NSU8g
MHgwMDAwMDAwMGY0MDUwMDAwIChvcHRpb25zIA0KJzk2MDBuOCcpDQpbICAgIDAuMDAwMDAw
XSBwcmludGs6IGJvb3Rjb25zb2xlIFt1YXJ0ODI1MF0gZW5hYmxlZA0KWyAgICAwLjAwMDAw
MF0gQUNQSTogRWFybHkgdGFibGUgY2hlY2tzdW0gdmVyaWZpY2F0aW9uIGRpc2FibGVkDQpb
ICAgIDAuMDAwMDAwXSBBQ1BJOiBSU0RQIDB4MDAwMDAwMDAzRkUyQTAwMCAwMDAwMjggKHYw
MiBIUCAgICApDQpbICAgIDAuMDAwMDAwXSBBQ1BJOiBYU0RUIDB4MDAwMDAwMDAzRkUyQTAy
QyAwMDAwQ0MgKHYwMSBIUCAgICAgcngyNjIwIA0KMDAwMDAwMDAgSFAgICAwMDAwMDAwMCkN
ClsuLi5dDQpbICAgIDMuODEwMzQ2XSBSdW4gL2luaXQgYXMgaW5pdCBwcm9jZXNzDQpMb2Fk
aW5nLCBwbGVhc2Ugd2FpdC4uLg0KU3RhcnRpbmcgc3lzdGVtZC11ZGV2ZCB2ZXJzaW9uIDI1
Mi42LTENClsgICAgMy45ODUzNzhdIGUxMDAwOiBJbnRlbChSKSBQUk8vMTAwMCBOZXR3b3Jr
IERyaXZlcg0KWyAgICAzLjk4OTM3OF0gZTEwMDA6IENvcHlyaWdodCAoYykgMTk5OS0yMDA2
IEludGVsIENvcnBvcmF0aW9uLg0KWyAgICAzLjk5MzM3NV0gR1NJIDI5IChsZXZlbCwgbG93
KSAtPiBDUFUgNyAoMHgwNzAwKSB2ZWN0b3IgNTMNClsgICAgNC4wMzAzODJdIEFDUEk6IGJ1
cyB0eXBlIFVTQiByZWdpc3RlcmVkDQpbICAgIDQuMDMwMzgyXSB1c2Jjb3JlOiByZWdpc3Rl
cmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIHVzYmZzDQpbICAgIDQuMDM0MzgyXSB1c2Jjb3Jl
OiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIGh1Yg0KWyAgICA0LjAzNDM4Ml0g
dXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgZGV2aWNlIGRyaXZlciB1c2INClsgICAgNC4wNDA2
MDldIEdTSSAxOCAobGV2ZWwsIGxvdykgLT4gQ1BVIDAgKDB4MDAwMCkgdmVjdG9yIDU0DQpb
ICAgIDQuMDQwNjIxXSBlaGNpLXBjaSAwMDAwOjAwOjAxLjI6IEVIQ0kgSG9zdCBDb250cm9s
bGVyDQpbLi4uXQ0KWyAgT0sgIF0gRmluaXNoZWQgc3lzdGVtZC11cGRhdGUtdXTigKYgLSBS
ZWNvcmQgUnVubGV2ZWwgQ2hhbmdlIGluIFVUTVAuDQpbICAgMTQuNTY4NjA2XSBpb2MxOiBM
U0k1M0MxMDMwIEMwOiBDYXBhYmlsaXRpZXM9e0luaXRpYXRvcixUYXJnZXR9DQoNCkRlYmlh
biBHTlUvTGludXggMTIgcngyNjIwIC0NCg0KcngyNjIwIGxvZ2luOg0KYGBgDQoNCkdyZWF0
ISBJJ2xsIGdpdmUgaXQgYSB0cnkgb24gbXkgcngyODAwLWkyLCB0b28sIGJ1dCBhc3N1bWUg
aXQgd2lsIHdvcmsgDQp0aGVyZSwgdG9vLg0KDQpDaGVlcnMsDQpGcmFuaw0K
