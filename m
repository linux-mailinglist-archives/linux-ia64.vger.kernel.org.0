Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA19834DADC
	for <lists+linux-ia64@lfdr.de>; Tue, 30 Mar 2021 00:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbhC2WXp (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 29 Mar 2021 18:23:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:47358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232292AbhC2WW6 (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Mon, 29 Mar 2021 18:22:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 363B36198A;
        Mon, 29 Mar 2021 22:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617056577;
        bh=cnb7QmwLhbTC+fXxQj2F60KkxDx49/PFfA8DcT71/pU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RE1i+0iNQHkjdPjxvrr/wr5Xys3ME9yPbSuIMbs136i7j+SttqyXR988L3+PNhRSD
         iHM3GJk59OaXNmUJ3H/O1lyrWPM7yHcW9CvGUO2QUMpOmprAhJJq8TI7r6U/UsYGXf
         3HbA0D7pUY6h20jOz59HhkVYVWyNoLqUSwJCZYNgLHGjIELWj4cU/cCdKcqZl3E3Dm
         vvGG4ZrLA/Jo7JFqrrCyPBcbK9A8M/NCO50d8QDrqa05ug5we7QouEBTbrCC7kE9K6
         iRd43oBIenr7Ktwwe35jjLsOqMpU6sw4BbkpdjJa031PiQK3e/WuGooccbl8aWlCD5
         4i6kKAjaIFQ3Q==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sergei Trofimovich <slyfox@gentoo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-ia64@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 29/33] ia64: fix format strings for err_inject
Date:   Mon, 29 Mar 2021 18:22:17 -0400
Message-Id: <20210329222222.2382987-29-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210329222222.2382987-1-sashal@kernel.org>
References: <20210329222222.2382987-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

From: Sergei Trofimovich <slyfox@gentoo.org>

[ Upstream commit 95d44a470a6814207d52dd6312203b0f4ef12710 ]

Fix warning with %lx / u64 mismatch:

  arch/ia64/kernel/err_inject.c: In function 'show_resources':
  arch/ia64/kernel/err_inject.c:62:22: warning:
    format '%lx' expects argument of type 'long unsigned int',
    but argument 3 has type 'u64' {aka 'long long unsigned int'}
     62 |  return sprintf(buf, "%lx", name[cpu]);   \
        |                      ^~~~~~~

Link: https://lkml.kernel.org/r/20210313104312.1548232-1-slyfox@gentoo.org
Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/ia64/kernel/err_inject.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/ia64/kernel/err_inject.c b/arch/ia64/kernel/err_inject.c
index 8b5b8e6bc9d9..dd5bfed52031 100644
--- a/arch/ia64/kernel/err_inject.c
+++ b/arch/ia64/kernel/err_inject.c
@@ -59,7 +59,7 @@ show_##name(struct device *dev, struct device_attribute *attr,	\
 		char *buf)						\
 {									\
 	u32 cpu=dev->id;						\
-	return sprintf(buf, "%lx\n", name[cpu]);			\
+	return sprintf(buf, "%llx\n", name[cpu]);			\
 }
 
 #define store(name)							\
@@ -86,9 +86,9 @@ store_call_start(struct device *dev, struct device_attribute *attr,
 
 #ifdef ERR_INJ_DEBUG
 	printk(KERN_DEBUG "pal_mc_err_inject for cpu%d:\n", cpu);
-	printk(KERN_DEBUG "err_type_info=%lx,\n", err_type_info[cpu]);
-	printk(KERN_DEBUG "err_struct_info=%lx,\n", err_struct_info[cpu]);
-	printk(KERN_DEBUG "err_data_buffer=%lx, %lx, %lx.\n",
+	printk(KERN_DEBUG "err_type_info=%llx,\n", err_type_info[cpu]);
+	printk(KERN_DEBUG "err_struct_info=%llx,\n", err_struct_info[cpu]);
+	printk(KERN_DEBUG "err_data_buffer=%llx, %llx, %llx.\n",
 			  err_data_buffer[cpu].data1,
 			  err_data_buffer[cpu].data2,
 			  err_data_buffer[cpu].data3);
@@ -117,8 +117,8 @@ store_call_start(struct device *dev, struct device_attribute *attr,
 
 #ifdef ERR_INJ_DEBUG
 	printk(KERN_DEBUG "Returns: status=%d,\n", (int)status[cpu]);
-	printk(KERN_DEBUG "capabilities=%lx,\n", capabilities[cpu]);
-	printk(KERN_DEBUG "resources=%lx\n", resources[cpu]);
+	printk(KERN_DEBUG "capabilities=%llx,\n", capabilities[cpu]);
+	printk(KERN_DEBUG "resources=%llx\n", resources[cpu]);
 #endif
 	return size;
 }
@@ -131,7 +131,7 @@ show_virtual_to_phys(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	unsigned int cpu=dev->id;
-	return sprintf(buf, "%lx\n", phys_addr[cpu]);
+	return sprintf(buf, "%llx\n", phys_addr[cpu]);
 }
 
 static ssize_t
@@ -145,7 +145,7 @@ store_virtual_to_phys(struct device *dev, struct device_attribute *attr,
 	ret = get_user_pages_fast(virt_addr, 1, FOLL_WRITE, NULL);
 	if (ret<=0) {
 #ifdef ERR_INJ_DEBUG
-		printk("Virtual address %lx is not existing.\n",virt_addr);
+		printk("Virtual address %llx is not existing.\n", virt_addr);
 #endif
 		return -EINVAL;
 	}
@@ -163,7 +163,7 @@ show_err_data_buffer(struct device *dev,
 {
 	unsigned int cpu=dev->id;
 
-	return sprintf(buf, "%lx, %lx, %lx\n",
+	return sprintf(buf, "%llx, %llx, %llx\n",
 			err_data_buffer[cpu].data1,
 			err_data_buffer[cpu].data2,
 			err_data_buffer[cpu].data3);
@@ -178,13 +178,13 @@ store_err_data_buffer(struct device *dev,
 	int ret;
 
 #ifdef ERR_INJ_DEBUG
-	printk("write err_data_buffer=[%lx,%lx,%lx] on cpu%d\n",
+	printk("write err_data_buffer=[%llx,%llx,%llx] on cpu%d\n",
 		 err_data_buffer[cpu].data1,
 		 err_data_buffer[cpu].data2,
 		 err_data_buffer[cpu].data3,
 		 cpu);
 #endif
-	ret=sscanf(buf, "%lx, %lx, %lx",
+	ret = sscanf(buf, "%llx, %llx, %llx",
 			&err_data_buffer[cpu].data1,
 			&err_data_buffer[cpu].data2,
 			&err_data_buffer[cpu].data3);
-- 
2.30.1

