Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA5A916E40
	for <lists+linux-ia64@lfdr.de>; Wed,  8 May 2019 02:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfEHAa1 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 7 May 2019 20:30:27 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41020 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbfEHAa1 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 7 May 2019 20:30:27 -0400
Received: by mail-ot1-f67.google.com with SMTP id g8so16747607otl.8
        for <linux-ia64@vger.kernel.org>; Tue, 07 May 2019 17:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aNugRNfI1NASCVQQotBkfUx3cjwsiA1TzUpe8ibe7ac=;
        b=gRIeqvWjXvHVuVEemJNJK8AS0nBpMXjQNbmZV9qOtFksOrHCfrqeuX/vrn0nS6wwxy
         kLfpormJ8YBe4ZEF9hNxd/IFXkViwzDXyjJ7SWlHab5fqkWfEG9z/QESkM0GYa14N37c
         lpNEiivZk/k4qPe6YXKCt/Usic/XxFC7BwQxcRPqPZt9yKca0JFbo8LULWWrbneDHmq+
         K8a2yddzszAkKsKQ3kY36HSo7YkWplePB3l48/W53IN9tPwuJM2Yv7wbC95njLsaoego
         6jh4lLkkJ43Um5WDoj3cd+7cCVtFpC4h2yUMlngnDEfXLG3iM/uPEArsgoY53kR9Wc3H
         DUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aNugRNfI1NASCVQQotBkfUx3cjwsiA1TzUpe8ibe7ac=;
        b=BwBQhevnaErtLRshfGEMdWRE53kU74IiFDkVihp8S22WT2Q95YW4Yuh4YlOcpYyDr5
         M2MdXYaz9PzjUcUvmf9Ck37qGVpjrQsT8ys+L2A7Y0akGzzuRpc8oO4fELUQh+bpwVP1
         QlgrZON4cu/gzHdGP1Lf7qmVN/cucfIAGCKk4oWigoahytuT/pXpKIwQ2nIfrNDZuXlI
         AkP+/tE348FGy/LlJiq4SiqoxM3JuyLcFTb49I6979BkhZKoniE2qJSt1jKjucrNKxqS
         DwYyg5MaKb7UaZD4gRBAZuZrfChebeYXV8uuGNr0NWUlvH5sVNDmNhFGbhEnu5RNoT5r
         o0LQ==
X-Gm-Message-State: APjAAAWmoYW2LCtsTQZBMhUHgOKUrXIt5qVTpWerQ4vNM+GZPZT07utl
        vHTcBs0BK89yHMbaZG+2LHBMIBI5qaaj2fa8AQJ7M07e
X-Google-Smtp-Source: APXvYqwnFUcfnqP6BFgjGKomJPr5yaMMCBD85pEk3++fjkl68hk/raq4PqQ7V3ysBstXCoK7LDo9wO4kaWYzTHhnX6M=
X-Received: by 2002:a9d:5cc1:: with SMTP id r1mr22059155oti.229.1557275426847;
 Tue, 07 May 2019 17:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com> <20190507183804.5512-9-david@redhat.com>
In-Reply-To: <20190507183804.5512-9-david@redhat.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 7 May 2019 17:30:15 -0700
Message-ID: <CAPcyv4hzpuApmKHhC6mHnE-RmiZ8Aspiv5wfd+Fs4QmaDsCJVw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] mm/memory_hotplug: Remove "zone" parameter from sparse_remove_one_section
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, May 7, 2019 at 11:39 AM David Hildenbrand <david@redhat.com> wrote:
>
> Unused, and memory unplug path should never care about zones. This is
> the job of memory offlining. ZONE_DEVICE might require special care -
> the caller of arch_remove_memory() should handle this.

The ZONE_DEVICE usage does not require special care so you can drop
that comment. The only place it's used in the subsection patches is to
lookup the node-id, but it turns out that the resulting node-id is
then never used.

With the ZONE_DEVICE mention dropped out of changelog you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
