Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 469811FD8C
	for <lists+linux-ia64@lfdr.de>; Thu, 16 May 2019 03:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfEPBul (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 15 May 2019 21:50:41 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:42924 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbfEPBom (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 15 May 2019 21:44:42 -0400
Received: by mail-lf1-f41.google.com with SMTP id y13so1260796lfh.9
        for <linux-ia64@vger.kernel.org>; Wed, 15 May 2019 18:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sQY3GaIoHlYaFrbjAui7Jyn3niJMZqzq1cIL7giNQUY=;
        b=dl62eSQihhMgJEdvBIWPejiCMdRDxott63IAnyeRSkp6BUvHdGB6N9uPVZFwOhM9DG
         yyyxlgy4cvZr66c7aK9EFlHpSa/hx7qcbWlpbnkQinzFD0p8WUjPN87R9jKu7r/CNcKw
         Qcz/c167Y0THV4LmPr3lRcfy1ycpxGZ2l/Yu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sQY3GaIoHlYaFrbjAui7Jyn3niJMZqzq1cIL7giNQUY=;
        b=ZlEtucGqTQw6jVaG/sQF2DUXOzPd+lRYGX8KIWb9J0XMIxCKbB/69tJfOryyhaIQrm
         pPpo38acvAv1KKHvlycwCDBkTaH2AJmphqvDD/gAitgnM/SFpvRaZKe91OVx/K6mS3+7
         x5bx2hl10uCinERTFbZW5i+Z1j0jyjhCek7EHK68awobVIq86aHTaSVfYwZtKBh3kF+X
         3rF0uPLr9YFASmtmJsQ+NV58owXPCukPLD7FyZaX3hO/ke4fvhnpdnZ3CHMuUGyG78HM
         5igf5iD3sWMi0ZtgjdBXGrNGpXPbpGYnNURBIp5k922/IcBSSeQJXDGulXfpLkCNr/Fz
         1v9g==
X-Gm-Message-State: APjAAAUQvcSr7eu7aBpFQGqYkelskx5/vroytICn/RtZNtTEb1Ug/FOK
        FbCsLxtzagMYt0bib/ZPSCNRj7gJZk4=
X-Google-Smtp-Source: APXvYqzj5vO6DNr5ZORs6uXjmlrF8ox/bdbq/UbciQRtt6vnMbqThXT3TotgaQFfX/HH18KmnThp/g==
X-Received: by 2002:a19:4811:: with SMTP id v17mr16070899lfa.10.1557971080597;
        Wed, 15 May 2019 18:44:40 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id q65sm115880lje.42.2019.05.15.18.44.39
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 18:44:39 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id h19so1552243ljj.4
        for <linux-ia64@vger.kernel.org>; Wed, 15 May 2019 18:44:39 -0700 (PDT)
X-Received: by 2002:a2e:5c1:: with SMTP id 184mr14810604ljf.94.1557971079311;
 Wed, 15 May 2019 18:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190516010414.30623-1-tony.luck@intel.com>
In-Reply-To: <20190516010414.30623-1-tony.luck@intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 15 May 2019 18:44:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgLK+FzuS-7QfaeZQnF8ZXiqHpf8Zh3e6L+Ve+zO5fKHQ@mail.gmail.com>
Message-ID: <CAHk-=wgLK+FzuS-7QfaeZQnF8ZXiqHpf8Zh3e6L+Ve+zO5fKHQ@mail.gmail.com>
Subject: Re: [PATCH: Linus please apply] ia64: Make sure that we have a mmiowb
 function real early
To:     Tony Luck <tony.luck@intel.com>
Cc:     linux-ia64@vger.kernel.org, Will Deacon <will.deacon@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, May 15, 2019 at 6:04 PM Tony Luck <tony.luck@intel.com> wrote:
>
> Statically initialize the mmiowb field of machvec so that we
> won't die with a call through a NULL pointer. This should be
> safe because we do the real initialization of machvec before
> bringing up any addtional CPUs or doing any I/O.

Thanks, applied.

            Linus
