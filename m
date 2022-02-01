Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8A24A59C3
	for <lists+linux-ia64@lfdr.de>; Tue,  1 Feb 2022 11:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236478AbiBAKRJ (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 1 Feb 2022 05:17:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42540 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236459AbiBAKRG (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 1 Feb 2022 05:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643710626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1rSMPibeU2/x9y1HGJmwIBX0MF6r0zdDZVn4ZSeYeqM=;
        b=BTJtMh/m9wI877MoJHJo8Ss1XH0a7PwVHOmxVkpkHjrxvMdSxPzz8ZscqYEXV3uEF4h7Nq
        JAbfc3pvCb0vO5IAiObiWenIWaQN7vCjMmb1ZSrYmeQUVRkIqULicGCQjO5sN+tCZd7zD+
        9kExqb8KeIhBd1T5B10BbJPp9h+gTdo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-AksghoeLOAGpFpX-38iQtg-1; Tue, 01 Feb 2022 05:17:05 -0500
X-MC-Unique: AksghoeLOAGpFpX-38iQtg-1
Received: by mail-wm1-f72.google.com with SMTP id c7-20020a1c3507000000b0034a0dfc86aaso1316403wma.6
        for <linux-ia64@vger.kernel.org>; Tue, 01 Feb 2022 02:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=1rSMPibeU2/x9y1HGJmwIBX0MF6r0zdDZVn4ZSeYeqM=;
        b=lt+mujnUoweQM6Z7ckPMfqF+DdMTM2YaoM+X3a3U9A+e3PAchBqwKvAPCtOFQqjaPT
         OIU9rNwEtnm1mNjhLo2MHjCQ8+LsEgK0Jh3tYi604YC64Ks0t6eooixI0iaW02jH569f
         vPWqFk5c46I905aCVBAuxUA4WVxg7wZRz7qnKVV1w29uLrZFotV8J7Ou/uEL42xK0eHj
         BLLcMqUBhNTf+C9wQUrDMMUDYnin9OBWUAXLgYsDDDAtfFz69fO8ykxdP8rbAtOPWfIZ
         Ygq5N6ZbrbddbwW00s7lOf9I9dYuZtL5XaWNE+7b/UZ6QXEj4UoWEyLeaIvjLRXM+IwC
         IPhA==
X-Gm-Message-State: AOAM531Mx70XN3H5JCntSlAfmqS54Hlz94ubUK4ngz3/TyNkTK/tx26O
        e4pS2Jrpblh69oNaSfKrrVpC3F7DAFkNow/3ts9SZQ6+pu/1MH3Beg914GpolXbeAANst9wiplT
        9sy35C/LDBSOzVJFULbrOXQ==
X-Received: by 2002:adf:f54d:: with SMTP id j13mr20271535wrp.596.1643710624126;
        Tue, 01 Feb 2022 02:17:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW9cnbVOET7eNHaJPpg1tW+PwHgA1p1BZnH/wRYWshALkMr1QDZjc+KGZLPaL4fKlWIFXhpA==
X-Received: by 2002:adf:f54d:: with SMTP id j13mr20271503wrp.596.1643710623856;
        Tue, 01 Feb 2022 02:17:03 -0800 (PST)
Received: from ?IPV6:2003:cb:c711:ba00:67b6:a3ab:b0a8:9517? (p200300cbc711ba0067b6a3abb0a89517.dip0.t-ipconnect.de. [2003:cb:c711:ba00:67b6:a3ab:b0a8:9517])
        by smtp.gmail.com with ESMTPSA id p2sm1600619wmc.33.2022.02.01.02.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 02:17:03 -0800 (PST)
Message-ID: <19907f0c-4d83-4d85-4233-f4ee727574a0@redhat.com>
Date:   Tue, 1 Feb 2022 11:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RFC v1] drivers/base/node: consolidate node device
 subsystem initialization in node_dev_init()
Content-Language: en-US
To:     Oscar Salvador <osalvador@suse.de>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
References: <20220128151540.164759-1-david@redhat.com>
 <YfeARpenqPii1WQH@localhost.localdomain>
 <3be2e20c-f0b9-c080-adf4-b0e17c046eb0@redhat.com>
 <20220131094041.GA15392@linux>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220131094041.GA15392@linux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 31.01.22 10:40, Oscar Salvador wrote:
> On Mon, Jan 31, 2022 at 08:48:54AM +0100, David Hildenbrand wrote:
>> Hi Oscar,
> 
> Hi David :-),
> 
>> Right, and the idea is that the online state of nodes (+ node/zone
>> ranges) already has to be known at that point in time, because
>> otherwise, we'd be in bigger trouble.
> 
> Yeah, I wanted to check where exactly did we mark the nodes online,
> and for the few architectures I checked it happens in setup_arch(),
> which is called very early in start_kernel(), while driver_init()
> gets called through arch_call_rest_init(), which happens at the end
> of the function.
> 
> I am not sure whether we want to remark that somehow in the changelog,
> so it is crystal clear that by the time the node_dev_init() gets called,
> we already set the nodes online.
> 
> Anyway, just saying, but is fine as is.

I'll adjust the first paragraph to:

    ... and call node_dev_init() after memory_dev_init() from driver_init(),
    so before any of the existing arch/subsys calls. All online nodes should
    be known at that point: early during boot, arch code determines node and
    zone ranges and sets the relevant nodes online; usually this happens in
    setup_arch().

Thanks!

-- 
Thanks,

David / dhildenb

