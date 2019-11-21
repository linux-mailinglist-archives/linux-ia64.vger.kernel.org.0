Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDF84104DA8
	for <lists+linux-ia64@lfdr.de>; Thu, 21 Nov 2019 09:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfKUIPV (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 21 Nov 2019 03:15:21 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44610 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKUIPH (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 21 Nov 2019 03:15:07 -0500
Received: by mail-wr1-f68.google.com with SMTP id i12so3148569wrn.11
        for <linux-ia64@vger.kernel.org>; Thu, 21 Nov 2019 00:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8LjJcUv5JRc8/4Vw05C03H9zEwwInU8us44q9tvp9r0=;
        b=lDQLQkLFnXHou+oCKFJriVm046psHa6PF4fvQ88rVy8xkKbVud6HDaf5BbBKWorYaG
         9JqhW4wsHV9WyzfjpMwcieA03kIJrYrmsTs2TKpgRF/0ze1l+yFLtdaMn6lM/x0/ZMcZ
         gN8VuphDjfs3yZHIQwGImS367kLOMoEvagMJ3vCF1mTPU29ATxQQQFaVSpUjQyfM49/w
         JWLGU+VUMdyGfRPnSWuMRWG/JiXnCIV5MpgvVOC5m7yzqS1zN7+PxiWfcCju2TKbwpT/
         d/F0AewpDtoCFSsHP1OuXvyMybR3YNTJVEpu/eUr3JCiknF3mZmcCWfs0gzNucjdCHqz
         DVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8LjJcUv5JRc8/4Vw05C03H9zEwwInU8us44q9tvp9r0=;
        b=mYz0gL9lSJxLkgnZQautWxRCCWb/Nd+OEQWpUg+zvaiVzm6yfp0F4dnA+dS48bfJ2q
         z4GTB36CqMX0cegyqcEsnLav4XOG0ONWWfpbYYJB0ithvxp/3FkEpGNYESbxgOKC3Cmc
         zCLUfPePnINfzuKlrEow1xAtGbOs7oG8Yofpu3vsfiB+jhhRt0FvdWoE5Cry+U6Ew2BO
         Oa1CthaMmZCD9Vj7Vc/MiDWDl5D04dEHnQHLHE5Y83jaIgrV1xhkRwuiLhIFJ/K2on1g
         CTH7DMY+enIrk/IuuOpUV2nLpLTVxSOOOJGGDKciJu67ukNwQf86NolVIopKNtVfjNpe
         IDTQ==
X-Gm-Message-State: APjAAAUNhYWLN+vhDGAiN+q2IwOMDDHgas9N0CiDrbSxp3EEfE7+QYdu
        a+00GyCe33Ct2SmqKah4pgNaog==
X-Google-Smtp-Source: APXvYqxuvxQ3VmGAQNQNFsb26ptbHyJKZeZzcG5Kiwzno83aX29giQBgYYZkraYJUUx7vIR0vINsIA==
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr489050wrw.373.1574324105155;
        Thu, 21 Nov 2019 00:15:05 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id w13sm2315075wrm.8.2019.11.21.00.15.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 21 Nov 2019 00:15:04 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     airlied@redhat.com, airlied@linux.ie, arnd@arndb.de,
        fenghua.yu@intel.com, gregkh@linuxfoundation.org,
        tony.luck@intel.com
Cc:     linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 2/5] agp: move AGPGART_MINOR to include/linux/miscdevice.h
Date:   Thu, 21 Nov 2019 08:14:42 +0000
Message-Id: <1574324085-4338-3-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
References: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

This patch move the define for AGPGART_MINOR to include/linux/miscdevice.h.
It is better that all minor number definitions are in the same place.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 include/linux/agpgart.h    | 2 --
 include/linux/miscdevice.h | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/agpgart.h b/include/linux/agpgart.h
index c6b61ca97053..21b34a96cfd8 100644
--- a/include/linux/agpgart.h
+++ b/include/linux/agpgart.h
@@ -30,8 +30,6 @@
 #include <linux/agp_backend.h>
 #include <uapi/linux/agpgart.h>
 
-#define AGPGART_MINOR 175
-
 struct agp_info {
 	struct agp_version version;	/* version of the driver        */
 	u32 bridge_id;		/* bridge vendor/device         */
diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
index b06b75776a32..becde6981a95 100644
--- a/include/linux/miscdevice.h
+++ b/include/linux/miscdevice.h
@@ -33,6 +33,7 @@
 #define SGI_MMTIMER		153
 #define STORE_QUEUE_MINOR	155	/* unused */
 #define I2O_MINOR		166
+#define AGPGART_MINOR		175
 #define HWRNG_MINOR		183
 #define MICROCODE_MINOR		184
 #define IRNET_MINOR		187
-- 
2.23.0

