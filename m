Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE4970A073
	for <lists+linux-ia64@lfdr.de>; Fri, 19 May 2023 22:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjESUS5 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 19 May 2023 16:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjESUS4 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 19 May 2023 16:18:56 -0400
Received: from mout.web.de (mout.web.de [212.227.15.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A43DFE
        for <linux-ia64@vger.kernel.org>; Fri, 19 May 2023 13:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1684527458; i=frank.scheiner@web.de;
        bh=XQJzCnB04iHl1jQnuJ0x9rhJEnkoTnHJcRcyqB/HFw0=;
        h=X-UI-Sender-Class:Date:From:Subject:To:Cc:References:In-Reply-To;
        b=tXmDyfwAxd6dFmo2pX1Iyfa3ODZkEQg5DDo6smTB3mSeKXm5UENPhZA54DlQGt2C4
         EwjrYlM8qDWSQ3r5tfgFAfUUUFIvoc1I4fdth0S/J2V6fm1t/qNPUeG7X2PiKb/r0g
         DyH36U18wXH7udI/dKRYQi+s5wADauLfus0crGFN+kZjVqXIdzoPbohvRMyUu2xPrp
         HvQXDC/aKV9jcxCp+C+QuJHPRNP4WwbtkpoAdC87/5/c01LxRsNCDETFKbEGI69pEd
         LJGthtLtEou8k8EcuBkgztBTlQRWIdyY94qVnrVMK3jGfmO1KBBQ7ro3ca9jVQB+f0
         XlfQ4Z9JkikGg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([79.200.209.18]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N5lnT-1qETxh0kod-017FOA; Fri, 19
 May 2023 22:17:38 +0200
Message-ID: <12a3e3c5-9465-c97f-58ab-938e80681fbc@web.de>
Date:   Fri, 19 May 2023 22:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From:   Frank Scheiner <frank.scheiner@web.de>
Subject: Re: [crosspost] dropping support for ia64
To:     matoro <matoro_mailinglist_kernel@matoro.tk>,
        Florian Weimer <fw@deneb.enyo.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        distributions@lists.freedesktop.org, debian-ia64@lists.debian.org,
        linux-ia64@vger.kernel.org, port-ia64@netbsd.org,
        Tony Luck <tony.luck@intel.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        Steve McIntyre <steve@einval.com>
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
 <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de>
 <87bkiilpc4.fsf@mid.deneb.enyo.de>
 <4e210d61adbe73a1673f113019401e5c@matoro.tk>
Content-Language: en-US
In-Reply-To: <4e210d61adbe73a1673f113019401e5c@matoro.tk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:WLWGoXnN/B59aEwORCPwWj+CDxgmdGBwPBiT+99MSqB6N3Yno19
 WFXPXYFGleqC8WwWXaKwLZtfswOJQQRzX1z9Ya0vXLX/nLD7zk0dj+jq4dSDfbfD/n4gWjK
 cCkoGwSdILZK7DsHaVzq5oHU3ss0SfacsIKmGMkAujRl2aoXiD9gvgPueg6z6gDQPfjdi2T
 rp0YkfHwLJa30kNsyRPqQ==
UI-OutboundReport: notjunk:1;M01:P0:vUctvZHTHGg=;XtELUQSdmYgOnLS2SFIe750CgJw
 AsslyPSfopY1QD8BTKvOKkDhKajAoY6oJe5VEmogVQpUJa51nWFguIB3Mx5yDHel+v2eDt1A1
 y0wGLcWaHdwJAPJQQlngyYptbp30kx/UHcbt9YLW3Ld1RHZMA2vqF99/Ju4TPH2meNbTaO3Wa
 0lBcnOMAms0EXNrbQ+/y4/6c7SPwkwCSRpXwlZFFXKU3TiQtd1gO4BQyO0gpYkTHe0WwbuFwv
 R+gwNrcVFauH1ZtQX7wAFYqWra2kLDQh7Ov3t+2F6hJ2ynsu2wOKYzhktPcaJKpc0i0A3eUUp
 YY9uywU77UNOa/UknqIB7h7sUf6d5OjQH0UszcUwut1jWgTxqyjE2DGxMZvM5V1RtuFLsUTxe
 3JTty67TQzKuvhtMQLeebcT0CXwtcOMi/pqrmasuJ91Ygx6tHoSg3ZgUlwhke/M1BQijpHr4q
 tobvo065C6RAIqtLMUYYqYN8WRq3lACqLHEQokjODbP51svfHuodeVmUYlhi0SZ8KgmX7kpLA
 0EOskgkcBMZp3FozNe+EKJeOcjBd7jQowpdXIkJECyPuOjPHwmghphbeqvPPtHZ5K95oTR+ix
 /jSq45hHryV81AUubB4Cje6eTBwIB5lFTNhP7tOc7jfP3odMJYITnItmzEaaPXVo8tFrxGn9M
 YquzZtU/GUJ8J+ohUq5B4N3dTcTLJMUljAom8PE4boseS1sccs8y6Gd3nmexd+nYAyJmlBfMX
 gsqgEiK2BQ2c1xtTBm+j6wuQ7bp3gkHWFQ0n+pIK5lcbE0AvwbYaVgmTj2xaMhKfH79lbEeyv
 d0whoUYEaK0BFYZ9W4dppwiwsTc794GN9gByIlNjbKIJr6SCpsnwp4qgO8Q1kGaUMG0gDEWM/
 kG1bBwXk+yg6F40xh/DHsZaA++HmzG45lD/1CJMLVkc/3bq7W7BoIucQIOmYOY5gFNmTVT1ku
 1z+lEVw+UVQ1car3bv0GWFfqE+U=
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

RGVhciBtYXRvcm8sIEZsb3JpYW4sDQoNCk9uIDE3LjA1LjIzIDIzOjQ3LCBtYXRvcm8gd3Jv
dGU6DQo+IE9uIDIwMjMtMDUtMTcgMTU6MzksIEZsb3JpYW4gV2VpbWVyIHdyb3RlOg0KPj4g
KiBGcmFuayBTY2hlaW5lcjoNCj4+DQo+Pj4gT24gMTIuMDUuMjMgMTc6NTcsIEFyZCBCaWVz
aGV1dmVsIHdyb3RlOg0KPj4+PiBUaGUgYm90dG9tIGxpbmUgaXMgdGhhdCwgd2hpbGUgSSBr
bm93IG9mIGF0IGxlYXN0IDIgcGVvcGxlIChvbiBjYykNCj4+Pj4gdGhhdCB0ZXN0IHN0dWZm
IG9uIGl0YW5pdW0sIGFuZCBwYWNrYWdlIHNvZnR3YXJlIGZvciBpdCwgSSBkb24ndCB0aGlu
aw0KPj4+PiB0aGVyZSBhcmUgYW55IGFjdHVhbCB1c2VycyByZW1haW5pbmcsIGFuZCBzbyBp
dCBpcyBkb3VidGZ1bCB3aGV0aGVyIGl0DQo+Pj4+IGlzIGp1c3RpZmllZCB0byBhc2sgcGVv
cGxlIHRvIHNwZW5kIHRpbWUgYW5kIGVmZm9ydCBvbiB0aGlzLg0KPj4+DQo+Pj4gV2hpbGUg
SSBnZXQgeW91ciBhcmd1bWVudCwgSSBhbHNvIGZpbmQgaXQgaW1wb3J0YW50IHRvIGJlIGFi
bGUgdG8NCj4+PiBpbm5vdmF0ZSB3aXRob3V0IGRlc3Ryb3lpbmcgdGhlIHBhc3QuIEFuZCB3
aXRoIHRoZSBhbHJlYWR5IHNldmVybHkNCj4+PiBsaW1pdGVkIGNob2ljZSBvZiBjdXJyZW50
IGFyY2hpdGVjdHVyZXMgZm9yIHRoZSBtYXNzZXMgKHg4NiwgYXJtKSwgaXQNCj4+PiBiZWNv
bWVzIGV2ZW4gbW9yZSBpbXBvcnRhbnQgdG8ga2VlcCB3aGF0IHdlIGhhdmUgb3IgaGFkIGlu
IHRoZSBwYXN0LCB0bw0KPj4+IG5vdCBlbmQgaW4gYSAiSWYgYWxsIHlvdSBoYXZlIGlzIGEg
aGFtbWVyLCBldmVyeXRoaW5nIGxvb2tzIGxpa2UgYQ0KPj4+IG5haWwuIiB0eXBlIG9mIGZ1
dHVyZS4NCj4+DQo+PiBUaGUgaGlzdG9yeSBkb2Vzbid0IGdvIGF3YXkuwqAgV2Ugc3RpbGwg
aGF2ZSBwcmUtYnVpbHQgaWE2NCBzeXN0ZW0NCj4+IGltYWdlcywgdGhlIHNvdXJjZXMsIGFu
ZCBjdXJyZW50IG1hY2hpbmVzIGNhbiBydW4gaWE2NCBjb2RlIHVuZGVyDQo+PiBRRU1VLsKg
IFRob3NlIGhvc3Qgc3lzdGVtcyB3aWxsIHJlbWFpbiBhdmFpbGFibGUgKG1heWJlIHVuZGVy
DQo+PiB2aXJ0dWFsaXphdGlvbikgZm9yIG1hbnksIG1hbnkgeWVhcnMgdG8gY29tZS7CoCBT
byBpZiBhbnlvbmUgd2FudHMgdG8NCj4+IGV4cGVyaW1lbnQgd2l0aCBhbiBhcmNoaXRlY3R1
cmUgdGhhdCBoYXMgcmVnaXN0ZXIgdHJhcCBiaXRzIGFuZCB0aGluZ3MNCj4+IGxpa2UgdGhh
dCwgaXQncyBwb3NzaWJsZS4NCj4+DQo+PiBJIGV4cGVjdCB0aGUgcmVzdCBvZiB0aGUgaGFy
ZHdhcmUgaXRzZWxmIGlzIG5vdCByZW1hcmthYmxlLCBhbmQNCj4+IGFueXRoaW5nIHVzZWZ1
bCBoYXMgYmVlbiB0aG9yb3VnaGx5IHJldXNlZCBmb3Igb3RoZXIgc3lzdGVtcyAobGlrZSB3
ZQ0KPj4gZGlkIGZvciB0aGUgSXRhbml1bSBDKysgQUJJIG9uIHRoZSBzb2Z0d2FyZSBzaWRl
KS4NCj4+DQo+PiBGcm9tIHRoZSB1c2Vyc3BhY2Ugc2lkZSwgdGhlIGlzc3VlIGlzIG5vdCBz
byBtdWNoIHRlc3RpbmcgKGlmIHdlDQo+PiBib3RoZXIgdG8gdGVzdCBvdXIgY2hhbmdlcyBh
dCBhbGwsIHdlIGNhbiB1c2UgZW11bGF0aW9uKSwgYnV0DQo+PiBoYWxmLWNvbXBsZXRlZCBp
bXBsZW1lbnRhdG9uIHdvcmsgKEkgcmFuIGludG8gbWlzc2luZyByZWxheGF0aW9ucyBpbg0K
Pj4gdGhlIGxpbmsgZWRpdG9yIGEgd2hpbGUgYmFjaywgZm9yIGV4YW1wbGUpLCBhbmQgdGhv
c2UgbGltaXRhdGlvbnMgaGF2ZQ0KPj4ga25vY2stb24gZWZmZWN0cyBvbiBnZW5lcmljIGNv
ZGUgdGhhdCB3ZSBoYXZlIHRvIG1haW50YWluLg0KPiANCj4gRllJLCBRRU1VIGRvZXMgbm90
IGhhdmUgaWE2NCBob3N0IG9yIHRhcmdldCBzdXBwb3J0LCBub3QgZXZlbiBUQ0cuDQoNCkkg
YXNzdW1lIEZsb3JpYW4gbWVhbnMgdXNlciBtb2RlIGVtdWxhdGlvbiwgd2hpY2ggZm9yIGV4
YW1wbGUgY2FuIGJlIA0KdXNlZCB0byBjb21wbGV0ZSBhIGBkZWJvb3RzdHJhcCAtLWZvcmVp
Z24gWy4uLl1gIHJ1biB3aGVuIHlvdSBkb24ndCBoYXZlIA0KYW4gZXhpc3RpbmcgaWE2NCB1
c2VybGFuZCBvbiByZWFsIGhhcmR3YXJlIGF0IGhhbmQuDQoNCkkgZG91YnQgdGhhdCBpdCB3
b3JrcyBpbiB0aGUgZXhhY3Qgc2FtZSB3YXkgdGhhbiB0aGUgcmVhbCB0aGluZywgdGhvdWdo
LiANClN1Y2ggZGlmZmVyZW5jZXMgYXJlIHBhcnQgb2YgdGhlIHJlYXNvbnMgd2h5IHRoZSBP
cGVuQlNEIGRldnMgZG9uJ3Qgc2VlbSANCnRvIHVzZSBjcm9zcyBjb21waWxlcnMgb3Igdmly
dHVhbGl6ZWQgb3IgZW11bGF0ZWQgc3lzdGVtcyB0byBwcm9kdWNlIGFuZCANCnRlc3QgdGhl
aXIgT1MsIHRob3VnaCB0aGV5IHNlZW0gdG8gdXNlIGNyb3NzIGNvbXBpbGVycyBmb3IgdGhl
IGJyaW5ndXAgDQpvZiBuZXcgcGxhdGZvcm1zIElJQy4NCg0KQnV0IGlmIGl0J3MgZ29vZCBl
bm91Z2ggdG8gcnVuIGlhNjQgYmluYXJpZXMgb24gb3RoZXIgYXJjaGVzLCB3aHkgbm90Lg0K
DQpIYXZlIGEgbmljZSB3ZWVrZW5kLA0KRnJhbmsNCg0K
