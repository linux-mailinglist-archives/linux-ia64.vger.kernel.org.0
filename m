Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 426C74F8EDC
	for <lists+linux-ia64@lfdr.de>; Fri,  8 Apr 2022 08:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiDHDoj (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 7 Apr 2022 23:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbiDHDoi (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 7 Apr 2022 23:44:38 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771186C953
        for <linux-ia64@vger.kernel.org>; Thu,  7 Apr 2022 20:42:34 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id k14so6741804pga.0
        for <linux-ia64@vger.kernel.org>; Thu, 07 Apr 2022 20:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K96mlN10n7EweDR+53jcFZAkfBQwRjsHeZeSVOaqH6U=;
        b=dL1emr/SVvDUitmI/GhFvZ5GDfJfCZqqybUK0jY5r9YpcwDEym86lGSPk5ajT9fkXv
         68GItVAds/Z+CMKr5K6+nclMV48nPWohX7Qz2mbKGSdt22CtfWYhovUHU9eWOOIJxF/x
         TIwKpkgJMMkaKK6GQVnlphvoASG3ht7FbopB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K96mlN10n7EweDR+53jcFZAkfBQwRjsHeZeSVOaqH6U=;
        b=098rpw9pthkJ7VkxL8irUvnWwcmTg/wBvEH3L6ZGE1W4FC4N24ZjIplIme+zv5+10M
         WC/3UYSIZ4Fmm+7Gf9IGtwovAvQmtcAYknonomW7Xr0sbT/3YqQgZ1Ag2YgBz/cGTKWG
         IlB55/8Z/uErr7BdYBirDOcpoYeZuBb8FBeu06CbiPOcUBEKI3PABZdsdRENDWp6scXU
         wCW7nCkvbm8upOVSQYS9cDexoxzHbAit1mIAiXRp1YvTAam1u7sO4jn3j7AN+JqKlPc7
         uvq/InI32NgH0GfTSjq/yO/w0wvcLBQgIKLzqG0I7IAMgYMbtE1nIEE/5H+qtthwIpRv
         Bakw==
X-Gm-Message-State: AOAM530xHGlR91Sqj+6tWJthfZwJOyOTm1NYeJqClUUdVIdtNxxFJa/O
        4x60MCF64A+FS67khv4RhS6eWg==
X-Google-Smtp-Source: ABdhPJzs4BJvqoMUJeyjaJ1TeZcDIdeQX1b09zQG89u/2Jo2P8sjElQ6/UOvNErwvd9fdVv73z+YWw==
X-Received: by 2002:a63:6c02:0:b0:398:833b:f739 with SMTP id h2-20020a636c02000000b00398833bf739mr14106439pgc.524.1649389353914;
        Thu, 07 Apr 2022 20:42:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q27-20020aa7961b000000b004fdf7a4d49esm17171769pfg.170.2022.04.07.20.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 20:42:33 -0700 (PDT)
Date:   Thu, 7 Apr 2022 20:42:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH] lkdtm: Replace lkdtm_rodata_do_nothing() by
 do_nothing()
Message-ID: <202204072037.FE91C45E@keescook>
References: <fe36bf23fb14e7eff92a95a1092ed38edb01d5f5.1634491011.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe36bf23fb14e7eff92a95a1092ed38edb01d5f5.1634491011.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Sun, Oct 17, 2021 at 07:19:47PM +0200, Christophe Leroy wrote:
> But for EXEC_RODATA test, execute_location() uses
> lkdtm_rodata_do_nothing() which is already in rodata section
> at build time instead of using a copy of do_nothing(). However
> it still uses the function descriptor of do_nothing(). There
> is a risk that running lkdtm_rodata_do_nothing() with the
> function descriptor of do_thing() is wrong.

Wrong how? (Could there be two descriptors?)

> To remove the above risk, change the approach and do the same
> as for other EXEC tests: use a copy of do_nothing(). The copy
> cannot be done during the test because RODATA area is write
> protected. Do the copy during init, before RODATA becomes
> write protected.

Hmm, hmm. This is a nice way to handle it, but I'm not sure which
"weird" way is better. I kind of prefer the code going through all the
"regular" linking goo to end up in .rodata, but is it really any
different from doing this via the ro_after_init section? It makes me
nervous because they can technically be handled differently. For
example, .rodata is mapped differently on some architectures compared to
ro_after_init. Honestly, I actually this this patch should be modified
to _add_ a new test for EXEC_RO_AFTER_INIT, and leave the existing
.rodata one alone...

-Kees

-- 
Kees Cook
