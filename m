Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F36255385BA
	for <lists+linux-ia64@lfdr.de>; Mon, 30 May 2022 18:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbiE3P7o (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 30 May 2022 11:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240922AbiE3P7g (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 30 May 2022 11:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 711B2205DA
        for <linux-ia64@vger.kernel.org>; Mon, 30 May 2022 08:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653925982;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bDYue/Afd3VGZHzU7tYF7qy5xBeBUpqe85rLuoAiRcE=;
        b=AkXHNJKvAQRHb5OqI+OhXnw4AlFTHU7SQ25I25r8DrkTB9nwXx2U3S7uy3yWEhfxPKMgZ0
        MCHoCCU4ElbTk7DKNd2mXmRpWE6tOdwsDRWpn7scMraYzymGuve2EYFM1vMWpJYkKpJQS0
        OjtcJUf23O2R/uhMV8v3cei4In0oe2Y=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-XQ1tM3PcNBm_cT4_VPa4YQ-1; Mon, 30 May 2022 11:53:01 -0400
X-MC-Unique: XQ1tM3PcNBm_cT4_VPa4YQ-1
Received: by mail-il1-f198.google.com with SMTP id j5-20020a922005000000b002d1c2659644so8585656ile.8
        for <linux-ia64@vger.kernel.org>; Mon, 30 May 2022 08:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bDYue/Afd3VGZHzU7tYF7qy5xBeBUpqe85rLuoAiRcE=;
        b=5/dOy1SEb+HnAVxyujcHo8Om7iSO+MZ1bgaV9maw9p86HIbHwRFUT7sJ8V5Jj9SqjM
         QS8t0z0IcR1LexzKBec1I1J1+I0dEtmC/ChZelyZ5nqTBpgpnlD1BnWOpiNk+99SXkXQ
         SLrspHpD2SSErUWHtUSD9+B7B5GU4QISjScuGttdXi/teut9gmSqUPpHDjKukluSx/lv
         Nsi+ft5JBZZgIh7G+dCgZc5zp1TIQl82tHTcEZYCesK4CYufx1UJHx9PcZ2lWXauorUf
         uYUNEqfeKGkFGjOLHlusV03T1bauLmf+CS4AINl4pYKdsDHI2HaFTs9fH1rJxsg5TaDk
         9yOw==
X-Gm-Message-State: AOAM532pXXXkHYhTaFf7ca+G12OstnkFuV6FjI0n7t/WFcMTGLx/Q5pO
        +B+wrEp5mhr4DtBmJizHa7GTFpaaIviIovmIgNEMSjaq/of3YuixVuK0inSpx6nP0orm5IkPSoC
        Ndn4zmdRAZcwrdOCUXmy29g==
X-Received: by 2002:a5d:9cc8:0:b0:663:2899:4b8 with SMTP id w8-20020a5d9cc8000000b00663289904b8mr16857358iow.192.1653925980591;
        Mon, 30 May 2022 08:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKQIoyyqGc41UCjMUnObS0GZ5Lh8IPSVLY8KDGIOa5YRMfMwdzANPXLWIG/1E7oUnwvcvO1w==
X-Received: by 2002:a5d:9cc8:0:b0:663:2899:4b8 with SMTP id w8-20020a5d9cc8000000b00663289904b8mr16857337iow.192.1653925980357;
        Mon, 30 May 2022 08:53:00 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id 66-20020a021d45000000b0032e75bfe344sm2781109jaj.171.2022.05.30.08.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 08:52:59 -0700 (PDT)
Date:   Mon, 30 May 2022 11:52:54 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Christian Borntraeger <borntraeger@linux.ibm.com>
Cc:     Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Will Deacon <will@kernel.org>,
        Matt Turner <mattst88@gmail.com>, linux-s390@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Brian Cain <bcain@quicinc.com>, Borislav Petkov <bp@alien8.de>,
        linux-alpha@vger.kernel.org, Alistair Popple <apopple@nvidia.com>,
        Jonas Bonn <jonas@southpole.se>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        linux-snps-arc@lists.infradead.org,
        Vineet Gupta <vgupta@kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Rich Felker <dalias@libc.org>, sparclinux@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        David Hildenbrand <david@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
        Richard Henderson <rth@twiddle.net>,
        Guo Ren <guoren@kernel.org>, linux-parisc@vger.kernel.org,
        Andrea Arcangeli <aarcange@redhat.com>,
        Helge Deller <deller@gmx.de>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-um@lists.infradead.org, "H . Peter Anvin" <hpa@zytor.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        openrisc@lists.librecores.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-hexagon@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
        Stafford Horne <shorne@gmail.com>, linux-csky@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "David S . Miller" <davem@davemloft.net>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Hugh Dickins <hughd@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-riscv@lists.infradead.org, Max Filippov <jcmvbkbc@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Chris Zankel <chris@zankel.net>,
        Michal Simek <monstr@monstr.eu>, x86@kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Richard Weinberger <richard@nod.at>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v4] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpToVpjXmdFqGOpY@xz-m1.local>
References: <20220527193936.30678-1-peterx@redhat.com>
 <YpPYkzbrQmy4FjrI@osiris>
 <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, May 30, 2022 at 11:35:10AM +0200, Christian Borntraeger wrote:
> 
> 
> Am 29.05.22 um 22:33 schrieb Heiko Carstens:
> [...]
> > 
> > Guess the patch below on top of your patch is what we want.
> > Just for clarification: if gmap is not NULL then the process is a kvm
> > process. So, depending on the workload, this optimization makes sense.
> > 
> > diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> > index 4608cc962ecf..e1d40ca341b7 100644
> > --- a/arch/s390/mm/fault.c
> > +++ b/arch/s390/mm/fault.c
> > @@ -436,12 +436,11 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> >   	/* The fault is fully completed (including releasing mmap lock) */
> >   	if (fault & VM_FAULT_COMPLETED) {
> > -		/*
> > -		 * Gmap will need the mmap lock again, so retake it.  TODO:
> > -		 * only conditionally take the lock when CONFIG_PGSTE set.
> > -		 */
> > -		mmap_read_lock(mm);
> > -		goto out_gmap;
> > +		if (gmap) {
> > +			mmap_read_lock(mm);
> > +			goto out_gmap;
> > +		}
> > +		goto out;
> 
> Yes, that makes sense. With that
> 
> Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>

Looks sane, thanks Heiko, Christian.  I'll cook another one.

-- 
Peter Xu

