Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE2664B1ABB
	for <lists+linux-ia64@lfdr.de>; Fri, 11 Feb 2022 01:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346519AbiBKAwB (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 10 Feb 2022 19:52:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346528AbiBKAwB (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 10 Feb 2022 19:52:01 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB3E5F8D
        for <linux-ia64@vger.kernel.org>; Thu, 10 Feb 2022 16:52:01 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id u12so3319753plf.13
        for <linux-ia64@vger.kernel.org>; Thu, 10 Feb 2022 16:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D3EjEoLgjS5BYa16RZ5JcaZGfnj2NCy9e6R/DsxWvD0=;
        b=mYDb9T7V8vVpb4vvbK6zkA0h1yevImaISwFUxjrIIoz62k/wF/zDHu5zFn6qzE7kUp
         87hdaz0kZHUo4I24hP9Ypim/bw0UCqkm9B/sqsnXEiXBwa22hYfKiyLvWUhlNNdLK62v
         jkpZSMR3Qi6h9sWFPRK7ScuIfziA7yI6AE748=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D3EjEoLgjS5BYa16RZ5JcaZGfnj2NCy9e6R/DsxWvD0=;
        b=EMcPMr9EBfH5DGYIa3fdyeLHhG+BXh/YfQjylMj3VVfwKlPeTj2LKIWO4CEGcw5v4V
         fbYZyEeWYgMOwx7qzw5l2kBLG55EdP8bcOwiBM0In7sPwJ2nXkOOxT+MQmxMCTLQ5DQf
         aRJ4Ioxx8Yg2KbosL0jiKgcnMynFb3J8IkD/iuWVnXUlc7Gu7Y8W6bFas7OouZOm7ACH
         GsxIYjPU3JSwhnpoy+MbzmSQD3QKzkuirXipLGFjD/s4Kku8kVKW3ulNJ0j4T+naOhrx
         EtipEqX+ywd2mtTLZ+eVpkslrH8W+jrzaIDqyHgpXtaRsdCvryP00SHi2KM6rpd0EoQz
         C8EA==
X-Gm-Message-State: AOAM531KOW7HNdGp7kKn10xkf4cQG8M8eQvxp0shSi15bpDjV1YIBCXC
        nZq2lU8Z11yU9MogStbbNHAsNA==
X-Google-Smtp-Source: ABdhPJw/vLSGOWe5ccZEegSZ0CyTgYC43nd3Y1R3YkYl+lBMWAImTOS4id0LQup7bw2RNv5XlqIpWQ==
X-Received: by 2002:a17:90a:5206:: with SMTP id v6mr71812pjh.220.1644540721159;
        Thu, 10 Feb 2022 16:52:01 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z22sm24478493pfe.42.2022.02.10.16.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 16:52:00 -0800 (PST)
Date:   Thu, 10 Feb 2022 16:51:59 -0800
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
Subject: Re: [PATCH v3 01/12] powerpc: Move and rename func_descr_t
Message-ID: <202202101651.E6AACB3D4F@keescook>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
 <637a9a11263afa216fdfa7fb470a54479c67c61c.1634457599.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <637a9a11263afa216fdfa7fb470a54479c67c61c.1634457599.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Sun, Oct 17, 2021 at 02:38:14PM +0200, Christophe Leroy wrote:
> There are three architectures with function descriptors, try to
> have common names for the address they contain in order to
> refactor some functions into generic functions later.
> 
> powerpc has 'entry'
> ia64 has 'ip'
> parisc has 'addr'
> 
> Vote for 'addr' and update 'func_descr_t' accordingly.
> 
> Move it in asm/elf.h to have it at the same place on all
> three architectures, remove the typedef which hides its real
> type, and change it to a smoother name 'struct func_desc'.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I like the name. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
