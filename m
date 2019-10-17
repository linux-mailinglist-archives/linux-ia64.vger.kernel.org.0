Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98D63DB5F9
	for <lists+linux-ia64@lfdr.de>; Thu, 17 Oct 2019 20:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503239AbfJQSWp (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 17 Oct 2019 14:22:45 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34685 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503290AbfJQSWc (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 17 Oct 2019 14:22:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id k20so1835738pgi.1
        for <linux-ia64@vger.kernel.org>; Thu, 17 Oct 2019 11:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:cc:from:to;
        bh=2KT/1Ua4Ne08bIcLoxtdMsARQdKvdiD630BlGhWeLtw=;
        b=cjgbnoEjHe0yrq4Kr1qMNt/y4w+aPaCJgX7ZS7cJ7DzZouuRl3bvyeJ1sknFY6zRCy
         H8XakWGvtIAO2qnm2f5boP+ZqEh3gtJRUT6OAFyEdlBuS/CVVljKQv/n5i7F+vImUchP
         5J8WAStaor2EgK2M3TgN+EgxDX8/9eaxOJygyFZoBpY4Iqx01n77UZHh8M3miQbJcZHn
         oBQI+4KX4/Z/k6J8wSwYB3J0KLkJcT01BFuaJe+JfJtlDGylEOaTwklIILWlImDc3ofK
         1FEYNdt7A3F9YVbUG/fpL5M+U4x8LDQpYLsTi6bH4e7VtHqCs/l6MZb+LdWO4Q+SsLG0
         u/mA==
X-Gm-Message-State: APjAAAVf+2N9ZqLIiAY6hDZB73GyyMgErWIyNQgrnm2KyA5j4ZJphTu1
        iUT583GPXFh85gVz6Et+exv85w==
X-Google-Smtp-Source: APXvYqzRFMnoGzdJ2pTmCdShwyvvireoh2sq3hfvaMP0TW/8NOqgFYu+GU8GpPpVrwDdC5UWEBAmzA==
X-Received: by 2002:a63:5423:: with SMTP id i35mr5812604pgb.128.1571336551338;
        Thu, 17 Oct 2019 11:22:31 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id u5sm4007226pfl.25.2019.10.17.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 11:22:30 -0700 (PDT)
Subject: [PATCH 1/3] ia64: Use the generic msi.h
Date:   Thu, 17 Oct 2019 11:19:35 -0700
Message-Id: <20191017181937.7004-2-palmer@sifive.com>
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

This builds with an ia64 defconfig, but I have no access to ia64 and
therefor can't even boot test it.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/ia64/include/asm/Kbuild | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/ia64/include/asm/Kbuild b/arch/ia64/include/asm/Kbuild
index 390393667d3b..22d6dbefa7d7 100644
--- a/arch/ia64/include/asm/Kbuild
+++ b/arch/ia64/include/asm/Kbuild
@@ -6,6 +6,7 @@ generic-y += irq_work.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += mm-arch-hooks.h
+generic-y += msi.h
 generic-y += preempt.h
 generic-y += trace_clock.h
 generic-y += vtime.h
-- 
2.21.0

