Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFE53C3652
	for <lists+linux-ia64@lfdr.de>; Sat, 10 Jul 2021 21:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhGJT1X (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 10 Jul 2021 15:27:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57310 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229714AbhGJT1X (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Sat, 10 Jul 2021 15:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625945077;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nRNmgWFE2tnoZRp6zNRhltOEmrGrbsSTJkaXswq9W80=;
        b=ICoimJkEBfgTcfnklY/giIIHQM0+aRRASQy/gpI3NrT3TdNvyjjlBy/QowvBDZnYqtTeLI
        l01ILxMK9sQ9GHsKcc0AeASc8KZ2UCZVXYCmWMxvAzF0dOmIfyAUZUbSpx1fVI5n5cjTF1
        iD6zp1ywTG3i/XR4g+Ziuz43jHOcrbU=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-wY-SppxnOzaqWu6c-K-a6Q-1; Sat, 10 Jul 2021 15:24:36 -0400
X-MC-Unique: wY-SppxnOzaqWu6c-K-a6Q-1
Received: by mail-oo1-f69.google.com with SMTP id e25-20020a4ab9990000b029024aa2670b1cso6864586oop.21
        for <linux-ia64@vger.kernel.org>; Sat, 10 Jul 2021 12:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nRNmgWFE2tnoZRp6zNRhltOEmrGrbsSTJkaXswq9W80=;
        b=cupoJAClKrRz2TRABrXRQBhF53fqt74jygZTlcliMD1v2HuBea6h4UMEefxUvBlZ8P
         480xAK70Wf6TyKORL8sbZDm5/PTkML8IE1Hwoac5WYOre9qE7jRuw7yzO5k55Sn57e5L
         e/wILsXHXzU0zPVzky4dOsC2CmxiLL6I9foRveKJ1YPiN4632FFX8wokQt23tP6HBok3
         fhzAcFZfr7kaKhmFvuogGbzz7daa/ydbMHeepVFIM3mZDXGf8MnpXLu3G/nsUduJdBx5
         hl3qgnqKLiXzCp3cP8EtfV7/dTdymIPesVtfXbA5XBg+GtIvgI6YMrGGl28z93QAA0Sm
         +B8A==
X-Gm-Message-State: AOAM533+0CS6RXOmSNxvF0fP2fvx+GKLewHH3o/j1B5uCIdx2ASaygBP
        EPAW4JMW78TQgz7Ao1cRN+NlTLcS0jCPofAmYuL4Xt7UJjymXzTxS3XeiSrgajkooMbamuXfHdQ
        bm1aC+f/t7GNFe8xsLlTjFw==
X-Received: by 2002:a05:6808:208a:: with SMTP id s10mr4471718oiw.97.1625945075775;
        Sat, 10 Jul 2021 12:24:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6kAn54z8yV+qVOMdVTMNE4oEPeAO1ygF2PHbv1jV7pZwgBekWPRTCzyHlv3bqX1K/Cjmoaw==
X-Received: by 2002:a05:6808:208a:: with SMTP id s10mr4471700oiw.97.1625945075571;
        Sat, 10 Jul 2021 12:24:35 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id t21sm1943667otl.29.2021.07.10.12.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 12:24:35 -0700 (PDT)
Date:   Sat, 10 Jul 2021 12:24:33 -0700
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Ingo Molnar <mingo@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, X86 ML <x86@kernel.org>,
        Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org,
        bpf@vger.kernel.org, kuba@kernel.org, mingo@redhat.com,
        ast@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>, kernel-team@fb.com,
        yhs@fb.com, linux-ia64@vger.kernel.org,
        Abhishek Sagar <sagar.abhishek@gmail.com>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>
Subject: [PATCH 1/2] objtool: Add frame-pointer-specific function ignore
Message-ID: <20210710192433.x5cgjsq2ksvaqnss@treble>
References: <162399992186.506599.8457763707951687195.stgit@devnote2>
 <162399996966.506599.810050095040575221.stgit@devnote2>
 <YOK8pzp8B2V+1EaU@gmail.com>
 <20210710003140.8e561ad33d42f9ac78de6a15@kernel.org>
 <20210710104104.3a270168811ac38420093276@kernel.org>
 <20210710190143.lrcsyal2ggubv43v@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210710190143.lrcsyal2ggubv43v@treble>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Add a CONFIG_FRAME_POINTER-specific version of
STACK_FRAME_NON_STANDARD() for the case where a function is
intentionally missing frame pointer setup, but otherwise needs
objtool/ORC coverage when frame pointers are disabled.

Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 include/linux/objtool.h       | 11 +++++++++++
 tools/include/linux/objtool.h | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/objtool.h b/include/linux/objtool.h
index 7e72d975cb76..c9575ed91052 100644
--- a/include/linux/objtool.h
+++ b/include/linux/objtool.h
@@ -66,6 +66,17 @@ struct unwind_hint {
 	static void __used __section(".discard.func_stack_frame_non_standard") \
 		*__func_stack_frame_non_standard_##func = func
 
+/*
+ * STACK_FRAME_NON_STANDARD_FP() is a frame-pointer-specific function ignore
+ * for the case where a function is intentionally missing frame pointer setup,
+ * but otherwise needs objtool/ORC coverage when frame pointers are disabled.
+ */
+#ifdef CONFIG_FRAME_POINTER
+#define STACK_FRAME_NON_STANDARD_FP(func) STACK_FRAME_NON_STANDARD(func)
+#else
+#define STACK_FRAME_NON_STANDARD_FP(func)
+#endif
+
 #else /* __ASSEMBLY__ */
 
 /*
diff --git a/tools/include/linux/objtool.h b/tools/include/linux/objtool.h
index 7e72d975cb76..c9575ed91052 100644
--- a/tools/include/linux/objtool.h
+++ b/tools/include/linux/objtool.h
@@ -66,6 +66,17 @@ struct unwind_hint {
 	static void __used __section(".discard.func_stack_frame_non_standard") \
 		*__func_stack_frame_non_standard_##func = func
 
+/*
+ * STACK_FRAME_NON_STANDARD_FP() is a frame-pointer-specific function ignore
+ * for the case where a function is intentionally missing frame pointer setup,
+ * but otherwise needs objtool/ORC coverage when frame pointers are disabled.
+ */
+#ifdef CONFIG_FRAME_POINTER
+#define STACK_FRAME_NON_STANDARD_FP(func) STACK_FRAME_NON_STANDARD(func)
+#else
+#define STACK_FRAME_NON_STANDARD_FP(func)
+#endif
+
 #else /* __ASSEMBLY__ */
 
 /*
-- 
2.31.1

