Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A65A6E3ECE
	for <lists+linux-ia64@lfdr.de>; Mon, 17 Apr 2023 07:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjDQFRS (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 17 Apr 2023 01:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjDQFRR (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 17 Apr 2023 01:17:17 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222B11738
        for <linux-ia64@vger.kernel.org>; Sun, 16 Apr 2023 22:17:16 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-54c0c86a436so525462347b3.6
        for <linux-ia64@vger.kernel.org>; Sun, 16 Apr 2023 22:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681708635; x=1684300635;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tyO4JOXCZAIo7dbf5amDDtc9eY22dYzR4kpkvjmtxpU=;
        b=cBdJf91Kj7km2xQewFBDykrtct/xRt0C1c8vs+eTiF3gMY38DdS5XtnLtSdvOweyj4
         8LaCibROSqQkBy9PiRn45Y3ByQwdsoMfjiagFV2LtJ+vRYfNTN7VQH64Z5/rw7dPSfuF
         7pnFuyV6h2Ww6SBCDyhPPIRai7o4yWL8GBQDfqNenqO8wvDrsBMOekeJTyXif/3MD8cN
         Sp3BaWQWzkv3unkG5oUqWLkrk8QO4/4HDU6fTLgXTEwmXJhOmyFy0TvKtEvfYB/I4NJM
         dUOWKmEF02ksKIs4uY/viKF8ZehTMYlle5qxwjKv2XdreOmiNT18XbVkxAs0VAJkO2Z2
         Yolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681708635; x=1684300635;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tyO4JOXCZAIo7dbf5amDDtc9eY22dYzR4kpkvjmtxpU=;
        b=DI0Sd23GxTPMOWZlZbd8ur/yp7Iuac57mafc5ylIfNB3IXDEtIDbDhFaY2713SgSZM
         /9Dn7I4Z3IEo4UG5+wNnHkPch/qyEePjhiI+IY8osYuoqk59cLH4AAloDUeuckiQwVii
         338ldotguXHyQZyJNP6RlVR5O2/Zh3LGS7qe26U8iLYQ2thkvUxnwnwz18sJLdUsj5T6
         jr6ZvC3TQde6csraNpIuygUu+tRDsSa8yO60UEOIh3nhSj+Bs1Jsb3Zr7wWNTCUDug/T
         By+vEydQol0JI/4mcPb9umLUFcne4LdGZqNH5+no47CPiMXBzA+4GU9IKsews1QerV70
         JXoQ==
X-Gm-Message-State: AAQBX9fx4ZX5ZXXMMqHZ4h26WSG655xmr8Owl6toUIqMH3BWkFDZJUAD
        kjRW8nXs1/E8frtSr4JXxKBu4w==
X-Google-Smtp-Source: AKy350bAqFfEpx4vSQd0hJSOssnZMZ/63Z6tfy1T2FtPIkJYl75Hb+Q54/ZXv49uP6YYuNgiAKbJTQ==
X-Received: by 2002:a0d:dd8c:0:b0:54f:4fd:7e5e with SMTP id g134-20020a0ddd8c000000b0054f04fd7e5emr15252594ywe.5.1681708635237;
        Sun, 16 Apr 2023 22:17:15 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id bw8-20020a05690c078800b0054f69033623sm2887791ywb.61.2023.04.16.22.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 22:17:14 -0700 (PDT)
Date:   Sun, 16 Apr 2023 22:17:05 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Andrew Morton <akpm@linux-foundation.org>
cc:     Mike Rapoport <rppt@linux.ibm.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Ard Biesheuvel <ardb@kernel.org>, linux-ia64@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH] ia64: fix an addr to taddr in huge_pte_offset()
Message-ID: <732eae88-3beb-246-2c72-281de786740@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

I know nothing of ia64 htlbpage_to_page(), but guess that the p4d
line should be using taddr rather than addr, like everywhere else.

Fixes: c03ab9e32a2c ("ia64: add support for folded p4d page tables")
Signed-off-by: Hugh Dickins <hughd@google.com
---
Just something noticed when visiting recently in the source:
thought we might fix it before ia64 is consigned to history;
I'm unable to say anything about the user-visible effects!

 arch/ia64/mm/hugetlbpage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 6.3-rc7/arch/ia64/mm/hugetlbpage.c
+++ linux/arch/ia64/mm/hugetlbpage.c
@@ -58,7 +58,7 @@ huge_pte_offset (struct mm_struct *mm, unsigned long addr, unsigned long sz)
 
 	pgd = pgd_offset(mm, taddr);
 	if (pgd_present(*pgd)) {
-		p4d = p4d_offset(pgd, addr);
+		p4d = p4d_offset(pgd, taddr);
 		if (p4d_present(*p4d)) {
 			pud = pud_offset(p4d, taddr);
 			if (pud_present(*pud)) {
