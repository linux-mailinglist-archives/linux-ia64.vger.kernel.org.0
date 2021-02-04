Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A9830EEC5
	for <lists+linux-ia64@lfdr.de>; Thu,  4 Feb 2021 09:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234946AbhBDIpS (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 4 Feb 2021 03:45:18 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:40957 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234834AbhBDIpR (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 4 Feb 2021 03:45:17 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1l7aFc-000Vhr-IL; Thu, 04 Feb 2021 09:44:32 +0100
Received: from p5b13a4ea.dip0.t-ipconnect.de ([91.19.164.234] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1l7aFc-000sdM-BB; Thu, 04 Feb 2021 09:44:32 +0100
Subject: Re: [PATCH] efi: ia64: move IA64-only declarations to new asm/efi.h
 header
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-efi <linux-efi@vger.kernel.org>, linux-ia64@vger.kernel.org,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
References: <20210118124913.1555-1-ardb@kernel.org>
 <f32b7560-4de4-79bb-a2e2-4edcb2a9d475@physik.fu-berlin.de>
 <CAMj1kXGMzrrEnNfv-cf+fG3snSMDuud48tX1pEZKst9jODkiQw@mail.gmail.com>
 <294348ae-c87a-3bc1-3593-e0c7982fe7d7@physik.fu-berlin.de>
 <CAMj1kXEOR5d7Hva7_=RkaoZw9A3ZBe-6otAL-C9YvL7FHe9+NQ@mail.gmail.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <f8252e56-41ab-e89d-93bf-972cf0bc100b@physik.fu-berlin.de>
Date:   Thu, 4 Feb 2021 09:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXEOR5d7Hva7_=RkaoZw9A3ZBe-6otAL-C9YvL7FHe9+NQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.164.234
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 2/4/21 9:40 AM, Ard Biesheuvel wrote:
> Actually, I have already sent this patch via the EFI tree, and it is
> already in -next.

OK, I'll test it nonetheless and report back.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

