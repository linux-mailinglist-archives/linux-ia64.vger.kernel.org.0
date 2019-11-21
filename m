Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31860104DA4
	for <lists+linux-ia64@lfdr.de>; Thu, 21 Nov 2019 09:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfKUIPS (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 21 Nov 2019 03:15:18 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38652 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbfKUIPJ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 21 Nov 2019 03:15:09 -0500
Received: by mail-wr1-f66.google.com with SMTP id i12so3201669wro.5
        for <linux-ia64@vger.kernel.org>; Thu, 21 Nov 2019 00:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S85Lb8WCrvzvHsXJ1JP6vJm29LDHnvv8cinVUtImNUA=;
        b=yq3uTprMfeFN489dyXFOl4m/qrdnE7eA2cjunM2zTtR4UzDnl6oQiaoS9uColT8q2h
         wSzZgoGOtmJvVG3/bcQbKvkBPwTgsAI4pbcteHAiL654TKVR8qKocXKSzfTIYt1jEUdI
         d8QWlvvR89ZJamV3huZEneoVQDB24YemVutwEGXJ/crJmSINH//i0XWOqGkOGe2gYgBU
         cOsHAD9eLTf66ifK2U3WkpLlVAPRn1erMWf6UKVoQuSgxpxbb72CERomZVM+HLZyQTff
         FX0GlPhHUyTgfuCvyXlcWO8+KKu1xx6IWRzydMZQYIvkCoviWDEpPtldm1QvSbRh1J5T
         UKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S85Lb8WCrvzvHsXJ1JP6vJm29LDHnvv8cinVUtImNUA=;
        b=bLmBxK6Q5Ox/vnF4rVbMfYlvcRihAJnFlIe8e3Y0cGz5ZZnNwG+9XuyQ768bPF6dXn
         7vvXcSJgMjb6xWGn0/PGDLdEpAytW44VXDfePck/rsYf31avamolTbnKhviizqDh1sX5
         j5dM8XE4w7QBeAuKxOiWf7sc9rejWSLAy19Em9HdOuKNH77mVYua8OWEFqVERvwoS7sA
         bzhqI80FhtiytO9S/m5hp/9rMxIIfzPdMGVs4o8BeIFF1T4N02ePorgwR2OHVIc0U5Gh
         WEVbSJU7AGbzJPa4hobx7cuxo/EL6erGYNBMkM6VC7/y99bEJKadobmCpKqENQjAAfYq
         JIMQ==
X-Gm-Message-State: APjAAAV8Q+ieCK5OYtf+buS3Nuj4/QdtFFfu6H1oBFpdOgDkRk8Ag4fE
        aEeMxd3YKxQUHudvWbaUqqN0zw==
X-Google-Smtp-Source: APXvYqwHgkPusxSIOYywogp+NmRlVVWIOoz0RqJdPk/4zC/qUu85b4/pJcVwbAtIK3Y6U6qbm6wG8g==
X-Received: by 2002:a5d:678f:: with SMTP id v15mr8567761wru.242.1574324107777;
        Thu, 21 Nov 2019 00:15:07 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id w13sm2315075wrm.8.2019.11.21.00.15.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 21 Nov 2019 00:15:07 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     airlied@redhat.com, airlied@linux.ie, arnd@arndb.de,
        fenghua.yu@intel.com, gregkh@linuxfoundation.org,
        tony.luck@intel.com
Cc:     linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 5/5] ia64: agp: Replace empty define with do while
Date:   Thu, 21 Nov 2019 08:14:45 +0000
Message-Id: <1574324085-4338-6-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
References: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

It's dangerous to use empty code define.
Furthermore it lead to the following warning:
drivers/char/agp/generic.c: In function « agp_generic_destroy_page »:
drivers/char/agp/generic.c:1266:28: attention : suggest braces around empty body in an « if » statement [-Wempty-body]

So let's replace emptyness by "do {} while(0)"

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/ia64/include/asm/agp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/ia64/include/asm/agp.h b/arch/ia64/include/asm/agp.h
index 2b451c4496da..0261507dc264 100644
--- a/arch/ia64/include/asm/agp.h
+++ b/arch/ia64/include/asm/agp.h
@@ -14,8 +14,8 @@
  * in coherent mode, which lets us map the AGP memory as normal (write-back) memory
  * (unlike x86, where it gets mapped "write-coalescing").
  */
-#define map_page_into_agp(page)		/* nothing */
-#define unmap_page_from_agp(page)	/* nothing */
+#define map_page_into_agp(page)		do { } while (0)
+#define unmap_page_from_agp(page)	do { } while (0)
 #define flush_agp_cache()		mb()
 
 /* GATT allocation. Returns/accepts GATT kernel virtual address. */
-- 
2.23.0

