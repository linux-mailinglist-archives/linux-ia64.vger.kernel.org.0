Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9FB6E6D7F
	for <lists+linux-ia64@lfdr.de>; Tue, 18 Apr 2023 22:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjDRUaA (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 18 Apr 2023 16:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjDRU37 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 18 Apr 2023 16:29:59 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5B61BE
        for <linux-ia64@vger.kernel.org>; Tue, 18 Apr 2023 13:29:57 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33IExZnU013966;
        Tue, 18 Apr 2023 20:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=JI7X3ejjGQoCkbIzLvFLK7b1SJse9JxmfNbj0u8XL7w=;
 b=MxRKmxmlkc1TMBkV0AmWFGo5CiCf+LJDB5cBoKtGEYtmNYu/B5PpaVmnTH3lfEm04vrt
 FCNWXOQFSxMEWUUiI6qtQagBKvyvrVaSoGQw6/NhY0VXnB1oiDIAazPb3lzNJZCh0vyq
 LhPm2T/32m97s1DTJ6ZS2VueODpLxTRqb1I99zSfNjbsd0RMxEqfzQ35UyIittNH41wU
 XZ2fRS7rFV0YnVBWd8GGGt3KpC2s9U6puJD1xcKKlnPoV3xlLzAxzS5+HucG+tCIVp3U
 R6DPIoxDSYWLVGIjW4kzuKBYHK4YvEm4GPl5nNIFEMztiDwtY+GH9KSbHhszQyuk0ITt mg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pymfuepsv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Apr 2023 20:29:47 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33IIrven015637;
        Tue, 18 Apr 2023 20:29:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3pyjcc2e4s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Apr 2023 20:29:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xh8TclJ2lF24Ws3O6HNc/zC6f5OtDB2i89rSwWec0DTXdtbL+urWGHeGcPhapHwj7LqtSESeF7MqNE7412kIIuR5OhuaGiLQH9NnNNEOjxB9de5vTo/KgZBlxQZ9ZSINkCEpXaUtSO13h4+qj7uHNhcSSeHVjPeD9DTjr8V7a26r++egRBGceLTClko7HaTL078dPO2kVruXmukzcQ7Rp9gBKOmFnpetnQco5C7fYD5GeAsY8MSkygEabxoPDkeHqBo1pTB9RqacTfCZRqBg8l5/vuyqWd9erZSMvkJU9u3x0bkIr8+kOLsjB9ZmFSbN1B84BqdgtwyqLMBeiVKVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JI7X3ejjGQoCkbIzLvFLK7b1SJse9JxmfNbj0u8XL7w=;
 b=Zi35hI78lg6/QttcUdZJUhVUUWE7Vk3ct2m/AATCujBeSgFPvxnSC2WvbS5BE8YLSaMWh3YfcM7/JBz9zt2/50pS9SomZmcQ/q5q55VylSTpiBb8P82M8BXzkk49ZhfwwtY1Ut+7q1LJoTeBbTdsQv1+6D7Kpd15Zi2E0xZD9hV5rNYO0mZEnWpmKBy2IupOvbF/4pUqV93FwhEHr/hpIQmBXXJzSGuJAfkPWQhdxxTP66iJyNIfCeoBv+up9MGk2JQGI8jBQxYPk2r5zhrGgGkMvkQpHsbmUKpdxBDzapq6KBCHWfw8KW/ucvUwY4OokObYFmj/KmbMNIIcyHdAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JI7X3ejjGQoCkbIzLvFLK7b1SJse9JxmfNbj0u8XL7w=;
 b=aCSnyJov/V4InBllAuqkAsllmPwk0hDjZZfUkSPdzQJHamsUAwahVA6solAwY2E7KE9CKYA8PoN0+H3N61971SYNL/JhJiQMeq0S41eH8FuxVBFU24qom805nUplIMieSNQ2lCgF7y7grYtOkfGWrG9fIDzI9iyTMgmku7jU4os=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by SN7PR10MB6978.namprd10.prod.outlook.com (2603:10b6:806:34d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 20:29:39 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::ffb:de39:b76b:52eb]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::ffb:de39:b76b:52eb%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 20:29:39 +0000
Date:   Tue, 18 Apr 2023 13:29:36 -0700
From:   Mike Kravetz <mike.kravetz@oracle.com>
To:     Hugh Dickins <hughd@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Ard Biesheuvel <ardb@kernel.org>, linux-ia64@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH] ia64: fix an addr to taddr in huge_pte_offset()
Message-ID: <20230418202936.GB4907@monkey>
References: <732eae88-3beb-246-2c72-281de786740@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <732eae88-3beb-246-2c72-281de786740@google.com>
X-ClientProxiedBy: MW2PR16CA0020.namprd16.prod.outlook.com (2603:10b6:907::33)
 To BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|SN7PR10MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a917ced-2e73-4e5b-6d3f-08db404ba205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R/3Vvyf4dvtCeiId26duBwqymmotDP/y3D9sojZMjJtYRSsar2bMOs1xQ6o5UPgyEE5Iw5GpEpXZ7DzCeb4vmv4RuE2pnwlrCXp2U7oQms2npZ18iqJJVXXhqQPpuairHF29rJHeXShghTbBCswPts9CilFrkQv15y85ypTcW1l+AtMvEF25cu8Z9X/O/xpKCE8xnPSuDse42iL7HrE6kQyomGEdRxv4f828vrcBYpmhvxLHeQAH5BGm2pGrTfZfq70KLyjbrgCfe7SjuStsFYfYNmJFKLLCSCUtlWL4CLcg4gq3H13cKOwgXQ3nVbSoSn34EE3xahXBaGvXqrh2lydmIXl/7SgIzJz3QSjekaBoGA7Z0l+KXHZ16XvfAalaBt+XuzSAGcgh+YZQVmd/flzoM/nHYgXvcDnTEzligqQ9FtiECQYipwP1RTjS3dRVZcNj68jdXGtnv9IELRqjDsPEnJECVQK60Z952lhsf6lOGPdX75jDGiW8I6kyLHban0KINxphxLBGeqpONYsC2cKpAerKzCC6qH6PZyiYbb8nmN41VOhcSAQ3R2lijI8ejANWqdeKzO1Siw0YOX40IJ07JuH4ESM6vQRLAdbwmi8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(9686003)(6506007)(86362001)(83380400001)(33716001)(6512007)(53546011)(1076003)(26005)(33656002)(186003)(2906002)(44832011)(5660300002)(6486002)(38100700002)(6666004)(8676002)(8936002)(66476007)(478600001)(54906003)(41300700001)(316002)(66556008)(66946007)(6916009)(4326008)(14583001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cCJe1mPGOMuhVvm4qV8h8F3ehU4c3z5l6mGymq/uvk5ODPecxO2AmqLV/9qE?=
 =?us-ascii?Q?Qz6iJWVDeTa/DdJ4g/keBC5sSBqIfyeX2Et4q1QF/P43uUQtYLzTYt/RnaHr?=
 =?us-ascii?Q?oSc2BlZxiMtADezPB1DTJgU9HVQfpTgy4ooI5Z4w7gzs4AAIvvCt4DG9SeB5?=
 =?us-ascii?Q?EBO+ltA32js9PdqsCyPhy/tzjKM/SzrMuriKwXtYaU42adQDnzhQpYEZCtak?=
 =?us-ascii?Q?RSuO2XPSwgLaHfDuF+wBOvjFRXZI3mR0JysqZtwTgTW5B0jo5M/6wNXcpJyf?=
 =?us-ascii?Q?FYIyN4eQqyesUYsc2FVbQnot1D0+A+iqPbcXX+mxPtr5oscxsyUknduealTW?=
 =?us-ascii?Q?CK+yJD+KBnKk+HMfaPuXldgS10yVlJ89plobmhY++zkx/kxJnaAHMFKGY7NK?=
 =?us-ascii?Q?1aaCilgNUoJ8ZUWnRgmSbexKFLB1GCIHNjCZgvcNWvxTCD++5IwYbp3a0fVw?=
 =?us-ascii?Q?V0139dXqIehH4ghRG3HhejUUZWW2AA+lgigaJ4TWMAEjCfaKfPO3bBYkj7+G?=
 =?us-ascii?Q?x1YeK10cYa4fqo2zRaW1ukqjr8MrwTm8HAXqcEyYfto1EnLHxzQ+LXhazSI9?=
 =?us-ascii?Q?lH2dJfJOhmxIlUkH3W1pBaI5QeF+o7EosvLG0eJqCJnAyxfh8v5ee12dFc+Z?=
 =?us-ascii?Q?JwVEWdeOG4r5/SfvEL9S2dtaSY6npoj4NeRiZG3nx2webnqKzSYdCiNYDaC2?=
 =?us-ascii?Q?mXrLiN1DPOKKg+NzWv5oTDzl1KWToTmrE3WfdHYTjIcg/GfZBd6EqKWk2XRp?=
 =?us-ascii?Q?vSD4a4RaBVsFHpASEFBfyEeQeaAnapoFub9+4NtNMZ5bCyzQ6uJaVdZcofA8?=
 =?us-ascii?Q?INGQ/rYTBAufFbEE443FbKj0vfcHuygLAs3R63OsS5NWr64oT1DS/jnqwlVh?=
 =?us-ascii?Q?m/4tTXukcEBufPHZnUIlNbesXXYSiSVd+Np/lc7vCuVPjXGDVbpPFTupZb7w?=
 =?us-ascii?Q?U/9qbkklGJzAByE1zNTkn2DxdMYkrHlD9+lwAfWX8BK1z7Ah+nk0vWgCesvT?=
 =?us-ascii?Q?a3+WGzZvuE8rHO8GrEK+fo5SBDnJukxEMl0jsmtPTjDCzBoC+c+5WqsI96SB?=
 =?us-ascii?Q?h/jcQI6EO9dINeqi4UvxDKbzNgrxb7FKTcehE1pHaJsP8/xwIdwvZUNdLwmG?=
 =?us-ascii?Q?QOf77P2k2MWxAEgcni2vDluLuNvnvPu5Y+8hETwuQ0qN0mRUlZI6xGbdm0A4?=
 =?us-ascii?Q?5etN1bGo+QFRRfg8RyFxyx4Mq/odt0TKFUiRBD9zlGbweH9TrKQKS+wLa3ic?=
 =?us-ascii?Q?z2iLUOfkPJ63QGI4C+umUh+LemfO0SB/EArHoCFCDQ87B2Y5hm0+TWOnMKSA?=
 =?us-ascii?Q?f5o8hSsy68kbU2GTEr6qA7PrjJhO4yOlv6pnW//spKKDgfArimfICJwewQVE?=
 =?us-ascii?Q?Ik+iWKcGT5JywjQPtnYQuxLowfY3fqF8tdk9EOIPeJrldB18QkhR5SGx7poq?=
 =?us-ascii?Q?X6KrauI0fy4/6kbbZkGqAizQKseVGDspKBpnm34VCzAY+zlkyIy3xQcLxdLy?=
 =?us-ascii?Q?7vfNUX7yguheg6PLM2U23TfBYJNFiN/qsz5SWBg6TAaMS6yLAmR+Kby+O2ty?=
 =?us-ascii?Q?fjPNjoVJQzJWl0J74wbpY7VQD572b2imgVICqGQM7uJa3ve35Fvoy0OCjBa/?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?DFVbgGrlw5aQcjdFcdhABwDy7lrEbxV0spDdFSz9ZSLQbolgP8+9ACiU3Mls?=
 =?us-ascii?Q?WTZ8pvsmUbiJCeeMCTzflP67pmi6jsPfsuHpS0CbrJwyG++hKXm69uf+lDdr?=
 =?us-ascii?Q?+Qy5b/UyOWAj3sjWXG4p6QBjWXw7wbW2yhrzMppv2G9NTFxCJpXhtm3dqh3f?=
 =?us-ascii?Q?fXU5pbk+aH/W5gOAf2gzPY93Kid8QkXN/J+VfoCVoVNoyixzeBtkJUAkY7Oe?=
 =?us-ascii?Q?LOEI2K42Isvl1081AqTQViATVhIk7sWew1C7AG1YDk/8rJpctNxdFLTg1nY0?=
 =?us-ascii?Q?W8mjWk0akdg/WTzJeHSOOwHfIFsZjGGtkWMgYiJqGkUnW2/5+4qY+YQI3v2y?=
 =?us-ascii?Q?Msm4botL5KEMjGi5pojUuTDkpOILVluCyajnDrc3fXM3G0WKTRkWHvq9FJqh?=
 =?us-ascii?Q?G5rDkbZ2x0TvASPGKrroXbTvNiM8ovJuliSJ8Y55SqUw18eYVofQ6iXGsZby?=
 =?us-ascii?Q?5pIqgvv/5PfEmZ2gRj7U9cjILMiKVUMPP+yRq0BR6VyT5SdudX8S9WaJRQib?=
 =?us-ascii?Q?sKHMpV3F0iavNYh3EGXqSgo39+5VhlJMftC2Yai8sjDYeNdmPCo6SNQyXsRJ?=
 =?us-ascii?Q?d4EHS6sKh715WewIdFgQseM7eprG8lP3DKUYQVXJnJz1u2vEom9pXwyMW+ya?=
 =?us-ascii?Q?zUYosTBRGCDuIxExeyQ2+h3pHtDyQiozDDDVGLSSgVz9Y45ZifLK3J7K+H3T?=
 =?us-ascii?Q?OqTZlfRESc7QHvkZ4ypTOCbM73SI/np9oiFjb1O/ca/NtJ4BFY3cZSqbion4?=
 =?us-ascii?Q?Pi8xO7JbHcMnzGiqrBPv8pm3KWO4KHP7+2mgxMmcBw8w/xTfQzA/7sX4HsRJ?=
 =?us-ascii?Q?AIhfU/0S6m6fWuSbh3XkcSkq2V/d5jaCiDHS0DYJeZ7einfqnufxtLyxMeGO?=
 =?us-ascii?Q?OzvuLh3cWq+2EBf4wnmCpqB0B7EIrAJ7aIAesoNc+YECI3MKFPGCX0bXvLkL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a917ced-2e73-4e5b-6d3f-08db404ba205
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 20:29:39.0201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAciR3K95tGI71n1sb31Uphw4CgKeRSS3tOUogzgUJAEnoo2xb1UZjqhLB5mRgsEYwz2zi8WqT7AY17CrLOL4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6978
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_15,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=950 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180169
X-Proofpoint-GUID: aLx5CdsZTw8PqFZQNtobigafy1jUlJNF
X-Proofpoint-ORIG-GUID: aLx5CdsZTw8PqFZQNtobigafy1jUlJNF
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 04/16/23 22:17, Hugh Dickins wrote:
> I know nothing of ia64 htlbpage_to_page(), but guess that the p4d
> line should be using taddr rather than addr, like everywhere else.
> 
> Fixes: c03ab9e32a2c ("ia64: add support for folded p4d page tables")
> Signed-off-by: Hugh Dickins <hughd@google.com
> ---
> Just something noticed when visiting recently in the source:
> thought we might fix it before ia64 is consigned to history;
> I'm unable to say anything about the user-visible effects!

Good eye!

I know as little about ia64 as you.  However, that single use of addr
within the routine certainly looks wrong.

Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
-- 
Mike Kravetz

> 
>  arch/ia64/mm/hugetlbpage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- 6.3-rc7/arch/ia64/mm/hugetlbpage.c
> +++ linux/arch/ia64/mm/hugetlbpage.c
> @@ -58,7 +58,7 @@ huge_pte_offset (struct mm_struct *mm, unsigned long addr, unsigned long sz)
>  
>  	pgd = pgd_offset(mm, taddr);
>  	if (pgd_present(*pgd)) {
> -		p4d = p4d_offset(pgd, addr);
> +		p4d = p4d_offset(pgd, taddr);
>  		if (p4d_present(*p4d)) {
>  			pud = pud_offset(p4d, taddr);
>  			if (pud_present(*pud)) {
