Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12DA1135B5
	for <lists+linux-ia64@lfdr.de>; Wed,  4 Dec 2019 20:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbfLDT26 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 4 Dec 2019 14:28:58 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36036 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbfLDT25 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 4 Dec 2019 14:28:57 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so645824ljg.3
        for <linux-ia64@vger.kernel.org>; Wed, 04 Dec 2019 11:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4V71s2LwlDpeSd+Z0KwAdRRtxbu47+DI0vfAf9c1tMM=;
        b=EcWy8sE2dADlsxEZqijPBeOko0SDeA4QPSJARWvVAIahLRX4t5ZNCinnHYVRfU29c4
         3HKs5OiXCFqB0SNaExXB1XD2VCR6RFH3eX29G+Unp7ZdTAFTSDBNTero87IN9zkZCNZ0
         x8F6V33r3l/TWCYZ3CpIZ+wTHnij581TOvM2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4V71s2LwlDpeSd+Z0KwAdRRtxbu47+DI0vfAf9c1tMM=;
        b=Knk+oYLJsqUXPAYWHMUqjiGMXtrFP9u61mF4fT8/xNU99NAUzTbvBlz1ZkDGhm/q1+
         9YdBl4dlFyGHzIodz6z708mQrWlu+iyI/+834f+cEx8MM4xSrsdMCjOcEWPhVKtQvMcA
         cBDQIjIc2vdALn5wJE8fI5RB2frxf18EIEEEZgQ2mRFbuflXds5DC5k5Hdfk8cBkc4Ya
         KrQ0hRrB80D6hz8KSlWjkf9WVu67R7UliSReIdxb55W0l7LEy0afvGfoKUhgZ4rccwRV
         VWDzTEI2fr9BnMPss5yLjvJQenJW6EY041mrJ53htCNhHUr5oemnmH6uypKyB4WhpG9C
         H2zQ==
X-Gm-Message-State: APjAAAWM/+RV+9t5Ke4exT606NiriQDYRklDPFhWYGH1jSXQ8SlZDflV
        eFgleAZCnJeISjiWxr0R4hyN1BPGpLE=
X-Google-Smtp-Source: APXvYqzU7uyRGjE1BJpnRhPseu+ai+CKsVb+ZpOdFRxCJjbOs6X9TYh1ZacPV5zqKMzmKII/HX86lw==
X-Received: by 2002:a05:651c:1059:: with SMTP id x25mr3105960ljm.255.1575487735379;
        Wed, 04 Dec 2019 11:28:55 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 206sm3823922lfb.20.2019.12.04.11.28.54
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2019 11:28:54 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id v201so453776lfa.11
        for <linux-ia64@vger.kernel.org>; Wed, 04 Dec 2019 11:28:54 -0800 (PST)
X-Received: by 2002:a19:4351:: with SMTP id m17mr3208962lfj.61.1575487734106;
 Wed, 04 Dec 2019 11:28:54 -0800 (PST)
MIME-Version: 1.0
References: <20191204182327.GA17103@agluck-desk2.amr.corp.intel.com>
In-Reply-To: <20191204182327.GA17103@agluck-desk2.amr.corp.intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 4 Dec 2019 11:28:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgxtj=azB6odLFG-oaKm6aKjM26iPhNLdkKpvUvqWiaWw@mail.gmail.com>
Message-ID: <CAHk-=wgxtj=azB6odLFG-oaKm6aKjM26iPhNLdkKpvUvqWiaWw@mail.gmail.com>
Subject: Re: [GIT PULL] ia64 changes for v5.5
To:     "Luck, Tony" <tony.luck@intel.com>
Cc:     linux-ia64@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Wed, Dec 4, 2019 at 10:23 AM Luck, Tony <tony.luck@intel.com> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git tags/please-pull-misc-5.5

I note that you didn't get a pr-tracker-bot reply because this was
only sent to me and the ia64 list. And apparently the ia64 list isn't
being tracked by the pr-bot (maybe it's not in lore? Should it be?).

So here's a random manual pull request ack - and a reminder to make
sure you cc lkml or ask for ia64 to be tracked on lore to actually get
the reliable automated ones.

                Linus
