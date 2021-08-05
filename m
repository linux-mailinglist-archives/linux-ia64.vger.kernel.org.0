Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDAC3E1E44
	for <lists+linux-ia64@lfdr.de>; Fri,  6 Aug 2021 00:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbhHEWCR (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 5 Aug 2021 18:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbhHEWCP (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 5 Aug 2021 18:02:15 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DF7C06179A
        for <linux-ia64@vger.kernel.org>; Thu,  5 Aug 2021 15:01:59 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id f13so10397197edq.13
        for <linux-ia64@vger.kernel.org>; Thu, 05 Aug 2021 15:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c3urkHLQm5QwJdZ9O5/+QqeYs/qIDb1LdTwMX8UuIJo=;
        b=Y9dxhU40Cp8veCcp+fcPVCm4ifcChrN1zCWT6snRwiYjugw4bnQknql6Al6HruhkGh
         hRr2EK3dfowDwcLy/91ol0zhq75r4GYw/0FGGfHCvI9pwgM/NBpebJBtEgcpxjZPzh7X
         6Qb4mLJ2AkRFR7FJQcLLLzFC1VGLUVsRMVl3aLy6lBeo2Y7pxZfomIrU+VomHL3c87QG
         q3wIiaH3OeaFpPWo49uBcSya0/hSPyR98ZBBjPRupyhM1wN8h8eCnG23kWHKYe5oxTOx
         ekDzNhD/GOj4/cx6e4T7C6fCiv+h+myJcrv4/jTtK0HBwN5TieASVgvaRp9YnmbuiQXC
         4KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c3urkHLQm5QwJdZ9O5/+QqeYs/qIDb1LdTwMX8UuIJo=;
        b=dyuIis+Pu/Kyj2vfVl5euMU7Jw+p5HRtZDqv7YDSRsQEotkIZ4d3XJo8/2dU5+cy2Z
         OUIWYjbXLV7pKFOnubR/Cgri7PvmYN7ooec3SlO2hQxcjU4Qgrhha8OTxlpMjgSY7pjE
         yg3v4BjEUv5Qga4PTooaiJjpRk4MX3Y6jt7xhbgAK7uti4ykHsZtqTzVW9erc95PD/7n
         febC79d//pIIWDQ3WZ05RvqwY+2f7MidnW9pPWbWfvsQJbQEkXzxbE8h1YYw4NSRkMKS
         VVR4eKVboQXc90zGdz4WUKpJJptz+XIlP+SAVk0csqPJzHtayhnAxHksDICPk5ne9JFh
         l7ZA==
X-Gm-Message-State: AOAM532obqDCjSkq9mpzsqanJJXhRiJVhRMLe41fuUFx/i5+tT0QDBy5
        /gj5Mj2DNPUX67DByI005vwkRfr2T+dzaEmT2nO7
X-Google-Smtp-Source: ABdhPJyUIiWYAz6aUFc6MPvieEo2GUkchlv7WYU/OChfOMJj/dkrDY3GEEK87ConDlVxbwRyeX2EW3ZWABWXQS8VcSk=
X-Received: by 2002:a05:6402:b83:: with SMTP id cf3mr9240826edb.12.1628200918472;
 Thu, 05 Aug 2021 15:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621363275.git.rgb@redhat.com> <2300b1083a32aade7ae7efb95826e8f3f260b1df.1621363275.git.rgb@redhat.com>
In-Reply-To: <2300b1083a32aade7ae7efb95826e8f3f260b1df.1621363275.git.rgb@redhat.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 5 Aug 2021 18:01:47 -0400
Message-ID: <CAHC9VhRDYYOpUvCkcWw=2a_P0AJxtA5N5y_Kj5PAG-0BQ02COQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] audit: replace magic audit syscall class numbers
 with macros
To:     Richard Guy Briggs <rgb@redhat.com>
Cc:     Linux-Audit Mailing List <linux-audit@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>,
        Steve Grubb <sgrubb@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Eric Paris <eparis@redhat.com>, x86@kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        Aleksa Sarai <cyphar@cyphar.com>,
        Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, May 19, 2021 at 4:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Replace audit syscall class magic numbers with macros.
>
> This required putting the macros into new header file
> include/linux/auditsc_classmacros.h since the syscall macros were
> included for both 64 bit and 32 bit in any compat code, causing
> redefinition warnings.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Link: https://lore.kernel.org/r/2300b1083a32aade7ae7efb95826e8f3f260b1df.1621363275.git.rgb@redhat.com
> ---
>  MAINTAINERS                         |  1 +
>  arch/alpha/kernel/audit.c           |  8 ++++----
>  arch/ia64/kernel/audit.c            |  8 ++++----
>  arch/parisc/kernel/audit.c          |  8 ++++----
>  arch/parisc/kernel/compat_audit.c   |  9 +++++----
>  arch/powerpc/kernel/audit.c         | 10 +++++-----
>  arch/powerpc/kernel/compat_audit.c  | 11 ++++++-----
>  arch/s390/kernel/audit.c            | 10 +++++-----
>  arch/s390/kernel/compat_audit.c     | 11 ++++++-----
>  arch/sparc/kernel/audit.c           | 10 +++++-----
>  arch/sparc/kernel/compat_audit.c    | 11 ++++++-----
>  arch/x86/ia32/audit.c               | 11 ++++++-----
>  arch/x86/kernel/audit_64.c          |  8 ++++----
>  include/linux/audit.h               |  1 +
>  include/linux/auditsc_classmacros.h | 23 +++++++++++++++++++++++
>  kernel/auditsc.c                    | 12 ++++++------
>  lib/audit.c                         | 10 +++++-----
>  lib/compat_audit.c                  | 11 ++++++-----
>  18 files changed, 102 insertions(+), 71 deletions(-)
>  create mode 100644 include/linux/auditsc_classmacros.h

...

> diff --git a/include/linux/auditsc_classmacros.h b/include/linux/auditsc_classmacros.h
> new file mode 100644
> index 000000000000..18757d270961
> --- /dev/null
> +++ b/include/linux/auditsc_classmacros.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* auditsc_classmacros.h -- Auditing support syscall macros
> + *
> + * Copyright 2021 Red Hat Inc., Durham, North Carolina.
> + * All Rights Reserved.
> + *
> + * Author: Richard Guy Briggs <rgb@redhat.com>
> + */
> +#ifndef _LINUX_AUDITSCM_H_
> +#define _LINUX_AUDITSCM_H_
> +
> +enum auditsc_class_t {
> +       AUDITSC_NATIVE = 0,
> +       AUDITSC_COMPAT,
> +       AUDITSC_OPEN,
> +       AUDITSC_OPENAT,
> +       AUDITSC_SOCKETCALL,
> +       AUDITSC_EXECVE,
> +
> +       AUDITSC_NVALS /* count */
> +};
> +
> +#endif

My apologies Richard, for some reason I had it in my mind that this
series was waiting on you to answer a question and/or respin; however,
now that I'm clearing my patch queues looking for any stragglers I see
that isn't the case.  Looking over the patchset I think it looks okay
to me, my only concern is that "auditsc_classmacros.h" is an awfully
specific header file name and could prove to be annoying if we want to
add to it in the future.  What do you think about something like
"audit_arch.h" instead?

If that change is okay with you I can go ahead and do the rename while
I'm merging the patches, I'll consider it penance for letting this
patchset sit for so long :/

-- 
paul moore
www.paul-moore.com
