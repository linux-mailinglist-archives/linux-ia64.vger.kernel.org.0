Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 582FBBA87A
	for <lists+linux-ia64@lfdr.de>; Sun, 22 Sep 2019 21:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729800AbfIVTEL (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 22 Sep 2019 15:04:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:37666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729096AbfIVTB0 (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Sun, 22 Sep 2019 15:01:26 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49ACA206C2;
        Sun, 22 Sep 2019 19:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569178886;
        bh=tZ0vg3dZimMEgTi2SUGe7lP4Vh6YFUj0YqBXkUubxTs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iXmpPvh0HWGT1Irgw5JbB2kQKHDiSzJYwkvQhSpFdGjolmUk2R2faqqcbP7FkBf+f
         Z9HdHdwpYgzTe9buKY4QkjTrfcBpEGItUbS/wzPDG6YPg/4g+up/5yx0se8lou/bij
         ejf9wpqcmu4SUD5XFy89vpjji5co/9xdeuJ2hOVo=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     chenzefeng <chenzefeng2@huawei.com>,
        Tony Luck <tony.luck@intel.com>,
        Sasha Levin <sashal@kernel.org>, linux-ia64@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 16/44] ia64:unwind: fix double free for mod->arch.init_unw_table
Date:   Sun, 22 Sep 2019 15:00:34 -0400
Message-Id: <20190922190103.4906-16-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922190103.4906-1-sashal@kernel.org>
References: <20190922190103.4906-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

From: chenzefeng <chenzefeng2@huawei.com>

[ Upstream commit c5e5c48c16422521d363c33cfb0dcf58f88c119b ]

The function free_module in file kernel/module.c as follow:

void free_module(struct module *mod) {
	......
	module_arch_cleanup(mod);
	......
	module_arch_freeing_init(mod);
	......
}

Both module_arch_cleanup and module_arch_freeing_init function
would free the mod->arch.init_unw_table, which cause double free.

Here, set mod->arch.init_unw_table = NULL after remove the unwind
table to avoid double free.

Signed-off-by: chenzefeng <chenzefeng2@huawei.com>
Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/ia64/kernel/module.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/ia64/kernel/module.c b/arch/ia64/kernel/module.c
index 36b2c94a8eb5d..14c7184daaf64 100644
--- a/arch/ia64/kernel/module.c
+++ b/arch/ia64/kernel/module.c
@@ -912,8 +912,12 @@ module_finalize (const Elf_Ehdr *hdr, const Elf_Shdr *sechdrs, struct module *mo
 void
 module_arch_cleanup (struct module *mod)
 {
-	if (mod->arch.init_unw_table)
+	if (mod->arch.init_unw_table) {
 		unw_remove_unwind_table(mod->arch.init_unw_table);
-	if (mod->arch.core_unw_table)
+		mod->arch.init_unw_table = NULL;
+	}
+	if (mod->arch.core_unw_table) {
 		unw_remove_unwind_table(mod->arch.core_unw_table);
+		mod->arch.core_unw_table = NULL;
+	}
 }
-- 
2.20.1

