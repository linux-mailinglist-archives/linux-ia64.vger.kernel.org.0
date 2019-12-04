Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80D0211344B
	for <lists+linux-ia64@lfdr.de>; Wed,  4 Dec 2019 19:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729024AbfLDSXd (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 4 Dec 2019 13:23:33 -0500
Received: from mga09.intel.com ([134.134.136.24]:53437 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728716AbfLDSX2 (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Wed, 4 Dec 2019 13:23:28 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Dec 2019 10:23:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; 
   d="scan'208";a="236378875"
Received: from agluck-desk2.sc.intel.com (HELO agluck-desk2.amr.corp.intel.com) ([10.3.52.68])
  by fmsmga004.fm.intel.com with ESMTP; 04 Dec 2019 10:23:27 -0800
Date:   Wed, 4 Dec 2019 10:23:27 -0800
From:   "Luck, Tony" <tony.luck@intel.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-ia64@vger.kernel.org
Subject: [GIT PULL] ia64 changes for v5.5
Message-ID: <20191204182327.GA17103@agluck-desk2.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org


The following changes since commit 219d54332a09e8d8741c1e1982f5eae56099de85:

  Linux 5.4 (2019-11-24 16:32:01 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git tags/please-pull-misc-5.5

for you to fetch changes up to 240b62d381fe5b66c496a6fd55edff3976a9be51:

  ia64: remove stale paravirt leftovers (2019-12-02 14:18:12 -0800)

----------------------------------------------------------------
Cleanup some leftover para-virtualization pieces

----------------------------------------------------------------
Juergen Gross (1):
      ia64: remove stale paravirt leftovers

 arch/ia64/include/asm/irqflags.h          |  4 ---
 arch/ia64/include/uapi/asm/gcc_intrin.h   | 24 +++++++--------
 arch/ia64/include/uapi/asm/intel_intrin.h | 32 +++++++++----------
 arch/ia64/include/uapi/asm/intrinsics.h   | 51 ++++---------------------------
 4 files changed, 34 insertions(+), 77 deletions(-)
