Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6ACCE918C
	for <lists+linux-ia64@lfdr.de>; Tue, 29 Oct 2019 22:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729719AbfJ2VOY (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 29 Oct 2019 17:14:24 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44089 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729700AbfJ2VOX (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 29 Oct 2019 17:14:23 -0400
Received: by mail-pf1-f195.google.com with SMTP id q26so6897152pfn.11
        for <linux-ia64@vger.kernel.org>; Tue, 29 Oct 2019 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8/x+eaVk+ss1aFRFRC2BuuTBFLP58LLEcIBPNJoL2cs=;
        b=E6/biqz3RgqOQZPzeBNo/5tlnkftQUoW2mf9CE298XsO5001NCPklzzOKT7E9Bm3jX
         WYxXOa5pUZ578xzGENT4FOXN1yp+4ICP9ASH5NBrudMTG4WbEhivqJqu8m13wiyzO8yL
         cP3ipZ2zK8zGQCNcxdhBWtwypbIJDVwNy8VIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8/x+eaVk+ss1aFRFRC2BuuTBFLP58LLEcIBPNJoL2cs=;
        b=FoKJATAw/1Hu9AVI1A8VwYVTG7OrHLBfeFm3NJXd5RsbkNKH0UJwgMCuqv7PhgVip2
         BTmvBZN0Qet92g4Xj6sdq7Qqd8xk3gUR7HvIKHgc+OSFDzF+qpUncinV5wGAxUAS7QJN
         p4W5eMTQMTfX7LyoR0NAznVGEUwqqWETpr6zSDpE8pOw3/tAcaHsFGfgdU/Mre0Wzf3E
         jAt7P5QxGeWP8M+2kWco53ooBPWWoobGJP9aSVES2Zmgbz8B1/AOZCkO2nptzygC4f8r
         p20NYL21TodGK6LuXtht+ZctvhzgVHeVfwKI40oIct7eZfC/bVF/97qrSTytNlSZnmZ6
         +I9Q==
X-Gm-Message-State: APjAAAX59kn+gNkcbOhG8P0sL8UIKXlaadKK3hYt0+nKiOH7WjTjeRRz
        wlXHt+bMIy5OR+poVRBMiFWkAg==
X-Google-Smtp-Source: APXvYqwo2RcUgs96Fy+CgTCDcRMaQZuOmvdYyYfnGkyPMENywMQNuhVEa5HaEFheZlG3BkJsaVvKAw==
X-Received: by 2002:a62:5442:: with SMTP id i63mr29128680pfb.220.1572383662624;
        Tue, 29 Oct 2019 14:14:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d14sm48547pfh.36.2019.10.29.14.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:14:20 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michal Simek <monstr@monstr.eu>
Subject: [PATCH v3 26/29] x86/mm: Remove redundant &s on addresses
Date:   Tue, 29 Oct 2019 14:13:48 -0700
Message-Id: <20191029211351.13243-27-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

The &s on addresses are redundant. Remove them to match all the other
similar functions.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/mm/init_64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 26299e9ce6da..e67ddca8b7a8 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1300,9 +1300,9 @@ void mark_rodata_ro(void)
 {
 	unsigned long start = PFN_ALIGN(_text);
 	unsigned long rodata_start = PFN_ALIGN(__start_rodata);
-	unsigned long end = (unsigned long) &__end_rodata_hpage_align;
-	unsigned long text_end = PFN_ALIGN(&_etext);
-	unsigned long rodata_end = PFN_ALIGN(&__end_rodata);
+	unsigned long end = (unsigned long)__end_rodata_hpage_align;
+	unsigned long text_end = PFN_ALIGN(_etext);
+	unsigned long rodata_end = PFN_ALIGN(__end_rodata);
 	unsigned long all_end;
 
 	printk(KERN_INFO "Write protecting the kernel read-only data: %luk\n",
-- 
2.17.1

