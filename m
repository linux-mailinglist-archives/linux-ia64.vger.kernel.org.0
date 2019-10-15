Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED0B1D7E85
	for <lists+linux-ia64@lfdr.de>; Tue, 15 Oct 2019 20:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbfJOSJt (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 15 Oct 2019 14:09:49 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:42912 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389106AbfJOSJs (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 15 Oct 2019 14:09:48 -0400
Received: by mail-qt1-f195.google.com with SMTP id w14so31886797qto.9
        for <linux-ia64@vger.kernel.org>; Tue, 15 Oct 2019 11:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0qwLtcxPALcuAsItN1B8qx8pI5MyvooMsDhjXlcFVYU=;
        b=OnJVDC5hcrBKYzJ0aaZLxRkdp1U3qCbQgu81veLGc4CM3Zb6t5hcOJCBpTdvyBdixF
         VWur9qZ4L56kK+G5lLndae4M48fKcE348SEdyWD92O4lDLHkfxe5ub5wW2//gFbMdbTi
         iE/SuY24OOqYt++fDwkOv1/GwgIUIlLUQjLQSRUD9o8GbrJtA9JJHM6yNqLJ6MTwQsp1
         dfxkcvx1nTD9OtgmSDJrI8pHgij5k8GqR5jvJV2yqTmJQajvA0gKezgdBIJXSTBKmtgD
         Bn30ldSgF22fHm04r+hQGzlUE6CW7jcqmMjIT04sV5F04SskgoCcXMGW7VfjZDMID4ld
         SbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0qwLtcxPALcuAsItN1B8qx8pI5MyvooMsDhjXlcFVYU=;
        b=bhlQ5gOoFyU6oB5Pr29v1ZseuIYpTMIg7HLnewSp+xqlkXX+Awn4+JWZ0Lrif8FU4F
         AJdxDt5i0buzup3WbA4+daTE+DW+7E7KXQ8bo9WUphRIQcOmvX+hB2NrV7s7opDklFyu
         NPyLexwbEvVBvCh/KDyYOodlFvzey8xIYfRgp6pVVGmnooCBB+dGkcqNMFhyU2Sc6J5+
         DMhLicpl3rUnKK5YdoE2RmC0vrKYBRrPyVcNLHHs+P4hrcsk0kvqHcpfDCPxXHcgznTL
         8IJoLd7gxlZ3nYrfpRTv6eHrsqGC+Ut7O9R7E+TdrhweAsUkXgxH8IwowMJFLcE6l0Uw
         1f7w==
X-Gm-Message-State: APjAAAVz56MR8Xv2Wp9WDlXLPP5mysoqTYcO9EA3oTqv0QoRNjLCz+cF
        M9goKmeEk184EHdTF4tkWtr35w==
X-Google-Smtp-Source: APXvYqyVLYUWTIAK6GzhvgdzZLJE6+q5wD4mjw+q975FciP9rpwUqd4etcurLcTJHzy5ZkDdOjbnKA==
X-Received: by 2002:ac8:7289:: with SMTP id v9mr39571710qto.139.1571162985818;
        Tue, 15 Oct 2019 11:09:45 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id k54sm15559033qtf.28.2019.10.15.11.09.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 11:09:45 -0700 (PDT)
Message-ID: <1571162982.5937.42.camel@lca.pw>
Subject: Re: [PATCH V6 2/2] mm/debug: Add tests validating architecture page
 table helpers
From:   Qian Cai <cai@lca.pw>
To:     Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 15 Oct 2019 14:09:42 -0400
In-Reply-To: <1571131302-32290-3-git-send-email-anshuman.khandual@arm.com>
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
         <1571131302-32290-3-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, 2019-10-15 at 14:51 +0530, Anshuman Khandual wrote:
> +static unsigned long __init get_random_vaddr(void)
> +{
> +	unsigned long random_vaddr, random_pages, total_user_pages;
> +
> +	total_user_pages = (TASK_SIZE - FIRST_USER_ADDRESS) / PAGE_SIZE;
> +
> +	random_pages = get_random_long() % total_user_pages;
> +	random_vaddr = FIRST_USER_ADDRESS + random_pages * PAGE_SIZE;
> +
> +	WARN_ON(random_vaddr > TASK_SIZE);
> +	WARN_ON(random_vaddr < FIRST_USER_ADDRESS);

It would be nice if this patch does not introduce a new W=1 GCC warning here on
x86 because FIRST_USER_ADDRESS is 0, and GCC think the code is dumb because
"random_vaddr" is unsigned,

In file included from ./arch/x86/include/asm/bug.h:83,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/gfp.h:5,
                 from mm/debug_vm_pgtable.c:13:
mm/debug_vm_pgtable.c: In function ‘get_random_vaddr’:
mm/debug_vm_pgtable.c:359:23: warning: comparison of unsigned expression < 0 is
always false [-Wtype-limits]
  WARN_ON(random_vaddr < FIRST_USER_ADDRESS);
                       ^
./include/asm-generic/bug.h:113:25: note: in definition of macro ‘WARN_ON’
  int __ret_warn_on = !!(condition);    \
                         ^~~~~~~~~
