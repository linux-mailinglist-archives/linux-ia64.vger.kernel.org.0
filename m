Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA024209F45
	for <lists+linux-ia64@lfdr.de>; Thu, 25 Jun 2020 15:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404922AbgFYNJU (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 25 Jun 2020 09:09:20 -0400
Received: from 8bytes.org ([81.169.241.247]:49462 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404898AbgFYNIt (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Thu, 25 Jun 2020 09:08:49 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 2BC4960C; Thu, 25 Jun 2020 15:08:40 +0200 (CEST)
From:   Joerg Roedel <joro@8bytes.org>
To:     iommu@lists.linux-foundation.org
Cc:     Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, x86@kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joerg Roedel <joro@8bytes.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        intel-gfx@lists.freedesktop.org, Joerg Roedel <jroedel@suse.de>
Subject: [PATCH 12/13] arm64: Remove dev->archdata.iommu pointer
Date:   Thu, 25 Jun 2020 15:08:35 +0200
Message-Id: <20200625130836.1916-13-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625130836.1916-1-joro@8bytes.org>
References: <20200625130836.1916-1-joro@8bytes.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

There are no users left, all drivers have been converted to use the
per-device private pointer offered by IOMMU core.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/arm64/include/asm/device.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/include/asm/device.h b/arch/arm64/include/asm/device.h
index 12b778d55342..996498751318 100644
--- a/arch/arm64/include/asm/device.h
+++ b/arch/arm64/include/asm/device.h
@@ -6,9 +6,6 @@
 #define __ASM_DEVICE_H
 
 struct dev_archdata {
-#ifdef CONFIG_IOMMU_API
-	void *iommu;			/* private IOMMU data */
-#endif
 };
 
 struct pdev_archdata {
-- 
2.27.0

