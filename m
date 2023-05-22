Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB1D70C43C
	for <lists+linux-ia64@lfdr.de>; Mon, 22 May 2023 19:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjEVR1b (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 22 May 2023 13:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjEVR1a (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 22 May 2023 13:27:30 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74464FA
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 10:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684776449; x=1716312449;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GVuHVVbzLFft6o9UgY74RQnR56/HjPqbyna8UkGJLs0=;
  b=mHdSytSeXeYbXaTL9QeNayQE3cJ0h0FbpvaGxOh/nAOzlH6yVsjYR4MC
   GHyicJAs4Zz8JKzwqkMq4UZytQh8GIT3pcUAdzjlE11RP/c9lltp3J7/6
   dq5lA6Xr+S/IdGGZX5Ch6VshS4wlmQ0XNXr5sOYs9cTsk9JJzOUFzLDh7
   RkpPXf7EZ0mzIYa+pUDLCztg6VoGmfnHyAAI/E9Gx7OFP9mHHBuS7E3ze
   fXLtFWi3Ay/Bb1JcAUOhp2zrf2Kr5vgtw5O5StiIgGw1QQYYsbCp9wHSh
   Ts34ADNSPcx2lyYmX7xM8hjI+OcdQmquDBPHWE96/zRfWwhsTQ8lTJHuz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="416452545"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="416452545"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 10:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="734346628"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="734346628"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP; 22 May 2023 10:27:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 10:27:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 10:27:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 10:27:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5DMwTk7Rtln9nB4E8LwGrRXCNa33gN+AZw99YLc6+dHT0X5bsrivzywxq/8UFP8O0H/V+ACJJasNr89nJWojSHC+XJ2HMkPR0HfY43CPRsUeUyCTmMrU8tV1plSLh3IHC3SaL6W9IBW613Tsc6HfcqDc1cYahKtyNs2EaOt7Ng1Zsxgf8T+Z2823HPsKurxEmnedVoe2wP7dgPiDzTD7zvuRHDuI8fKXHhMsRFvrECvGKeqzE8pX3AkSfp5H+vL3CxEBrucO1HD4gnxDMfgBUtmESWb5UyUEpnOKr9ZYZT51VPM+cdtzjJguGwTg5G1jhL3MX4JtfpnlaCzWBjehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVuHVVbzLFft6o9UgY74RQnR56/HjPqbyna8UkGJLs0=;
 b=hRSJRgWWVyD587SXrbvFmRDFE7JmxqYigabR2Ih2pwEI6tXe77s5N72woksJSqsRHnVolh+E2MTQx2tiBuH9vsaa9JJR0l+GfglEdIwYgR/8x2F1DZC14yVTCHBjp+5QsOPRlk6vITyN0JYwNqmQUmCDtZcoKezQInxnGqSOiykdxiMnpXPE3jWQy4u8x4Pkq2py98t1o3aK25gJ27ahMJHNQuc+xmvdkK9x1J8U5LyvnmKyx3s0/5+ChIQuPM8CjeieBmE8z8+8HM1K/A4vqIpAG5vCl9NiR8sQLK5ljMGlDj87RkDGzue67NFXppt/nOAqCyC6grxl69OJ+zjIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 17:27:23 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::a52e:e620:e80f:302]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::a52e:e620:e80f:302%6]) with mapi id 15.20.6387.029; Mon, 22 May 2023
 17:27:23 +0000
From:   "Luck, Tony" <tony.luck@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ardb@kernel.org>
CC:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Florian Weimer <fw@deneb.enyo.de>,
        matoro <matoro_mailinglist_kernel@matoro.tk>,
        "Frank Scheiner" <frank.scheiner@web.de>,
        "distributions@lists.freedesktop.org" 
        <distributions@lists.freedesktop.org>,
        "debian-ia64@lists.debian.org" <debian-ia64@lists.debian.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "port-ia64@netbsd.org" <port-ia64@netbsd.org>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        "Steve McIntyre" <steve@einval.com>
Subject: RE: [crosspost] dropping support for ia64
Thread-Topic: [crosspost] dropping support for ia64
Thread-Index: AQHZhOqMg1CrAZ0pI0edlx0M8Sd4pK9e09OAgAARYCyAACNTAIADC42AgAAK5ACAAU0j44AAKvgAgAJXi4CAAAifAIAAAhmAgACZngCAAAbysA==
Date:   Mon, 22 May 2023 17:27:23 +0000
Message-ID: <SJ1PR11MB60833AF98E6E9D3CD89AB393FC439@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de>
 <87bkiilpc4.fsf@mid.deneb.enyo.de>
 <4e210d61adbe73a1673f113019401e5c@matoro.tk>
 <12a3e3c5-9465-c97f-58ab-938e80681fbc@web.de>
 <5e778e16f93f2286fa535597ba5da24b@matoro.tk>
 <87y1lj0x0m.fsf@mid.deneb.enyo.de>
 <ff58a3e76e5102c94bb5946d99187b358def688a.camel@physik.fu-berlin.de>
 <CAMj1kXGmbtiosH3fwMuduFvjmb2PVsX-tMLTk96jPvmW+oKi-w@mail.gmail.com>
 <2023052230-lunacy-graffiti-0cee@gregkh>
 <CAMj1kXFWCo4kqkGeYDqY9JJ3bTesJefKTPFhnnszWHbbD4jXwQ@mail.gmail.com>
 <2023052202-stumble-debtless-8613@gregkh>
In-Reply-To: <2023052202-stumble-debtless-8613@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CO1PR11MB5155:EE_
x-ms-office365-filtering-correlation-id: 78d12289-1d18-44f0-09f3-08db5ae9ce2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J3fDql6WYv+9G8/2uIZdYgLF+SfFMjrJYKDoUZnnXP60QcDnuYAPOLK+3rMCh/7uGkSZi9rVryffdLPHfLtexLbnsogceOcooSk24pbnk5ZDolvVIklM7MX+PmhClTTKNiyAqHa+REfDGUXNFwN6kCEYupHotcvoWZ5HhNbRYCkspzLbjGT6qHN84gGNjw0Fp9Do0yQ0uSwmoNtncDdmvNg6IQfwtlnmMudhVZiour8i2EVgi2rAS3T7BRwfnbRbl1f3k1LrpuuPfqr1OF5AsaQpGQY079WurxWxJ2BiA+Y88zxm1yxRSN2DXDGFbfeFHqWS+2D3IRvLTAbsQL9FYdm6C8G7u87bcJkJr6WJjY2nJRTQ1H5rtpVP/YMQHuMwlkT85u/3vw9zQ3cXQhXNsAOcdME3kNVALi0LOwPkDC9fggsppRJpMvzkOhK1tsCEI3kfN2N5JSerbu+Tdo1rZ2/OZoSuRyrjidHzd8Br7H1Wh6YmXjRO+BYJd13E4bvpC0YQ3vFYfNfiKavOYFx9k6eL8nWB4Ry53BOeYOtIQq8ApMLSMZDd6W/jaEah127g0dXkTtq8gTGmMSD0YigfW3JELPzh11LDn1RhJN4oAv6m1J+TzOGSD4tokADyz61G
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199021)(38100700002)(82960400001)(122000001)(86362001)(55016003)(38070700005)(33656002)(66899021)(8676002)(8936002)(7416002)(52536014)(5660300002)(9686003)(26005)(6506007)(186003)(4744005)(2906002)(83380400001)(41300700001)(7696005)(316002)(76116006)(66446008)(64756008)(66946007)(66556008)(110136005)(54906003)(71200400001)(478600001)(66476007)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BQQniQ4RNOSndtJGVZHxCAT976tEpB93RcuC/GZFuONPotgR/hG0SOmclk6W?=
 =?us-ascii?Q?wprqIHSvw/j7Yfc7V7Yzxz8mFF5dbkedZ1wddI5aZzOdlCsogUDkyVvPO+DL?=
 =?us-ascii?Q?yFRNItyhuZftN3hJZ7ErqvQYCwV3g/DOSsu06XqJ9nKTf7rdyT8vdghLNGVm?=
 =?us-ascii?Q?BtcF5toOgZ1ut9J0V7UuyeGCAE22p6qONTts3wtjI11+XZYh478kMVZYHxEe?=
 =?us-ascii?Q?4oKH+eHCbSbhgueK5BCPb2Rm7lIF2VT6OCpoIcwjImZi4B3E2nv8MhF4prZq?=
 =?us-ascii?Q?fPcho9ghHdbcaFG62us6/pMk8IOUuJoRsV75vNUzeTbFLlRt/NDoZQcFq8Px?=
 =?us-ascii?Q?3uVzp7JP/pDCRnLNTCX/eqSkMbTNWsrMdU7X+wBuOglWDW56Vz/10xklDmTf?=
 =?us-ascii?Q?wAh+giF/r1Tk7pn0WmqeYKl/siv+6g25gCuVKity3rNky5KD6k4FqQxXEexS?=
 =?us-ascii?Q?9/qnhGVED3na0OayuzcbW7tqA7EwTUwnvNB2WyZfNsh3Rt3tpjYJf7qZWE+9?=
 =?us-ascii?Q?jAazL9FXiRrQvNFrWYinjFw0R2Z99UQUBL8IOY6wJFnz0QDGRMIQar/tc6j/?=
 =?us-ascii?Q?DevnERK2+EIOl7PfFYF1vgyLTPoHsiG9x6eITLfBK9FP5IMwSkviYcFl1m5G?=
 =?us-ascii?Q?/KGQI2tgmtCbyflitDR4TMeG8FKgKgxJyN6DLZrFhZM4+3yt/Zu6nSinPCWR?=
 =?us-ascii?Q?eL4Zvz7Lw39gKP5h+VuBSpY95kg2FDqS2rpaReNY/wIDeYXZWJhXh7/QXer4?=
 =?us-ascii?Q?KL+FciNf+/IvBrUFJLjLqtoX+DLEJvu8J4DJWgkQO6e03CXD3Z+pEIgmna51?=
 =?us-ascii?Q?kw8pWDlX2fsrdwdCWaW3OKyKiS10YDO2oklYTE+E3IWoynJKmuMhqxS5QzBU?=
 =?us-ascii?Q?QBDo0FRh35x2HBK0970gkLHrytxEAw/gNlU5+raqDwQuZc7J91Ak7P75SDvw?=
 =?us-ascii?Q?wYcHZ2uz28vfbZI4oZYcNmrj2KMNuYeCG0IO537MPqX+ggTwAphT0reIg2SB?=
 =?us-ascii?Q?uc0ydhY54zHu9nzULuQ79AVqACsF/Cz57sMBhEBZn1ZAE9OfHSN+8p8HHcHL?=
 =?us-ascii?Q?0OX8+XUoBTcv+sH8/JCLpkTgUW9vxfUTpz//qH8E9yr+KBmG8cBh8Hp9BpJN?=
 =?us-ascii?Q?kQdlQCEzJtzV4MVpT6e64AOWQJX5sET57aADvoFpNWJYwvIWJSsvK7sEAS+W?=
 =?us-ascii?Q?Nw9ggfggjUJ+UK273lP1NjozjB804Eaoaa6j8b4A4/U/So/QvdzREJkFkfER?=
 =?us-ascii?Q?fsbaQLaFW+1RCpo3jWYqM58AEqXTbuXuh35/5Up9rKGvnKPLhd4sntUZ/XPy?=
 =?us-ascii?Q?clT8DuHSb4kWm+Kuf8BoShgfwzDfJShq0ab0vOY0gq049XHFVh/cy0MgrOUi?=
 =?us-ascii?Q?+kvQmRZ3qY2kwMyvBdiIT0LkR7nsLa782vwyq5+YtQXVYAxv/ospIkhP0LFf?=
 =?us-ascii?Q?BtyAAiezgPDHZSv4okfQxMNu8Y7vIkFyCOCbXuo85X0GYpPxqXLGfD3Eprtn?=
 =?us-ascii?Q?aX97XsfCaauuOCw/cZB7UA+G6VOjv+T+WJoe5zJeMRU6lCh+e/SH0FhxnltL?=
 =?us-ascii?Q?JHk5PXlBv1cTK2hw+84=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d12289-1d18-44f0-09f3-08db5ae9ce2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 17:27:23.5737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UxNhB3iQ0BkcOvAKYVKvyJEFMTzN1mJfsMCtjP256ntpDbn+LG/tWcTryPxvZuurDIyPrfnEAkX+9XeOkMqBjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

>> As far as we have been able to establish, the only people that use
>> this arch and code are people that would hate to see it go, but don't
>> actually use it for anything other than checking whether it still
>> boots, and don't have the skills or bandwidth to step up and maintain
>> it upstream.
>
> Great, then let's drop it today, there is no need to wait until the end
> of the year as nothing is going to change then.

I think this also puts the existing stable and LTS trees in some interestin=
g
state. After arch/ia64 is removed, there may be some tree-wide change
that gets backported to stable & LTS. That may break arch/ia64 in those
trees (e.g. because arguments to some common function are changed).

Maybe just deal with that if it happens ... and if anyone notices ... are t=
here
automated builds and boot test for ia64 in those trees?

-Tony

