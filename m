Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61FC3418DEA
	for <lists+linux-ia64@lfdr.de>; Mon, 27 Sep 2021 05:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhI0DYw (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 26 Sep 2021 23:24:52 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:35612 "EHLO
        mx0a-0064b401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229572AbhI0DYv (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Sun, 26 Sep 2021 23:24:51 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18R3LnU2010073;
        Sun, 26 Sep 2021 20:22:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=5bs2mTAH8GDwqIkxdBWXMmfjQFXu8X0fKUaC3pczdRI=;
 b=gsfBhUVXcTL8fcqzqdFxX/axE0RsVf/pstXASqKvQzjmBOKiXMKOpncic/wEcg3cPR1V
 Kx3hB8k/fOThiwdf1gCILqc44nIHexNALjpi/Gz98y1V3U22S50s1INVYQmHr6NlqLQx
 UAG8Ecn195AJfDKBLW8mM19IpLQ7uegr0QS+xffqYr3t8lR+4SpRksHDuXY01hkNkM4F
 NuuVZPa4Ui+aD3ed3yXSvnSNOyFbur/8GpZvOR6TuqvhkXm3sO6Q+502rOBxGkuwtqg+
 XzYBfLz5FDfwITr2TWtfuQhDD/8VwnNZYVyLj1r76FjCUJ0nllaVbnlBITvj1k+/2StF ow== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        by mx0a-0064b401.pphosted.com with ESMTP id 3basd309qu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 26 Sep 2021 20:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USLSSCz33mE5LeXF+1dA9DhIwcDpJM+Dd2TFHi4OPh+YUL11F7t6/FRAFocnVrXfzsW55eZ3tfozrfWib2g6BH1bna3YvWbc8WaISfBLDFi+LsFUjIp5AqbeDCSarABUNUogMs34t1FN5DFyMmTVuGWeMPigBy4K90+AII3U8H2FqQImujR+N0tSPUP7r6L4MJL6V/cKmq4yTBQ6amMlPOjOs6vVje97LgLFr1dj+v4T0Uwp/b9lvjUWarIjg8cg7d5ankFUKRVZjzq3RwvhPZd2s9x+kM9snjDYHWScy5SXVu9DK28inzpBQLSUdGgYbQiRmkHeAu8jKdTDnf0ulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5bs2mTAH8GDwqIkxdBWXMmfjQFXu8X0fKUaC3pczdRI=;
 b=JPuAaiqr58PbT1M+ApxGG64lMyyzWz4dY/+2nv0Sr3ptWCpsydrO7OcAo4qjph67LZ9ItRSlkEAeAiPnWY0bupP+uKEN6YdHFLv6xazrhjLUXWx8xeSvpgx6qoFhokxsP/wqb9si8JCVCHBkAuIz/6XuFglomQTHA5irM9RUPH2Ke+sCxhAwFTBOQ6Vt1Z2akGkQb/tCoMGfmZXhsKczy39D1r2GTGgMmcjwJwBpUnXxkevJagjYsSW1H13D2RuS4tcsahoB1VX65X+asxhyjyaxyZGseZIm3wJXSbJO9lUqbuEryYv2p9UIHOwArgnoOpFo7Ebc/oUTckdopSiODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM6PR11MB2956.namprd11.prod.outlook.com (2603:10b6:5:64::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Mon, 27 Sep
 2021 03:22:39 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::c24:f0af:95b4:3885]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::c24:f0af:95b4:3885%6]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 03:22:39 +0000
Date:   Sun, 26 Sep 2021 23:22:34 -0400
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-ia64@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tony Luck <tony.luck@intel.com>,
        Chris Down <chris@chrisdown.name>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2] ia64: don't do IA64_CMPXCHG_DEBUG without
 CONFIG_PRINTK
Message-ID: <20210927032234.GA20607@windriver.com>
References: <20210926171224.27019-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926171224.27019-1-rdunlap@infradead.org>
X-ClientProxiedBy: YTXPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::27) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
MIME-Version: 1.0
Received: from windriver.com (128.224.252.2) by YTXPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 03:22:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3b0bfe9-065a-475c-fa03-08d981660edc
X-MS-TrafficTypeDiagnostic: DM6PR11MB2956:
X-Microsoft-Antispam-PRVS: <DM6PR11MB2956140D1EC53F9065287E1D83A79@DM6PR11MB2956.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GHN6METjOZtAakcajPD8niRGaxNt18TZoiJQT3tOAILcfr0cf8GexWtT3nbIAT0oRGj7Mz/QpCViBvbOosD1ABkLa/KsoNkLA7AimOIRCyVglHbGWbumCZRdgFUfCitHcX7ZjDUga5ZobwJ1eGAFmt0UtoYKi6xjDr3qqy1VPgyZWuDicjngc6IwLBWk8k+ReIuNpugO7u77DI5W61apDlHf/OMNfadKEOq9wt5AxL2V6H2bXa+oA2D88p06ZgBvBNxGFnWAJP6uDGtCPCSiR2cok3DrwIklkQl9KEbZLjiEUXeQL9hFBBfHIIED6PrbuqpyrA55e4JYlvm+ISkVUvR+akb7TzitN8aJHPzE/5Tt8cgJzXR8tlwVhG6PTQv+OvXTenIBEQNT9bv7smVicLl2YZCMZKnHhBUEGs2Ga1lnwdWk8+dz6D6MYe7FzrkRK0C0EVZe1R3h42uhHndaLq/DKQLhWtaToSz7enapVyYFnQTK8uw5gAB0dKfutthUuQ4HkXGqwZNtWypSFVfI6vNuhtG/tzKRR6Ppy97oJ5iS52xjBmRDg/hUZ+5C5xAmwOj5zcj4ykizLDY3W71bUVuB2mTMWbIZXtuuv78ZSlWVRtIqMP32qOPXsCh+HRlVxR4eQ2L9bqXseiNrV+2KeKelSP/kUrz7pDg+/emu408R6z3G/8/zrDAQbK8OPhugURpYt40hS82AFjcTlUS6hd/mXnpnci+CtPDoqLyzte3j+vUpJQwyMn/x18n4fAjLX9ZeWCLt4zaQnovOWdJ9oQTEL/Lekwo4/sTk1srGqKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4545.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(1076003)(316002)(6666004)(8936002)(26005)(4326008)(54906003)(186003)(83380400001)(38350700002)(8676002)(55016002)(7696005)(5660300002)(52116002)(956004)(38100700002)(66476007)(33656002)(36756003)(86362001)(2616005)(508600001)(2906002)(6916009)(8886007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p61UkRJojgxz8h8oppqlGVqIIaNKzCuFd9uAMq4Z7gpqkpT09NHNYzORcBfW?=
 =?us-ascii?Q?lDouA6CXh4WnArb07uzhYX4CuzmKkgtteomQgfR4REj0dpU+iXN9MMRMjzl9?=
 =?us-ascii?Q?cJ44gSK6FucEcTUHHGs8NhsO9Ianw5vmRobQlxPCAuCSOCGCtfEG7dfiV0uT?=
 =?us-ascii?Q?Hc5bx9JIrD8O1M2VS1nIu3ahMSvsMyIUKuVEFbXCc7SVxV04SSbzsjrQwI5n?=
 =?us-ascii?Q?k3tnLJnp1VL6cabDaYOubmHn0wXdxccjg4LFqJRt/U0VpG5znxeWlPoD2JVF?=
 =?us-ascii?Q?pTn7C8FF4PiBOgGfnSZda6zf6jAdwB5TzgzULR6l5x5Oy24N2QuBgTZ/H0we?=
 =?us-ascii?Q?eFsCWyGC3AX/pI6RVl6PCOoU3Nk2bszgRrWe8TaJZumDMAor8GE+v5l+d19x?=
 =?us-ascii?Q?Wns3ceBQ97Sp2+OZI6OSXdZP/8Dz/KZAemFw35H2TRcOGBqmYpDYzhSOtMRu?=
 =?us-ascii?Q?UqY9z4sygzu2GHi4WBBsHTs1kAxo9RW50YFBGR1S6j24aFESMoRGBB00+0el?=
 =?us-ascii?Q?8LU+rYtoRH7N+xsSR5SkqzGC7LlPy8UIhIS446K/gOa4zwU1lm6AjJFyx9rn?=
 =?us-ascii?Q?6YOw2tpt6pB9iZaxNed3hG5b1nEYuthrUUnl2foR8WR7srNQeM8f+t9IOMGg?=
 =?us-ascii?Q?wmJTIfpRzhuTs3fuwIXbPzELzFQRbnfF9lyfC0JyuBSzW1Bp/O7VvV9a6CrQ?=
 =?us-ascii?Q?y7uq2tjnP0WHWKZPeOpFqgeRsxoXo6/x3YFD7tshRvogUSZN0YnRS+fsoNxD?=
 =?us-ascii?Q?SR82vYFhIeG2BKzttOg2/4JrxlNu5cG2jixCwQO6s49q7/5z4j2ULV91a2lw?=
 =?us-ascii?Q?nLGIBK9PEUYYdj8n9owfoiKg4WOUe7BnTVWBxFZEBOsZ5AEPaPAWyBc7LLR3?=
 =?us-ascii?Q?imZF8IwQyWyrfjpbSZYIkVwf4Eqg3FfU8qYn2oUKU4xyLF+tbPhdbVibaXvK?=
 =?us-ascii?Q?nlDvCzivIGWZQuMCxCerut3U0AFwnNFWLJVXQNFTpZCfb7XDG9H6oYaj/taZ?=
 =?us-ascii?Q?SNx3wMwltz2kGfGFPh9LDXcNdS6ghjvjv+6TQSxzwgJdU9lKVWmEEmyQrY+A?=
 =?us-ascii?Q?flKU5ee1br1+u+KI5PhqfalLMfDeaT0c5TWAQfr7h2R0sRNw/IXx3Zu/lP18?=
 =?us-ascii?Q?40PM6YkoYkshhNS5f6/7exUYtAhqhVoDGJ8IvRLz4XLzGxWycUwuVq2zVvys?=
 =?us-ascii?Q?UB/yos+mbh5ZmZyxYWskamwsW2UJdFPcDGLnaRdK1liD+jsszYbO/74mi2FP?=
 =?us-ascii?Q?fOPy1ROUYec1cu0ozB+IR8azEU302LfIjCI8LTWjaTlrY/bS1ZqScW1eBkOd?=
 =?us-ascii?Q?UEpD6M8+6/r3fGM6d/d0pJ8U?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b0bfe9-065a-475c-fa03-08d981660edc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 03:22:38.8105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bq139aXhFStDR1R9qYh6ojXHO9mS2WRgxxmi+hp9kuSzG9QGx4liupnbLNGRwUflDr8W1FodcARQdjNm/0qpekZtQhroM5sgKcheNFklMoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2956
X-Proofpoint-GUID: 8tqkWbLWcAidm35WofX_RRPTDx-JqOjB
X-Proofpoint-ORIG-GUID: 8tqkWbLWcAidm35WofX_RRPTDx-JqOjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_01,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxlogscore=928
 spamscore=0 clxscore=1011 priorityscore=1501 mlxscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109270021
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

[[PATCH v2] ia64: don't do IA64_CMPXCHG_DEBUG without CONFIG_PRINTK] On 26/09/2021 (Sun 10:12) Randy Dunlap wrote:

> When CONFIG_PRINTK is not set, the CMPXCHG_BUGCHECK() macro calls
> _printk(), but _printk() is a static inline function, not available
> as an extern.
> Since the purpose of the macro is to print the BUGCHECK info,
> make this config option depend on PRINTK.
> 
> Fixes multiple occurrences of this build error:
> 
> ../include/linux/printk.h:208:5: error: static declaration of '_printk' follows non-static declaration
>   208 | int _printk(const char *s, ...)
>       |     ^~~~~~~
> In file included from ../arch/ia64/include/asm/cmpxchg.h:5,
> ../arch/ia64/include/uapi/asm/cmpxchg.h:146:28: note: previous declaration of '_printk' with type 'int(const char *, ...)'
>   146 |                 extern int _printk(const char *fmt, ...);
> 
> Fixes: 85f8f7759e41 ("ia64: populate the cmpxchg header with appropriate code")

I don't think this fixes tag makes sense either as it was just a
straightforward code relocation.  As pointed out elsewhere, it will
probably be back even further where CONFIG_PRINTK was introduced, which
would be d59745ce3e7a (2005 vintage).  The ia64 debug option predates
git, so it isn't at fault (and you can't blame it anyway).

Honestly, realize this is just for a randconfig for ia64 where PRINTK is
disabled - something that will never be done in any of the remaining
ia64 deployments out there (if there is any).  So I'd just recommend
dropping the Fixes tag and move on.  It isn't like there is a lot of
people out there doing randconfig builds on linux-stable releases.

Paul.
--

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: linux-ia64@vger.kernel.org
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Chris Down <chris@chrisdown.name>
> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> ---
> v2: correct the Fixes: commit info
> 
>  arch/ia64/Kconfig.debug |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20210917.orig/arch/ia64/Kconfig.debug
> +++ linux-next-20210917/arch/ia64/Kconfig.debug
> @@ -39,7 +39,7 @@ config DISABLE_VHPT
>  
>  config IA64_DEBUG_CMPXCHG
>  	bool "Turn on compare-and-exchange bug checking (slow!)"
> -	depends on DEBUG_KERNEL
> +	depends on DEBUG_KERNEL && PRINTK
>  	help
>  	  Selecting this option turns on bug checking for the IA-64
>  	  compare-and-exchange instructions.  This is slow!  Itaniums
