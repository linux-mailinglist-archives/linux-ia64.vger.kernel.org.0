Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F07245E18
	for <lists+linux-ia64@lfdr.de>; Mon, 17 Aug 2020 09:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgHQHd7 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 17 Aug 2020 03:33:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1824 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726746AbgHQHd5 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Mon, 17 Aug 2020 03:33:57 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07H73Xis141858;
        Mon, 17 Aug 2020 03:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=N8+1kvMoZAKv/kpd/KP/YHckzQbSF9PRsuI4l3aEw9E=;
 b=Wga6r9RkRSRk42MzJYlfarkfZUJrMcbdZWXU80TgW1x6xM+djqLpYte6s0mfEvCpbtVQ
 ZPXc4gKEsyUrHgPneKGty3MUGlYS+XXSv4hweiKSl9rAbHOVE78DlHjRCKEvxcXeQlEp
 KjiiE3zRlhpOY5nbAQhywFFHDbuv003kyT7AUCpOGrkj7sTaANEbZAr/p1y69vK1WAS3
 3CzlvTGWxhn4CkWDyI+8JyZu80ZiIton37KoZLLi7ExRklSOapZhk/nWxy4WHA9QLNfH
 IfintzSSc14WwlUYaur2542WOEXBjmMSplGh4ecAgb2Oh4QB6JuTmRpJibhlx9/aTvIZ nw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32y6mjh9x1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Aug 2020 03:33:41 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07H74cBD145279;
        Mon, 17 Aug 2020 03:33:40 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32y6mjh9vw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Aug 2020 03:33:40 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07H7URIp029319;
        Mon, 17 Aug 2020 07:33:38 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma05fra.de.ibm.com with ESMTP id 32x7b816hj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Aug 2020 07:33:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07H7Xad925624920
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 Aug 2020 07:33:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 03B9411C058;
        Mon, 17 Aug 2020 07:33:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0497511C050;
        Mon, 17 Aug 2020 07:33:35 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.34.219])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 17 Aug 2020 07:33:34 +0000 (GMT)
Date:   Mon, 17 Aug 2020 10:33:33 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Jessica Clarke <jrtc27@jrtc27.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        Anatoly Pugachev <matorola@gmail.com>,
        Sergei Trofimovich <slyfox@gentoo.org>, linux-mm@kvack.org,
        Frank Scheiner <frank.scheiner@web.de>
Subject: Re: [PATCH v5] arch/ia64: Restore arch-specific pgd_offset_k
 implementation
Message-ID: <20200817073333.GK969206@linux.ibm.com>
References: <20200813205521.5405-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813205521.5405-1-rppt@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-17_02:2020-08-17,2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=1 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=849 clxscore=1015
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170055
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, Aug 13, 2020 at 11:55:21PM +0300, Mike Rapoport wrote:
> From: Jessica Clarke <jrtc27@jrtc27.com>
> 
> IA-64 is special and treats pgd_offset_k() differently to pgd_offset(),
> using different formulae to calculate the indices into the kernel and user
> PGDs.  The index into the user PGDs takes into account the region number,
> but the index into the kernel (init_mm) PGD always assumes a predefined
> kernel region number. Commit 974b9b2c68 ("mm: consolidate pte_index() and
> pte_offset_*() definitions") made IA-64 use a generic pgd_offset_k() which
> incorrectly used pgd_index() for kernel page tables.  As a result, the
> index into the kernel PGD was going out of bounds and the kernel hung
> during early boot.
> 
> Allow overrides of pgd_offset_k() and override it on IA-64 with the old
> implementation that will correctly index the kernel PGD.
> 
> Fixes: 974b9b2c68 ("mm: consolidate pte_index() and pte_offset_*() definitions")
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
> Changes in v4:
> * Correct the comment that I missed in v4 :(
> 
> Changes since v3:
> * Correct commit message as Jessica suggested
> 
> Changes since v2:
> * Rephrase commit message and comment about pgd_offset_k()
> 
> Changes since v1:
>  * Fixed typo in commit message
>  * Slightly reworded commit message to sound less weird
>  * Included Adrian's Tested-by
>  arch/ia64/include/asm/pgtable.h | 9 +++++++++
>  include/linux/pgtable.h         | 2 ++
>  2 files changed, 11 insertions(+)

I can take this via my tree if there are no objections.

Tony?

-- 
Sincerely yours,
Mike.
