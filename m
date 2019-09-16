Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA89AB4477
	for <lists+linux-ia64@lfdr.de>; Tue, 17 Sep 2019 01:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbfIPXLw (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 16 Sep 2019 19:11:52 -0400
Received: from mga17.intel.com ([192.55.52.151]:60026 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726648AbfIPXLv (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Mon, 16 Sep 2019 19:11:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Sep 2019 16:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,514,1559545200"; 
   d="scan'208";a="361673992"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
  by orsmga005.jf.intel.com with ESMTP; 16 Sep 2019 16:11:50 -0700
Received: from orsmsx158.amr.corp.intel.com (10.22.240.20) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 16 Sep 2019 16:11:50 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.103]) by
 ORSMSX158.amr.corp.intel.com ([169.254.10.46]) with mapi id 14.03.0439.000;
 Mon, 16 Sep 2019 16:11:49 -0700
From:   "Luck, Tony" <tony.luck@intel.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "Christoph Hellwig" <hch@lst.de>
Subject: RE: [GIT PULL] ia64 changes for v5.4
Thread-Topic: [GIT PULL] ia64 changes for v5.4
Thread-Index: AdVspkQgo5OcrdMnSJ2cLefKAnI8NQAc7/QAAA2Tp0A=
Date:   Mon, 16 Sep 2019 23:11:49 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F7F46544E@ORSMSX115.amr.corp.intel.com>
References: <20190916154903.GA18169@agluck-desk2.amr.corp.intel.com>
 <CAHk-=wj9uPRcTPVDh4O73n6xX0KdYTTO=FrQC4iWsrF4WWeFQw@mail.gmail.com>
In-Reply-To: <CAHk-=wj9uPRcTPVDh4O73n6xX0KdYTTO=FrQC4iWsrF4WWeFQw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTgzZTJlZTctMDBlZS00YjhlLTg3YTgtMTA2YjcwODI4ODk4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicG9zNEVFZUJoZHF0RkUrczNBakRVZ1psQlh5R3lEUEdYenU3SlwvRmpQRm1EU2h5NXYyRHlBbUJCd1RKZG9cL3oyIn0=
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

PiAuLiBhbmQgdGhlIHJlbWFpbmluZyBpYTY0IGNvZGUgbm93IGRvZXNuJ3QgbmVlZCB0aGUgb2Rk
IElPIGNvaGVyZW5jeQ0KPiBjb250b3J0aW9ucywgcmlnaHQ/IFRoYXQgd2FzIGFsbCBTTj8NCg0K
SUlSQyB5ZXMgLi4uIFNOIGhhZCB0aGUgd2VpcmQgc3R1ZmYgd2hlcmUgeW91IGhhZCB0byB0d2lz
dCBpbnRvIGEgcHJldHplbA0KdG8gZ3VhcmFudGVlIG9yZGVyaW5nIG9mIG9wZXJhdGlvbnMgYmV0
d2VlbiBkaWZmZXJlbnQgIm5vZGVzIi4NCg0KLVRvbnkNCg0KQlRXIC0gSSBmb3Jnb3QgdG8gbWVu
dGlvbiBpbiB0aGUgcHVsbCByZXF1ZXN0IHRoYXQgaW50ZWwtbmV4dCBoYWQgYSBmZXcgc21hbGwN
Cm1lcmdlIGlzc3VlcyB3aXRoIG90aGVyIHRyZWVzIGJlY2F1c2Ugb2Ygc3R1ZmYgZGVsZXRlZCwg
b3IgdHdlYWtzIHRvIHRoZQ0KaWE2NCBLY29uZmlnIGZpbGUuDQo=
