Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 109C7104DA6
	for <lists+linux-ia64@lfdr.de>; Thu, 21 Nov 2019 09:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfKUIPV (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 21 Nov 2019 03:15:21 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34766 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfKUIPH (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 21 Nov 2019 03:15:07 -0500
Received: by mail-wm1-f66.google.com with SMTP id j18so7065188wmk.1
        for <linux-ia64@vger.kernel.org>; Thu, 21 Nov 2019 00:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ppdXOwTCOHJBslqqkHtMotBNjKQr4/HLLSmXIlfKn5I=;
        b=TbXcZ93plWK4bAWJcfLyzxI+4etcs03Szkm7G6rDMa2pHnupYk/f5ga2Vfhzfzliyx
         ouHZRgQebTf9UtelZm+SlPamQadwc0uRFvx+ap51JmuaD2NC68WhdPYaGHHSIiMsbKhf
         YifnYC+f6Byn4RW8XuD46Wowol/uZ62XjGxZCTeUF7nB7PXt4t3B7yuti/GZut0lcFpR
         qWoKOLbernVARfDVvHD7PtVzjcTYL71ySkRwcTfM0FxWnVRJoK1dbfCyqzV6znnzuaSo
         NOefX0QGVkTyi2BaojCKHN7Fp+BoYw/vca4Wjmc6o8hXSO8lla/YyPB37Dt9EQVe4+qA
         Rjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ppdXOwTCOHJBslqqkHtMotBNjKQr4/HLLSmXIlfKn5I=;
        b=Q+B+BmAmlfBsyXwndFo0ivYG8czC6aB0oYU/cwN0HNFLkKFAtoBCWnjWu6XKaERdr2
         Vt4lDm//kPx1ZTr4yPOBjCC/tFsF4WW9RQ1RYXB5h+Scv/cQmyNi/WjGXPjw2gEIsfgy
         HR0v44RdbAk7y3smBrYHzWOIl6uAsmJyKBxCxtHlZaXCB6TYnwnr39PeT0IG6AgU0PBR
         mL+MuPzAeLlUalvKoWwe8FwGjTSZn8VrruZtb5h/Od5/jB8ivP/kVWQGTNKejcaSg/8N
         L+llG/1PTsb6jjDb4Gm1ZCXpuUDFwYiDNpPmnqT58Oxqn4Z56fg+6fI5O282HI0DXsaK
         s6TA==
X-Gm-Message-State: APjAAAXjovSa96dbBKda9k43iGNhH0ifH0/tH6dm16gmYcVhdRSrP6lw
        ULty9zKZeXOuPBAk9T/bKf9dLw==
X-Google-Smtp-Source: APXvYqxnWiDeclOsZiVIDP1hcF7kueSw27gghY0GU9xK2mF7vk5GzQTJof7FeL/1t0shyFSLSwNMbw==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr7959566wmj.32.1574324104216;
        Thu, 21 Nov 2019 00:15:04 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id w13sm2315075wrm.8.2019.11.21.00.15.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 21 Nov 2019 00:15:03 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     airlied@redhat.com, airlied@linux.ie, arnd@arndb.de,
        fenghua.yu@intel.com, gregkh@linuxfoundation.org,
        tony.luck@intel.com
Cc:     linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 1/5] agp: remove unused variable size in agp_generic_create_gatt_table
Date:   Thu, 21 Nov 2019 08:14:41 +0000
Message-Id: <1574324085-4338-2-git-send-email-clabbe@baylibre.com>
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

This patch fix the following warning:
drivers/char/agp/generic.c:853:6: attention : variable ‘size’ set but not used [-Wunused-but-set-variable]
by removing the unused variable size in agp_generic_create_gatt_table

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/char/agp/generic.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/char/agp/generic.c b/drivers/char/agp/generic.c
index df1edb5ec0ad..4d2eb0800b2a 100644
--- a/drivers/char/agp/generic.c
+++ b/drivers/char/agp/generic.c
@@ -850,7 +850,6 @@ int agp_generic_create_gatt_table(struct agp_bridge_data *bridge)
 {
 	char *table;
 	char *table_end;
-	int size;
 	int page_order;
 	int num_entries;
 	int i;
@@ -864,25 +863,22 @@ int agp_generic_create_gatt_table(struct agp_bridge_data *bridge)
 	table = NULL;
 	i = bridge->aperture_size_idx;
 	temp = bridge->current_size;
-	size = page_order = num_entries = 0;
+	page_order = num_entries = 0;
 
 	if (bridge->driver->size_type != FIXED_APER_SIZE) {
 		do {
 			switch (bridge->driver->size_type) {
 			case U8_APER_SIZE:
-				size = A_SIZE_8(temp)->size;
 				page_order =
 				    A_SIZE_8(temp)->page_order;
 				num_entries =
 				    A_SIZE_8(temp)->num_entries;
 				break;
 			case U16_APER_SIZE:
-				size = A_SIZE_16(temp)->size;
 				page_order = A_SIZE_16(temp)->page_order;
 				num_entries = A_SIZE_16(temp)->num_entries;
 				break;
 			case U32_APER_SIZE:
-				size = A_SIZE_32(temp)->size;
 				page_order = A_SIZE_32(temp)->page_order;
 				num_entries = A_SIZE_32(temp)->num_entries;
 				break;
@@ -890,7 +886,7 @@ int agp_generic_create_gatt_table(struct agp_bridge_data *bridge)
 			case FIXED_APER_SIZE:
 			case LVL2_APER_SIZE:
 			default:
-				size = page_order = num_entries = 0;
+				page_order = num_entries = 0;
 				break;
 			}
 
@@ -920,7 +916,6 @@ int agp_generic_create_gatt_table(struct agp_bridge_data *bridge)
 			}
 		} while (!table && (i < bridge->driver->num_aperture_sizes));
 	} else {
-		size = ((struct aper_size_info_fixed *) temp)->size;
 		page_order = ((struct aper_size_info_fixed *) temp)->page_order;
 		num_entries = ((struct aper_size_info_fixed *) temp)->num_entries;
 		table = alloc_gatt_pages(page_order);
-- 
2.23.0

