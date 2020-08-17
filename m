Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5EB2470CB
	for <lists+linux-ia64@lfdr.de>; Mon, 17 Aug 2020 20:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390456AbgHQSO7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ia64@lfdr.de>); Mon, 17 Aug 2020 14:14:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:18285 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731025AbgHQQGO (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Mon, 17 Aug 2020 12:06:14 -0400
IronPort-SDR: PhIzHPQMb6qM7/QcLM2rKCmPI5NaDAzB9u2r+SSuHBSY0g8rHGQRelF54Y3xHHJIaH7Un0OKVl
 vlTPHOgn6BGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="142570624"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="142570624"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:06:04 -0700
IronPort-SDR: rFHdT2zJLxDkWebF3jI9jhQcnfc/pfGVoxmy+58RbngzkFVbDZ4PAZtZZxQ6oldmLwKB6jtxLl
 WmbZNLuG+2zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="326451184"
Received: from unknown (HELO fmsmsx604.amr.corp.intel.com) ([10.18.84.214])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 09:06:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 17 Aug 2020 09:05:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 17 Aug 2020 09:05:06 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Mon, 17 Aug 2020 09:05:06 -0700
From:   "Luck, Tony" <tony.luck@intel.com>
To:     Mike Rapoport <rppt@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>
CC:     Jessica Clarke <jrtc27@jrtc27.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Anatoly Pugachev <matorola@gmail.com>,
        "Sergei Trofimovich" <slyfox@gentoo.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        Frank Scheiner <frank.scheiner@web.de>
Subject: RE: [PATCH v5] arch/ia64: Restore arch-specific pgd_offset_k
 implementation
Thread-Topic: [PATCH v5] arch/ia64: Restore arch-specific pgd_offset_k
 implementation
Thread-Index: AQHWcbQZv4SXb0nCT0SDk5o7YCxl/Kk8Y1yAgAAZXKA=
Date:   Mon, 17 Aug 2020 16:05:06 +0000
Message-ID: <3cd971aebf854c038c4e9b54f23d8456@intel.com>
References: <20200813205521.5405-1-rppt@kernel.org>
 <20200817073333.GK969206@linux.ibm.com>
In-Reply-To: <20200817073333.GK969206@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

> I can take this via my tree if there are no objections.

Sure. Go ahead. (You can count that as Acked-by)

-Tony
