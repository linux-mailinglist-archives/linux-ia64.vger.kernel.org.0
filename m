Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA732CBB7
	for <lists+linux-ia64@lfdr.de>; Tue, 28 May 2019 18:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfE1QVR (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 28 May 2019 12:21:17 -0400
Received: from mail-lf1-f51.google.com ([209.85.167.51]:34307 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbfE1QVQ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 28 May 2019 12:21:16 -0400
Received: by mail-lf1-f51.google.com with SMTP id v18so15092837lfi.1
        for <linux-ia64@vger.kernel.org>; Tue, 28 May 2019 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h/2hyxWaURZSdXJ20o8fMO6qgKY60fQ7HRDPc3iVbj4=;
        b=PBZIobVgDtGH3TnIcTCJfanLxhvL4n5blj4f+SsT3Z4EmSnDrrFT44CBc8gw4XhpLT
         2ltr5P4wJA+lyEiu98Y+nY1z104tMkHvblNz9AIIAqQorDtkr0JVQuZ/aPzSN4Ou0Loy
         9w5Lu2BIkSuzNH7KTqi14A1CyyBA/+5fiB7dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h/2hyxWaURZSdXJ20o8fMO6qgKY60fQ7HRDPc3iVbj4=;
        b=V3Z0PPHtje23JoPOg5/Z/N0o+P3JDrAPML4kuuz9mPW8vhTzcLf7E57CThfrX6I+9r
         Z/7yXrl2zTzyQijtFI5xC7f86rayTRgw16M9LdBwyujX6X/z9R9OIOgVtrN4CHjbvRsU
         4iaYmvWM+USOCZHwC5VnTP/rRjLQpR3CLu5TtzcX2fQ/jWOM/4T4p5jNTyLul4hGAjPH
         FNwfwTMG4cttQAHZVAqqErD0YzP5PwCA38vUKx4fPfz4KZ1uYNtyg/n6+hw+jN65HTOD
         pkeskcyG/+yEiuUDtaOIspvpYsk30RmPBV+ZJKuhWEj4hGNtOs+QhxrOHadCG7VB/HVk
         wqNA==
X-Gm-Message-State: APjAAAWnCvB9EmFq0HynUKU0OJgw45DzDpBOEQpJq38+fqwwriudwgVL
        fuBwryXCofybvF56TQP+vsEMsQCqAnQ=
X-Google-Smtp-Source: APXvYqzqwFfCZ2sAcR6YD0I3X5Ns/b5FITiYshIm1vkcp22db9/d7HH/MMmmxCJYXqMN0TZFsL6tGw==
X-Received: by 2002:a19:218b:: with SMTP id h133mr2468134lfh.151.1559060474428;
        Tue, 28 May 2019 09:21:14 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id r11sm2985592ljd.91.2019.05.28.09.21.13
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:21:13 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id v18so15092742lfi.1
        for <linux-ia64@vger.kernel.org>; Tue, 28 May 2019 09:21:13 -0700 (PDT)
X-Received: by 2002:a19:a408:: with SMTP id q8mr2788022lfc.79.1559060472897;
 Tue, 28 May 2019 09:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190528161430.27697-1-tony.luck@intel.com>
In-Reply-To: <20190528161430.27697-1-tony.luck@intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 28 May 2019 09:20:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=whaNQSnV3Mv_-T8jLmPeHQUTZieg+ZYhyUufW4wrPymfw@mail.gmail.com>
Message-ID: <CAHk-=whaNQSnV3Mv_-T8jLmPeHQUTZieg+ZYhyUufW4wrPymfw@mail.gmail.com>
Subject: Re: [PATCH - Linus please apply] ia64: fix build errors by exporting paddr_to_nid()
To:     Tony Luck <tony.luck@intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kbuild test robot <lkp@intel.com>,
        linux-ia64@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, May 28, 2019 at 9:14 AM Tony Luck <tony.luck@intel.com> wrote:
>
> Fix build errors on ia64 when DISCONTIGMEM=y and NUMA=y by
> exporting paddr_to_nid().

Applied.

Just out of curiosity, what caused this error? It doesn't _look_ new,
just judging from the patch itself. Is this just a configuration that
nobody has noticed before, or something else that changed that caused
it to happen now?

                Linus
