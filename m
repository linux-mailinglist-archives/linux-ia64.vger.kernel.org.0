Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6860460B9C0
	for <lists+linux-ia64@lfdr.de>; Mon, 24 Oct 2022 22:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234111AbiJXUUm (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 24 Oct 2022 16:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234123AbiJXUUP (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 24 Oct 2022 16:20:15 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8C88FD40;
        Mon, 24 Oct 2022 11:36:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 729E6CE13CA;
        Mon, 24 Oct 2022 12:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC8BC433D6;
        Mon, 24 Oct 2022 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666614226;
        bh=3HHEogK/GgH7Bj0ZbubU+2O46uGu6KFNZBsMl3GyFTQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IR/CyQ4r+46rOrS1Sn533A2RdmRo1LZoVFIULmGp/j3WcBV/6RrIOu/I1fl8FqQPY
         KsGjnTPruX1ZjQVFQOIBQhpdtkOA90UfK+mtT3u4H6OA6p1wf13zL2/XegP2IBWkNo
         3anELfSSKydfjdOzNQbWM+knKWloPwxdzECeVSH0=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Ben Widawsky <bwidawsk@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-ia64@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Keith Mannthey <kmannth@us.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10 179/390] ia64: export memory_add_physaddr_to_nid to fix cxl build error
Date:   Mon, 24 Oct 2022 13:29:36 +0200
Message-Id: <20221024113030.363399091@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221024113022.510008560@linuxfoundation.org>
References: <20221024113022.510008560@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 97c318bfbe84efded246e80428054f300042f110 ]

cxl_pmem.ko uses memory_add_physaddr_to_nid() but ia64 does not export it,
so this causes a build error:

ERROR: modpost: "memory_add_physaddr_to_nid" [drivers/cxl/cxl_pmem.ko] undefined!

Fix this by exporting that function.

Fixes: 8c2676a5870a ("hot-add-mem x86_64: memory_add_physaddr_to_nid node fixup")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-ia64@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Keith Mannthey <kmannth@us.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/ia64/mm/numa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/ia64/mm/numa.c b/arch/ia64/mm/numa.c
index f34964271101..6cd002e8163d 100644
--- a/arch/ia64/mm/numa.c
+++ b/arch/ia64/mm/numa.c
@@ -106,5 +106,6 @@ int memory_add_physaddr_to_nid(u64 addr)
 		return 0;
 	return nid;
 }
+EXPORT_SYMBOL(memory_add_physaddr_to_nid);
 #endif
 #endif
-- 
2.35.1



