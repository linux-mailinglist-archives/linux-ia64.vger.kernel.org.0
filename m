Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070271E4D69
	for <lists+linux-ia64@lfdr.de>; Wed, 27 May 2020 20:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgE0Svo (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 27 May 2020 14:51:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:39120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbgE0Svo (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Wed, 27 May 2020 14:51:44 -0400
Received: from localhost.localdomain (unknown [194.230.155.118])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5B0D2075A;
        Wed, 27 May 2020 18:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590605504;
        bh=KoTA2o9FaMQOH2KZot8SHO+30GT1daY4qqGv1KORumc=;
        h=From:To:Cc:Subject:Date:From;
        b=Tqp2NtRYvLqdRSKYEBq9XGdd3xvINeKaWsVm3CKE5pEp10eazAYXhcgdL4ngGm72/
         EC0a5T0tt9AlUowKx8CkSCdEaQpz7CkHLWcDFZGs8wBIcQoSVFODFFg/KDc9tULXhJ
         WoOYzAIvKYxrOwbYz72kEzwHXEuqCN96+5P89mAs=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH] ia64: configs: Remove useless UEVENT_HELPER_PATH
Date:   Wed, 27 May 2020 20:51:37 +0200
Message-Id: <20200527185137.13335-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Remove the CONFIG_UEVENT_HELPER_PATH because:
1. It is disabled since commit 1be01d4a5714 ("driver: base: Disable
   CONFIG_UEVENT_HELPER by default") as its dependency (UEVENT_HELPER) was
   made default to 'n',
2. It is not recommended (help message: "This should not be used today
   [...] creates a high system load") and was kept only for ancient
   userland,
3. Certain userland specifically requests it to be disabled (systemd
   README: "Legacy hotplug slows down the system and confuses udev").

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/ia64/configs/generic_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/ia64/configs/generic_defconfig b/arch/ia64/configs/generic_defconfig
index cb267a07c57f..f1c5aad6725e 100644
--- a/arch/ia64/configs/generic_defconfig
+++ b/arch/ia64/configs/generic_defconfig
@@ -37,7 +37,6 @@ CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_IPV6 is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_CONNECTOR=y
 # CONFIG_PNP_DEBUG_MESSAGES is not set
 CONFIG_BLK_DEV_LOOP=m
-- 
2.17.1

