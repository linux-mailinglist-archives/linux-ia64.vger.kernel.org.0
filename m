Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1154D30ACDC
	for <lists+linux-ia64@lfdr.de>; Mon,  1 Feb 2021 17:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbhBAQkT (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 1 Feb 2021 11:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbhBAQj5 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 1 Feb 2021 11:39:57 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4330CC061573
        for <linux-ia64@vger.kernel.org>; Mon,  1 Feb 2021 08:39:17 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 18D044CD5;
        Mon,  1 Feb 2021 16:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 18D044CD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1612197514; bh=TGcSUf0lCQ/GM/YUezjDHkafUZeyat41vsY8Hj++jkg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Yh0fwv3K0P8h3SG0LzNHciGTxfpgLBfNn9yB9DDKBoxe+GdVHVmPumFTch1ksK4ba
         kML0ESzaPWelGX4/OnZZFrl2sbQUx+0dn/mKXCTnn+8Bc559lND6a5RqF+VZsZr0r/
         erO9UfHXOVdfKGUg+N5DBg1KvlH8L7xGRK1uPXg71RLkmaIUjP3tg/3BC1mw9smsMh
         GcuiFGEtUlUlWpPf7HalQNXOmfGhASLHc9+hkKIP/3YmQtHvtnb5moF0GiJj7QuguB
         LZ3B7KwVHhugY3X+YaH16oafpoyuA6cZqdQfAwd0DGlxpL2a2wei0U3g6Pg1jiH5aE
         HcRFQ0XvPvW6Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] kbuild: remove PYTHON variable
In-Reply-To: <20210201010024.654526-1-masahiroy@kernel.org>
References: <20210201010024.654526-1-masahiroy@kernel.org>
Date:   Mon, 01 Feb 2021 09:38:33 -0700
Message-ID: <87r1lzvj3q.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> Python retired in 2020, and some distributions do not provide the
> 'python' command any more.
>
> As in commit 51839e29cb59 ("scripts: switch explicitly to Python 3"),
> we need to use more specific 'python3' to invoke scripts even if they
> are written in a way compatible with both Python 2 and 3.
>
> This commit removes the variable 'PYTHON', and switches the existing
> users to 'PYTHON3'.
>
> BTW, PEP 394 (https://www.python.org/dev/peps/pep-0394/) is a helpful
> material.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

So this will have the effect of making the docs build impossible for
folks who only have Python 2.  As I said before, this is a step that we
knew was coming, we just hadn't decided on the exact timing - I guess
this decides for us :)

That said, I'll copy linux-doc to see if anybody screams.  I assume this
is a 5.12 change?

Thanks,

jon

