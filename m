Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B735B888F
	for <lists+linux-ia64@lfdr.de>; Wed, 14 Sep 2022 14:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbiINMrr (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 14 Sep 2022 08:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbiINMrU (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 14 Sep 2022 08:47:20 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483F07B78D
        for <linux-ia64@vger.kernel.org>; Wed, 14 Sep 2022 05:47:11 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MSKkQ2pqQzlVnQ;
        Wed, 14 Sep 2022 20:43:10 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 14 Sep 2022 20:47:08 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <mhiramat@kernel.org>, <mingo@kernel.org>,
        <cuigaosheng1@huawei.com>
CC:     <linux-ia64@vger.kernel.org>
Subject: [PATCH] ia64/kprobes: Remove orphan declarations from arch/ia64/include/asm/kprobes.h
Date:   Wed, 14 Sep 2022 20:47:07 +0800
Message-ID: <20220914124707.1483471-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

flush_register_stack() and invalidate_stacked_regs()
have been removed since commit 0aeaf6b3a345 ("ia64/kprobes:
Remove jprobe implementation"), so remove them.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/ia64/include/asm/kprobes.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/ia64/include/asm/kprobes.h b/arch/ia64/include/asm/kprobes.h
index c5cf5e4fb338..9e956768946c 100644
--- a/arch/ia64/include/asm/kprobes.h
+++ b/arch/ia64/include/asm/kprobes.h
@@ -110,8 +110,6 @@ extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
 extern int kprobe_exceptions_notify(struct notifier_block *self,
 				    unsigned long val, void *data);
 
-extern void invalidate_stacked_regs(void);
-extern void flush_register_stack(void);
 extern void arch_remove_kprobe(struct kprobe *p);
 
 #endif /* CONFIG_KPROBES */
-- 
2.25.1

