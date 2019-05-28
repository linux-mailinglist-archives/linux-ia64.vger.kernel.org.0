Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 097642CC43
	for <lists+linux-ia64@lfdr.de>; Tue, 28 May 2019 18:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbfE1Qjy (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 28 May 2019 12:39:54 -0400
Received: from mga09.intel.com ([134.134.136.24]:8852 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbfE1Qjy (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 28 May 2019 12:39:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 May 2019 09:39:53 -0700
X-ExtLoop1: 1
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
  by fmsmga006.fm.intel.com with ESMTP; 28 May 2019 09:39:52 -0700
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 28 May 2019 09:39:52 -0700
Received: from orsmsx104.amr.corp.intel.com ([169.254.4.200]) by
 ORSMSX111.amr.corp.intel.com ([169.254.12.165]) with mapi id 14.03.0415.000;
 Tue, 28 May 2019 09:39:52 -0700
From:   "Luck, Tony" <tony.luck@intel.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     Randy Dunlap <rdunlap@infradead.org>, lkp <lkp@intel.com>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "Yu, Fenghua" <fenghua.yu@intel.com>
Subject: RE: [PATCH - Linus please apply] ia64: fix build errors by
 exporting paddr_to_nid()
Thread-Topic: [PATCH - Linus please apply] ia64: fix build errors by
 exporting paddr_to_nid()
Thread-Index: AQHVFXBvYLImjhC3SUy2r03aBa7QK6aBLR8A//+PUUA=
Date:   Tue, 28 May 2019 16:39:51 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F7E97462E@ORSMSX104.amr.corp.intel.com>
References: <20190528161430.27697-1-tony.luck@intel.com>
 <CAHk-=whaNQSnV3Mv_-T8jLmPeHQUTZieg+ZYhyUufW4wrPymfw@mail.gmail.com>
In-Reply-To: <CAHk-=whaNQSnV3Mv_-T8jLmPeHQUTZieg+ZYhyUufW4wrPymfw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDE5N2EzZDctYzE4ZS00N2EyLTlhMzktZDMwZWYyNmY3ZTg0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiU1JGR1d4dzNGSHUwdnU5TSs2YUtDV2JnWHVJZDgzNWRQNDk4a0pGQ09GK1JMams0XC9LTlRpTHFzVG52d2ZQc0wifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

PiBKdXN0IG91dCBvZiBjdXJpb3NpdHksIHdoYXQgY2F1c2VkIHRoaXMgZXJyb3I/IEl0IGRvZXNu
J3QgX2xvb2tfIG5ldywNCj4ganVzdCBqdWRnaW5nIGZyb20gdGhlIHBhdGNoIGl0c2VsZi4gSXMg
dGhpcyBqdXN0IGEgY29uZmlndXJhdGlvbiB0aGF0DQo+IG5vYm9keSBoYXMgbm90aWNlZCBiZWZv
cmUsIG9yIHNvbWV0aGluZyBlbHNlIHRoYXQgY2hhbmdlZCB0aGF0IGNhdXNlZA0KPiBpdCB0byBo
YXBwZW4gbm93Pw0KDQpJJ20gY29uZnVzZWQgYnkgdGhlIGVycm9yIGJlY2F1c2UgSSBkb24ndCBz
ZWUgaXQgdXNpbmcgYW4gb2xkZXIgKDQuNi40KSB2ZXJzaW9uDQpvZiBnY2MuIEJ1dCBSYW5keSBp
cyBidWlsZGluZyB3aXRoIHNvbWV0aGluZyBtb2Rlcm4gYW5kIHJ1bnMgaW50byBpdC4NCg0KU28g
c29tZSBhZ2dyZXNzaXZlIG9wdGltaXphdGlvbi9pbmxpbmU/DQoNCi1Ub255DQo=
