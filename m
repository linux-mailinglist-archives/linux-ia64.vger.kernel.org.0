Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C394699D09
	for <lists+linux-ia64@lfdr.de>; Thu, 16 Feb 2023 20:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjBPTfQ (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 16 Feb 2023 14:35:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjBPTfP (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 16 Feb 2023 14:35:15 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1E652881
        for <linux-ia64@vger.kernel.org>; Thu, 16 Feb 2023 11:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=5dua9h4/Mzzs5WrUsPytX7QSV94VLLpPJ12iKyimNdM=; b=oiwFZwydmp4ZAARaqFiE5ULidA
        nxMip83XKhKYEH0ENGqN5qgXQ6lDOsbkO+u2O4UE/nruS5mj8OqEyYgbKHOgDEq39bklhLeKUOwqr
        RSQLQ7Qo2mjc0rIQslonoWYDd3QK7s+ZeOLOTsbQQ8OLSqZHkwXv/DJzddZ3Y/Wee3nfqTy7pavuU
        joB+a5QDWKX2mWMB9oVUHhhXOSYa2S5ADqvuj6DLaoh6si9r5o+jo2aW2kNxrsLTCJshI7ubdMdC4
        2kS2kEW6ScX0M/LrC0YGt004KXxmCMzA6ikqcpHu3m2+ZUgUbNM7s6dn0BbynraYsl3Zdbgj1++ra
        VL3N3kuw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pSk1i-008f6v-PW; Thu, 16 Feb 2023 19:34:42 +0000
Date:   Thu, 16 Feb 2023 19:34:42 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Pedro Miguel Justo <pmsjt@texair.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Tony Luck <tony.luck@intel.com>,
        Jessica Clarke <jrtc27@jrtc27.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
Subject: Re: [RFC PATCH 0/5] Retire IA64/Itanium support
Message-ID: <Y+6FUoMdLYyG71Il@casper.infradead.org>
References: <CO1PR13MB48707CAD2AFD26D4B6D11321C8A09@CO1PR13MB4870.namprd13.prod.outlook.com>
 <CAMj1kXG5ufjnZGX=i92REDTayrYEKu0uVCdMB5X5JkNfAX4peA@mail.gmail.com>
 <3f91da52-619a-89a2-da96-bf04e8ae3e48@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f91da52-619a-89a2-da96-bf04e8ae3e48@roeck-us.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, Feb 16, 2023 at 11:17:55AM -0800, Guenter Roeck wrote:
> It isn't just that. Trying to build ia64:allmodconfig with gcc 11.2
> fails due to build warning(s) which are now errors, and the same
> build with gcc 11.3 or later (and binutils 2.32 or later) fails
> completely with
>     Error: Register number out of range 0..1
> and similar all over the place. So there isn't just code bitrot,
> there is also compiler and/or binutils bitrot.

FWIW, ia64-unknown-linux-gnu was removed as a secondary platform between
the gcc-4.6 and gcc-4.7 releases (around 2012).  So this part of the
release criteria no longer applies:

: Our release criteria for the secondary platforms is:
: 
:     The compiler bootstraps successfully, and the C++ runtime library builds.
:     The DejaGNU testsuite has been run, and a substantial majority of the tests pass.

Linux does support a lot of platforms which are tertiary platforms,
of course.  Alpha, arc, csky, hexagon, loongarch, m68k, microblaze,
nios2, openrisc, parisc, riscv, sh and xtensa are all tertiary.  But
even Debian don't ship an x86->ia64 cross-gcc.
