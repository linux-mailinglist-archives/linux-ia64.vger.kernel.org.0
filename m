Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9774A375B87
	for <lists+linux-ia64@lfdr.de>; Thu,  6 May 2021 21:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbhEFTPq (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 6 May 2021 15:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60615 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235000AbhEFTPq (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 6 May 2021 15:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620328487;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LxJCtrJc+hn1vhOwMRBMiLEsVjLTk4AmYnUbr3bQtaE=;
        b=PLRvuvKSFI1DBA41oyQZfmh5KBtNY7jp9bfmvhGxSvQHtx0HkfmIdlhEHoaBBb18LF3AOM
        6lYi62N3cIRS2MC9cNkAYTtSyTqaEZyJ7/MvGXFS7pLcnBjmicQBouSbd0WuWOO8CFt0Dm
        U/iwtdnTNMQIyW096DYgRPjOV5+xK6M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-jcH0C5b7PdeU3U3_735AwA-1; Thu, 06 May 2021 15:14:45 -0400
X-MC-Unique: jcH0C5b7PdeU3U3_735AwA-1
Received: by mail-ej1-f72.google.com with SMTP id v7-20020a1709061807b02903a3d1724659so2127504eje.8
        for <linux-ia64@vger.kernel.org>; Thu, 06 May 2021 12:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LxJCtrJc+hn1vhOwMRBMiLEsVjLTk4AmYnUbr3bQtaE=;
        b=ozYc864suBiPi3D4dvnqWW2lotmuEhFThlfoRg5LZvlsGle4QuR3CsyC1o4apYAY/X
         J5ljZ7JCHbrSQZjH/rG7I5jCiMB5uRgQkV7wYBAnpUsr4wiZeQvHRKrvEzyKxMy52V6j
         3slz7M4LVsYCaSOrUvmYf35z1UAihNIRYMsKLArzLzXmgfTUIykTYgTx322j/QkmTsWs
         NfuBbtM9OASZMUsNWcAaqcoQ4TEPWZ0sw9KDF57LlyOsT66omD9sEGnip32970QlqVyY
         030Eez1jwqQAYNttnX7DQky/9l+1jsw3dsWU3TBgQVSyrEiGhQ3NZkp0PWGZlpmpLRpK
         nVsw==
X-Gm-Message-State: AOAM533Kx2vDjd9p8QnS8aMPn2O1sHWJVJEgtfmte35RIWWAddGNzOiD
        FkmThCriCXn1amh3lpKoENmhWOZyrNxuW++96g4ubw0KcmHNAj0jq2Y1/VGGirJHqMmf3naeSu7
        iq0ylmNezik78ujPOqRxcDg==
X-Received: by 2002:aa7:d843:: with SMTP id f3mr7130704eds.270.1620328484581;
        Thu, 06 May 2021 12:14:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMDfCDANHagwyvMGFrV1L6sL7t6UDHQRxiwpmWElp0FfWEi44uao+v+GyT+Pf6/v6QHjNNZw==
X-Received: by 2002:aa7:d843:: with SMTP id f3mr7130678eds.270.1620328484331;
        Thu, 06 May 2021 12:14:44 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
        by smtp.gmail.com with ESMTPSA id x7sm1924071ejc.116.2021.05.06.12.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 12:14:44 -0700 (PDT)
To:     Zi Yan <ziy@nvidia.com>
Cc:     Oscar Salvador <osalvador@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Michal Hocko <mhocko@suse.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
References: <20210506152623.178731-1-zi.yan@sent.com>
 <20210506152623.178731-2-zi.yan@sent.com>
 <06dfaf69-1173-462c-b85f-8715cb8d108c@redhat.com>
 <71EE13C0-9CF7-4F1F-9C17-64500A854BD8@nvidia.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH 1/7] mm: sparse: set/clear subsection bitmap when
 pages are onlined/offlined.
Message-ID: <146a1ec6-38b3-9724-b346-9bb6e7e24c72@redhat.com>
Date:   Thu, 6 May 2021 21:14:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <71EE13C0-9CF7-4F1F-9C17-64500A854BD8@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

>> But glimpsing at patch #2, I'd rather stop right away digging deeper into this series :)
> 
> What is the issue of patch 2, which makes pageblock_order a variable all the time? BTW, patch 2 fixes a bug by exporting pageblock_order, since when HUGETLB_PAGE_SIZE_VARIABLE is set, virtio-mem will not see pageblock_order as a variable, which could happen for PPC_BOOK2S_64 with virtio-men enabled, right? Or is this an invalid combination?

virtio_mem is x86_64 only. aarch64 and s390x prototypes are available.

If I understood "Make pageblock_order a variable and
set it to the max of HUGETLB_PAGE_ORDER, MAX_ORDER - 1" correctly, 
you're setting the pageblock_order on x86_64 to 4M. That mean's you're 
no longer grouping for THP but MAX_ORDER - 1, which is not what we want. 
We want to optimize for THP.

Also, that would affect virtio-balloon with free page reporting (report 
only 4 MiB chunks not 2 MiB chunks).

> 
>>
>> I think what would really help is drafting a design of how it all could look like and then first discussing the high-level design, investigating how it could play along with all existing users, existing workloads, and existing use cases. Proposing such changes without a clear picture in mind and a high-level overview might give you some unpleasant reactions from some of the developers around here ;)
> 
> Please see my other email for a high-level design. Also I sent the patchset as a RFC to gather information on users, workloads, use cases I did not know about and I learnt a lot from your replies. :) Feedback is always welcome, but I am not sure why it needs to make people unpleasant. ;)

Rather the replies might be unpleasant ;)

-- 
Thanks,

David / dhildenb

