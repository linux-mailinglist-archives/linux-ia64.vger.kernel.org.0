Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 821AB699B6F
	for <lists+linux-ia64@lfdr.de>; Thu, 16 Feb 2023 18:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjBPRm7 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 16 Feb 2023 12:42:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjBPRm6 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 16 Feb 2023 12:42:58 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2128.outbound.protection.outlook.com [40.107.93.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA9B3B234
        for <linux-ia64@vger.kernel.org>; Thu, 16 Feb 2023 09:42:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P34YTxs9dYiU4rXJbQK5+hiaN3Fe37qkxP/AcsQpuwpPO85OMdER0ipBR3oAPkvfrvw2ChV5qQ0ZgYufcUtUOfj0bLVYs+E5+wDLp52MF8kJ792Sc4A9Rz+3j8uuATS8X2cJzx4yzs5u+soJ+Zz1r8Q96SuT9EtpSTwS1dLCBvbO86wSZYhGVr9lJfyvGjdWep4MZclzEIEmukP4qv+CU/7xnUAYqwXwkaiMXWTS+a0Mh5+Y9nbnwd0qLNCnES3jke1u2z0szIfdpuCuwYmiAMViqL03cDFKaWUdAFgwJ0fYzoafeENIWi0ZxlJr76bkVXMb3gZ3em1AcmqB7kt0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGAfN5BljXYDwF42maKITCc7u3SnuC72w751Y4GtxbU=;
 b=JIpQMGllvCkaqE9PJd3HhyCoLjAbV1eRXOaOjTrRvZ2IsDysuTatqCrBnRSezsZcvcejCzegvUxEJ26WUXuodtb1zCLfHK5SdXycZ8WHQbRYm5WaTkHtP5W6s/A/PJemVcrSIO42cJXO70kFHJtZp2elIiFVIvW7Zr7ge3oZMWgL2XNHhvT2U/yHO6/bSesNfZLtNPQ/t0JjAfSv9KZ+5qpW4eSMtKkarWOvfVKRGWMNTw4I1Ujl68gn/ntw2Tf2q0kHLcw6zSGUoQNErHvAmvfUhEi0HGBS5RkvGpans1BXQinENy7mr0Fl6gi0FEvznqW7NvMtYOVHZgPflwUbeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=texair.net; dmarc=pass action=none header.from=texair.net;
 dkim=pass header.d=texair.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=texair.onmicrosoft.com; s=selector2-texair-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGAfN5BljXYDwF42maKITCc7u3SnuC72w751Y4GtxbU=;
 b=UAe/Fz71wbaRhfASi2FkKJ7vu/2xFn/5KumNXN2+2Df/eGqLtBT2KIkf491gDnfc0sIvNvSz+PsMC6QCx8RsmEmIUsQKOh3ZpP9FWyceA7WCIdikvL29lEqujlP1gYc/uL/MxsIh6LiedQjyHiG1CdNlXkSEO+L8wOShMT/qras=
Received: from CO1PR13MB4870.namprd13.prod.outlook.com (2603:10b6:303:fb::20)
 by CO1PR13MB5047.namprd13.prod.outlook.com (2603:10b6:303:f6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 17:42:53 +0000
Received: from CO1PR13MB4870.namprd13.prod.outlook.com
 ([fe80::cbe0:58c1:7634:6b85]) by CO1PR13MB4870.namprd13.prod.outlook.com
 ([fe80::cbe0:58c1:7634:6b85%5]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 17:42:52 +0000
From:   Pedro Miguel Justo <pmsjt@texair.net>
To:     Ard Biesheuvel <ardb@kernel.org>
CC:     Ard Biesheuvel <ardb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Tony Luck <tony.luck@intel.com>,
        Jessica Clarke <jrtc27@jrtc27.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Matthew Wilcox <willy@infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
Subject: RE: [RFC PATCH 0/5] Retire IA64/Itanium support
Thread-Topic: [RFC PATCH 0/5] Retire IA64/Itanium support
Thread-Index: AQHZQi2cXq7Lf2MCJUS0JkRDZn+hDw==
Date:   Thu, 16 Feb 2023 17:42:52 +0000
Message-ID: <CO1PR13MB48707CAD2AFD26D4B6D11321C8A09@CO1PR13MB4870.namprd13.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=texair.net;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR13MB4870:EE_|CO1PR13MB5047:EE_
x-ms-office365-filtering-correlation-id: 224b21e4-cca2-4da4-ca3d-08db10453ac0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NYhVdmaZqYNOFHuZ47pNoSUyWzPBRodGsmvSjcsgLZKWD53t7b1Ck16MuwSAj9Cur5cTUTeS/didr/79JYbYKV5ZkzlSy7rWR4k4tUEmyBoagBJCG8sSBCtzR2dzUsy/lIrOX1JPKeGnFGTIpllP6fLN8/eC4fSuRUY1/Pwn+FVXfDv5S+s0AEL2vUpF3Y4A+l2gsHG4B9c0A1BA/6kYHP0pNvjU0lmCPvh5FsTlzK+XuSaB/jkodzq0FVQ9QaHI+5NJnmKjWPWqhDmj2aUfEbcCgpTXgtR42NvjreZltWKSLeYfdaiSQir/58PeWyNJUiY93kLk/Cb13eKpZyXMArEehjx4qnU0Pth0bcLfkJYOYLuZMzrUgw6ltgSy+GztUFWGjfbztdhcaescTipONSNwM+rTWrOaTYQ1obLJaizHFQcTGwRMrN6jwCxUy/yurgG1l/UqgUuEVrYbWl6QYTkdM1crZQJEo8NL0aWy6EKp8VE17XB8KWtcZWUSRjaSk6K40HpBOVVk+hp97dUEIzPZqKdkrZKcc3+lHENnFN7AIkPTLoQtBlk1s13vcq7B3R/fmNPPeuaiUd96bR8qAbUqTdzQiUN3+NxCEXY9v37Z307VS2g9+GyQ86z+OOWF48tNwAMG/d51Smv1d9yALkivl7KXsLaxBwbIopCEgfx3+kNjLr1z/H0rE8AqYLGsQikgvQCOFOSMm4jRai7hdQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR13MB4870.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(366004)(39830400003)(136003)(396003)(451199018)(2906002)(478600001)(55016003)(83380400001)(86362001)(26005)(186003)(9686003)(7696005)(5660300002)(7416002)(6506007)(71200400001)(558084003)(33656002)(8936002)(66476007)(64756008)(66446008)(66946007)(66556008)(8676002)(38100700002)(6916009)(76116006)(4326008)(52536014)(316002)(41300700001)(38070700005)(122000001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?801SWTCYaky1esZlXnBGNnYjK4yUS9mrWCIdK/eG4eW6K4BrIEZkBdGM22?=
 =?iso-8859-1?Q?AEfmxY+P13CKJxV03MM3WL/kt0GqNswViz67WldbI9H4pscwHzftnsYDi/?=
 =?iso-8859-1?Q?7yjnLDPz/VFbZ0BoHOwue3BX2yIpCOnfxpsOfrI/KoCp+4BGh2gafqyVqz?=
 =?iso-8859-1?Q?hcJ8I+VoZAeonhaAgf7kRPGPgmQFIdczWi4qesTO/pzNh9yimLJQcVlqod?=
 =?iso-8859-1?Q?S6W/LIizUylZZFSZPXvF4tIgir+Q3HFesK3YITPbtKXv9vVaQPO1BzzQnS?=
 =?iso-8859-1?Q?M3tpf960cNQkyZb4kOUtvjoxPk6fYlUF9GPijrudq3yX/5Uw6XbtKFaEpz?=
 =?iso-8859-1?Q?Do3GWpgn1b7VnH2J7UgOM3tDMWfOMGkqW2YSY3/yZB4OeJWpXBYs5BrZI1?=
 =?iso-8859-1?Q?nREaR465bGGxomSZ3oyUbCKUBakmdM7kb1c6xsJMqq9xUI1eaeZIAAmGer?=
 =?iso-8859-1?Q?9kKTV32KCCnQqYBlhFUcHfYNf2/XhatpKZBQiBC04nW2su8963fK+Z3h+X?=
 =?iso-8859-1?Q?/NmGMVM5XnifLF3b4NeR8leyl5CNh/TLxn8P0FMkxf7iBryW6KHDEeQGwW?=
 =?iso-8859-1?Q?I4algROrJ8fEEUfEdMvauvQogxVfpnUgkR8sYe9Px96snTAGX42c/9/Z0w?=
 =?iso-8859-1?Q?E/DP9TcifqwSdM4VtFLLksoahhEHSk97xDRT3OMWV/XWjCi9RifdATvPfv?=
 =?iso-8859-1?Q?xSN0XyBFlhI6IEiXE3/+JHYd934cm2gJAHepn2m5UHgmrbBexrKkY6RLOE?=
 =?iso-8859-1?Q?Z/fRLKwvJMwYLBi2ncsI4BQd41eBM2/yRHLu/ax/xxs33a3LA52sPhQ6Si?=
 =?iso-8859-1?Q?wy2XYx9WNs9R/L7o3Hr2axNG6mSJwj+2Ze0/hXQJS7G+6EV+xvhbHWRIuf?=
 =?iso-8859-1?Q?zRdgl39V56yam8V1yoeZ1wfUFLkRr5qn6lyhY4VwYRm7si8hyLin5gqhOr?=
 =?iso-8859-1?Q?hgsnm0PBZ7heDRVGhgL57frIHYxJu0oJkdLVmKjfisyJLr0OH1sIEfmXF9?=
 =?iso-8859-1?Q?/6BlO3F9+1zXSXFvDZlhjanchoYJTHuhKDAp6q5aXrXjQ1AeiuMZ0HiJ2O?=
 =?iso-8859-1?Q?RVVfAAqynfUiAcuyQFpihpsfE0wixYfYIcaTQ1k14qzu5t7ISYrHG7Loea?=
 =?iso-8859-1?Q?1OKDlnR4MvoskDAy9TLOEjAKV4tl6XXt5UWC4zZV3LzRbwp1sbDTf+v3Gt?=
 =?iso-8859-1?Q?7i7PTrWD7rBEpbKzgZh0ciNhv0nNbPTbzXMDqDStBpVnAp0xaE4LAro6ri?=
 =?iso-8859-1?Q?MQjkkUOebNfH8gF58K++BnSBXMdy/aMXeJ7HW0t16on1fdqnnoQZv8jZXa?=
 =?iso-8859-1?Q?q8AVxxznIyeu3ip4Fn0Y0fLicfVA+xVgfjIcNtBDD3+ArxCZs5PFAziyfl?=
 =?iso-8859-1?Q?k9gWP3CSo9tHVT9gfJ4rv+63k6QEunzjNwKghsQtpxPKunRNY/5jR+KLNA?=
 =?iso-8859-1?Q?XT/qGBXucSE7UpSK59iAzcBNRYyy0TNHc8lW41LZxL98vNnuxUlQb6hhVX?=
 =?iso-8859-1?Q?XAaeXtiUYzYzIXX8to82TrdQ9RtgBL/fDMOJ+mvmgt6to5dJhbTSPpC0V0?=
 =?iso-8859-1?Q?RXKj9fJ/ytUCO5sszq0yyL71FG8I1ProtM4W31umuAVQEll4QCX6raDOhK?=
 =?iso-8859-1?Q?oL/eDUZIVjkwM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: texair.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR13MB4870.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 224b21e4-cca2-4da4-ca3d-08db10453ac0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 17:42:52.7089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0b6628c1-b69a-4bbc-a568-13d205085e0d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /hiCWwWaLSsxRj7fdq7OGpJ9pj36i5hPqXwvX4W2Z2I6AoQR1LhZRBkHvzFkvdEoeoD+EorsNsCmtXnIPoCCtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR13MB5047
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Ard.=0A=
=0A=
John is not the "only remaining user". I also reported the problem. I am so=
rry I don't update the kernel every month. Yes there might have been more t=
han 30 days between updates.=0A=
=0A=
I'd prefer if we don't remove the Itanium McKinley+ support but I'll unders=
tand if it must.=0A=
=0A=
_____=0A=
Pedro=0A=
=0A=
=0A=
=0A=
