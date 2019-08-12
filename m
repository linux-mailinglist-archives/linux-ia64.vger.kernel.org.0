Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47C938A9D4
	for <lists+linux-ia64@lfdr.de>; Mon, 12 Aug 2019 23:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbfHLVv4 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 12 Aug 2019 17:51:56 -0400
Received: from mail-pl1-f201.google.com ([209.85.214.201]:54426 "EHLO
        mail-pl1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727786AbfHLVv4 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 12 Aug 2019 17:51:56 -0400
Received: by mail-pl1-f201.google.com with SMTP id g9so1819601plo.21
        for <linux-ia64@vger.kernel.org>; Mon, 12 Aug 2019 14:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=v7DM326MSicLDe79qqcY0HKXo2oHl/5N5zZnyQIiza4=;
        b=o4VxFo+EtLXK2riOOPk4QRRjTs2RgXJTMYwZoru577r0BLbARIiNZUgZ1dVtHsUb/a
         TVe1r+i45usYLeR7al5mCa876/aAIdlLKo4tyo5zY6nY7Gxy9BGcPe+5HJFkY1afmf6w
         gzjH/RE3sXYqcfP5GkGNN2v99q5tcUCWgzjqF9EMOQNauKeK4JQfFt35ANcCtnTttTS9
         LM+2F7THTVlJTjxayr8/pOfPcWhg4vwFHqzRSkcOFV4zl8G1Q/VwB+vUnryDWrDXS1qE
         WjpH200i04VXzIaeuJV3zfjCq6aEltlO0BArJHGJRSr8/Gyus7z2O0GaJJV4vBlLX5FY
         c4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=v7DM326MSicLDe79qqcY0HKXo2oHl/5N5zZnyQIiza4=;
        b=Gx0CE9aG71DPeksEL7c+juebOkOqJFJt6TD3xQiFGD+5RnGqtnvXaZQCq2Pk9NhvLv
         2eCXwkQDn0tw/uYpefhlBfWCGj3TaolmAQ+hXF+RyXBYa0eAIhGKZMenZu8oi1sFJ/Wl
         khNGEyRiUFlSOGKJ1FGj2iUhOQ/CJWSQO9BnmQRNzwuURFjTWN8ZZkiI2OhYCU2cn6S1
         IT8hdWBevN7RJZOt/NtGC3Vds+/+yqtOPR1rlTsOJ+4qTqtTvNc+iy5BVKeh1kUZLuPE
         rPubK/ZwHFtEwmJy0SVduqegj9RolB+PJkdb+r7OxQ3lkBbHKdHJI14UsPoqs8nKHzKu
         4iRg==
X-Gm-Message-State: APjAAAVDlqcaubt0QEA3nc41VBo3zNT6K/rfigewYdQKy61BP5WS2HDE
        gtblub7MX5ndE502FF/r092M6fgyOAgXVzeJipY=
X-Google-Smtp-Source: APXvYqzU0bZ1QFNEENBo3eyvWw59cdPtdPpcNVCeqR1ob/cdYfG3LfUXxAlnCbGSZ/i8EYqWhQlooaXgQnIT63U4+4s=
X-Received: by 2002:a63:7a01:: with SMTP id v1mr32581110pgc.310.1565646715119;
 Mon, 12 Aug 2019 14:51:55 -0700 (PDT)
Date:   Mon, 12 Aug 2019 14:50:39 -0700
In-Reply-To: <20190812215052.71840-1-ndesaulniers@google.com>
Message-Id: <20190812215052.71840-6-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20190812215052.71840-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH 06/16] ia64: prefer __section from compiler_attributes.h
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     akpm@linux-foundation.org
Cc:     sedat.dilek@gmail.com, jpoimboe@redhat.com, yhs@fb.com,
        miguel.ojeda.sandonis@gmail.com,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/ia64/include/asm/cache.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/ia64/include/asm/cache.h b/arch/ia64/include/asm/cache.h
index 4eb6f742d14f..7decf91ca11a 100644
--- a/arch/ia64/include/asm/cache.h
+++ b/arch/ia64/include/asm/cache.h
@@ -25,6 +25,6 @@
 # define SMP_CACHE_BYTES	(1 << 3)
 #endif
 
-#define __read_mostly __attribute__((__section__(".data..read_mostly")))
+#define __read_mostly __section(.data..read_mostly)
 
 #endif /* _ASM_IA64_CACHE_H */
-- 
2.23.0.rc1.153.gdeed80330f-goog

