Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 328AF514879
	for <lists+linux-ia64@lfdr.de>; Fri, 29 Apr 2022 13:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbiD2Lrq (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 29 Apr 2022 07:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358713AbiD2Lrm (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 29 Apr 2022 07:47:42 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DDBC7494
        for <linux-ia64@vger.kernel.org>; Fri, 29 Apr 2022 04:44:18 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id iq10so6930532pjb.0
        for <linux-ia64@vger.kernel.org>; Fri, 29 Apr 2022 04:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EkPpqVJFZwtWuFEh4cjXyyHHD2JdNkeuaKvQxOerGLs=;
        b=UiTgjpBDLYNVb5S2HJ7JkqhnXTLajN0F89ea627idBHei/lCATFHimuuXRKJrI7VP1
         hXd7YtHmJfxGyoIYThnjXVLHYbsWVstByJN/HBzblqHJmwTxONK1aH8TlhMIUEt+J9JL
         Jvj2ubAeOBdbV9dq8oG8yygZ9JPthi8vSkNDCX94aI4sEhLujFDd+HRF55Ml0m06TdkX
         I6Xj25mlJ0iyRn7ETPC/BZk4FHDDb2OOBnDcodFk6gi47HGtXFbrvtnl7TQeEoom11lr
         HZAz2r2JE0eZk/RGC0m2KhI7rmMDlVncQ6eLOBDh+9jdIJ4jcDL3YARyrhK3+hqz12g4
         Xu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EkPpqVJFZwtWuFEh4cjXyyHHD2JdNkeuaKvQxOerGLs=;
        b=HMVWG044iOA4uaSPzVMN1jBLVRjXkFZhAtSESk/LfMbJVt7ImzwH48HZvAJivBEX/u
         RHLS7qMCC6DBso7agpuRW9i4uOUCiJ27PV6151+AUdqRqljWXRFMADf8vzNTccC4nvFW
         tdjlEKONoUpphnOhpMz7flxM368wh8VxMag5yxu16llgVJE8Pz4gsg8MU9fzxS425mc6
         KAGB9mR71onOHIQCrbeNQ/qnk428rTkwhxayX83nz9DcXfKFuk2ZiVkpMGEK1snf0bwK
         Le6aHiGw3nhvnsOR2So2I5WGBqYjXfa4lC00jUnHRpoCB2fpGf4JtA4SbYX6Km8xQaoe
         NOJA==
X-Gm-Message-State: AOAM533NKJ981kyjG6xVSsIj+uBONxqy7x+d0W3sS5zLz4jc2TVMXL1h
        PMm3b1Iiy/crfm/0D/6ojZtkSg==
X-Google-Smtp-Source: ABdhPJzBsgHH4J5QAo+Gn1X23WEJ7Tm2fIjGmg7YoFqHNQUGWoo/feizs2yfyHBrgsdv6ewosE17vw==
X-Received: by 2002:a17:902:e84b:b0:15c:fee2:aeb6 with SMTP id t11-20020a170902e84b00b0015cfee2aeb6mr27576901plg.128.1651232657669;
        Fri, 29 Apr 2022 04:44:17 -0700 (PDT)
Received: from localhost ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id u14-20020a63470e000000b003c14af5061esm5653739pga.54.2022.04.29.04.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 04:44:17 -0700 (PDT)
Date:   Fri, 29 Apr 2022 19:44:14 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Peng Liu <liupeng256@huawei.com>
Cc:     mike.kravetz@oracle.com, david@redhat.com,
        akpm@linux-foundation.org, yaozhenguo1@gmail.com,
        baolin.wang@linux.alibaba.com, liuyuntao10@huawei.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        wangkefeng.wang@huawei.com, dave@stgolabs.net,
        wangborong@cdjrlc.com, linux-ia64@vger.kernel.org,
        adobriyan@gmail.com
Subject: Re: [PATCH v4] mm: Using for_each_online_node and node_online
 instead of open coding
Message-ID: <YmvPjnjufx+XZxN3@FVFYT0MHHV2J.usts.net>
References: <20220413032915.251254-4-liupeng256@huawei.com>
 <20220429030218.644635-1-liupeng256@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429030218.644635-1-liupeng256@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Fri, Apr 29, 2022 at 03:02:18AM +0000, Peng Liu wrote:
> Use more generic functions to deal with issues related to online
> nodes. The changes will make the code simplified.
> 
> Signed-off-by: Peng Liu <liupeng256@huawei.com>
> Suggested-by: Davidlohr Bueso <dave@stgolabs.net>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
