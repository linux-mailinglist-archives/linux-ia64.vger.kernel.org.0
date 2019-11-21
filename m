Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3D6104DA5
	for <lists+linux-ia64@lfdr.de>; Thu, 21 Nov 2019 09:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfKUIPT (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 21 Nov 2019 03:15:19 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46088 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbfKUIPJ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 21 Nov 2019 03:15:09 -0500
Received: by mail-wr1-f65.google.com with SMTP id b3so3140250wrs.13
        for <linux-ia64@vger.kernel.org>; Thu, 21 Nov 2019 00:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SjGczowwUMA62+bb6wzr8HVfKvM+janVmRBwtTyBzkg=;
        b=0JHSTeGixrtpymRz8vpApRjjftH/WTxInOqaFVXrYLaCDg8oUMoEZ+VQq1oOnSqAZg
         bNDuDr7wuZ6G04TtFcOgQ5V3iSyALN/Xqbo0twXOPhkFdzVCRbT6wzse9k8wsBPao526
         0Y1wfvsuLvuM3jDeV36Pgp57y3Gh9jsNS1SaGO1PBw9vZk7aH+UFQghm7ZplJWcbKh8u
         jR7/3upipkhcYJZyatlFXuYsewRvjSWv5eYR2v+iLkO/TNfcXupss+bJIYXk+HgrU6FE
         eLGpjkVTNamb3qcEBrS7tpVJiKc2UuzGoRSB4Vik/eac5eKH9n0MupIQWrt+U8wSztzz
         Iv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SjGczowwUMA62+bb6wzr8HVfKvM+janVmRBwtTyBzkg=;
        b=jEutqBN0hpdF2EzIrafi3go2erN+ZdRSv1fIrnTh7ud+qxYLApk4Ckn0CoJw92UYp3
         tcjCe5Z8Dkjj1FRE8p4roOpGOfdVC+lE9PMvTNLGPNxP7+UX+tVn9oIt0+thpU8yQM6+
         MU9llZGA+CcXXvB05eu5Hth1j8aJkVTSLHNyyqdqkl+fSw+yZSVGyhsfWKlOjTOdppAn
         BwgnrZ9IVI1vBoC8Rg8wrA0VzLihNmT1uwJjPPEUVORQhIPCEfxv/buVWJkgTJUWfeSg
         YxUdSlosdHfLceZr/mp0+afVV26wGiSXfybhyfEtVe3mXZKWUB5nXh7u6UHgh+VGP95e
         jTjA==
X-Gm-Message-State: APjAAAUVEK/5KGSK36gzXVG+Zfn2Cd4TA7h43J2m1pkVdykuyTN1fc/P
        f2vfFLXRQaTr2j3bUato9yF64g==
X-Google-Smtp-Source: APXvYqwkXWgvZOLyl9BukK+UwG4oof1LQP5o3l6sN1AKIHPGLzOhTU2+/8GXvBsiG0MIELBaj2LgHw==
X-Received: by 2002:a5d:638a:: with SMTP id p10mr8454274wru.336.1574324106925;
        Thu, 21 Nov 2019 00:15:06 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id w13sm2315075wrm.8.2019.11.21.00.15.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 21 Nov 2019 00:15:06 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     airlied@redhat.com, airlied@linux.ie, arnd@arndb.de,
        fenghua.yu@intel.com, gregkh@linuxfoundation.org,
        tony.luck@intel.com
Cc:     linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 4/5] agp: Add bridge parameter documentation
Date:   Thu, 21 Nov 2019 08:14:44 +0000
Message-Id: <1574324085-4338-5-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
References: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

This patch add documentation about the bridge parameter in several
function.

This will fix the following build warning:
drivers/char/agp/generic.c:220: warning: No description found for parameter 'bridge'
drivers/char/agp/generic.c:364: warning: No description found for parameter 'bridge'
drivers/char/agp/generic.c:1283: warning: No description found for parameter 'bridge'

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/char/agp/generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/char/agp/generic.c b/drivers/char/agp/generic.c
index 4d2eb0800b2a..ab154a75acf0 100644
--- a/drivers/char/agp/generic.c
+++ b/drivers/char/agp/generic.c
@@ -207,6 +207,7 @@ EXPORT_SYMBOL(agp_free_memory);
 /**
  *	agp_allocate_memory  -  allocate a group of pages of a certain type.
  *
+ *	@bridge: an agp_bridge_data struct allocated for the AGP host bridge.
  *	@page_count:	size_t argument of the number of pages
  *	@type:	u32 argument of the type of memory to be allocated.
  *
@@ -355,6 +356,7 @@ EXPORT_SYMBOL_GPL(agp_num_entries);
 /**
  *	agp_copy_info  -  copy bridge state information
  *
+ *	@bridge: an agp_bridge_data struct allocated for the AGP host bridge.
  *	@info:		agp_kern_info pointer.  The caller should insure that this pointer is valid.
  *
  *	This function copies information about the agp bridge device and the state of
@@ -1277,6 +1279,7 @@ EXPORT_SYMBOL(agp_generic_destroy_page);
 /**
  * agp_enable  -  initialise the agp point-to-point connection.
  *
+ * @bridge: an agp_bridge_data struct allocated for the AGP host bridge.
  * @mode:	agp mode register value to configure with.
  */
 void agp_enable(struct agp_bridge_data *bridge, u32 mode)
-- 
2.23.0

