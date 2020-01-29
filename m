Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4633114C949
	for <lists+linux-ia64@lfdr.de>; Wed, 29 Jan 2020 12:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgA2LKA (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 29 Jan 2020 06:10:00 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:41234 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbgA2LKA (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 29 Jan 2020 06:10:00 -0500
Received: by mail-qv1-f65.google.com with SMTP id s7so2124349qvn.8
        for <linux-ia64@vger.kernel.org>; Wed, 29 Jan 2020 03:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Rdg0eRE4Rs/tOFVa1nKjmhUlRl2NKOMw55LDI32OSOc=;
        b=VJ8O0yAWe2cXlzCT1mNhPcxqqFeCKhkmfpyAWfq4oYf0VFJ3BC4CHwckKloSIN0EXg
         v5DJKr5FfAbivbt4bmiixvzRDbgAX4zdyDY3Z7zJENEidZcJ7qqrRNPRT7y2J7WlkuAW
         ewW0RwL5VtfuLoAx485pn8lnifxaC15SKUc8607bIEelaurpzyi5k7hkoO7yxuV3yb4d
         hRnFShBFGIfDCfAPvTiAO0yxsNG/bViMXer6WnGqfUy8ySyDKJC0Q4H5WpZ3O51VPBPp
         7I+z1htSl8yn6YxMeGxxXZDeFn0jXFFJZ2cfPzD73Zg0RLbASOFkEZ8dO14ZZO1X4gAp
         ELnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Rdg0eRE4Rs/tOFVa1nKjmhUlRl2NKOMw55LDI32OSOc=;
        b=sPXtRQ2dyKQm7jbrF4Zwv4qG27aFAIy2n0wv0aEYmzNO7Bt2r7YgWYxoTGjWJw8Aew
         APvPh8mRl22jUSMFozB/zYl59Cnbk4RdDGoWaUVaR/KITrBXYlaSTLFXDsFuMLjVR+Y8
         8Jo4mlGy8Mm4CNYEeHmqA844JL1HeBoJ7GB0QxAeugWf8IQh+goYq62sTqvdazb52Ae2
         NC9lc2sf8cLM9fw9WsWaHb/Vsdh/juITMigr5OAkryg+oqUl3qJ0Q+eT2Kt1H41mdpUU
         wHvbgUuLQ7RuwAuSPipmGxA6yCH4+UUB8g46LQPWSCgDXrnzYGAd3pu6jKk31M+Euicm
         b8YA==
X-Gm-Message-State: APjAAAUXcf5596cQuVxsvzoDH3ou1rfM26ix4iyhPatEvfxM6IC4xtNU
        tkRk+9v5finWUArmK9FOskSTjA==
X-Google-Smtp-Source: APXvYqwSo4IdEjgBam29nZ7sdiS8q0FjVa1Z465Vm5JMHa3pbBcFWxe+wcLkVFwcg7WF0RMbdVCuCg==
X-Received: by 2002:a0c:9d4f:: with SMTP id n15mr22120161qvf.194.1580296199181;
        Wed, 29 Jan 2020 03:09:59 -0800 (PST)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id v7sm882184qtk.89.2020.01.29.03.09.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jan 2020 03:09:58 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
From:   Qian Cai <cai@lca.pw>
In-Reply-To: <20200129103640.GA668562@arrakis.emea.arm.com>
Date:   Wed, 29 Jan 2020 06:09:56 -0500
Cc:     Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
        linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        James Hogan <jhogan@kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Michal Hocko <mhocko@kernel.org>,
        Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
        sparclinux@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        linux-s390@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Vlastimil Babka <vbabka@suse.cz>,
        the arch/x86 maintainers <x86@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        Steven Price <Steven.Price@arm.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org,
        Kees Cook <keescook@chromium.org>,
        Anshuman Khandual <Anshuman.Khandual@arm.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Mark Brown <broonie@kernel.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Thomas Gleixner <tglx@linutronix.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <50B7EFFE-1FF0-4B16-84A1-D851052B18B4@lca.pw>
References: <20200128174709.GK655507@arrakis.emea.arm.com>
 <69091BA4-18C4-4425-A5E2-31FBE4654AF9@lca.pw>
 <20200129103640.GA668562@arrakis.emea.arm.com>
To:     Catalin Marinas <catalin.marinas@arm.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org



> On Jan 29, 2020, at 5:36 AM, Catalin Marinas <catalin.marinas@arm.com> =
wrote:
>=20
> On Tue, Jan 28, 2020 at 02:07:10PM -0500, Qian Cai wrote:
>> On Jan 28, 2020, at 12:47 PM, Catalin Marinas =
<catalin.marinas@arm.com> wrote:
>>> The primary goal here is not finding regressions but having clearly
>>> defined semantics of the page table accessors across architectures. =
x86
>>> and arm64 are a good starting point and other architectures will be
>>> enabled as they are aligned to the same semantics.
>>=20
>> This still does not answer the fundamental question. If this test is
>> simply inefficient to find bugs,
>=20
> Who said this is inefficient (other than you)?

Inefficient of finding bugs. It said only found a bug or two in its =
lifetime?

>=20
>> who wants to spend time to use it regularly?=20
>=20
> Arch maintainers, mm maintainers introducing new macros or assuming
> certain new semantics of the existing macros.
>=20
>> If this is just one off test that may get running once in a few years
>> (when introducing a new arch), how does it justify the ongoing cost =
to
>> maintain it?
>=20
> You are really missing the point. It's not only for a new arch but
> changes to existing arch code. And if the arch code churn in this area
> is relatively small, I'd expect a similarly small cost of maintaining
> this test.
>=20
> If you only turn DEBUG_VM on once every few years, don't generalise =
this
> to the rest of the kernel developers (as others pointed out, this test
> is default y if DEBUG_VM).

Quite the opposite, I am running DEBUG_VM almost daily for regression
workload while I felt strongly this thing does not add any value mixing =
there.

So, I would suggest to decouple this away from DEBUG_VM, and clearly
document that this test is not something intended for automated =
regression
workloads, so those people don=E2=80=99t need to waste time running =
this.

>=20
> Anyway, I think that's a pointless discussion, so not going to reply
> further (unless you have technical content to add).
>=20
> --=20
> Catalin

