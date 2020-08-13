Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55AC9243F33
	for <lists+linux-ia64@lfdr.de>; Thu, 13 Aug 2020 21:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgHMTM3 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 13 Aug 2020 15:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgHMTM3 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 13 Aug 2020 15:12:29 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A39C061757
        for <linux-ia64@vger.kernel.org>; Thu, 13 Aug 2020 12:12:28 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c80so5587722wme.0
        for <linux-ia64@vger.kernel.org>; Thu, 13 Aug 2020 12:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=W/BIFbceizggg/9lDLKGKhKgYUcVEubo8er0W9HlrdA=;
        b=D87RVrJ7KnrOkyzYyqFKdURL4929QTtBzYnToNk7NR5QPJt84BDlCP+R1EOKwzWLmX
         fkmOhCnhg1/p4COpYq++qVCz4KLBscgyEJCSIRFTGMiCVkRTUhuMwlGe0vfW1tjFeKoL
         xuCGbq+GrbJSibt4mSXqUHPfEC8a+iFMHlpYKusLzHSYJsnNC66Xo5TgmNfqkGcysw5D
         NnXhHkyK/o1XpkUWCec/BdnrWwhjXIg6dIlolMe8y9xTe5pR7LKpHhmP8DbPgPU8MdV5
         x3Bs03cSpZSUZeyOqWiu7Muf/MGTl6GI2CZXH+fXDmAMpizA4zHPcg1IxjI3mf1pwQZw
         WqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=W/BIFbceizggg/9lDLKGKhKgYUcVEubo8er0W9HlrdA=;
        b=sAPsKntfeqPDBcFRAdMgxcQGGR59DO9xbr6Rs4vCXnVrKLyffX9rUy3SVByDmd2MUT
         T5FiP+PU+G3WK+Ou79bCIB7Hp2PXIcdhP1lYpAV/KdjbNAVpe10WKZrP3vEWOIlTMCEQ
         4SqnGUTlhH0gGzDZqYWBXzJ6oiW4wor4qWkwEFY/ufkqWZ9+r8xCSxD8SV8qlUgs20nz
         3P/VFFiXhcxDmUHABZr307RIOuAhoIv4VPxK+MixM9pVnOhUdvyPPZrI978jeqFk+iC4
         lu13at8BugOMoU3tg0+oCDlllkhnGzPnSXIPZ4KWuW5Z1sCrsBv7oHdRW4lc2b9QsKz/
         z/VA==
X-Gm-Message-State: AOAM533Tmk2G81ZfDNm+uuE2tZwIkmcWdenYERIiQFdePWYZFirMzsm0
        f74mut/sSRCDpUKopDrrIiItHOe2Jr5jug==
X-Google-Smtp-Source: ABdhPJws7/mYcdD3+LaGIFQyuOxkURrDb40pMS1U/qpeFEMtmcC3KqAt0FqUudbkDZ2k0ECvtstVmA==
X-Received: by 2002:a1c:bc54:: with SMTP id m81mr5943864wmf.73.1597345947663;
        Thu, 13 Aug 2020 12:12:27 -0700 (PDT)
Received: from [192.168.149.251] (trinity-students-nat.trin.cam.ac.uk. [131.111.193.104])
        by smtp.gmail.com with ESMTPSA id i14sm14062427wrc.19.2020.08.13.12.12.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2020 12:12:26 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v3] arch/ia64: Restore arch-specific pgd_offset_k
 implementation
From:   Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20200813190546.4788-1-rppt@kernel.org>
Date:   Thu, 13 Aug 2020 20:12:25 +0100
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        Anatoly Pugachev <matorola@gmail.com>,
        Sergei Trofimovich <slyfox@gentoo.org>, linux-mm@kvack.org,
        Frank Scheiner <frank.scheiner@web.de>,
        Mike Rapoport <rppt@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <13B46F16-1E82-4E15-8F6B-E8C24D6800AA@jrtc27.com>
References: <20200813190546.4788-1-rppt@kernel.org>
To:     Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 13 Aug 2020, at 20:05, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> From: Jessica Clarke <jrtc27@jrtc27.com>

Given this commit is being attributed to me please apply these =
grammatical
fixes (and tweaks) to your wording, as well as a technical correction.

(I have not re-wrapped, for easier diffing, and due to my laziness)

> IA-64 is special and treats pgd_offset_k() differently from =
pgd_offset() by
> using different formulas to calculate index into kernel and user PGD
> tables. The index into user PGDs takes into account the region number
> and the index into the kernel (init_mm) PGD always presumes predefined
> kernel region number. Commit 974b9b2c68 ("mm: consolidate pte_index()
> and pte_offset_*() definitions") made IA-64 to use generic
> pgd_offset_k() which wrongly used pgd_index() for user page tables. As
> the result, the index into kernel PGD was going out of bounds and the
> kernel hang during early boot.
>=20
> Allow overrides of pgd_offset_k() and use an override on IA-64 with =
the
> old implementation that will correctly index kernel PGD.

IA-64 is special and treats pgd_offset_k() differently to pgd_offset(),
using different formulae to calculate the indices into the kernel and =
user PGDs.
The index into the user PGDs takes into account the region number,
but the index into the kernel (init_mm) PGD always assumes a predefined
kernel region number. Commit 974b9b2c68 ("mm: consolidate pte_index()
and pte_offset_*() definitions") made IA-64 use a generic
pgd_offset_k() which incorrectly used pgd_index() for kernel page =
tables. As
a result, the index into the kernel PGD was going out of bounds and the
kernel hung during early boot.

Allow overrides of pgd_offset_k() and override it on IA-64 with the
old implementation that will correctly index the kernel PGD.

> Fixes: 974b9b2c68 ("mm: consolidate pte_index() and pte_offset_*() =
definitions")
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
> Changes since v2:
> * Rephrase commit message and comment about pgd_offset_k()
>=20
> Changes since v1:
> * Fixed typo in commit message
> * Slightly reworded commit message to sound less weird
> * Included Adrian's Tested-by
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

/*
 * In the kernel's mapped region we know everything is in region number =
5, so
 * as an optimisation its PGD already points to the area for that =
region.
 * However, this also means that we cannot use pgd_index() and we must
 * never add the region here.
 */

Jess

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

