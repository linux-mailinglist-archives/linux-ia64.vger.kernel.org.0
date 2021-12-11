Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9750471284
	for <lists+linux-ia64@lfdr.de>; Sat, 11 Dec 2021 08:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhLKHh0 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 11 Dec 2021 02:37:26 -0500
Received: from mail-eopbgr120072.outbound.protection.outlook.com ([40.107.12.72]:36800
        "EHLO FRA01-PR2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229455AbhLKHh0 (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Sat, 11 Dec 2021 02:37:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMaBpBCXJzSB3LrXvFQbs10SnCIByhaqX9REZWSPMXq9lJ3I5Jaho8YkKn+9VH6JEe9TWs3ksc71l191xKQyOFctq3vbb6wh1qrxzQuEGWZCPcrbUheVtpBRTw+6OR1j5mvkFo8T0f7oY/CVCukLSkDFYC1udxXYkzEBDCK3HF+j1pdphKZ+CXhlhBEuytgTcsWXdj+TGluosuBCPZV0UzKMvXLyoKTnXXTxUY8eSVUGE2t7o4wz+O2eOnu80Cv9eLDiWPdGl5qgv3Hch9X4OKbnqLwq5ZEni7yZLU7QRzejnDl4JFsvmlEbKAAfO4qwjvXzpSpIIrWEbA4HtWalbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8oNhHwJ/unpyIFfsQzMMumgs+DV8BIjUNzt2be5q3g=;
 b=TGe7sQ+YZVByA8zkFwx8ZFlKGBqaxZrvSDiL3QB7iJ02u2FJwbZJfNHX2lBNU/wiOs18ueVnVRr6AAw6CX4zlzRLdCpDkQ/LZageVNpA7kCQFR4oc8pHSWPBxVj96z8rQlOn0zZ/IKwEPdW7fZauUhAGGwMo+zyo/r1d6dQfEjZBakyZt7PzYj6MBdgNJTKCbtxaV3MvTLV10pNKitLEFQUsYvQCorfyRVPeLisdPWjvIj2ZWPMymI1FzveDHhIhlJ7biHKymJSQm2SecpXXlJFgmnJuv32MsGZ5tHpxjCN4z5CHwClVV3fYsvjwJcrdfJRBnTUvkljVvg4gu/vq9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0420.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 07:37:21 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 07:37:21 +0000
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
CC:     "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Baoquan He <bhe@redhat.com>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vivek Goyal <vgoyal@redhat.com>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Dave Young <dyoung@redhat.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] kdump: vmcore: move copy_to() from vmcore.c to
 uaccess.h
Thread-Topic: [PATCH 1/2] kdump: vmcore: move copy_to() from vmcore.c to
 uaccess.h
Thread-Index: AQHX7cwgdwEGMiNprEO/AabKcy7+sqwr8t+AgAD1ZAA=
Date:   Sat, 11 Dec 2021 07:37:21 +0000
Message-ID: <d72f6169-4779-0901-ae1d-743a93a196c4@csgroup.eu>
References: <1639143361-17773-1-git-send-email-yangtiezhu@loongson.cn>
 <1639143361-17773-2-git-send-email-yangtiezhu@loongson.cn>
 <20211210085903.e7820815e738d7dc6da06050@linux-foundation.org>
In-Reply-To: <20211210085903.e7820815e738d7dc6da06050@linux-foundation.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee90a413-023b-4bed-fce6-08d9bc791163
x-ms-traffictypediagnostic: MR2P264MB0420:EE_
x-microsoft-antispam-prvs: <MR2P264MB0420293D6A7AEEAADCE03F2FED729@MR2P264MB0420.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jPTa2rkqMFOC/AFA/pPUAY5w9I6cjQFlVBvGIP4f/n/J2LrEFIHUFHbpDebarqqV6nFzJuAeIW675tE24puWBcPJ5l62WllZKwwXmmPIdg3tALxC3T2SK+Qz8iNa17n8iJC2O7S9SNkaoSZvVYTpu/3HrrFoSFPju7ZjUYJq7xtfTNjv77Hg1mslk9Yrnl/jvq59auUhg9YME2cExBUWezgveGwJ1HTf+FwelEvHHC4BdSPyXa7yAfr0Klz68s26LlAQMc2DWKFsEF/63niY69tD9YC5l5TiU4fGNj5VLeFUvjPq9At9wskck9SCN2LJTUTeNqBBbbMydb5HMfDFvj9//ZJh6qftWxBLVk1/bHsvIq71lqSH2tc3s+Doltn42Q57A/JszLw71nzuS78+aWYEWqZtqwrFZs/UREZf+GTPBMAHV2hRPt367ogx4ZCuirD46gsqtoJgGHE3JuQFR76U5bwneUNcmBARtJipW3qW4mqne6glannYtzbpHoOjEytULsusjEBfqPYCPJhTNW9dgl/xeFleNbNEpNqIZ8kZgrFkfyO0k80LTkKLGG6EEyOq3MNCdi8OAfj58jw41ypBWSpWAlL+Oc86OwM16eQ/0hJSXOEsgsoT31JHrH612hAcTfF71ROGD5vOLS9CUDSWI4d/i4EyqO1f8Mg4MBkCdoVOG21ZFSyZdRT/jLiG2B0h87tzMABoyFs7hUVBwjz7tYQr/VBrL6iBAYtjbtZqYMKYiACZORiXEYvojYp7B8buWegnpDukt24OCUDfzw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66574015)(6506007)(44832011)(31686004)(2616005)(71200400001)(31696002)(26005)(110136005)(54906003)(186003)(316002)(5660300002)(6512007)(4326008)(66446008)(36756003)(38100700002)(8676002)(122000001)(91956017)(38070700005)(86362001)(83380400001)(7416002)(2906002)(76116006)(508600001)(66946007)(66556008)(66476007)(64756008)(8936002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFJaVVJkRnJOaTl4K3c5a3NxWXFZOHRqakZxbkJSdnJST05DdDErdnFTS3VR?=
 =?utf-8?B?ajV4ZHFQWmc2cmNWczRHbE1NbG9HelhtN2FDc3NOekFiWFUzUjlvNWpyNkFt?=
 =?utf-8?B?SzlFVnlyS0crOERNRXFCMjhna25GTktiYWEvT2xFOHFrMDBpSm9LSW5GNnA3?=
 =?utf-8?B?d0RJY3VzRUl6cW5ZRnBjV09jNzUwdkRzUVFsbE1naDBxekNPcFcvZE1xV3JV?=
 =?utf-8?B?VGFqcEt0bXdtRU5Pd2lOMWhrVFlXVjYvK2hGWGIvajN6bExFeEdSWG53SS9y?=
 =?utf-8?B?RUJFTkRTcy9sbHBpM2ttRmZyVkNid3pwNG9zNXRDUDZpUnBRdGFPNklmZWVk?=
 =?utf-8?B?RTg1elRRTGJLWU1MS2RoV09mWG5YMWlwLzlvRmxza1Q3Q3ZZZFUySml1RmYr?=
 =?utf-8?B?WGFyMmZqbHdXSWtmdm1Ob1dJN0NKUWtmVlF1TnMzV0RUWm95ZDNmcTdTSjUy?=
 =?utf-8?B?bGovUXVDTmV2WnZNVFM2YXBwSEZIRU05S3Z3L2lDR3psYUNPeWVJZy9pY3Yz?=
 =?utf-8?B?cTdOV1FISThEOHVDam8zSjJ2U0xmaXRnZi9LbnEyTUxkTHBsSmFxY29JYVlz?=
 =?utf-8?B?M3dtcDRCcVVnbW4zSzVmUHkwOXNKcm53WVlFbXMzaEw3YjE1YUQ4UWtPSnE2?=
 =?utf-8?B?WC9qNlN6Z0p6TzN3d0NVbjZvN2RFeTdqczgxdWI3SG1nU2FKMVBqWFQvbVNE?=
 =?utf-8?B?NGVqTEtZWjdQNGtzVlJEM2Q0TEp6RGpUS1FoWWFVWVNEcXFtdTZ4Y0w5OUxz?=
 =?utf-8?B?Zmx3cVVTRGJmbmhVaTNGYjlDVS9OZDRQaEpCallwMk9mVlZTWCtaUWdJRnJi?=
 =?utf-8?B?TU9CcFNYVGxQQjBrYVBOZnljWGY2enIxUVc0S0taa0tBUzh0ZG50U1NGcC9p?=
 =?utf-8?B?M0xnQzQ0ZG5ud0Q0NXBPTkZwK1hvUkl4QWRFVHZLZXFrNENPL21jZmFkQlJJ?=
 =?utf-8?B?V3ZSVjB3dWtJekVCblhuNVF2Rll1clpVUnZWY0p3SUxhUFlzMWZIaU9palAx?=
 =?utf-8?B?aTFVYjNQOFZ1ZzQ4Y3dqb3piZUlNbGVCU2NqVlNuWG5BU2tnUDdwOG5TcFg3?=
 =?utf-8?B?MHBYZzBRT1FBSW4wM1pFbTJNTk1CTXY2aWVtT2Nad3duMDhJQVh5elJ1bk1l?=
 =?utf-8?B?NVEzVzNjWmpFcHY5SG5iUTU4QVg5eUFwSXgxVnQwV3hhSW44VGxMZVdMaXZK?=
 =?utf-8?B?eWN0S2VkSTMza29YcVdtU1VYSkcrc25sZDZDQjd4S1lad29EbUJDQWpUbkRz?=
 =?utf-8?B?TytIVFV3bVd3K0xhUzE0NnZ1STdwTU5qUzFsSi96VG5TZHA5dUphU05UajhK?=
 =?utf-8?B?VW9TajJCWGdiUXVYaG01UHJNWmg4WklNeTE3VVlWSG1Ua2ExMkg1c3ZuQ3g1?=
 =?utf-8?B?RU1WenZGK0tJUFlFY3lkbUtVOXN5cEVZS2VlOXR3cTkvc0NyY0VjZlBTd2Jp?=
 =?utf-8?B?R3dHRTNzRGVlc2xVVytXeDVuelNlNWsxY1c2Q2ZjUkp4OHc0eUtmamN4b2VH?=
 =?utf-8?B?Q1NGdm1LZFhzcll6U1BvUmM0aXhCeWJYY3NuM1Qvd3F2by83V1pVcmJlR21o?=
 =?utf-8?B?SjM2WnpxeTJsM1Y1RkxxWUpJeGlua1pmUG1DM1FoRmVjdXdwVUcwY2VBdXJj?=
 =?utf-8?B?L1VwZGhOWHRMcjV2NFdFUGhGQUlEWTRLY0VhUk44cFQ3VkFVSHY1Nk05VjND?=
 =?utf-8?B?YTFrcTdJNjJTOStOb3dmL2NQelpvRm1MeEN5aVlIT0RMVEJLK21sQnhiTEp3?=
 =?utf-8?B?c1lnMGlJMFdMNDBPczJDQTRxNHJxMVZGK1R3LzkyNG5BZ1A0SjR0aUs2L3RJ?=
 =?utf-8?B?YmtVWkRnamwwSGtBYWg1dmZxV3lpZkF4OFB0M285eFhqY29ZOE9KRURTV2JL?=
 =?utf-8?B?ME5tUVdLQVlSbW9oeThCUVBiTkw5MlViRWdGejJmeEtCS2Y0VTdodzh0RXZx?=
 =?utf-8?B?ZDNzN1Vya0luN2V2VjdjYnE4MjMrN3ZsV1BvakJKTkFobUhqaWF0dWFKSHdz?=
 =?utf-8?B?eDFCQlgyMDgzaG8wZ1JYQXJ0bFk5SVRMeUQrVmwzV0RvUkpqdXFZcUlvVVVp?=
 =?utf-8?B?STFtVTNDblZBVEM4MWsyUWszM0YzYVVSRFdZK3N5VlAyK3dSQlBBR3JwVkM2?=
 =?utf-8?B?N3hsTWRIVS8rY1FVSWRXdXMybXcvV2IvU2VabHEwUm1JVTdaeHJhQWZTUzlt?=
 =?utf-8?B?ZTVDU01wNndua0JQdGVCRURIODZ5VmZFd0ZwMzUrV0ZpRUFTQ1BHeGwvSU9s?=
 =?utf-8?Q?IM32YzpyJQU+eO2dTE5VwbqrwtErkcz76jz+/l2yC4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7114388A094A546AFAC6B136F6A9CD4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ee90a413-023b-4bed-fce6-08d9bc791163
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2021 07:37:21.7241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DjzOaQ0OEMJhdfMcf7JMUFkulPPgNmcsMjLGcutVVIGYPaq/QFBxjdsmnubDWgarXDHhQ1h/doUQq3eg6dATwc+F5rlJ5xef25ha5s5P1Dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0420
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

DQoNCkxlIDEwLzEyLzIwMjEgw6AgMTc6NTksIEFuZHJldyBNb3J0b24gYSDDqWNyaXTCoDoNCj4g
T24gRnJpLCAxMCBEZWMgMjAyMSAyMTozNjowMCArMDgwMCBUaWV6aHUgWWFuZyA8eWFuZ3RpZXpo
dUBsb29uZ3Nvbi5jbj4gd3JvdGU6DQo+IA0KPj4gSW4gYXJjaC8qL2tlcm5lbC9jcmFzaF9kdW1w
Ki5jLCB0aGVyZSBleGlzdCBzaW1pbGFyIGNvZGUgYWJvdXQNCj4+IGNvcHlfb2xkbWVtX3BhZ2Uo
KSwgbW92ZSBjb3B5X3RvKCkgZnJvbSB2bWNvcmUuYyB0byB1YWNjZXNzLmgsDQo+PiBhbmQgdGhl
biB3ZSBjYW4gdXNlIGNvcHlfdG8oKSB0byBzaW1wbGlmeSB0aGUgcmVsYXRlZCBjb2RlLg0KPj4N
Cj4+IC4uLg0KPj4NCj4+IC0tLSBhL2ZzL3Byb2Mvdm1jb3JlLmMNCj4+ICsrKyBiL2ZzL3Byb2Mv
dm1jb3JlLmMNCj4+IEBAIC0yMzgsMjAgKzIzOCw2IEBAIGNvcHlfb2xkbWVtX3BhZ2VfZW5jcnlw
dGVkKHVuc2lnbmVkIGxvbmcgcGZuLCBjaGFyICpidWYsIHNpemVfdCBjc2l6ZSwNCj4+ICAgCXJl
dHVybiBjb3B5X29sZG1lbV9wYWdlKHBmbiwgYnVmLCBjc2l6ZSwgb2Zmc2V0LCB1c2VyYnVmKTsN
Cj4+ICAgfQ0KPj4gICANCj4+IC0vKg0KPj4gLSAqIENvcHkgdG8gZWl0aGVyIGtlcm5lbCBvciB1
c2VyIHNwYWNlDQo+PiAtICovDQo+PiAtc3RhdGljIGludCBjb3B5X3RvKHZvaWQgKnRhcmdldCwg
dm9pZCAqc3JjLCBzaXplX3Qgc2l6ZSwgaW50IHVzZXJidWYpDQo+PiAtew0KPj4gLQlpZiAodXNl
cmJ1Zikgew0KPj4gLQkJaWYgKGNvcHlfdG9fdXNlcigoY2hhciBfX3VzZXIgKikgdGFyZ2V0LCBz
cmMsIHNpemUpKQ0KPj4gLQkJCXJldHVybiAtRUZBVUxUOw0KPj4gLQl9IGVsc2Ugew0KPj4gLQkJ
bWVtY3B5KHRhcmdldCwgc3JjLCBzaXplKTsNCj4+IC0JfQ0KPj4gLQlyZXR1cm4gMDsNCj4+IC19
DQo+PiAtDQo+PiAgICNpZmRlZiBDT05GSUdfUFJPQ19WTUNPUkVfREVWSUNFX0RVTVANCj4+ICAg
c3RhdGljIGludCB2bWNvcmVkZF9jb3B5X2R1bXBzKHZvaWQgKmRzdCwgdTY0IHN0YXJ0LCBzaXpl
X3Qgc2l6ZSwgaW50IHVzZXJidWYpDQo+PiAgIHsNCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L3VhY2Nlc3MuaCBiL2luY2x1ZGUvbGludXgvdWFjY2Vzcy5oDQo+PiBpbmRleCBhYzAzOTQw
Li40YTZjM2U0IDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9saW51eC91YWNjZXNzLmgNCj4+ICsr
KyBiL2luY2x1ZGUvbGludXgvdWFjY2Vzcy5oDQo+PiBAQCAtMjAxLDYgKzIwMSwyMCBAQCBjb3B5
X3RvX3VzZXIodm9pZCBfX3VzZXIgKnRvLCBjb25zdCB2b2lkICpmcm9tLCB1bnNpZ25lZCBsb25n
IG4pDQo+PiAgIAlyZXR1cm4gbjsNCj4+ICAgfQ0KPj4gICANCj4+ICsvKg0KPj4gKyAqIENvcHkg
dG8gZWl0aGVyIGtlcm5lbCBvciB1c2VyIHNwYWNlDQo+PiArICovDQo+PiArc3RhdGljIGlubGlu
ZSBpbnQgY29weV90byh2b2lkICp0YXJnZXQsIHZvaWQgKnNyYywgc2l6ZV90IHNpemUsIGludCB1
c2VyYnVmKQ0KPj4gK3sNCj4+ICsJaWYgKHVzZXJidWYpIHsNCj4+ICsJCWlmIChjb3B5X3RvX3Vz
ZXIoKGNoYXIgX191c2VyICopIHRhcmdldCwgc3JjLCBzaXplKSkNCj4+ICsJCQlyZXR1cm4gLUVG
QVVMVDsNCj4+ICsJfSBlbHNlIHsNCj4+ICsJCW1lbWNweSh0YXJnZXQsIHNyYywgc2l6ZSk7DQo+
PiArCX0NCj4+ICsJcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPiANCj4gT3JkaW5hcmlseSBJJ2Qg
c2F5ICJ0aGlzIGlzIHRvbyBsYXJnZSB0byBiZSBpbmxpbmVkIi4gIEJ1dCB0aGUgZnVuY3Rpb24N
Cj4gaGFzIG9ubHkgYSBzaW5nbGUgY2FsbHNpdGUgcGVyIGFyY2hpdGVjdHVyZSBzbyBpbmxpbmlu
ZyBpdCB3b24ndCBjYXVzZQ0KPiBibG9hdCBhdCBwcmVzZW50Lg0KPiANCj4gQnV0IGhvcGVmdWxs
eSBjb3B5X3RvKCkgd2lsbCBnZXQgYWRkaXRpb25hbCBjYWxsZXJzIGluIHRoZSBmdXR1cmUsIGlu
DQo+IHdoaWNoIGNhc2UgaXQgc2hvdWxkbid0IGJlIGlubGluZWQuICBTbyBJJ20gdGhpbmtpbmcg
aXQgd291bGQgYmUgYmVzdA0KPiB0byBzdGFydCBvdXQgd2l0aCB0aGlzIGFzIGEgcmVndWxhciBu
b24taW5saW5lZCBmdW5jdGlvbiwgaW4NCj4gbGliL3VzZXJjb3B5LmMuDQo+IA0KPiBBbHNvLCBj
b3B5X3RvKCkgaXMgYSB2ZXJ5IHBvb3IgbmFtZSBmb3IgYSBnbG9iYWxseS12aXNpYmxlIGhlbHBl
cg0KPiBmdW5jdGlvbi4gIEJldHRlciB3b3VsZCBiZSBjb3B5X3RvX3VzZXJfb3Jfa2VybmVsKCks
IGFsdGhvdWdoIHRoYXQncw0KPiBwZXJoYXBzIGEgYml0IGxvbmcuDQo+IA0KPiBBbmQgdGhlIGB1
c2VyYnVmJyBhcmcgc2hvdWxkIGhhdmUgdHlwZSBib29sLCB5ZXM/DQo+IA0KDQpJIHRoaW5rIGtl
ZXBpbmcgaXQgaW5saW5lZCBpcyBiZXR0ZXIuDQoNCmNvcHlfb2xkbWVtX3BhZ2UoKSBpcyBiaWdn
ZXIgd2l0aCB2MiAob3V0bGluZWQpIHRoYW4gd2l0aCB2MSAoaW5saW5lZCksIA0Kc2VlIGJvdGgg
YmVsb3c6DQoNCnYxOg0KDQowMDAwMDAwMCA8Y29weV9vbGRtZW1fcGFnZT46DQogICAgMDoJOTQg
MjEgZmYgZTAgCXN0d3UgICAgcjEsLTMyKHIxKQ0KICAgIDQ6CTkzIGUxIDAwIDFjIAlzdHcgICAg
IHIzMSwyOChyMSkNCiAgICA4Ogk3YyBiZiAyYiA3OSAJbXIuICAgICByMzEscjUNCiAgICBjOgk0
MCA4MiAwMCAxNCAJYm5lICAgICAyMCA8Y29weV9vbGRtZW1fcGFnZSsweDIwPg0KICAgMTA6CTgz
IGUxIDAwIDFjIAlsd3ogICAgIHIzMSwyOChyMSkNCiAgIDE0OgkzOCA2MCAwMCAwMCAJbGkgICAg
ICByMywwDQogICAxODoJMzggMjEgMDAgMjAgCWFkZGkgICAgcjEscjEsMzINCiAgIDFjOgk0ZSA4
MCAwMCAyMCAJYmxyDQogICAyMDoJMjggMWYgMTAgMDAgCWNtcGx3aSAgcjMxLDQwOTYNCiAgIDI0
Ogk5MyA2MSAwMCAwYyAJc3R3ICAgICByMjcsMTIocjEpDQogICAyODoJN2MgMDggMDIgYTYgCW1m
bHIgICAgcjANCiAgIDJjOgk5MyA4MSAwMCAxMCAJc3R3ICAgICByMjgsMTYocjEpDQogICAzMDoJ
OTMgYTEgMDAgMTQgCXN0dyAgICAgcjI5LDIwKHIxKQ0KICAgMzQ6CTdjIDliIDIzIDc4IAltciAg
ICAgIHIyNyxyNA0KICAgMzg6CTkwIDAxIDAwIDI0IAlzdHcgICAgIHIwLDM2KHIxKQ0KICAgM2M6
CTdjIGRkIDMzIDc4IAltciAgICAgIHIyOSxyNg0KICAgNDA6CTkzIGMxIDAwIDE4IAlzdHcgICAg
IHIzMCwyNChyMSkNCiAgIDQ0Ogk3YyBmYyAzYiA3OCAJbXIgICAgICByMjgscjcNCiAgIDQ4Ogk0
MCA4MSAwMCAwOCAJYmxlICAgICA1MCA8Y29weV9vbGRtZW1fcGFnZSsweDUwPg0KICAgNGM6CTNi
IGUwIDEwIDAwIAlsaSAgICAgIHIzMSw0MDk2DQogICA1MDoJNTQgN2UgNjAgMjYgCXJsd2lubSAg
cjMwLHIzLDEyLDAsMTkNCiAgIDU0Ogk3ZiBjMyBmMyA3OCAJbXIgICAgICByMyxyMzANCiAgIDU4
Ogk3ZiBlNCBmYiA3OCAJbXIgICAgICByNCxyMzENCiAgIDVjOgk0OCAwMCAwMCAwMSAJYmwgICAg
ICA1YyA8Y29weV9vbGRtZW1fcGFnZSsweDVjPg0KCQkJNWM6IFJfUFBDX1JFTDI0CW1lbWJsb2Nr
X2lzX3JlZ2lvbl9tZW1vcnkNCiAgIDYwOgkyYyAwMyAwMCAwMCAJY21wd2kgICByMywwDQogICA2
NDoJNDEgODIgMDAgMzAgCWJlcSAgICAgOTQgPGNvcHlfb2xkbWVtX3BhZ2UrMHg5ND4NCiAgIDY4
OgkyYyAxYyAwMCAwMCAJY21wd2kgICByMjgsMA0KICAgNmM6CTNmIGRlIGMwIDAwIAlhZGRpcyAg
IHIzMCxyMzAsLTE2Mzg0DQogICA3MDoJN2YgNjMgZGIgNzggCW1yICAgICAgcjMscjI3DQogICA3
NDoJN2YgZTUgZmIgNzggCW1yICAgICAgcjUscjMxDQogICA3ODoJN2MgOWUgZWEgMTQgCWFkZCAg
ICAgcjQscjMwLHIyOQ0KICAgN2M6CTQxIDgyIDAwIDdjIAliZXEgICAgIGY4IDxjb3B5X29sZG1l
bV9wYWdlKzB4Zjg+DQogICA4MDoJNDggMDAgMDAgMDEgCWJsICAgICAgODAgPGNvcHlfb2xkbWVt
X3BhZ2UrMHg4MD4NCgkJCTgwOiBSX1BQQ19SRUwyNAlfY29weV90b191c2VyDQogICA4NDoJMmMg
MDMgMDAgMDAgCWNtcHdpICAgcjMsMA0KICAgODg6CTQxIGEyIDAwIDQ4IAliZXEgICAgIGQwIDxj
b3B5X29sZG1lbV9wYWdlKzB4ZDA+DQogICA4YzoJM2IgZTAgZmYgZjIgCWxpICAgICAgcjMxLC0x
NA0KICAgOTA6CTQ4IDAwIDAwIDQwIAliICAgICAgIGQwIDxjb3B5X29sZG1lbV9wYWdlKzB4ZDA+
DQogICA5NDoJN2YgYzMgZjMgNzggCW1yICAgICAgcjMscjMwDQogICA5ODoJMzggYTAgMDUgOTEg
CWxpICAgICAgcjUsMTQyNQ0KICAgOWM6CTM4IDgwIDEwIDAwIAlsaSAgICAgIHI0LDQwOTYNCiAg
IGEwOgk0OCAwMCAwMCAwMSAJYmwgICAgICBhMCA8Y29weV9vbGRtZW1fcGFnZSsweGEwPg0KCQkJ
YTA6IFJfUFBDX1JFTDI0CWlvcmVtYXBfcHJvdA0KICAgYTQ6CTJjIDFjIDAwIDAwIAljbXB3aSAg
IHIyOCwwDQogICBhODoJN2MgN2UgMWIgNzggCW1yICAgICAgcjMwLHIzDQogICBhYzoJN2MgODMg
ZWEgMTQgCWFkZCAgICAgcjQscjMscjI5DQogICBiMDoJN2YgZTUgZmIgNzggCW1yICAgICAgcjUs
cjMxDQogICBiNDoJN2YgNjMgZGIgNzggCW1yICAgICAgcjMscjI3DQogICBiODoJNDEgODIgMDAg
NDggCWJlcSAgICAgMTAwIDxjb3B5X29sZG1lbV9wYWdlKzB4MTAwPg0KICAgYmM6CTQ4IDAwIDAw
IDAxIAlibCAgICAgIGJjIDxjb3B5X29sZG1lbV9wYWdlKzB4YmM+DQoJCQliYzogUl9QUENfUkVM
MjQJX2NvcHlfdG9fdXNlcg0KICAgYzA6CTJjIDAzIDAwIDAwIAljbXB3aSAgIHIzLDANCiAgIGM0
Ogk0MCA4MiAwMCA0NCAJYm5lICAgICAxMDggPGNvcHlfb2xkbWVtX3BhZ2UrMHgxMDg+DQogICBj
ODoJN2YgYzMgZjMgNzggCW1yICAgICAgcjMscjMwDQogICBjYzoJNDggMDAgMDAgMDEgCWJsICAg
ICAgY2MgPGNvcHlfb2xkbWVtX3BhZ2UrMHhjYz4NCgkJCWNjOiBSX1BQQ19SRUwyNAlpb3VubWFw
DQogICBkMDoJODAgMDEgMDAgMjQgCWx3eiAgICAgcjAsMzYocjEpDQogICBkNDoJN2YgZTMgZmIg
NzggCW1yICAgICAgcjMscjMxDQogICBkODoJODMgNjEgMDAgMGMgCWx3eiAgICAgcjI3LDEyKHIx
KQ0KICAgZGM6CTgzIDgxIDAwIDEwIAlsd3ogICAgIHIyOCwxNihyMSkNCiAgIGUwOgk3YyAwOCAw
MyBhNiAJbXRsciAgICByMA0KICAgZTQ6CTgzIGExIDAwIDE0IAlsd3ogICAgIHIyOSwyMChyMSkN
CiAgIGU4Ogk4MyBjMSAwMCAxOCAJbHd6ICAgICByMzAsMjQocjEpDQogICBlYzoJODMgZTEgMDAg
MWMgCWx3eiAgICAgcjMxLDI4KHIxKQ0KICAgZjA6CTM4IDIxIDAwIDIwIAlhZGRpICAgIHIxLHIx
LDMyDQogICBmNDoJNGUgODAgMDAgMjAgCWJscg0KICAgZjg6CTQ4IDAwIDAwIDAxIAlibCAgICAg
IGY4IDxjb3B5X29sZG1lbV9wYWdlKzB4Zjg+DQoJCQlmODogUl9QUENfUkVMMjQJbWVtY3B5DQog
ICBmYzoJNGIgZmYgZmYgZDQgCWIgICAgICAgZDAgPGNvcHlfb2xkbWVtX3BhZ2UrMHhkMD4NCiAg
MTAwOgk0OCAwMCAwMCAwMSAJYmwgICAgICAxMDAgPGNvcHlfb2xkbWVtX3BhZ2UrMHgxMDA+DQoJ
CQkxMDA6IFJfUFBDX1JFTDI0CW1lbWNweQ0KICAxMDQ6CTRiIGZmIGZmIGM0IAliICAgICAgIGM4
IDxjb3B5X29sZG1lbV9wYWdlKzB4Yzg+DQogIDEwODoJM2IgZTAgZmYgZjIgCWxpICAgICAgcjMx
LC0xNA0KICAxMGM6CTRiIGZmIGZmIGJjIAliICAgICAgIGM4IDxjb3B5X29sZG1lbV9wYWdlKzB4
Yzg+DQoNCg0KdjI6DQoNCjAwMDAwMDAwIDxjb3B5X29sZG1lbV9wYWdlPjoNCiAgICAwOgk5NCAy
MSBmZiBlMCAJc3R3dSAgICByMSwtMzIocjEpDQogICAgNDoJOTMgZTEgMDAgMWMgCXN0dyAgICAg
cjMxLDI4KHIxKQ0KICAgIDg6CTdjIGJmIDJiIDc5IAltci4gICAgIHIzMSxyNQ0KICAgIGM6CTkz
IGMxIDAwIDE4IAlzdHcgICAgIHIzMCwyNChyMSkNCiAgIDEwOgkzYiBjMCAwMCAwMCAJbGkgICAg
ICByMzAsMA0KICAgMTQ6CTQwIDgyIDAwIDE4IAlibmUgICAgIDJjIDxjb3B5X29sZG1lbV9wYWdl
KzB4MmM+DQogICAxODoJN2YgYzMgZjMgNzggCW1yICAgICAgcjMscjMwDQogICAxYzoJODMgZTEg
MDAgMWMgCWx3eiAgICAgcjMxLDI4KHIxKQ0KICAgMjA6CTgzIGMxIDAwIDE4IAlsd3ogICAgIHIz
MCwyNChyMSkNCiAgIDI0OgkzOCAyMSAwMCAyMCAJYWRkaSAgICByMSxyMSwzMg0KICAgMjg6CTRl
IDgwIDAwIDIwIAlibHINCiAgIDJjOgkyOCAxZiAxMCAwMCAJY21wbHdpICByMzEsNDA5Ng0KICAg
MzA6CTkzIDYxIDAwIDBjIAlzdHcgICAgIHIyNywxMihyMSkNCiAgIDM0Ogk3YyAwOCAwMiBhNiAJ
bWZsciAgICByMA0KICAgMzg6CTkzIDgxIDAwIDEwIAlzdHcgICAgIHIyOCwxNihyMSkNCiAgIDNj
Ogk5MyBhMSAwMCAxNCAJc3R3ICAgICByMjksMjAocjEpDQogICA0MDoJN2MgZGIgMzMgNzggCW1y
ICAgICAgcjI3LHI2DQogICA0NDoJOTAgMDEgMDAgMjQgCXN0dyAgICAgcjAsMzYocjEpDQogICA0
ODoJN2MgOWQgMjMgNzggCW1yICAgICAgcjI5LHI0DQogICA0YzoJN2MgZmMgM2IgNzggCW1yICAg
ICAgcjI4LHI3DQogICA1MDoJNDAgODEgMDAgMDggCWJsZSAgICAgNTggPGNvcHlfb2xkbWVtX3Bh
Z2UrMHg1OD4NCiAgIDU0OgkzYiBlMCAxMCAwMCAJbGkgICAgICByMzEsNDA5Ng0KICAgNTg6CTU0
IDdlIDYwIDI2IAlybHdpbm0gIHIzMCxyMywxMiwwLDE5DQogICA1YzoJN2YgYzMgZjMgNzggCW1y
ICAgICAgcjMscjMwDQogICA2MDoJN2YgZTQgZmIgNzggCW1yICAgICAgcjQscjMxDQogICA2NDoJ
NDggMDAgMDAgMDEgCWJsICAgICAgNjQgPGNvcHlfb2xkbWVtX3BhZ2UrMHg2ND4NCgkJCTY0OiBS
X1BQQ19SRUwyNAltZW1ibG9ja19pc19yZWdpb25fbWVtb3J5DQogICA2ODoJMmMgMDMgMDAgMDAg
CWNtcHdpICAgcjMsMA0KICAgNmM6CTQxIDgyIDAwIDU0IAliZXEgICAgIGMwIDxjb3B5X29sZG1l
bV9wYWdlKzB4YzA+DQogICA3MDoJM2YgZGUgYzAgMDAgCWFkZGlzICAgcjMwLHIzMCwtMTYzODQN
CiAgIDc0Ogk3YyA5ZSBkYSAxNCAJYWRkICAgICByNCxyMzAscjI3DQogICA3ODoJN2YgODYgZTMg
NzggCW1yICAgICAgcjYscjI4DQogICA3YzoJN2YgYTMgZWIgNzggCW1yICAgICAgcjMscjI5DQog
ICA4MDoJN2YgZTUgZmIgNzggCW1yICAgICAgcjUscjMxDQogICA4NDoJNDggMDAgMDAgMDEgCWJs
ICAgICAgODQgPGNvcHlfb2xkbWVtX3BhZ2UrMHg4ND4NCgkJCTg0OiBSX1BQQ19SRUwyNAljb3B5
X3RvX3VzZXJfb3Jfa2VybmVsDQogICA4ODoJM2IgYzAgZmYgZjIgCWxpICAgICAgcjMwLC0xNA0K
ICAgOGM6CTJjIDAzIDAwIDAwIAljbXB3aSAgIHIzLDANCiAgIDkwOgk0MCA4MiAwMCAwOCAJYm5l
ICAgICA5OCA8Y29weV9vbGRtZW1fcGFnZSsweDk4Pg0KICAgOTQ6CTdmIGZlIGZiIDc4IAltciAg
ICAgIHIzMCxyMzENCiAgIDk4Ogk4MCAwMSAwMCAyNCAJbHd6ICAgICByMCwzNihyMSkNCiAgIDlj
Ogk4MyA2MSAwMCAwYyAJbHd6ICAgICByMjcsMTIocjEpDQogICBhMDoJODMgODEgMDAgMTAgCWx3
eiAgICAgcjI4LDE2KHIxKQ0KICAgYTQ6CTdjIDA4IDAzIGE2IAltdGxyICAgIHIwDQogICBhODoJ
ODMgYTEgMDAgMTQgCWx3eiAgICAgcjI5LDIwKHIxKQ0KICAgYWM6CTdmIGMzIGYzIDc4IAltciAg
ICAgIHIzLHIzMA0KICAgYjA6CTgzIGUxIDAwIDFjIAlsd3ogICAgIHIzMSwyOChyMSkNCiAgIGI0
Ogk4MyBjMSAwMCAxOCAJbHd6ICAgICByMzAsMjQocjEpDQogICBiODoJMzggMjEgMDAgMjAgCWFk
ZGkgICAgcjEscjEsMzINCiAgIGJjOgk0ZSA4MCAwMCAyMCAJYmxyDQogICBjMDoJN2YgYzMgZjMg
NzggCW1yICAgICAgcjMscjMwDQogICBjNDoJOTMgNDEgMDAgMDggCXN0dyAgICAgcjI2LDgocjEp
DQogICBjODoJMzggYTAgMDUgOTEgCWxpICAgICAgcjUsMTQyNQ0KICAgY2M6CTM4IDgwIDEwIDAw
IAlsaSAgICAgIHI0LDQwOTYNCiAgIGQwOgk0OCAwMCAwMCAwMSAJYmwgICAgICBkMCA8Y29weV9v
bGRtZW1fcGFnZSsweGQwPg0KCQkJZDA6IFJfUFBDX1JFTDI0CWlvcmVtYXBfcHJvdA0KICAgZDQ6
CTdmIDg2IGUzIDc4IAltciAgICAgIHI2LHIyOA0KICAgZDg6CTdjIDgzIGRhIDE0IAlhZGQgICAg
IHI0LHIzLHIyNw0KICAgZGM6CTdjIDdhIDFiIDc4IAltciAgICAgIHIyNixyMw0KICAgZTA6CTdm
IGU1IGZiIDc4IAltciAgICAgIHI1LHIzMQ0KICAgZTQ6CTdmIGEzIGViIDc4IAltciAgICAgIHIz
LHIyOQ0KICAgZTg6CTQ4IDAwIDAwIDAxIAlibCAgICAgIGU4IDxjb3B5X29sZG1lbV9wYWdlKzB4
ZTg+DQoJCQllODogUl9QUENfUkVMMjQJY29weV90b191c2VyX29yX2tlcm5lbA0KICAgZWM6CTNi
IGMwIGZmIGYyIAlsaSAgICAgIHIzMCwtMTQNCiAgIGYwOgkyYyAwMyAwMCAwMCAJY21wd2kgICBy
MywwDQogICBmNDoJNDAgODIgMDAgMDggCWJuZSAgICAgZmMgPGNvcHlfb2xkbWVtX3BhZ2UrMHhm
Yz4NCiAgIGY4Ogk3ZiBmZSBmYiA3OCAJbXIgICAgICByMzAscjMxDQogICBmYzoJN2YgNDMgZDMg
NzggCW1yICAgICAgcjMscjI2DQogIDEwMDoJNDggMDAgMDAgMDEgCWJsICAgICAgMTAwIDxjb3B5
X29sZG1lbV9wYWdlKzB4MTAwPg0KCQkJMTAwOiBSX1BQQ19SRUwyNAlpb3VubWFwDQogIDEwNDoJ
ODAgMDEgMDAgMjQgCWx3eiAgICAgcjAsMzYocjEpDQogIDEwODoJODMgNDEgMDAgMDggCWx3eiAg
ICAgcjI2LDgocjEpDQogIDEwYzoJODMgNjEgMDAgMGMgCWx3eiAgICAgcjI3LDEyKHIxKQ0KICAx
MTA6CTdjIDA4IDAzIGE2IAltdGxyICAgIHIwDQogIDExNDoJODMgODEgMDAgMTAgCWx3eiAgICAg
cjI4LDE2KHIxKQ0KICAxMTg6CTgzIGExIDAwIDE0IAlsd3ogICAgIHIyOSwyMChyMSkNCiAgMTFj
Ogk0YiBmZiBmZiA5MCAJYiAgICAgICBhYyA8Y29weV9vbGRtZW1fcGFnZSsweGFjPg0KDQoNCkNo
cmlzdG9waGU=
