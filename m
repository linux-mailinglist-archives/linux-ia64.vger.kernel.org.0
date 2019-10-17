Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F316CDB5F1
	for <lists+linux-ia64@lfdr.de>; Thu, 17 Oct 2019 20:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503305AbfJQSWf (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 17 Oct 2019 14:22:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37721 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503307AbfJQSWe (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 17 Oct 2019 14:22:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id y5so2167776pfo.4
        for <linux-ia64@vger.kernel.org>; Thu, 17 Oct 2019 11:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:cc:from:to;
        bh=DgBlxGGOySK3PLbEB8KobplGmb/95tE64KOi4eUuQBM=;
        b=pM0JbF5lq9b9nsByCmq+6gb+s/lCCLSDawuK29cipx7iR9oDw7G/UcwIL7UYdcLhfZ
         wWbWlsVqUfnyaH3TgTTWSUj1+gdrG+R9P3daEbH4gTheh2J8qSpC7FgAz6Y23p1/Y2ZF
         eqsFHUKotsvLPcC3DL4VIXy0/Xop3/0oaeeHs99BaXx0dphz/apjKqWSw3ZZczAWivff
         x58ZBCFl22BpHqvbE9kwL4D3PTWVbCrSGc9kce3EvaD6KbGSee2GEV/uSp11w80Ok0F/
         wYCvAkhx3CyiyjKMxAR1MhDq4zrT7wlkVpGsxTSfFE8ljy/gOc2kZSGjA+/Gkq1A7XOh
         yqag==
X-Gm-Message-State: APjAAAXWesRtSEw1ZOUvv8rSmS3yZi5gCZ68xP/BOHMeZwWo//1ztHZw
        pZMaI5itFF4VVcmr31WBJVyO4g==
X-Google-Smtp-Source: APXvYqybdVbJNTvuzOcVhsPQif36O+YC/nFlezJzYkDdm19blzh9K6d8ez4kplshP0Xrf/0pwtO9Ew==
X-Received: by 2002:a62:cf42:: with SMTP id b63mr1721635pfg.33.1571336553006;
        Thu, 17 Oct 2019 11:22:33 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id s5sm2751586pjn.24.2019.10.17.11.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 11:22:32 -0700 (PDT)
Subject: [PATCH 2/3] s390: Use the generic msi.h
Date:   Thu, 17 Oct 2019 11:19:36 -0700
Message-Id: <20191017181937.7004-3-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191017181937.7004-1-palmer@sifive.com>
References: <20191017181937.7004-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     tony.luck@intel.com, fenghua.yu@intel.com,
        heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, bhelgaas@google.com, will@kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Palmer Dabbelt <palmer@sifive.com>,
        kstewart@linuxfoundation.org, pbonzini@redhat.com,
        firoz.khan@linaro.org, yamada.masahiro@socionext.com,
        longman@redhat.com, mingo@kernel.org, peterz@infradead.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-pci@vger.kernel.org
From:   Palmer Dabbelt <palmer@sifive.com>
To:     Christoph Hellwig <hch@infradead.org>, michal.simek@xilinx.com,
        helgaas@kernel.org
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Without this I can't enable PCI_MSI_IRQ_DOMAIN, which as far as I can
tell only depends on generic functionality provided by msi.h.
PCI_MSI_IRQ_DOMAIN has historically had a whitelist of supported
architectures, but that list is getting long enough that it's cleaner to
just enable it everywhere.

This builds with an s390 defconfig, but I have no access to s390 and
therefor can't even boot test it.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/s390/include/asm/Kbuild | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/s390/include/asm/Kbuild b/arch/s390/include/asm/Kbuild
index 2531f673f099..afd35e55b358 100644
--- a/arch/s390/include/asm/Kbuild
+++ b/arch/s390/include/asm/Kbuild
@@ -21,6 +21,7 @@ generic-y += local64.h
 generic-y += mcs_spinlock.h
 generic-y += mm-arch-hooks.h
 generic-y += mmiowb.h
+generic-y += msi.h
 generic-y += trace_clock.h
 generic-y += unaligned.h
 generic-y += word-at-a-time.h
-- 
2.21.0

