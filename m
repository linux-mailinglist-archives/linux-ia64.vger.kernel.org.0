Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 404501FCF9
	for <lists+linux-ia64@lfdr.de>; Thu, 16 May 2019 03:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbfEPBqc (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 15 May 2019 21:46:32 -0400
Received: from mga14.intel.com ([192.55.52.115]:62621 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726891AbfEPBEP (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Wed, 15 May 2019 21:04:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 May 2019 18:04:14 -0700
X-ExtLoop1: 1
Received: from agluck-desk.sc.intel.com ([10.3.52.160])
  by orsmga005.jf.intel.com with ESMTP; 15 May 2019 18:04:13 -0700
From:   Tony Luck <tony.luck@intel.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        Will Deacon <will.deacon@arm.com>
Subject: [PATCH: Linus please apply] ia64: Make sure that we have a mmiowb function real early
Date:   Wed, 15 May 2019 18:04:14 -0700
Message-Id: <20190516010414.30623-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Generic kernels feed many operation through the "machvec"
logic to get the correct form of the operation for the
current system. "mmiowb()" is one of those operations.

Although machvec is initialized very early in boot, it isn't
early enough for a recent upstream kernel change that added
mmiowb to the spin_unlock() path.

Statically initialize the mmiowb field of machvec so that we
won't die with a call through a NULL pointer. This should be
safe because we do the real initialization of machvec before
bringing up any addtional CPUs or doing any I/O.

Fixes: 49ca6462fc9e ("ia64/mmiowb: Add unconditional mmiowb() to arch_spin_unlock()")
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/ia64/kernel/machvec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/ia64/kernel/machvec.c b/arch/ia64/kernel/machvec.c
index 1b604d02250b..ebd82535f51b 100644
--- a/arch/ia64/kernel/machvec.c
+++ b/arch/ia64/kernel/machvec.c
@@ -10,7 +10,9 @@
 
 #include <asm/page.h>
 
-struct ia64_machine_vector ia64_mv;
+struct ia64_machine_vector ia64_mv = {
+	.mmiowb	= ___ia64_mmiowb
+};
 EXPORT_SYMBOL(ia64_mv);
 
 static struct ia64_machine_vector * __init
-- 
2.20.1

