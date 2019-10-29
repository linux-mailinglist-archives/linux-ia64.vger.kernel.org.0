Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20393E915F
	for <lists+linux-ia64@lfdr.de>; Tue, 29 Oct 2019 22:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729484AbfJ2VOL (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 29 Oct 2019 17:14:11 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46567 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729471AbfJ2VOK (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 29 Oct 2019 17:14:10 -0400
Received: by mail-pl1-f193.google.com with SMTP id q21so8282992plr.13
        for <linux-ia64@vger.kernel.org>; Tue, 29 Oct 2019 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/BlCq1vuoPK6b90i9+3dEN0gsbsUxI5XzRVDtU+Y9n4=;
        b=M3a1uKeinpfYILyOgto01x3Z0/Do7xHci3ACE83vFIz62Z9cDjf3QuJSqLQlVdoz5I
         0rW3KKzQ7S0KkakxOpNlTmyhieiHv+YebhpWX4iC97xSOcSmbsnsoy8a6PUwi+eJhllx
         qwaZZ60pVF22RF1UdIfw2PTFkL9ZBlI7t+Doc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/BlCq1vuoPK6b90i9+3dEN0gsbsUxI5XzRVDtU+Y9n4=;
        b=I2NSEkkT/KCJUUMJSNFplK/j73k7qRHNGVFK6egrsVcKFay3z9rYUAic+hOPf4+8ON
         TsyDq59cver6GfGJL+yarE46bxe/8cLsY3kC1nlYa0pjjPejpV8tJ88z9qlAF+VYcKoy
         XMT8Arsv/39iYwqLvUeJp1lQ7QZLBlHtQ4xKgzt/eMRsAvaJg58f4goNWyJ38qxdsw6h
         VxjbFCdrMNf7phgjg9FGJ8+Ad9zHuJkQ7PjpSjPSgGOAOA9UWpIBcrYhgvS6k1oDJHzG
         iKomhfK6QC6VJE8Jmmk8NZ1WyZnPE6SyhJN3MzL/AGxJMGleRKQ9HKP3JWJ6kQcUbRQS
         QFRw==
X-Gm-Message-State: APjAAAWypv+00rHQ++88FiA+TfbZXraWXtmrcZhSbAUhuopUmhbSm3AA
        38l3kkh7gwSxUo/pSJzp6b5hTA==
X-Google-Smtp-Source: APXvYqwBlr/dG9EoHmIzcD/284bTMRVUng+VSZNVn2USM8IUIAoIBLGaDuOHmKUNb6KZndWlR52IoQ==
X-Received: by 2002:a17:902:ab82:: with SMTP id f2mr774907plr.39.1572383649691;
        Tue, 29 Oct 2019 14:14:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z25sm41774pfa.88.2019.10.29.14.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:14:04 -0700 (PDT)
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
Subject: [PATCH v3 07/29] x86: Restore "text" Program Header with dummy section
Date:   Tue, 29 Oct 2019 14:13:29 -0700
Message-Id: <20191029211351.13243-8-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

In a linker script, if once places a section in one or more segments using
":PHDR", then the linker will place all subsequent allocatable sections,
which do not specify ":PHDR", into the same segments. In order to have
the NOTES section in both PT_LOAD (":text") and PT_NOTE (":note"), both
segments are marked, and the only way to to undo this to keep subsequent
sections out of PT_NOTE is to mark the following section with just the
single desired PT_LOAD (":text").

In preparation for having a common NOTES macro, perform the segment
assignment use a dummy section (as done by other architectures).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/vmlinux.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index e2feacf921a0..788e78978030 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -147,8 +147,9 @@ SECTIONS
 	} :text = 0x9090
 
 	NOTES :text :note
+	.dummy : { *(.dummy) } :text
 
-	EXCEPTION_TABLE(16) :text = 0x9090
+	EXCEPTION_TABLE(16)
 
 	/* .text should occupy whole number of pages */
 	. = ALIGN(PAGE_SIZE);
-- 
2.17.1

