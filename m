Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E6837AD63
	for <lists+linux-ia64@lfdr.de>; Tue, 11 May 2021 19:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhEKRxK (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 11 May 2021 13:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbhEKRxI (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 11 May 2021 13:53:08 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00A5C06138A
        for <linux-ia64@vger.kernel.org>; Tue, 11 May 2021 10:52:01 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id r11so9065618edt.13
        for <linux-ia64@vger.kernel.org>; Tue, 11 May 2021 10:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vvtm8n5cG3jzsceNHvZusZOhtfG69GGyP0C0zXimiGg=;
        b=H0AsqdZCMhypi9/Qd7/1eUPAVczkGpwzNdPrEzyRmHk3+xGYRUzHdDlO2l4ucRTL8I
         6IkWY+o747IONKRbHjInbulgo0QHOF+Aog+9sCymBmOTGkGLMG+u9jruv/UZbKRmL6Hs
         djJGJfy02eav+9cJ/e8taZvmfCdpWKwopL9l1L00vGTndNfe8I1Ba0qFSrrwJA5o7Fa2
         kypHmxkIMZ4AZTUMiSVLWlzzQG450CuwCzyuG27tqQfsnYHhRA1T87hFThJfEPtkcb4Y
         ue4D2yBkATCGXbxXcVfdq4bXxs/UCpwDO9F00VAa9ugcnvVl8Xt3EZbMRGFEais4Tdh5
         EGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vvtm8n5cG3jzsceNHvZusZOhtfG69GGyP0C0zXimiGg=;
        b=mtOdKs//3s0plekNh9KpLFgwaluBnFoUz2z4anm7RJQ5vCUKj9OXN+VsCFqNrzQ2EE
         p4YCLnyCJqHnAZIl5Rr1Ne8PwCq+s2pp3BPcPcFWL+t1mvnMABtyrOpHO8Yb5IfmrAX5
         Dxnfy/TFFIfLR/kKNHWI7FuWnWL/xf4MHnfXXtM0NIT4PRyIaLCVpQwRjHPxCngf9rdO
         8p3O5JbRwfmuWqUVun9yy3dDGsPSe9y1PQN5iOgjUn4Zr699drS42RsNyfSuTqZkCFgp
         MJfI+SAzl9l7xHJPFURiQmr/BZA70BZsGSRqPbwC+FSPTM3SBCWuCq96tzbplB3eUXjo
         H6Mg==
X-Gm-Message-State: AOAM532HpBYQTJM2yQZZCHfgfjBSB0laiECxivvq4+hdr0AudMOkKo4Q
        MAQ3U0q6wzklahqyfyEMH27bqJx7aLnMQteGCH5c
X-Google-Smtp-Source: ABdhPJwdWMqdXYacKcJJowhKXF8ZQ0FIAVm666XBBWORfGjqUYLRbHiBohY3kurt7w0lB0ANXSdmCBIBLwgMolCf7vo=
X-Received: by 2002:a50:ed0c:: with SMTP id j12mr37675663eds.12.1620755519859;
 Tue, 11 May 2021 10:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619811762.git.rgb@redhat.com> <bda073f2a8b11000ef40cf8b965305409ee88f44.1619811762.git.rgb@redhat.com>
 <CAHC9VhShi4u26h5OsahveQDNxO_uZ+KgzGOYEp5W7w6foA-uKg@mail.gmail.com> <20210511171356.GN3141668@madcap2.tricolour.ca>
In-Reply-To: <20210511171356.GN3141668@madcap2.tricolour.ca>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 11 May 2021 13:51:48 -0400
Message-ID: <CAHC9VhQ9DgiMKScTt5xfyK25WM-KPUrFksFS7dH51u0+PemPLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] audit: replace magic audit syscall class numbers
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

On Tue, May 11, 2021 at 1:14 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> On 2021-05-10 21:23, Paul Moore wrote:
> > On Fri, Apr 30, 2021 at 4:36 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Replace audit syscall class magic numbers with macros.
> > >
> > > This required putting the macros into new header file
> > > include/linux/auditscm.h since the syscall macros were included for both 64
> > > bit and 32 bit in any compat code, causing redefinition warnings.
> >
> > The ifndef/define didn't protect against redeclaration?  Huh.  Maybe
> > I'm not thinking about this correctly, or the arch specific code is
> > doing something wonky ...
> >
> > Regardless, assuming that it is necessary, I would prefer if we called
> > it auditsc.h instead of auditscm.h; the latter makes me think of
> > sockets and not syscalls.
>
> The "m" was for "macros", since there are auditsc bits in audit.h as
> well, but I have no significant objection.

Yes, I figured as much, but my comment about it looking like a socket
"thing" still stands.  I'm open to other ideas if you don't like
auditsc.h, I just don't like auditscm.h.

-- 
paul moore
www.paul-moore.com
