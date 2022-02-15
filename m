Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E17FC4B7125
	for <lists+linux-ia64@lfdr.de>; Tue, 15 Feb 2022 17:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241327AbiBOQHq (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 15 Feb 2022 11:07:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238834AbiBOQHp (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 15 Feb 2022 11:07:45 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46848DE8F
        for <linux-ia64@vger.kernel.org>; Tue, 15 Feb 2022 08:07:35 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id t14-20020a17090a3e4e00b001b8f6032d96so2523536pjm.2
        for <linux-ia64@vger.kernel.org>; Tue, 15 Feb 2022 08:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9F1cZHityGGoWBhfQ6coBOoN6sLDbcrG5DsSqFvaDqU=;
        b=QerMelEYY6ZDyyl1cI/YVp6a+3AiRTY9PXCnsmnFgeUeqOfD0RdHc1oShO5TFk3a1e
         reRp5IdzoSDGiTUW0TUs9obthAaR6Fd7ALoGIVLN+mzEsNiFaBatztWhabOU5Mdkco4q
         B/zJoBvoW6A94AVKVgT4SIX+4LVEqROqThJII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9F1cZHityGGoWBhfQ6coBOoN6sLDbcrG5DsSqFvaDqU=;
        b=eM1gww5RUyXE02CLl203GJyPSSAv3j9+nXEIvDuLkXhroWhuwZZQnoOQVOsYps+j3h
         /vvtlBUJquoIzpNA07gfg0Y4r0Lu/P+pek8QH4VqvUeLukBSEM3JNlg1fFgj3jXi2YR5
         wQBoZyoe+TwdqvF5i7Q04nvd8seaSTvZQ/AUBD69ZXTzAyfsbtGUUekj8wYvCawiHB94
         NVyO/M2mdOlrAk8yKoQgBVJniLedfHqcPodxDggBJZgPh+GD7U6bYddoCymCTmLt7nus
         Tb2LVGe5vBbnByTrSzF4O765Dcuo5Qmh2UgFEJjP9vTcWjCQ0iawTpvotFgOdf8jQJog
         Lfkg==
X-Gm-Message-State: AOAM533Lx6kczFoqedpY8rfQeOGW9j0x7E8sCu2zl13pvtT+FNR/1XzH
        APjshuYeSZkWAroXwzTcT9Uo7A==
X-Google-Smtp-Source: ABdhPJy9XUFQBS9qoJ92jrgPj0aOGN3xbqhE/n4oek8xKKJdVkIpgUPawPDOLHN99L+h2PeDtK1eNw==
X-Received: by 2002:a17:902:b413:: with SMTP id x19mr5046708plr.103.1644941254817;
        Tue, 15 Feb 2022 08:07:34 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n29sm2964422pgc.10.2022.02.15.08.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 08:07:34 -0800 (PST)
Date:   Tue, 15 Feb 2022 08:07:33 -0800
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
Subject: Re: [PATCH v4 00/13] Fix LKDTM for PPC64/IA64/PARISC v4
Message-ID: <202202150807.D584917D34@keescook>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1644928018.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, Feb 15, 2022 at 01:40:55PM +0100, Christophe Leroy wrote:
> PPC64/IA64/PARISC have function descriptors. LKDTM doesn't work
> on those three architectures because LKDTM messes up function
> descriptors with functions.
> 
> This series does some cleanup in the three architectures and
> refactors function descriptors so that it can then easily use it
> in a generic way in LKDTM.

Thanks for doing this! It looks good to me. :)

-Kees

> 
> Changes in v4:
> - Added patch 1 which Fixes 'sparse' for powerpc64le after wrong report on previous series, refer https://github.com/ruscur/linux-ci/actions/runs/1351427671
> - Exported dereference_function_descriptor() to modules
> - Addressed other received comments
> - Rebased on latest powerpc/next (5a72345e6a78120368fcc841b570331b6c5a50da)
> 
> Changes in v3:
> - Addressed received comments
> - Swapped some of the powerpc patches to keep func_descr_t renamed as struct func_desc and remove 'struct ppc64_opd_entry'
> - Changed HAVE_FUNCTION_DESCRIPTORS macro to a config item CONFIG_HAVE_FUNCTION_DESCRIPTORS
> - Dropped patch 11 ("Fix lkdtm_EXEC_RODATA()")
> 
> Changes in v2:
> - Addressed received comments
> - Moved dereference_[kernel]_function_descriptor() out of line
> - Added patches to remove func_descr_t and func_desc_t in powerpc
> - Using func_desc_t instead of funct_descr_t
> - Renamed HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR to HAVE_FUNCTION_DESCRIPTORS
> - Added a new lkdtm test to check protection of function descriptors
> 
> Christophe Leroy (13):
>   powerpc: Fix 'sparse' checking on PPC64le
>   powerpc: Move and rename func_descr_t
>   powerpc: Use 'struct func_desc' instead of 'struct ppc64_opd_entry'
>   powerpc: Remove 'struct ppc64_opd_entry'
>   powerpc: Prepare func_desc_t for refactorisation
>   ia64: Rename 'ip' to 'addr' in 'struct fdesc'
>   asm-generic: Define CONFIG_HAVE_FUNCTION_DESCRIPTORS
>   asm-generic: Define 'func_desc_t' to commonly describe function
>     descriptors
>   asm-generic: Refactor dereference_[kernel]_function_descriptor()
>   lkdtm: Force do_nothing() out of line
>   lkdtm: Really write into kernel text in WRITE_KERN
>   lkdtm: Fix execute_[user]_location()
>   lkdtm: Add a test for function descriptors protection
> 
>  arch/Kconfig                             |  3 +
>  arch/ia64/Kconfig                        |  1 +
>  arch/ia64/include/asm/elf.h              |  2 +-
>  arch/ia64/include/asm/sections.h         | 24 +-------
>  arch/ia64/kernel/module.c                |  6 +-
>  arch/parisc/Kconfig                      |  1 +
>  arch/parisc/include/asm/sections.h       | 16 ++----
>  arch/parisc/kernel/process.c             | 21 -------
>  arch/powerpc/Kconfig                     |  1 +
>  arch/powerpc/Makefile                    |  2 +-
>  arch/powerpc/include/asm/code-patching.h |  2 +-
>  arch/powerpc/include/asm/elf.h           |  6 ++
>  arch/powerpc/include/asm/sections.h      | 29 ++--------
>  arch/powerpc/include/asm/types.h         |  6 --
>  arch/powerpc/include/uapi/asm/elf.h      |  8 ---
>  arch/powerpc/kernel/module_64.c          | 42 ++++++--------
>  arch/powerpc/kernel/ptrace/ptrace.c      |  6 ++
>  arch/powerpc/kernel/signal_64.c          |  8 +--
>  drivers/misc/lkdtm/core.c                |  1 +
>  drivers/misc/lkdtm/lkdtm.h               |  1 +
>  drivers/misc/lkdtm/perms.c               | 71 +++++++++++++++++++-----
>  include/asm-generic/sections.h           | 15 ++++-
>  include/linux/kallsyms.h                 |  2 +-
>  kernel/extable.c                         | 24 +++++++-
>  tools/testing/selftests/lkdtm/tests.txt  |  1 +
>  25 files changed, 155 insertions(+), 144 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
Kees Cook
