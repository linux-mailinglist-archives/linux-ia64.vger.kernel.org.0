Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D69C36E7642
	for <lists+linux-ia64@lfdr.de>; Wed, 19 Apr 2023 11:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbjDSJaP (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 19 Apr 2023 05:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjDSJaO (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 19 Apr 2023 05:30:14 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5177E7AB9
        for <linux-ia64@vger.kernel.org>; Wed, 19 Apr 2023 02:30:13 -0700 (PDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33J8BVSD027803;
        Wed, 19 Apr 2023 09:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=BCVaQWX8wENq0DO7uDMubrTTJdT7g8WAsUs6XZCUPEc=;
 b=KI59aLQeP+ewyXB61WATBv0WCZ0jamjZKmXqoLQFp8b41aS9dlFFh3AP8mtMTFJ/9Yu0
 UhKfdMVPQNZC8ucf29Kwj6Uh3u8tGPyicOBVqQC29FUAvpsRb50E0hInINag8DlcEmjX
 BYi/8XjQaAYF83rEo6XN6zIKvhbGrxcJwOPaKi5IGItQabxjfd0/7sfSrzdLNc4mw9GM
 Jb2+ukiG/uXqx2wNx2YBGfl25k+GoBBubjOzbe63xRqHETjXv4462krI0Nz+kQlSL8xi
 gl0GGSR+Di6TKuz5ahCh5KCOPxyjSSH5ineA9rvpVptny70FNKADhcXU2FK+MQGu1Rqs 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q28tyrdxn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 09:30:03 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33J9OZkt019579;
        Wed, 19 Apr 2023 09:30:03 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q28tyrdvk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 09:30:03 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33J3K8C5027628;
        Wed, 19 Apr 2023 09:30:00 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
        by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pyk6fjkyb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 09:30:00 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
        by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33J9TwhR7275050
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 Apr 2023 09:29:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3FAFF20043;
        Wed, 19 Apr 2023 09:29:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 576E020040;
        Wed, 19 Apr 2023 09:29:57 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.171.40.70])
        by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
        Wed, 19 Apr 2023 09:29:57 +0000 (GMT)
Date:   Wed, 19 Apr 2023 12:29:55 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Hugh Dickins <hughd@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Ard Biesheuvel <ardb@kernel.org>, linux-ia64@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH] ia64: fix an addr to taddr in huge_pte_offset()
Message-ID: <ZD+0k0k4KzMzrmsT@linux.ibm.com>
References: <732eae88-3beb-246-2c72-281de786740@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <732eae88-3beb-246-2c72-281de786740@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SRg6qd7GUcrAaW-YibhBdvpq11qOi6sT
X-Proofpoint-GUID: 5W1KW1xNB19ev1igrtiNiz9uVgMkUKmC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_04,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=697 clxscore=1011 priorityscore=1501 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190081
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Sun, Apr 16, 2023 at 10:17:05PM -0700, Hugh Dickins wrote:
> I know nothing of ia64 htlbpage_to_page(), but guess that the p4d
> line should be using taddr rather than addr, like everywhere else.
> 
> Fixes: c03ab9e32a2c ("ia64: add support for folded p4d page tables")
> Signed-off-by: Hugh Dickins <hughd@google.com

htlbpage_to_page() does weird things I don't understand, but I should have
used taddr indeed :)

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
> Just something noticed when visiting recently in the source:
> thought we might fix it before ia64 is consigned to history;
> I'm unable to say anything about the user-visible effects!
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

-- 
Sincerely yours,
Mike.
