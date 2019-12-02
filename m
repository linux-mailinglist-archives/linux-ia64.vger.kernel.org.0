Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 668C610F13D
	for <lists+linux-ia64@lfdr.de>; Mon,  2 Dec 2019 21:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbfLBUBa (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 2 Dec 2019 15:01:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48668 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727586AbfLBUBa (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 2 Dec 2019 15:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575316889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zacL8ZwUfm9ACoXwRxpaHO5nNuk5Pt/tAg3zBrg+MDU=;
        b=Bjh72seb3j1rMvuQ5JS2tkSRAVd3ozJVfkqzai+H52rdFjAQ4rrPsHoYD++kH/QsFuUAKV
        X6P91qNX1OaKYFQAZK5pP7TSUsgZFSZBPz0Kg/kSAoQWriYL/7MXQjA7/mODuBWJi5FSRN
        097Hjf/P1eayRgsarhwDKa+SP7xIDRc=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-zQ8IskdzNzSNkNOTqa0KMQ-1; Mon, 02 Dec 2019 15:01:28 -0500
Received: by mail-ot1-f70.google.com with SMTP id z13so274679otp.7
        for <linux-ia64@vger.kernel.org>; Mon, 02 Dec 2019 12:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ijUXKcWVOy6uyc+9TN1aIhkDvnkVi2DmgHGgcMYXyg8=;
        b=Tm7EOc2hng3/lodzwOzG17n7DD72eoqgxKWrcVKAMKjLGKGAqAWQ7N3JEavFf0rXqS
         FsGTgc/ZOPB7kAkdTeu/jj5Jxjj7n2Rge5xBXEYGJ2NBNKVUOmaX9wUivzhQZVXAAuKw
         eQTlf+MVGBWNZD32H7vO6BQVJ4ce6b3QwGT9LpXWw0rOcR+1HWOLm5n1RJ0/inp6JVMQ
         +aMS02S+uQopfkhAsJkT16HeKf6mUuEs3WLOSpi3DnejgGd12mZfzKUmG/tIrVx7sl9L
         PMrAvHmCGZh5GCJM5kA8SepfTSMLc5SZG0royMw4eXDNMMqZSLvjD8RxAJHrk+2iLzDP
         Gzrw==
X-Gm-Message-State: APjAAAUyEwBobi9t4THPmR6Dxnn39XyM8Vp9Cfg7qczovupFU/CvEVNc
        o8diO75nn1tOGsbSDtnPr9xDOmwWbnJO5bj+TftjsJpq6njkheuzCjxlY0++lqxNnEIhkdY0WL8
        k88yHF827CrocJ6kH0nq/UB0EDOX+gy6WohHaeg==
X-Received: by 2002:a9d:6842:: with SMTP id c2mr587962oto.336.1575316887648;
        Mon, 02 Dec 2019 12:01:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqyMdBme1c9WpgSFSgNXAIaU6jfbxGCDDzMLm0j7YrB0Sco90y06wXmXOeN/FpJHGpZ/O6xcsvuz4LhYjQo9Iu8=
X-Received: by 2002:a9d:6842:: with SMTP id c2mr587947oto.336.1575316887450;
 Mon, 02 Dec 2019 12:01:27 -0800 (PST)
MIME-Version: 1.0
References: <1574324085-4338-1-git-send-email-clabbe@baylibre.com> <20191202133254.GA21550@Red>
In-Reply-To: <20191202133254.GA21550@Red>
From:   David Airlie <airlied@redhat.com>
Date:   Tue, 3 Dec 2019 06:01:15 +1000
Message-ID: <CAMwc25obOebugXGSNVWd1bjPN+tR82wwFJ6PgqnvZXK4O6xAFw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] agp: minor fixes, does the maintainer still there ?
To:     LABBE Corentin <clabbe@baylibre.com>
Cc:     airlied <airlied@linux.ie>, arnd@arndb.de, fenghua.yu@intel.com,
        "KH, Greg" <gregkh@linuxfoundation.org>,
        "Luck, Tony" <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
X-MC-Unique: zQ8IskdzNzSNkNOTqa0KMQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, Dec 2, 2019 at 11:33 PM LABBE Corentin <clabbe@baylibre.com> wrote:
>
> On Thu, Nov 21, 2019 at 08:14:40AM +0000, Corentin Labbe wrote:
> > Hello
> >
> > This patch serie fixes some minor problem found in the agp subsystem
> > There are no change since v1 (posted two years ago)
> > This is simply a repost for trying to get an answer (gentle ping 6 mont=
h
> > ago got no answer also).
> >
> > Regards
> >
>
> Hello
>
> Does the AGP maintainer still maintain it ?

It's maintained but really loathe to touch it, I've no hw to validate
any changes on so making any changes to it really has to get past my
internal, I care enough about this change to risk applying anything to
AGP.

I'll try and look and apply those patches today.

Dave.

