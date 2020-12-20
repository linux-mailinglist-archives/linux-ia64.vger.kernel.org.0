Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D05762DF66C
	for <lists+linux-ia64@lfdr.de>; Sun, 20 Dec 2020 19:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgLTSON (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 20 Dec 2020 13:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbgLTSOM (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 20 Dec 2020 13:14:12 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9B6C061282
        for <linux-ia64@vger.kernel.org>; Sun, 20 Dec 2020 10:13:30 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id u203so6915798ybb.2
        for <linux-ia64@vger.kernel.org>; Sun, 20 Dec 2020 10:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=yfL3TwphQwDcJhO7xWNmfz/2nOVjoLHCH1WzVlQxeDc=;
        b=Waw9MU0KIrWS6Rgq2xqOarmW9VIAU5bvP9hFCtOu2L2PsoUj9gQU9VZqAl2+UqLA8c
         F0TgF/pSg3q/0eLRcg1UhZ1AEEPh2/cmS39IAsFVz5Svh2naWn4bsLVbpyQsy9y77WUP
         7j3w5lSpxOE/S57v8gGu0kJ8liZYcZPleLDD8cYQBi+49OYMDk6uFVNCBe8OhKQe4hjS
         EU0yXhuIPO/jERt4GZEXoc6PKC4MPv6kBGAqBaPcM6bcls0WBDu2HYjb5m2CmuwCfBT5
         mzCcEfADUwZwad4WEioKJogbmX7Htxp1O1o95866NJaoEpQ+pGOPuia2mNJ+5MUsuMUL
         YIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=yfL3TwphQwDcJhO7xWNmfz/2nOVjoLHCH1WzVlQxeDc=;
        b=rWhg4XXuL9sX6xPQbeAEAL3g8Uf9HCAkwT9e0bz0nWICbHzdbqeY362f6yqxhS6s0z
         01OtLEtyc8Ie1WZLnOzmq77QqwIdGBJDJ8h+mfXXmMsxJ/uCHmvOIvqSPD9cE85xVj+W
         xCVYXGPdfE9Pzwanrjyg3bplSkAStyo9Gh1Hkodfa409aUtbStfjJOyawxBQedkbHawX
         VFOkdPs2dNzIzmFSsSFxHt20p9F+JixH9NRmolesIG+zn/OcXA7Z3yjnixzMF+TYhGF3
         e/8g1OwgQJo31U6yPp9Rc65P3uA9Gge01vBFlg9tATFSP++m0YVgPhXTu93zQXOc6bRh
         typw==
X-Gm-Message-State: AOAM533F0OLqEeyZHj6hm7BMJQHnzcsLVJBJNbGuBVwUb7fUExO/CiND
        DppCzbcxFp1pJDp/mEc+mQOxQbvJRnzO+nyjB7M80HFt4R6Z4g==
X-Google-Smtp-Source: ABdhPJxSeGPqM/HtegROiJN7gZaG9G6M3Sf3KlJFiy/ArqIz/OmAghjHA5Rtue9grano8UuOK/enjn3c6dirJwy3mZU=
X-Received: by 2002:a25:9d8d:: with SMTP id v13mr18384700ybp.81.1608488009195;
 Sun, 20 Dec 2020 10:13:29 -0800 (PST)
MIME-Version: 1.0
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Sun, 20 Dec 2020 21:13:18 +0300
Message-ID: <CADxRZqwfMr9==xFQaaEOk7jYVoROEEyQ_12KpBCtwL3SXoCM-A@mail.gmail.com>
Subject: where to start with ia64 kernel
To:     linux-ia64@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hello!

I have Integrity BL870c i4 blade installed with debian sid, somewhat
working 4.15/4.14.x kernel series...

4.16.x kernel (and more recent ones, including latest git) does not boot ...
tried to bisect (but some kernel revisions does not even compile - git
bisect skip).

Does it make sense to try to start reporting bugs and hangs with ia64
4.x kernel series, being 5.10 is out...

Or can you please suggest what to do with this machine kernel?

Thanks.
