Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF54C243F8B
	for <lists+linux-ia64@lfdr.de>; Thu, 13 Aug 2020 22:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgHMUAL (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 13 Aug 2020 16:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbgHMUAK (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 13 Aug 2020 16:00:10 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75777C061757
        for <linux-ia64@vger.kernel.org>; Thu, 13 Aug 2020 13:00:10 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x5so5683635wmi.2
        for <linux-ia64@vger.kernel.org>; Thu, 13 Aug 2020 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=MDY4VR7sk8ivVZRv1+DZoU7fYwncB9DP7kIqn5ZnsBg=;
        b=e0fgTlM6T+JTHANbqOxXPMp9rlQ3z4KQDIuuirFfVsMQ7PVnu7NTmlAREr8eoljjXE
         7B0q1E2Yp6MkMarfcl53zvH5nyJiW36+jH0nyicHNgQDfN/5sCJCVFSDtdAoY8luFQQL
         9L6bT7d8zWP8OAoLjDP1r1OmltskiwVhtmSx6gXpZKmm+2Xo+xJUAgPDQKKqDWtf9GYv
         SMSUNPz9nJzcY6DzdWCgad8o4iYXEu3O4xDMAlbpgGmePc0NStT1PHxR7CyK8hUbOv50
         toqZdewWZ543o1MGXJqzNKurGTbE+kmBEDZX9LTTmMNhCnfT6cEABybYq3zWIR/GbrzD
         kdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=MDY4VR7sk8ivVZRv1+DZoU7fYwncB9DP7kIqn5ZnsBg=;
        b=ZfArWw8gYuYjTq65u67IHIKvl78C26fwGLDYg971/6YPkho4u63dL7hlobIHQy1Eoz
         FT+ZA3hbVlkIjbNZ/0utZO0XwRXqzQePPfO+U6Xpo7itkGliFOB+RYEm8sBWkVeDayke
         w77tJ4ultnfICGhYXcQe7Aem9V2kPZB+P/dKG6K8iLpAWre2dDxmjBwT0A8mtNQaH6Zi
         OjPt6CU4llQ1QN3eggPBqv2GFKmOIZVUuYoyzzjXXDT64nTCLRhSiLnMtJwC3vyr7xQL
         +aVrkplqZN+464pLBeIkt3U8DlNHggIx90m9s39plH4xUTyfx86Ic+QJ5CwV4hFH/gr3
         i1Tg==
X-Gm-Message-State: AOAM531yLVh2N1mNJK5GcLlUTqZkokBkKUh7jnfu6dGwqmzDIIbFhpMK
        Z7T3Wr7qUDCkrMnhncY0FdvUMw==
X-Google-Smtp-Source: ABdhPJyhcLy1FCYgiQmcz7z4M8mlGqUkzYi5Efs3zlqP71Ury2zPANaNiOuuxSVAMQ48O41+XPj8og==
X-Received: by 2002:a1c:14e:: with SMTP id 75mr6140187wmb.151.1597348808202;
        Thu, 13 Aug 2020 13:00:08 -0700 (PDT)
Received: from [192.168.149.251] (trinity-students-nat.trin.cam.ac.uk. [131.111.193.104])
        by smtp.gmail.com with ESMTPSA id t11sm10358708wrs.66.2020.08.13.13.00.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2020 13:00:07 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v4] arch/ia64: Restore arch-specific pgd_offset_k
 implementation
From:   Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20200813195129.5099-1-rppt@kernel.org>
Date:   Thu, 13 Aug 2020 21:00:06 +0100
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        Anatoly Pugachev <matorola@gmail.com>,
        Sergei Trofimovich <slyfox@gentoo.org>, linux-mm@kvack.org,
        Frank Scheiner <frank.scheiner@web.de>,
        Mike Rapoport <rppt@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4BAE916F-BC99-4CE8-9A9B-266AC69CF346@jrtc27.com>
References: <20200813195129.5099-1-rppt@kernel.org>
To:     Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 13 Aug 2020, at 20:51, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> From: Jessica Clarke <jrtc27@jrtc27.com>
>=20
> IA-64 is special and treats pgd_offset_k() differently to =
pgd_offset(),
> using different formulae to calculate the indices into the kernel and =
user
> PGDs.  The index into the user PGDs takes into account the region =
number,
> but the index into the kernel (init_mm) PGD always assumes a =
predefined
> kernel region number. Commit 974b9b2c68 ("mm: consolidate pte_index() =
and
> pte_offset_*() definitions") made IA-64 use a generic pgd_offset_k() =
which
> incorrectly used pgd_index() for kernel page tables.  As a result, the
> index into the kernel PGD was going out of bounds and the kernel hung
> during early boot.
>=20
> Allow overrides of pgd_offset_k() and override it on IA-64 with the =
old
> implementation that will correctly index the kernel PGD.
>=20
> Fixes: 974b9b2c68 ("mm: consolidate pte_index() and pte_offset_*() =
definitions")
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>=20
> Changes since v3:
> * Correct commit message as Jessica suggested

I also corrected the comment to:

/*
 * In the kernel's mapped region we know everything is in region number =
5, so
 * as an optimisation its PGD already points to the area for that =
region.
 * However, this also means that we cannot use pgd_index() and we must
 * never add the region here.
 */

> Changes since v2:
> * Rephrase commit message and comment about pgd_offset_k()
>=20
> Changes since v1:
> * Fixed typo in commit message
> * Slightly reworded commit message to sound less weird
> * Included Adrian's Tested-by
>=20
>=20
> arch/ia64/include/asm/pgtable.h | 9 +++++++++
> include/linux/pgtable.h         | 2 ++
> 2 files changed, 11 insertions(+)
>=20
> diff --git a/arch/ia64/include/asm/pgtable.h =
b/arch/ia64/include/asm/pgtable.h
> index 10850897a91c..6ef501cd0166 100644
> --- a/arch/ia64/include/asm/pgtable.h
> +++ b/arch/ia64/include/asm/pgtable.h
> @@ -366,6 +366,15 @@ pgd_index (unsigned long address)
> }
> #define pgd_index pgd_index
>=20
> +/*
> + * In the kernel's mapped region we know everything is in region =
number 5, so
> + * as an optimisation its PGD already points to the area for that =
region.
> + * However, this also means that we cannot use pgd_index() and we =
never
> + * should add the region here.
> + */
> +#define pgd_offset_k(addr) \
> +	(init_mm.pgd + (((addr) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1)))
> +
> /* Look up a pgd entry in the gate area.  On IA-64, the gate-area
>    resides in the kernel-mapped segment, hence we use pgd_offset_k()
>    here.  */
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index a124c21e3204..e8cbc2e795d5 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -117,7 +117,9 @@ static inline pgd_t *pgd_offset_pgd(pgd_t *pgd, =
unsigned long address)
>  * a shortcut which implies the use of the kernel's pgd, instead
>  * of a process's
>  */
> +#ifndef pgd_offset_k
> #define pgd_offset_k(address)		pgd_offset(&init_mm, (address))
> +#endif
>=20
> /*
>  * In many cases it is known that a virtual address is mapped at PMD =
or PTE
> --=20
> 2.26.2
>=20

