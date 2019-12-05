Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44AEB1147DC
	for <lists+linux-ia64@lfdr.de>; Thu,  5 Dec 2019 20:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbfLETy6 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 5 Dec 2019 14:54:58 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50303 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729154AbfLETy6 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 5 Dec 2019 14:54:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575575698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bV8SWjNXtxP1IwqvIWSeZiIB97GtM4TrtLpqcXfhVJg=;
        b=g4ZtROh3KCtLtolSYtaR8pshQh0dOxyMV6sqBVzL2/uOtmLAYe2oAgBgt8Bez0yuuksqGy
        +8ZfyjGn9jvkP2Ja5idoumQcPxza2HPu3bgZ82izgxET6d6HJaouV0zkq/O1qfuyuUxz9P
        dC2RE7Z7/GeDpLXPpdPTYxmXjj4ajQ4=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-jXpVA8erO5G4NxolW6bpXQ-1; Thu, 05 Dec 2019 14:54:54 -0500
Received: by mail-oi1-f199.google.com with SMTP id u125so2289653oia.20
        for <linux-ia64@vger.kernel.org>; Thu, 05 Dec 2019 11:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bV8SWjNXtxP1IwqvIWSeZiIB97GtM4TrtLpqcXfhVJg=;
        b=toDXD1RL1iKmun8mkGyx92Ls/0+gMuCJpaNNDGsYKpkf/Bj7KKh2tOizJC+lwi5EuN
         eJ90t7kqoBtQmhYwX0gvX/UQN79WW0/ZJsORzNhlPDA1cm+9mCFSVtxsyV6OGjGpZptJ
         1IW0jTTujBiMyY3e7zG83QDZ7gNO8aO45avUtrt8RxbXS1uFL/Vs3WGBF1up+KELgVOC
         vKVc2Vj/Y3PWCdSE8HHjYzb7Issk47AnDvWKLYYHLukGgQebOH29x3bVygNevXiy0ai/
         IexKipQBLiONLDwue8BnDlAN1V3ulRrsh3KUXqStybmFyPuaISyp7E1Q42fWKuvbVh9J
         xq+A==
X-Gm-Message-State: APjAAAW3XOklUBXSacpsrFT3HJFw5ZxHtJXBQm7MMNmzkKUL5GF96ASu
        GYLpLNLl0/LlWVYOJpi+ToIOw7xoHqz52gol7aes0D1k4eZoEc8ZKA0u241rb3g+lSdiM8wq/vs
        LnwpMg6sg5ddOlwM91kbxCd6CmpkEMxcw3vTjaw==
X-Received: by 2002:a54:4817:: with SMTP id j23mr3134337oij.152.1575575694102;
        Thu, 05 Dec 2019 11:54:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOzQYeNXdptc6UzHvcsEGhlDRD2E6q9r2/6ID9yEOc8jYP3umcpWhaNl+JgiiamB6NrEbAhucmvBqn3sXc8tk=
X-Received: by 2002:a54:4817:: with SMTP id j23mr3134331oij.152.1575575693936;
 Thu, 05 Dec 2019 11:54:53 -0800 (PST)
MIME-Version: 1.0
References: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
 <20191202133254.GA21550@Red> <CAMwc25obOebugXGSNVWd1bjPN+tR82wwFJ6PgqnvZXK4O6xAFw@mail.gmail.com>
 <20191205152945.GB10549@Red>
In-Reply-To: <20191205152945.GB10549@Red>
From:   David Airlie <airlied@redhat.com>
Date:   Fri, 6 Dec 2019 05:54:42 +1000
Message-ID: <CAMwc25pgOx+_2NaJb4vb4bf_mvKD8QYfQAbP7TV2tRUa2yWjrw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] agp: minor fixes, does the maintainer still there ?
To:     LABBE Corentin <clabbe@baylibre.com>
Cc:     airlied <airlied@linux.ie>, arnd@arndb.de, fenghua.yu@intel.com,
        "KH, Greg" <gregkh@linuxfoundation.org>,
        "Luck, Tony" <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
X-MC-Unique: jXpVA8erO5G4NxolW6bpXQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

> Thanks for applying.
> Perhaps you need to fix your address in MAINTAINERS.
>
> When you has hardware, What was your tests procedure ?
Just boot and run gears type thing.

> I can on my freetime add some AGP hw on my kernelCI lab.
>

I don't know where to get AGP hw these days that isn't horrible power
consumption wise, I can't really wish for anyone to ever put it into
CI for an area that we change once a year.

I'd rather we just don't touch AGP too much and let it die and remove
support in 5-10 years.

Dave.

