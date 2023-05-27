Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A99A713684
	for <lists+linux-ia64@lfdr.de>; Sat, 27 May 2023 23:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjE0VOV (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 27 May 2023 17:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjE0VOU (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 27 May 2023 17:14:20 -0400
Received: from mout.web.de (mout.web.de [212.227.15.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100BCC7
        for <linux-ia64@vger.kernel.org>; Sat, 27 May 2023 14:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1685222014; i=frank.scheiner@web.de;
        bh=x6/ksJqKT1Cwzk2ep9cEU3TbU/7aMU39kdC0+EYbd6c=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=O4aeR4Z2nBcajGGP3echQDIl/CMT74jMHdRsvKqZrcJpU58IJrf9h6/y1Wib2i+kS
         xR7jZIl+okWPJWWWnY3IX29fgHCR1ERwdw58sZhNJgKkKeoEk67xsVQ4JTOi0M/Cqz
         7s6VKQW0IITU5/bbMGWachpmz/4WATSiUFytOHdQjpr8Ms8hWbDOHOKg8MCAByiFre
         lckFWYH2KiDpwgVQLNtklgM7MLJSvLD8IjvR6ZkfrszBx4bDVUvupU45Vo9R+7erLz
         SP98xYB/Ra7vDXmChl0MaxVpi/C48iFwOAdRi9Mhx6zIG0qOYVVyJ9OAL2vYYpRpfF
         mb6zWo0ohN/LA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([217.247.45.222]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MRW2D-1piJXn2IwH-00NCzZ; Sat, 27
 May 2023 23:13:34 +0200
Message-ID: <218eb812-e0bd-5a1f-ceb7-cfad1c277254@web.de>
Date:   Sat, 27 May 2023 23:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Boot regression in Linux v6.4-rc3
Content-Language: en-US
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
        linux-ia64@vger.kernel.org, song@kernel.org,
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
From:   Frank Scheiner <frank.scheiner@web.de>
In-Reply-To: <CAHk-=wjDQZ8snU__Y8qJ8M5H--1FtAwNq-oHKmY4CJuomWPvDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:YX1PyxX+EPveJ55hoO7jWhSvheB8UFq5vseN+tQMLdjSiWMXV2k
 nfLgF8s7TZakGSXTsOiQ3WsHshQffDNQULukcr3L08/xfSTIlHCtwjXhLtNv/ZCCzp7S1Sw
 qb9rkgx+LPEOuiWhzbAb/TFOBc2Pb6PiDtYF6FzKtSIupu0+CDExJMzmS38tiN2nmzSteL+
 DNNQH17tZv33GfLIqTPNw==
UI-OutboundReport: notjunk:1;M01:P0:KyQ2+ETd0MQ=;Fpo26i3cO828iacSrGoYQnHW5Rb
 +CWXYQ6BDUSwEZbOdpwVRLsQgkvJGXJoK+HqrbGGclfsM95NiQvmVaLX/fkEdelqsDvCAJoLs
 nLZ1bPldn7N/BvhKvjW6L8aItV6r5G5BHRB/YYEP06v6RSK0Spr00Z8II30VdFauRuUKU8aDi
 1Hy9zOJbD/F0Wl5WDjSLDGigCUzRSGRdOuiocvGJDwspBv4qwpN4TMr73GUQOnmjE3EnnnxAS
 ShMNI1L/b35tGM83zC717o6+4h7Arg1ux9JcPtvIW1xAE1BicfpSEDCAY55wbfP2h3HpXdc9A
 C8m5AvGV2xjlQTXlRom6IsqTaB6NW25BqF/Bb9J3cg82v/xrBpEV6nDSYK+hEj5rGBVDeB/wA
 VQMFr9mo0C+0PHt3LDQX81G/jMwkaeSqfz+pKemTpSPSLdHRbUez1pVWBFDmWDhg4GoVzJNnz
 FKTpzjiY7jKVOHlmO6djg2pnUuYn14bjwrEE5PycmqRCyyhpvr9WRJUT+52Q7b9OUWwM6Upvb
 k6PBI5i0QrT7JBed6E46jOKoSno8OLX+o9ZFO7snbiDVU4rk24mkal9A3J6lIN7VTknLLnRM4
 M5IfFmNg40lEInh5DaH8mE+q4tJCaV5mxfOHwxFpX5mlqHv6bS11PWAIHImwEGTjy9pHvvDCN
 aTDuibxZhraKFmdTt0N3yGptql67M60eMwinnkqUbPaM6BNo3Vrc3pihbkcG3sglrn1x/vMIS
 33Cyu+cs17CYV1mgnqkMDWlKhBIGB3UMildYrxygyWkENcKMsXxSA3XHmBSgtVEikKIFbKwd4
 UB8Mh7lVGZ+7lCNLdV0yIlxD5nx8O7ZEYw5bBXDrv52xujQnpy5a7zI7U0ppolUu6Q8CN9SAC
 93qHMRSpeb1BZ4aVyLZLyvaeuyOmlvWFk0lykYmgRJd9XiQov8kXUQAVLjZpUX22XX4FOCzia
 xNS1ylSiPTjoYnc139hUyX0j9s0=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

SGksDQoNCk9uIDI3LjA1LjIzIDIxOjM0LCBMaW51cyBUb3J2YWxkcyB3cm90ZToNCj4gT24g
U2F0LCBNYXkgMjcsIDIwMjMgYXQgMTE6NDHigK9BTSBGcmFuayBTY2hlaW5lciA8ZnJhbmsu
c2NoZWluZXJAd2ViLmRlPiB3cm90ZToNCj4+DQo+PiBPaywgSSBwdXQgdGhlIGRlY29kZWQg
Y29uc29sZSBtZXNzYWdlcyBvbiBbMl0uDQo+Pg0KPj4gWzJdOiBodHRwczovL3Bhc3RlYmlu
LmNvbS9kTFlNaWpmUw0KPiANCj4gVWdoLiBBcHBhcmVudGx5IGlhNjQgZGVjb2RpbmcgaXNu
J3QgZ3JlYXQuIEJ1dCBhdCBsZWFzdCBpdCBnaXZlcw0KPiBtdWx0aXBsZSBsaW5lIG51bWJl
cnM6DQo+IA0KPiAgICAgbG9hZF9tb2R1bGUgKGtlcm5lbC9tb2R1bGUvbWFpbi5jOjIyOTEg
a2VybmVsL21vZHVsZS9tYWluLmM6MjQxMg0KPiBrZXJuZWwvbW9kdWxlL21haW4uYzoyODY4
KQ0KPiANCj4gZXhjZXB0IHlvdXIga2VybmVsIG9idmlvdXNseSBoYXMgdGhvc2UgdGVzdC1w
YXRjaGVzLCBzbyBJIHN0aWxsIGRvbid0DQo+IGtub3cgZXhhY3RseSB3aGVyZSB0aGV5IGFy
ZS4NCg0KRXJtLCBJIHNlZS4gSSBkaWQgcmVjcmVhdGUgYSB2YW5pbGxhIHY2LjQtcmMzIGFu
ZCByYW4gdGhhdCwgZGVjb2RlZCANCnJlc3VsdCBpcyBvbiBbMV0gLSBub3Qgc3VyZSBpZiBp
dCBtYWtlcyBpdCBhIGxpdHRsZSBiZXR0ZXIuDQoNClsxXTogaHR0cHM6Ly9wYXN0ZWJpbi5j
b20vejVYekVuaHENCg0KSSBkaWQgYWxzbyB0cnkgdG8gYnVpbGQgYW5kIHJ1biBhIFNQIGtl
cm5lbCB0byBtYXliZSBnZXQgYSBiZXR0ZXIgDQpwaWN0dXJlIGluIHRoZSB0cmFjZXMsIGJ1
dCB0aGF0IHNlZW1zIHRvIHJlcXVpcmUgRkxBVE1FTSwgd2hpY2ggc2VlbXMgdG8gDQpub3Qg
d29yayBvbiB0aGF0IG1hY2hpbmUgb3IgZHVlIHRvIHRoZSB3YXkgaXQgaXMgY29uZmlndXJl
ZCAoYW5kIHllYWgsIA0KaXQgd2FzIGFsc28gdGhlIHdyb25nIGNvbW1pdCBJIHVzZWQgZm9y
IGl0IGFuZCBpdCB3YXMgcGF0Y2hlZC4uLik6DQoNCmBgYA0KWyAgICAwLjAwMDAwMF0gTGlu
dXggdmVyc2lvbiANCjYuNC4wLXJjMy05MzMxNzRhZTI4YmE3MmFiOGRlNWIzNWNiN2M5OGZj
MjExMjM1MDk2LXBhdGNoM19zcCANCihyb290QHg0MjcwKSAoaWE2NC1saW51eC1nY2MgKEdD
QykgMTIuMi4wLCBHTlUgbGQgKEdOVSBCaW51dGlscykgMi4zOSkgDQojMSBTYXQgTWF5IDI3
IDIxOjI4OjQ0IENFU1QgMjAyMw0KWy4uLl0NClsgICAgMC4wMDAwMDBdIEFDUEk6IFNTRFQg
MHgwMDAwMDAwMDNGRTM1QkE4IDAwMDEzQyAodjAxIEhQICAgICByeDI2MjAgDQowMDAwMDAw
NiBJTlRMIDIwMDUwMzA5KQ0KWyAgICAwLjAwMDAwMF0gQUNQSTogTG9jYWwgQVBJQyBhZGRy
ZXNzIChfX19fcHRydmFsX19fXykNClsgICAgMC4wMDAwMDBdIDEgQ1BVcyBhdmFpbGFibGUs
IDEgQ1BVcyB0b3RhbA0KWy4uLl0NClsgICAgMC4wMDAwMDBdIEtlcm5lbCBwYW5pYyAtIG5v
dCBzeW5jaW5nOiBDYW5ub3QgdXNlIEZMQVRNRU0gd2l0aCANCjI0Njc4NE1CIGhvbGUNClsg
ICAgMC4wMDAwMDBdIFBsZWFzZSBzd2l0Y2ggb3ZlciB0byBTUEFSU0VNRU0NClsgICAgMC4w
MDAwMDBdIC0tLVsgZW5kIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBDYW5ub3QgdXNl
IEZMQVRNRU0gDQp3aXRoIDI0Njc4NE1CIGhvbGUNClsgICAgMC4wMDAwMDBdIFBsZWFzZSBz
d2l0Y2ggb3ZlciB0byBTUEFSU0VNRU0gXS0tLQ0KYGBgDQoNCj4gQnV0IGl0IGxvb2tzIGxp
a2UgaXQgaXMgaW4gbW92ZV9tb2R1bGUoKS4gU3RyYW5nZS4gSSBkb24ndCBrbm93IGhvdyBp
dA0KPiBnZXRzIHRvICJfX2NvcHlfdXNlciIgZnJvbSB0aGVyZS4uLg0KPiANCj4gWyBMb29r
cyBhdCB0aGUgaWE2NCBjb2RlIF0NCj4gDQo+IE9oLg0KPiANCj4gSXQgdHVybnMgb3V0IHRo
YXQgaXQgKnNheXMqIF9fY29weV91c2VyKCksIGJ1dCB0aGUgY29kZSBpcyBhY3R1YWxseQ0K
PiBzaGFyZWQgd2l0aCB0aGUgcmVndWxhciBtZW1jcHkoKSBmdW5jdGlvbiwgd2hpY2ggZG9l
cw0KPiANCj4gICAgR0xPQkFMX0VOVFJZKG1lbWNweSkNCj4gICAgICAgICAgYW5kICAgICBy
Mjg9MHg3LGluMA0KPiAgICAgICAgICBhbmQgICAgIHIyOT0weDcsaW4xDQo+ICAgICAgICAg
IG1vdiAgICAgZjY9ZjANCj4gICAgICAgICAgbW92ICAgICByZXR2YWw9aW4wDQo+ICAgICAg
ICAgIGJyLmNvbmQuc3B0ayAuY29tbW9uX2NvZGUNCj4gICAgICAgICAgOzsNCj4gDQo+IHdo
ZXJlIHRoYXQgIi5jb21tb25fY29kZSIgbGFiZWwgaXMgLSBzdXJwcmlzZSBzdXJwcmlzZSAt
IHRoZSBjb21tb24NCj4gY29weSBjb2RlLCBhbmQgc28gd2hlbiB0aGUgb29wcyByZXBvcnRz
IHRoYXQgdGhlIHByb2JsZW0gaGFwcGVuZWQgaW4NCj4gX19jb3B5X3VzZXIoKSwgaXQgYWN0
dWFsbHkgaXMgaW4gdGhpcyBjYXNlIGp1c3QgYSBub3JtYWwgbWVtY3B5Lg0KPiANCj4gT2ss
IHNvIGl0J3MgcHJvYmFibHkgdGhlDQo+IA0KPiAgICAgICAgICBtZW1jcHkoZGVzdCwgKHZv
aWQgKilzaGRyLT5zaF9hZGRyLCBzaGRyLT5zaF9zaXplKTsNCj4gDQo+IGluIG1vdmVfbW9k
dWxlKCkgdGhhdCB0YWtlcyBhIGZhdWx0LiAgQW5kIGxvb2tpbmcgYXQgdGhlIHJlZ2lzdGVy
cywNCj4gdGhlIGRlc3RpbmF0aW9uIGlzIGluIHIxNy9yMTgsIGFuZCB5b3VyIGR1bXAgaGFz
DQo+IA0KPiAgICAgIHVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0
IHZpcnR1YWwgYWRkcmVzcyAxMDAwMDAwMDAwMDAwMDAwDQo+ICAgICAgLi4uDQo+ICAgICAg
cjE3IDogMGZmZmZmZmZmZmZmZmZmZiByMTggOiAxMDAwMDAwMDAwMDAwMDAwDQo+IA0KPiBz
byBpdCdzIGFsbW9zdCBjZXJ0YWlubHkgdGhhdCAnZGVzdCcgdGhhdCBpcyBiYWQuDQo+IA0K
PiBXaGljaCBJIGd1ZXNzIHNob3VsZG4ndCBzdXJwcmlzZSBhbnlib2R5Lg0KPiANCj4gQnV0
IHRoYXQncyB3aGVyZSBteSBrbm93bGVkZ2Ugb2YgaWE2NCBhbmQgdGhlIG5ldyBtb2R1bGUg
bG9hZGVyIGxheW91dCBlbmRzLg0KDQpUaGFua3MgZm9yIHlvdXIgaGVscCBhbmQgZ29pbmcg
YXMgZmFyIGFzIHlvdSBjb3VsZCwgdGhhdCdzIGdyZWF0bHkgDQphcHByZWNpYXRlZC4gUnVu
bmluZyB0aGF0IHN0dWZmIGlzIHN1cmVseSBlYXNpZXIgdGhhbiBkZWJ1Z2dpbmcgaXQuIDot
KQ0KDQpDaGVlcnMsDQpGcmFuaw0K
