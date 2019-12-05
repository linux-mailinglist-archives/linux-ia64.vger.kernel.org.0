Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B29E211438F
	for <lists+linux-ia64@lfdr.de>; Thu,  5 Dec 2019 16:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbfLEP3u (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 5 Dec 2019 10:29:50 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53941 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfLEP3u (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 5 Dec 2019 10:29:50 -0500
Received: by mail-wm1-f66.google.com with SMTP id n9so3804016wmd.3
        for <linux-ia64@vger.kernel.org>; Thu, 05 Dec 2019 07:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cP+oM3NA7KncqmbMbjVli5611B4S2UpI7p/XGvy4+VM=;
        b=ABix7BZQE6/oBKIKzeq9oQL81G5DErroX9yrN0/xNE9ctYSu1ppRCD8sQMK77lOdts
         Mfr15V5jwVQ2rcMIcysM2MiH6VZLtLggMq0L0SRa1qBRPmMnHNXiOVbnOHvMqyCmHKRo
         6FOfi054BSOc5EOTe54VmuigHJSnbORH6oTtwGSAZ62YJOXkuowcArCg5VWS+hry7iqA
         BYAUeO6RGrCTf9WYI7VME/NZ8tbhZ9ObrWccYrSxw8c/16qUUnKIE2p4AArXHFhDovwA
         2FRNRjaSfG+YETDxzNHli16KZ1Pf0ZSSGdK2F/Pi7gjD94kcwr4bWPw9FAao/PFHNcVh
         925A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cP+oM3NA7KncqmbMbjVli5611B4S2UpI7p/XGvy4+VM=;
        b=HdZhxvNuvtBTCfu8+ABK69nlUxIIM92VpLxj5EBu99QByCFtLTWEUiqaol7s15xTpd
         S9OAW5ap/N3QTaLZVD/Sw9KBtKCpaEUSnebTZFfvu3ZSXW/SLGMOIIAuOPfl/kbxTNUy
         BX73WMPA4v6q6tPIwe18Od7jJ7gMPYCxxATTlczbz5VWUmeQ0HCS1dkXK8FFHwCiZGWu
         XyMElFHBprN8MzGjFjVK4z+DcnrYhYxIHVnvxQpb4wLIGsLmWqEAUK1WKlIYD9cIxA8h
         db38LJEIIRmXleHP22rm4FQvJ968onkXzKsQ9pWMpuwMrWk/MLZOJjEyCUgO+pVnDaH3
         RmNw==
X-Gm-Message-State: APjAAAWGf0xS+tAJ6LpNxzXkJq8FDMhQz/sb0L45EWFqWlMTaIXrJhgC
        iZOb+RlWb4HR8lGWbf8MBH6ygQ==
X-Google-Smtp-Source: APXvYqwg7r5WIGyCZhCUyuc9pK/Q411mfTgj34TL5oqoEJcHF0kVbf5N6U5FZZj3N86LNm+WlNwMbQ==
X-Received: by 2002:a1c:61d7:: with SMTP id v206mr5704907wmb.13.1575559788631;
        Thu, 05 Dec 2019 07:29:48 -0800 (PST)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id z64sm176283wmg.30.2019.12.05.07.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 07:29:47 -0800 (PST)
Date:   Thu, 5 Dec 2019 16:29:45 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     David Airlie <airlied@redhat.com>
Cc:     airlied <airlied@linux.ie>, arnd@arndb.de, fenghua.yu@intel.com,
        "KH, Greg" <gregkh@linuxfoundation.org>,
        "Luck, Tony" <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] agp: minor fixes, does the maintainer still there
 ?
Message-ID: <20191205152945.GB10549@Red>
References: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
 <20191202133254.GA21550@Red>
 <CAMwc25obOebugXGSNVWd1bjPN+tR82wwFJ6PgqnvZXK4O6xAFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMwc25obOebugXGSNVWd1bjPN+tR82wwFJ6PgqnvZXK4O6xAFw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, Dec 03, 2019 at 06:01:15AM +1000, David Airlie wrote:
> On Mon, Dec 2, 2019 at 11:33 PM LABBE Corentin <clabbe@baylibre.com> wrote:
> >
> > On Thu, Nov 21, 2019 at 08:14:40AM +0000, Corentin Labbe wrote:
> > > Hello
> > >
> > > This patch serie fixes some minor problem found in the agp subsystem
> > > There are no change since v1 (posted two years ago)
> > > This is simply a repost for trying to get an answer (gentle ping 6 month
> > > ago got no answer also).
> > >
> > > Regards
> > >
> >
> > Hello
> >
> > Does the AGP maintainer still maintain it ?
> 
> It's maintained but really loathe to touch it, I've no hw to validate
> any changes on so making any changes to it really has to get past my
> internal, I care enough about this change to risk applying anything to
> AGP.
> 
> I'll try and look and apply those patches today.
> 

Thanks for applying.
Perhaps you need to fix your address in MAINTAINERS.

When you has hardware, What was your tests procedure ?
I can on my freetime add some AGP hw on my kernelCI lab.

Regards
