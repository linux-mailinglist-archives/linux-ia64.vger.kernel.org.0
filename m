Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D39BEB4414
	for <lists+linux-ia64@lfdr.de>; Tue, 17 Sep 2019 00:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387579AbfIPWh6 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 16 Sep 2019 18:37:58 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45264 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733128AbfIPWh6 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 16 Sep 2019 18:37:58 -0400
Received: by mail-lf1-f68.google.com with SMTP id r134so1195461lff.12
        for <linux-ia64@vger.kernel.org>; Mon, 16 Sep 2019 15:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VRn5HcZzB9Q4jnvsA0lcFqxUY28FwWaAGyxtJnfaHmY=;
        b=Z7wlGQRBQo1fXCVt7PuDypJ7dXomiILTPoOEozJ/zJzxx97XG7li/gpDQhKa3VlohG
         jbO1rem9dkUOE3pOqyIIQ87+tKZavPfyZUOWwyaXBcTMpGDaPmojxDVoQ9w4K1oj2rWJ
         K8vengtAujiyuc9SQOdLFfunFkD8ng9iy+JQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VRn5HcZzB9Q4jnvsA0lcFqxUY28FwWaAGyxtJnfaHmY=;
        b=XZF/tPO+V8818DfPOC9GxR4mw9o6A8VOj4U2A8IxwlpL+n+DNn+CS+arqdud8eOzer
         i63rwh+V79E4uTOPm792vJ3eod0CAAG8Z9PbLqfhLzouwsTMI8n2fpzuxAeJLWcjJQVN
         u1+VjqP33lkpOTL7XyIJsk8XpqcMjoOMGcw+uelJQKxs9moiFWp99CxCgNDb5VOMV3Mr
         C7x/3H0TPPg1ak3gR0A2NVLpsBa9DcXEGMlOcAuSf6GNxiHGR/WJYsG72IE0DF4KqCL6
         QZt5aOshLnPTd9QNZarta1m5VIc+ZOZt8RTSo5K/VQU7PIxl7efi5U2cXuvOseWrpqKa
         3DPg==
X-Gm-Message-State: APjAAAXJxGFvdQli9n1/3tbhhrunbLqzzIfrXEn9QPyym0kcpZGtjxaa
        QUb9yTYvqId5pjhGMT1fRZ/3O7FweEk=
X-Google-Smtp-Source: APXvYqytWBjYDmjQ7hsNNCDL+0nuTmPJu5DYEd/EaBefyxsbwUbvAHTECzusFANleUkVEn/BUgDzjA==
X-Received: by 2002:ac2:446a:: with SMTP id y10mr276413lfl.96.1568673475602;
        Mon, 16 Sep 2019 15:37:55 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id h9sm26993lfp.40.2019.09.16.15.37.54
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2019 15:37:54 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id q11so1209012lfc.11
        for <linux-ia64@vger.kernel.org>; Mon, 16 Sep 2019 15:37:54 -0700 (PDT)
X-Received: by 2002:a19:7d55:: with SMTP id y82mr284873lfc.106.1568673474197;
 Mon, 16 Sep 2019 15:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190916154903.GA18169@agluck-desk2.amr.corp.intel.com>
In-Reply-To: <20190916154903.GA18169@agluck-desk2.amr.corp.intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 16 Sep 2019 15:37:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj9uPRcTPVDh4O73n6xX0KdYTTO=FrQC4iWsrF4WWeFQw@mail.gmail.com>
Message-ID: <CAHk-=wj9uPRcTPVDh4O73n6xX0KdYTTO=FrQC4iWsrF4WWeFQw@mail.gmail.com>
Subject: Re: [GIT PULL] ia64 changes for v5.4
To:     "Luck, Tony" <tony.luck@intel.com>
Cc:     linux-ia64@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, Sep 16, 2019 at 8:49 AM Luck, Tony <tony.luck@intel.com> wrote:
>
> big change here is removal of support for SGI Altix
>
>  231 files changed, 349 insertions(+), 40676 deletions(-)

.. and the remaining ia64 code now doesn't need the odd IO coherency
contortions, right? That was all SN?

              Linus
