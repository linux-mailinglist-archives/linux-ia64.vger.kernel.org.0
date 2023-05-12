Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF6B700F48
	for <lists+linux-ia64@lfdr.de>; Fri, 12 May 2023 21:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbjELTYy (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 12 May 2023 15:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237012AbjELTYw (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 12 May 2023 15:24:52 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384A71BC9
        for <linux-ia64@vger.kernel.org>; Fri, 12 May 2023 12:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683919492; x=1715455492;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=DOrqpIyXnc9KzIJJnXHw4dYjmTtOJsabzI7Hv6PY8OM=;
  b=B2HQJ6XAi6zpGIhbgJKP36yZQNhMwgvdp3axexW2fP3Uwi788Wer9smL
   gS2zwf6W1W81WNRYZfEI2po8qOk/TikWp6aa7AG40SV8+5xYpE72VqK7z
   t9yEGsrmXlliYEC3Xa7R7jFaEdxPgA7rTkv4x/qWzPtRse5J7ltmE0AIs
   yBpQ+UNqbWQQ3WbDbmbq9EoSu87sCbyRsliwMiw9B3oIptroHEtUpED+c
   e/I/9aHZmJ0Y+CzBdZUI+Pzc7zy5I18A7340bbcjVcVx5XeVBfGto6SCf
   zLcUkRWWEqWppDsURvaUa2Uut4vNbH3NuEgLedQAAELPeP8ABtcGha66e
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="350896208"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="350896208"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 12:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="730921908"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="730921908"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 12 May 2023 12:24:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 12:24:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 12:24:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 12:24:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 12:24:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrgoTBKHHqtdwpUWozkVzp6Ws8i/r8q9a0v3K+tx+CDiykRSdMCiwn5qCvyJAADYewSe8dir79FbhayuoSsccr0PjO0uPP0BSWOjXiPVNd8inYW5A8Q76rQ9mP9lcqgwY7sacKMSDi7IH/XnCEvB0mLtKn5KWcC9/icuIy19PceVFNXjwrfdRe89y+wSjIrSKAng41Mt0cXS6N865tGqgC/BtqNBgleVUCz449tO3FtnCT+DhJjxu2wm0QJvrWnkB6yrBDGtYJgJlG6VzFotUFB2dJbounVlYgpERW1/84gYmlowLPqc6tiOVziN6Qo3yDpuIUHsJKEjd2GIIdoQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOrqpIyXnc9KzIJJnXHw4dYjmTtOJsabzI7Hv6PY8OM=;
 b=LO3+QR//udiR39idCvfz5mTmEFjXYaukaAaVEdIgNR8SQj+VAe0emYzh6B+tfGbmLxnrolV4kSIzy1PoeXqYDZj1fmf8W2lI4swUCNmT84n+rrhcFq5Sq3iPT5tbwuvBLqlYJ8n7NRO4mgVe7MxjSKqgLHgCfoskav5sYHk5Su0ZTgndqA5oyL0g8k9+Rf0YJ28kifJOwysgvFe3ZtlQlTRMRA5kEO9EUr+UBs1WGSetsfFwlRvIgyWHpy8urS0Ek8k7+BTzbUhmg1BNd8Hvb/40eerVsr135BQ/sECwVatgki7BLMkcGa9hS/JaAs9Gok8sVgsaT/hftYbqwolXVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH3PR11MB8592.namprd11.prod.outlook.com (2603:10b6:610:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Fri, 12 May
 2023 19:24:45 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::a52e:e620:e80f:302]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::a52e:e620:e80f:302%6]) with mapi id 15.20.6363.032; Fri, 12 May 2023
 19:24:45 +0000
From:   "Luck, Tony" <tony.luck@intel.com>
To:     Jesse Dougherty <Jesse@Cypress-Tech.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        "distributions@lists.freedesktop.org" 
        <distributions@lists.freedesktop.org>,
        "debian-ia64@lists.debian.org" <debian-ia64@lists.debian.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Florian Weimer <fw@deneb.enyo.de>,
        "port-ia64@netbsd.org" <port-ia64@netbsd.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        matoro <matoro_mailinglist_kernel@matoro.tk>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        "Steve McIntyre" <steve@einval.com>
Subject: RE: [crosspost] dropping support for ia64
Thread-Topic: [crosspost] dropping support for ia64
Thread-Index: AQHZhOqMg1CrAZ0pI0edlx0M8Sd4pK9W+0sAgAAJVLA=
Date:   Fri, 12 May 2023 19:24:44 +0000
Message-ID: <SJ1PR11MB608361D3A56CF85CD433D135FC759@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
 <8fea5127-c985-8057-2654-9001cb6256c0@Cypress-Tech.com>
In-Reply-To: <8fea5127-c985-8057-2654-9001cb6256c0@Cypress-Tech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CH3PR11MB8592:EE_
x-ms-office365-filtering-correlation-id: ff01a4d9-8160-499e-5fae-08db531e8b03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YJJNzc6HqktpkUcm1L5l/W/DQsbiinimndQapkU2MTboeqAUb3D/50jAU1Sd+9w3nGGiPD7s6Z+TDcvQuD1d1g/Rx+9f9+R9b1oXA9cb8fmQK9TBLfqHfeQ8eca7ywa4mKnVujycdfDKcpD0gJnoD2i34oCDF8bD62jjNMUnv6KSy8gujEoiUmfAAFIdpPmjdvTF9P4ODoRtmj+9IrTVcsyz+jI7aINZntcZXCSE7Vpu1lqRJtJ1KHPVHcWRcuV/xSGADiDEP3OvZOB0gsbC0LvqQxEDekfCNORi+fjhaJ+OVPUX4jijxemL7HshDHuOtEpgvG2ZrUMW7vHNsKiR0K1klS9vpc+fjMKJPJ3/DIjl2JDo0xfcy1+0jU47BXq5ZBawpe6+aX94vLC8Ko24PLPtAi5iuYn1CHl7JEpWdH5GlaQHC2e3A7P+RHS/gVe7i1movB6GAV1gzafbygLKo9AwUneidre5BsDD07UEScvg9nsf/eZ9uPkryjzSo3qEzeL0ny7/YeRuJMNpyBFgGIFZ1kAkiuNe93452QqBk4WOifuiljStjb7kapxvUDz8Bh3/iK9EpfwqL4kOfwnSwKNU6CMw0cUeScgYNJmUYNqL+YYoGmsmfq7ZvtBzpsjZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199021)(64756008)(66446008)(76116006)(66946007)(66476007)(7696005)(66556008)(478600001)(110136005)(316002)(33656002)(86362001)(71200400001)(38070700005)(26005)(9686003)(6506007)(186003)(52536014)(55016003)(5660300002)(7416002)(8676002)(4744005)(8936002)(82960400001)(41300700001)(2906002)(921005)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2RQOHNZRVV6U1FiUTlhSDNzMGpjdU1pWVhieHEwTFB2OUR4V1hQUFdUQy9Q?=
 =?utf-8?B?MU5uYzNmbENPQ243UElSTlhOWDFWZnlMVUg0bko4cllVUFVOa2pCU3FERzBa?=
 =?utf-8?B?eXpkS1JpSzJIVnZDWGtqUVpRd2lDeWJyUG8rNzUzRHVxaFRLRjdJeDE0NjJ4?=
 =?utf-8?B?ZWJKYnhjOWZKSTFST0ZDNlRYbnVmK0pUVjBWQVFSUnU4M2VhN2kvWkErRzdH?=
 =?utf-8?B?ekhVUFlNODNOUi8yeUo2dTVqc1BCTEdZcDJPblVDcm9QMHdYUFU0S0FnTnBY?=
 =?utf-8?B?RktiQ29IYzVJMFplaWs2QTBYeWNkWGltZXE5S0hPSm1LNTc0Wnkrb3lpZ0lB?=
 =?utf-8?B?ZW91VDJMT0MwU1BYOWxudW41enNZdlFUeGxpT0NqazZldXFNSjdMc20wMmtK?=
 =?utf-8?B?b2tldm8yeEFWNEkySzRSM28vNzYyREtUSGVKRzBWaXpqYkdHVHl3Q3g4RjhW?=
 =?utf-8?B?VFREM29LTHVLVnMydlZ3ZkVaMUxlaXJUNEVMTVpLMEJIdW84N1VZYndFQ0ow?=
 =?utf-8?B?VHExaG9EVHNCZ1JCTk1PME96ZXNaSVRLVk5tZnBRT3NTbEl5eXpuakZCQUlh?=
 =?utf-8?B?SHg0dCtJR2orMkNVWWF2WUo4TTNXWFRMdTkyNVBvN2Q3WktPeEhpd0hqVjJL?=
 =?utf-8?B?d0xtVmJtL2pRaEdmYWQ2Zkt4cDdjV3hoWXlEOHJhQzBUdnIxRzFWVUk3dWlx?=
 =?utf-8?B?WmpTdnJUdHFnOVRvc0g4dnk5dExiYUptblcwcndoWVZIVzNHTXRuYmZhWCtL?=
 =?utf-8?B?QVIvaFJEN3d3MDgxNDJSbjJ4bWtpL3J5TXVtQnp4dXBJRVFQblBpWFNmc1Uw?=
 =?utf-8?B?QXBCWXNyb25ROW10M3cwVVZrZ1cyVWFMd1hMQ0lBOTZTN2VSQ2svajRKams1?=
 =?utf-8?B?UzdNaE9nWHQ2T0Z4T2s5MTJaM3ZsYWZHamN4Z25BNFl0K3ljSnVBVk9WTjNV?=
 =?utf-8?B?UkFHakhQMXhuNkFQM0d4SmV2RFN2cy9pUDZPZmJoam53dFpvN0ZpTXg1ZEcx?=
 =?utf-8?B?UTNoc0lLZHl3RkVldW9HZmFQdThsWnVRLzBKbGZiVFJTVENPNkRra3NyR05p?=
 =?utf-8?B?ZCt1M3IvU0RraVB4cjEwQmI5TkRHVUsvZkd2L2w3Y0N1OTdPNHFZQjVIWEQ4?=
 =?utf-8?B?TWFTQkl5U21qMm9oN2N1VFdIMzNHS3BDWEF6OTRsZ1p0NWRxZmhrVFRRTjM5?=
 =?utf-8?B?S1FMakUvK210aEgzK2s1UkV3TU10WEVZS1pnak9rYUlNWmFrbEcwN29aNEM5?=
 =?utf-8?B?MWt5NlUrUzNZdVhPZDNLY0RCVDQ2VFBGajlmWUxueUh6a0VnVDBKV1JBK09U?=
 =?utf-8?B?K0FiR0lBL3Naa203UTBwaHErN1hpYjRWc3NaeDlXeUYrNElQczJ0dE0yRjlU?=
 =?utf-8?B?eWxEQlIvOWozK0JtRllEMXZyUXJVc3h6OHA1K3o1a05vWHJ6NVhMOFdFZE1R?=
 =?utf-8?B?dkFoWGR4NUl1KzFnd0ljSEFLbWl4enhpWnZoT0tTRnFRQkxua2RaMlVOYjhQ?=
 =?utf-8?B?TkpleUlnMXV6dTVsemtnSkEwT2N5eUNwWXREVFp1cGtETWsyNTJiamJJdmVU?=
 =?utf-8?B?TUd4VkN6ZXl2Y2d3RTB6TWlaVmNTT2huNjRSN0d2anNRbUdZeDcyNXNndjlZ?=
 =?utf-8?B?TVYrVXpycnpxYWs2TXR3d0JqNDlDRlM4RGlEQy9MODd0Y0xmclQyeDhoY2NS?=
 =?utf-8?B?Q0JySmZxU3BqZHRPdlUxbkxNcUFUY2NPc2tPY2dNdzFpVGp0L1FwbjUrc1pi?=
 =?utf-8?B?VUNpeXFOTFgvVUJqOVBMOHJEVENqaWNzMFhMZGtTMkFkSitOVE9GTUJQNC9Z?=
 =?utf-8?B?SEhTcFZ4UEN6Z0tjekY2YXhpRlZWcXBtY1EwTmFXcWJsT0N6MS9hUWVNUTd0?=
 =?utf-8?B?elJTNXB0aFFPZENtdndFYS93UnY1NDB3VnRhRW42MFpIK1orS0pJR3lpUm12?=
 =?utf-8?B?ZDVvdXQ5YXluajhMZ3p5VElac0hreU0zZHhkblA3c1JueVEvdUovVmZGaU1W?=
 =?utf-8?B?b3BDdkdmTGVFamhCZVVmd0s1a3I0aW5NL2tzd2hFVlRjbFJLNGlRYnFYR0U1?=
 =?utf-8?B?eWU2L3J0QjlTbER2d3hzb2lYT05scjVDYUlCZDMrSlNXdmgzNkpnUUwxZkFX?=
 =?utf-8?Q?cIQU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff01a4d9-8160-499e-5fae-08db531e8b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 19:24:44.9270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQ5mfmnKSWfg8JCeZrlvqrEaWh/GEIgAvxE3he5tQ2X5DeXxnBvUrtbqXeJsksawisbWPABRF2rVV8o9TzVeGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8592
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

PiBJJ20gYSBsaXR0bGUgYmlhcyBiZWNhdXNlIG15IGNvbXBhbnkgaXMgYSByZS1zZWxsZXJzIG9m
IHRoZSBIUCBJdGFuaXVtIA0KPiBpYTY0IGhhcmR3YXJlIChSWCAmIFpYIGJveGVzKSwgYXMgd2Vs
bCBhcyBQQS1SSVNDLiBGb3IgdGhhdCByZWFzb24sIEkgDQo+IHdvdWxkIGhhdGUgdG8gc2VlIGl0
IGZhZGUgYXdheSBpbiBhbnkgc2VjdG9yLiBUaGUgaWE2NCBwbGF0Zm9ybSBpcyBzdGlsbCANCj4g
d2lkZWx5IHVzZWQgd2l0aCBIUC1VWCBVbml4IGFuZCBPcGVuIFZNUyB1c2VycyB3b3JsZHdpZGUu
IA0KDQpCdXQgaXMgYW55b25lIGRlcGxveWluZyBMaW51eCB2Ni54IGtlcm5lbHMgaW4gcHJvZHVj
dGlvbiBlbnZpcm9ubWVudHM/DQoNCi1Ub255DQoNCg==
