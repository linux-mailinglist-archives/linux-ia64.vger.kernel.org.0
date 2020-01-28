Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E95F14AFD7
	for <lists+linux-ia64@lfdr.de>; Tue, 28 Jan 2020 07:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgA1Gg7 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 28 Jan 2020 01:36:59 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:45057 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgA1Gg7 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 28 Jan 2020 01:36:59 -0500
Received: by mail-qv1-f65.google.com with SMTP id l14so5740322qvu.12
        for <linux-ia64@vger.kernel.org>; Mon, 27 Jan 2020 22:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=0abVuQRiEoEWLaCFKSSRqYpNWOPktE+d1wvOzU3Y5QQ=;
        b=dX5ri6JWeqf2OD9HUY9VaB/KwNs/qrzPVG/Mkk6o9PIOqw2H/gbYXWgmg5n/T9sQZi
         Iu9x9L3POLnl1YchVinwocuu9ounpYF8/kx5Kl6xkZvkINd+J3VgmAAsMM4XdNmOQpGF
         n/A6miYs2pl1z68bmOVHF16tPK0qb+EWBTpkY/wDARN4JMfLDfXWnSNw6qljowznZeLw
         nC2mDCu/xZdzLMzffrfLowRJu9L4pvo4bnAdA6EAug7bCreb8yqSCB9NBnvi8MDOIkJC
         NhZM5PfIKH0yrTiGcHzwETXhAcZRM4FxAKgtCYb9TW9qoZDA0+sfnlblbnN56jONvpa4
         1ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=0abVuQRiEoEWLaCFKSSRqYpNWOPktE+d1wvOzU3Y5QQ=;
        b=fuXc4H/Hc3FDwXp5gJtx5kfSNRt1ylNn+w/0ZjaIFPPEI5Z8VexnUhGa0Kz4lUC7kP
         A9BmoVrhijVu3g/eOr8JtpBFnGrf/TuKn/MpC18VuP+wjQR55+3r24GxEjrZdcbtOdYF
         bbyDJ3kZ7ku2X+q5WU+XxSu2N8DCVcI6oKCVo83t5coC23R0AF20GF9nbq5MKqUXgSzA
         K5fMqTB0atECXOL2n13ku4f8xgVfbyinzqB2aEOy7oCVQBgcSComHxIysKSLCG3YwZpj
         rcxV4FfF4PSsj405jH1213rWI3k7SXlftqR/+CJWYoa7H6BcjWQ0c9eIZWuuU7zAlfoK
         xnnQ==
X-Gm-Message-State: APjAAAWzd27rz6ofvTOnzAqiUbsvgBcMCMdVnlbp4YAUwFLV8AYtoo5h
        n2sWw83BzIH/CwL6ZWpcR2XTKg==
X-Google-Smtp-Source: APXvYqyOYFD97tfKGnmPwPmfp2w3pbVQzr1Mc0RjmsOaGaxOYR1oH4beASJJ2LsvEzXBpFE4wXV4hg==
X-Received: by 2002:a05:6214:1189:: with SMTP id t9mr20389607qvv.153.1580193418367;
        Mon, 27 Jan 2020 22:36:58 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id z126sm11703882qka.34.2020.01.27.22.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 22:36:57 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page table helpers
Date:   Tue, 28 Jan 2020 01:36:56 -0500
Message-Id: <F90DA0AA-4D27-4346-8D8D-D9A7871E2C07@lca.pw>
References: <115c187b-73ce-30b2-0694-999db1f2183b@c-s.fr>
Cc:     Anshuman Khandual <Anshuman.Khandual@arm.com>,
        Linux-MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
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
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <115c187b-73ce-30b2-0694-999db1f2183b@c-s.fr>
To:     Christophe Leroy <christophe.leroy@c-s.fr>
X-Mailer: iPhone Mail (17C54)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org



> On Jan 28, 2020, at 1:17 AM, Christophe Leroy <christophe.leroy@c-s.fr> wr=
ote:
>=20
> It is 'default y' so there is no much risk that it is forgotten, at least a=
ll test suites run with 'allyes_defconfig' will trigger the test, so I think=
 it is really a good feature.

This thing depends on DEBUG_VM which I don=E2=80=99t see it is selected by a=
ny defconfig. Am I missing anything?=
