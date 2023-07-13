Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5F5F7519EA
	for <lists+linux-ia64@lfdr.de>; Thu, 13 Jul 2023 09:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234055AbjGMH2P (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 13 Jul 2023 03:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234324AbjGMH2H (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 13 Jul 2023 03:28:07 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC34C2;
        Thu, 13 Jul 2023 00:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1689233250; x=1689838050; i=deller@gmx.de;
 bh=BzvXTHYc41zcqbAAV/+hJvg0vIxuqHt7OiQPT6yMRv4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=mCj6Ir2NfRHrbtDot5VggBJSvAlw4rjHKa8bVZGC8CCe2ZWehPcE0fZnpwr6qiRQMFm9yBE
 dB7cjOcjdxuPCTKdYUayAlczB8UfuzCFFjirzG/HGrTaTTSuNnG8mMNRJS15pqRkRK3pP98RH
 ClvOT4zp9T+eqXR3lZdZuJ6QQaFGRdjJaVf8PYm0BLCpS7SdPxY5cfJ/wqTOCe4ahp9B/pSwY
 ibewls/yKTYKiNUAjJAbdXLbycN/trIJlhzHnDVEsNjrWzI1wNtSA9kuIn8Rj63nSonryZr0A
 W+5n2YksuQPSzc5ye5yvvSh1tI1dHevb76PEJYvTMVMuLMQBRZbg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([94.134.155.32]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1pziO32gTh-00tTB1; Thu, 13
 Jul 2023 09:27:30 +0200
Date:   Thu, 13 Jul 2023 09:27:28 +0200
From:   Helge Deller <deller@gmx.de>
To:     matoro <matoro_mailinglist_kernel@matoro.tk>
Cc:     Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
        Linux Ia64 <linux-ia64@vger.kernel.org>,
        glaubitz@physik.fu-berlin.de, Sam James <sam@gentoo.org>
Subject: Re: [PATCH 1/5] io_uring: Adjust mapping wrt architecture aliasing
 requirements
Message-ID: <ZK+nYIxe6zf2vYwH@ls3530>
References: <20230314171641.10542-1-axboe@kernel.dk>
 <20230314171641.10542-2-axboe@kernel.dk>
 <1d5f8f99f39e2769b9c76fbc24e2cf50@matoro.tk>
 <ZK7TrdVXc0O6HMpQ@ls3530>
 <f1bed3cc3c43083cfd86768a91402f6b@matoro.tk>
 <a3ae1656-be97-ccc2-8962-1cb70ebc67fa@gmx.de>
 <802b84f7-94f4-638b-3742-26bca00b262d@gmx.de>
 <8bb091fb5fd00072842fe92b03abac9b@matoro.tk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8bb091fb5fd00072842fe92b03abac9b@matoro.tk>
X-Provags-ID: V03:K1:CRK/0yceaE+RM8qCVi8DTMn7X4b2jwsKLj1C+Pyw+i1t5+ZkfYk
 FC0hp3TkZ3zitbxkiON4ywV9wO5UlWu/9wGRtSmUkNcp5TOuPMZmdlftsA776ijqXLBu5Su
 Ftv6LijGXo17SSprFpmVY/Pc0fyQ4uWgreiuajs74dNc+Ak3OfGgBj+pclCTh+hW0FYGjOH
 v0RxA6DEt3FE7LAJ2zYmw==
UI-OutboundReport: notjunk:1;M01:P0:W9jM8zDF1r0=;1QzWzZezLhiTJF6/DBgQKPm/ecT
 M3WjeFP1n0xURgoODlssgpMZxGal3n+6uVf3VD0bGdCnZyQW9a6EdfLDEPXfBWAJrNiF+n1sB
 HPMdVdtLHnGhxAg6h0Cbpi1/Xc4kDm3cv9twkydZImFSJuPKOoG46xQu6ne2z275NEh3sbDXz
 Rfcgnzi9jTWfG9qg4lnm+F6zzaBVFVhs9rDLNcAzrOwgJG93vQso2miKrwdP76eQZs+GBBcVb
 AwtTsfQQGztD7po9Cdkd4QbSurmHCrxJZDjO+aVA+/8BhDvktqYTkpU4UBcMMzGI8MqNmiwhW
 JywYja5FV2StZP0L/ZGbda//ADtShpADxQH3lxnUdHy0WoTyBwdog6rMagmyB2WV2clM8ZXm3
 5jQnlS8U4lrdufT79Sl5G+A1/QIfiCfMF9WxljeKP8IkrN1OOv3uxSM65L/XT3IsEhAEaoQ7P
 E/O6GdwC+otslGe+eQj5ITALwKGLKn+hjL8NwFBx77BrvccJkWDzK/aIUb8/V8znD0hJ4x8VI
 tz29aZZiz1kxQ5F7AqfGxmIbyfBwrMyFapDy53IUJTDglIoHixkpovWA0pqFGzvxkSZgwUtXT
 j9IVqc0E127VDn/m83r9q/Oun5amfU/JAQ6dZLaPgKblfaiIxqoQDL7XUqjWgKH7tghCqiIPa
 gci5GK1qyUZoOlHwPZS5pm5m2wZ+3tXrzPemYfY21EwZj46QIGvv+dCheE7I0z75FnydEdbdg
 vb4kBn58fNuhCAJD3VwYDWPEfyj/xTDXilEr3OgaiGlVC0SGqHVY9mqLIszVxjj6sCBAkDYvD
 lAfJ2GknG4MbkTNp7DccposIiCTW0ep/0cDaZ+gGR3Sv2u63WA1a5rhbL9+Xj4fzTuGkvAZAF
 iskzdJuHMnZU3CWzDmzB0dr7LQZvHIPNVaNJcbApMEee3IbTY+VWL6Kxk08ISo8OsJHeanRgO
 KCNff1EvXBAnUVToBOTpQr49H3s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

* matoro <matoro_mailinglist_kernel@matoro.tk>:
> On 2023-07-12 16:30, Helge Deller wrote:
> > On 7/12/23 21:05, Helge Deller wrote:
> > > On 7/12/23 19:28, matoro wrote:
> > > > On 2023-07-12 12:24, Helge Deller wrote:
> > > > > Hi Matoro,
> > > > >
> > > > > * matoro <matoro_mailinglist_kernel@matoro.tk>:
> > > > > > On 2023-03-14 13:16, Jens Axboe wrote:
> > > > > > > From: Helge Deller <deller@gmx.de>
> > > > > > >
> > > > > > > Some architectures have memory cache aliasing requirements (=
e.g. parisc)
> > > > > > > if memory is shared between userspace and kernel. This patch=
 fixes the
> > > > > > > kernel to return an aliased address when asked by userspace =
via mmap().
> > > > > > >
> > > > > > > Signed-off-by: Helge Deller <deller@gmx.de>
> > > > > > > Signed-off-by: Jens Axboe <axboe@kernel.dk>
> > > > > > > ---
> > > > > > >=A0 io_uring/io_uring.c | 51 ++++++++++++++++++++++++++++++++=
+++++++++++++
> > > > > > >=A0 1 file changed, 51 insertions(+)
> > > > > > >
> > > > > > > diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> > > > > > > index 722624b6d0dc..3adecebbac71 100644
> > > > > > > --- a/io_uring/io_uring.c
> > > > > > > +++ b/io_uring/io_uring.c
> > > > > > > @@ -72,6 +72,7 @@
> > > > > > >=A0 #include <linux/io_uring.h>
> > > > > > >=A0 #include <linux/audit.h>
> > > > > > >=A0 #include <linux/security.h>
> > > > > > > +#include <asm/shmparam.h>
> > > > > > >
> > > > > > >=A0 #define CREATE_TRACE_POINTS
> > > > > > >=A0 #include <trace/events/io_uring.h>
> > > > > > > @@ -3317,6 +3318,54 @@ static __cold int io_uring_mmap(struc=
t file
> > > > > > > *file, struct vm_area_struct *vma)
> > > > > > >=A0=A0=A0=A0=A0 return remap_pfn_range(vma, vma->vm_start, pf=
n, sz,
> > > > > > > vma->vm_page_prot);
> > > > > > >=A0 }
> > > > > > >
> > > > > > > +static unsigned long io_uring_mmu_get_unmapped_area(struct =
file *filp,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned long addr, unsig=
ned long len,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned long pgoff, unsi=
gned long flags)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 const unsigned long mmap_end =3D arch_get_mmap_en=
d(addr, len, flags);
> > > > > > > +=A0=A0=A0 struct vm_unmapped_area_info info;
> > > > > > > +=A0=A0=A0 void *ptr;
> > > > > > > +
> > > > > > > +=A0=A0=A0 /*
> > > > > > > +=A0=A0=A0=A0 * Do not allow to map to user-provided address=
 to avoid breaking the
> > > > > > > +=A0=A0=A0=A0 * aliasing rules. Userspace is not able to gue=
ss the offset address
> > > > > > > of
> > > > > > > +=A0=A0=A0=A0 * kernel kmalloc()ed memory area.
> > > > > > > +=A0=A0=A0=A0 */
> > > > > > > +=A0=A0=A0 if (addr)
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > > > > +
> > > > > > > +=A0=A0=A0 ptr =3D io_uring_validate_mmap_request(filp, pgof=
f, len);
> > > > > > > +=A0=A0=A0 if (IS_ERR(ptr))
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;
> > > > > > > +
> > > > > > > +=A0=A0=A0 info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
> > > > > > > +=A0=A0=A0 info.length =3D len;
> > > > > > > +=A0=A0=A0 info.low_limit =3D max(PAGE_SIZE, mmap_min_addr);
> > > > > > > +=A0=A0=A0 info.high_limit =3D arch_get_mmap_base(addr, curr=
ent->mm->mmap_base);
> > > > > > > +#ifdef SHM_COLOUR
> > > > > > > +=A0=A0=A0 info.align_mask =3D PAGE_MASK & (SHM_COLOUR - 1UL=
);
> > > > > > > +#else
> > > > > > > +=A0=A0=A0 info.align_mask =3D PAGE_MASK & (SHMLBA - 1UL);
> > > > > > > +#endif
> > > > > > > +=A0=A0=A0 info.align_offset =3D (unsigned long) ptr;
> > > > > > > +
> > > > > > > +=A0=A0=A0 /*
> > > > > > > +=A0=A0=A0=A0 * A failed mmap() very likely causes applicati=
on failure,
> > > > > > > +=A0=A0=A0=A0 * so fall back to the bottom-up function here.=
 This scenario
> > > > > > > +=A0=A0=A0=A0 * can happen with large stack limits and large=
 mmap()
> > > > > > > +=A0=A0=A0=A0 * allocations.
> > > > > > > +=A0=A0=A0=A0 */
> > > > > > > +=A0=A0=A0 addr =3D vm_unmapped_area(&info);
> > > > > > > +=A0=A0=A0 if (offset_in_page(addr)) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 info.flags =3D 0;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 info.low_limit =3D TASK_UNMAPPED_BASE=
;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 info.high_limit =3D mmap_end;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 addr =3D vm_unmapped_area(&info);
> > > > > > > +=A0=A0=A0 }
> > > > > > > +
> > > > > > > +=A0=A0=A0 return addr;
> > > > > > > +}
> > > > > > > +
> > > > > > >=A0 #else /* !CONFIG_MMU */
> > > > > > >
> > > > > > >=A0 static int io_uring_mmap(struct file *file, struct vm_are=
a_struct *vma)
> > > > > > > @@ -3529,6 +3578,8 @@ static const struct file_operations io=
_uring_fops
> > > > > > > =3D {
> > > > > > >=A0 #ifndef CONFIG_MMU
> > > > > > >=A0=A0=A0=A0=A0 .get_unmapped_area =3D io_uring_nommu_get_unm=
apped_area,
> > > > > > >=A0=A0=A0=A0=A0 .mmap_capabilities =3D io_uring_nommu_mmap_ca=
pabilities,
> > > > > > > +#else
> > > > > > > +=A0=A0=A0 .get_unmapped_area =3D io_uring_mmu_get_unmapped_=
area,
> > > > > > >=A0 #endif
> > > > > > >=A0=A0=A0=A0=A0 .poll=A0=A0=A0=A0=A0=A0=A0 =3D io_uring_poll,
> > > > > > >=A0 #ifdef CONFIG_PROC_FS
> > > > > >
> > > > > > Hi Jens, Helge - I've bisected a regression with
> > > > > > io_uring on ia64 to this
> > > > > > patch in 6.4.=A0 Unfortunately this breaks userspace
> > > > > > programs using io_uring,
> > > > > > the easiest one to test is cmake with an io_uring
> > > > > > enabled libuv (i.e., libuv
> > > > > > >=3D 1.45.0) which will hang.
> > > > > >
> > > > > > I am aware that ia64 is in a vulnerable place right now
> > > > > > which I why I am
> > > > > > keeping this spread limited.=A0 Since this clearly involves
> > > > > > architecture-specific changes for parisc,
> > > > >
> > > > > it isn't so much architecture-specific... (just one ifdef)
> > > > >
> > > > > > is there any chance of looking at
> > > > > > what is required to do the same for ia64?=A0 I looked at
> > > > > > 0ef36bd2b37815719e31a72d2beecc28ca8ecd26 ("parisc:
> > > > > > change value of SHMLBA
> > > > > > from 0x00400000 to PAGE_SIZE") and tried to replicate the SHML=
BA ->
> > > > > > SHM_COLOUR change, but it made no difference.
> > > > > >
> > > > > > If hardware is necessary for testing, I can provide it,
> > > > > > including remote BMC
> > > > > > access for restarts/kernel debugging.=A0 Any takers?
> > > > >
> > > > > I won't have time to test myself, but maybe you could test?
> > > > >
> > > > > Basically we should try to find out why
> > > > > io_uring_mmu_get_unmapped_area()
> > > > > doesn't return valid addresses, while arch_get_unmapped_area()
> > > > > [in arch/ia64/kernel/sys_ia64.c] does.
> > > > >
> > > > > You could apply this patch first:
> > > > > It introduces a memory leak (as it requests memory twice),
> > > > > but maybe we
> > > > > get an idea?
> > > > > The ia64 arch_get_unmapped_area() searches for memory from botto=
m
> > > > > (flags=3D0), while io_uring function tries top-down first.
> > > > > Maybe that's
> > > > > the problem. And I don't understand the offset_in_page() check r=
ight
> > > > > now.
> > > > >
> > > > > diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> > > > > index 3bca7a79efda..93b1964d2bbb 100644
> > > > > --- a/io_uring/io_uring.c
> > > > > +++ b/io_uring/io_uring.c
> > > > > @@ -3431,13 +3431,17 @@ static unsigned long
> > > > > io_uring_mmu_get_unmapped_area(struct file *filp,
> > > > > =A0=A0=A0=A0=A0 * can happen with large stack limits and large m=
map()
> > > > > =A0=A0=A0=A0=A0 * allocations.
> > > > > =A0=A0=A0=A0=A0 */
> > > > > +/* compare to arch_get_unmapped_area() in
> > > > > arch/ia64/kernel/sys_ia64.c */
> > > > > =A0=A0=A0=A0 addr =3D vm_unmapped_area(&info);
> > > > > -=A0=A0=A0 if (offset_in_page(addr)) {
> > > > > +printk("io_uring_mmu_get_unmapped_area() address 1 is:
> > > > > %px\n", addr);
> > > > > +=A0=A0=A0 addr =3D NULL;
> > > > > +=A0=A0=A0 if (!addr) {
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0 info.flags =3D 0;
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0 info.low_limit =3D TASK_UNMAPPED_BASE;
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0 info.high_limit =3D mmap_end;
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0 addr =3D vm_unmapped_area(&info);
> > > > > =A0=A0=A0=A0 }
> > > > > +printk("io_uring_mmu_get_unmapped_area() returns address
> > > > > %px\n", addr);
> > > > >
> > > > > =A0=A0=A0=A0 return addr;
> > > > > =A0}
> > > > >
> > > > >
> > > > > Another option is to disable the call to
> > > > > io_uring_nommu_get_unmapped_area())
> > > > > with the next patch. Maybe you could add printks() to ia64's
> > > > > arch_get_unmapped_area()
> > > > > and check what it returns there?
> > > > >
> > > > > @@ -3654,6 +3658,8 @@ static const struct file_operations
> > > > > io_uring_fops =3D {
> > > > > =A0#ifndef CONFIG_MMU
> > > > > =A0=A0=A0=A0 .get_unmapped_area =3D io_uring_nommu_get_unmapped_=
area,
> > > > > =A0=A0=A0=A0 .mmap_capabilities =3D io_uring_nommu_mmap_capabili=
ties,
> > > > > +#elif 0=A0=A0=A0 /* IS_ENABLED(CONFIG_IA64) */
> > > > > +=A0=A0=A0 .get_unmapped_area =3D NULL,
> > > > > =A0#else
> > > > > =A0=A0=A0=A0 .get_unmapped_area =3D io_uring_mmu_get_unmapped_ar=
ea,
> > > > > =A0#endif
> > > > >
> > > > > Helge
> > > >
> > > > Thanks Helge.=A0 Sample output from that first patch:
> > > >
> > > > [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area()
> > > > address 1 is: 1ffffffffff40000
> > > > [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area()
> > > > returns address 2000000001e40000
> > > > [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area()
> > > > address 1 is: 1ffffffffff20000
> > > > [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area()
> > > > returns address 2000000001f20000
> > > > [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area()
> > > > address 1 is: 1ffffffffff30000
> > > > [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area()
> > > > returns address 2000000001f30000
> > > > [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area()
> > > > address 1 is: 1ffffffffff90000
> > > > [Wed Jul 12 13:09:50 2023] io_uring_mmu_get_unmapped_area()
> > > > returns address 2000000001f90000
> > > >
> > > > This pattern seems to be pretty stable, I tried instead just
> > > > directly returning the result of a call to
> > > > arch_get_unmapped_area() at the end of the function and it seems
> > > > similar:
> > > >
> > > > [Wed Jul 12 13:27:07 2023] io_uring_mmu_get_unmapped_area()
> > > > would return address 1ffffffffffd0000
> > > > [Wed Jul 12 13:27:07 2023] but arch_get_unmapped_area() would
> > > > return address 2000000001f00000
> > > > [Wed Jul 12 13:27:07 2023] io_uring_mmu_get_unmapped_area()
> > > > would return address 1ffffffffff00000
> > > > [Wed Jul 12 13:27:07 2023] but arch_get_unmapped_area() would
> > > > return address 1ffffffffff00000
> > > > [Wed Jul 12 13:27:07 2023] io_uring_mmu_get_unmapped_area()
> > > > would return address 1fffffffffe20000
> > > > [Wed Jul 12 13:27:07 2023] but arch_get_unmapped_area() would
> > > > return address 2000000002000000
> > > > [Wed Jul 12 13:27:07 2023] io_uring_mmu_get_unmapped_area()
> > > > would return address 1fffffffffe30000
> > > > [Wed Jul 12 13:27:07 2023] but arch_get_unmapped_area() would
> > > > return address 2000000002100000
> > > >
> > > > Is that enough of a clue to go on?
> > >
> > > SHMLBA on ia64 is 0x100000:
> > > arch/ia64/include/asm/shmparam.h:#define=A0=A0=A0=A0=A0=A0=A0 SHMLBA=
=A0 (1024*1024)
> > > but the values returned by io_uring_mmu_get_unmapped_area() does not
> > > fullfill this.
> > >
> > > So, probably ia64's SHMLBA isn't pulled in correctly in
> > > io_uring/io_uring.c.
> > > Check value of this line:
> > >  =A0=A0=A0=A0info.align_mask =3D PAGE_MASK & (SHMLBA - 1UL);
> > >
> > > You could also add
> > > #define SHM_COLOUR=A0 0x100000
> > > in front of the
> > >  =A0=A0=A0=A0#ifdef SHM_COLOUR
> > > (define SHM_COLOUR in io_uring/kbuf.c too).
> >
> > What is the value of PAGE_SIZE and "ptr" on your machine?
> > For 4k page size I get:
> > SHMLBA -1   ->        FFFFF
> > PAGE_MASK   -> FFFFFFFFF000
> > so,
> > info.align_mask =3D PAGE_MASK & (SHMLBA - 1UL) =3D 0xFF000;
> > You could try to set nfo.align_mask =3D 0xfffff;
> >
> > Helge
>
> Using 64KiB (65536) PAGE_SIZE here.  64-bit pointers.
>
> Tried both #define SHM_COLOUR 0x100000, as well and info.align_mask =3D
> 0xFFFFF, but both of them made the problem change from 100% reproducible=
, to
> intermittent.
>
> After inspecting the ouput I observed that it hangs only when the first
> allocation returns an address below 0x2000000000000000, and the second
> returns an address above it.  When both addresses are above it, it does =
not
> hang.  Examples:
>
> When it works:
> $ cmake --version
> cmake version 3.26.4
>
> CMake suite maintained and supported by Kitware (kitware.com/cmake).
> $ dmesg --color=3Dalways -T | tail -n 4
> [Wed Jul 12 20:32:37 2023] io_uring_mmu_get_unmapped_area() would return
> address 1fffffffffe20000
> [Wed Jul 12 20:32:37 2023] but arch_get_unmapped_area() would return add=
ress
> 2000000002000000
> [Wed Jul 12 20:32:37 2023] io_uring_mmu_get_unmapped_area() would return
> address 1fffffffffe50000
> [Wed Jul 12 20:32:37 2023] but arch_get_unmapped_area() would return add=
ress
> 2000000002100000
>
>
> When it hangs:
> $ cmake --version
> cmake version 3.26.4
>
> CMake suite maintained and supported by Kitware (kitware.com/cmake).
> ^C
> $ dmesg --color=3Dalways -T | tail -n 4
> [Wed Jul 12 20:33:12 2023] io_uring_mmu_get_unmapped_area() would return
> address 1ffffffffff00000
> [Wed Jul 12 20:33:12 2023] but arch_get_unmapped_area() would return add=
ress
> 1ffffffffff00000
> [Wed Jul 12 20:33:12 2023] io_uring_mmu_get_unmapped_area() would return
> address 1fffffffffe60000
> [Wed Jul 12 20:33:12 2023] but arch_get_unmapped_area() would return add=
ress
> 2000000001f00000
>
> Is io_uring_mmu_get_unmapped_area supported to always return addresses a=
bove
> 0x2000000000000000?

Yes, with the patch below.

> Any reason why it is not doing so sometimes?

It depends on the parameters for vm_unmapped_area(). Specifically
info.flags=3D0.

Try this patch:

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 3bca7a79efda..b259794ab53b 100644
=2D-- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -3429,10 +3429,13 @@ static unsigned long io_uring_mmu_get_unmapped_are=
a(struct file *filp,
 	 * A failed mmap() very likely causes application failure,
 	 * so fall back to the bottom-up function here. This scenario
 	 * can happen with large stack limits and large mmap()
-	 * allocations.
+	 * allocations. Use bottom-up on IA64 for correct aliasing.
 	 */
-	addr =3D vm_unmapped_area(&info);
-	if (offset_in_page(addr)) {
+	if (IS_ENABLED(CONFIG_IA64))
+		addr =3D NULL;
+	else
+		addr =3D vm_unmapped_area(&info);
+	if (!addr) {
 		info.flags =3D 0;
 		info.low_limit =3D TASK_UNMAPPED_BASE;
 		info.high_limit =3D mmap_end;

Helge
