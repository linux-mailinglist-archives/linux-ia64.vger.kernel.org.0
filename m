Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5582441CA1E
	for <lists+linux-ia64@lfdr.de>; Wed, 29 Sep 2021 18:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345858AbhI2Qb4 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 29 Sep 2021 12:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28050 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345779AbhI2Qbz (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Wed, 29 Sep 2021 12:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632933014;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LzEA/AMsDC+zBVogDRmix14O9ZRH28vVpD1t8BFMOTQ=;
        b=OHBmXcXFal572r+La62x/Pn62V3aPieYOB7wpdnX+fdQtLC0NoStUv+jiupRblcNaL3ueG
        KAyzB/qmCFYPkPzJ99/RNGLkOgQmgI6ENjA0Hl59ZGewjTj0IjWYZ6sXmWRuGDsqkZZI1A
        WaMksgp254vi7iOLDxJkYraotUwtBZw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-PfQluc3jOsyGQXnUa2jtCw-1; Wed, 29 Sep 2021 12:30:12 -0400
X-MC-Unique: PfQluc3jOsyGQXnUa2jtCw-1
Received: by mail-wm1-f69.google.com with SMTP id k35-20020a05600c1ca300b0030d13cecf46so1033133wms.4
        for <linux-ia64@vger.kernel.org>; Wed, 29 Sep 2021 09:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LzEA/AMsDC+zBVogDRmix14O9ZRH28vVpD1t8BFMOTQ=;
        b=aPvVoEwTbE0JO2UbmVLtbzennv9AbOdqPokLFGm+Yo105ubbVjGGpoJ6BC6y3Ya0n7
         5QOEEaXROPvvEaH156JEq1sRHarGavimUqZxxJs3TdnFP6x9ngObTEvwE/IFmoufLyLp
         thU0WrHRi+ORDU7k99quq1+M23s2Bhb4C3ohhIX8KROn0juK+j3W8hP2OUm178m7Hl62
         +8YeITafC/y1qYbK442ilDEnrNt8QCxHNjWqXUiL2bX8SDSmITJVtfnRfPoVXHTZDsTB
         HBMPO99sXp/gSavU+m/j6tNTbPm7MC6iRL8SIxH3gvHGrncrqCN4ehnDZE1ppQVW0iaT
         CG2w==
X-Gm-Message-State: AOAM531LXYSoq9vFZA9EOT90/IsNLgCLZQ6pJWN9FMDKRcZb84KzTWcV
        rFtFAqChgQB/m7+bi71wjTc7Hr8fSOKfJAQEl60d0VQdyA9Bdo0qr8wKbdw0Jkv6YNhJECO6ymf
        x+Ce1mECpCjd6iRez4DJngQ==
X-Received: by 2002:a05:6000:184c:: with SMTP id c12mr1026248wri.150.1632933011558;
        Wed, 29 Sep 2021 09:30:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWpbhPpbSmBcJNqivlDLJZ/UTUefLQTk4gKa/CcEn6HHHOoDfx1bOgZbQtRoI/dHj6OAlJWg==
X-Received: by 2002:a05:6000:184c:: with SMTP id c12mr1026220wri.150.1632933011388;
        Wed, 29 Sep 2021 09:30:11 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c3b.dip0.t-ipconnect.de. [79.242.60.59])
        by smtp.gmail.com with ESMTPSA id m21sm354405wmq.37.2021.09.29.09.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 09:30:10 -0700 (PDT)
Subject: Re: [PATCH v1 2/4] memblock: allow to specify flags with
 memblock_add_node()
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jianyong Wu <Jianyong.Wu@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-mm@kvack.org,
        kexec@lists.infradead.org
References: <20210927150518.8607-1-david@redhat.com>
 <20210927150518.8607-3-david@redhat.com> <YVSTkGdh2nQWQp+U@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3651c7d0-f7b6-63ff-216a-b74176623a6f@redhat.com>
Date:   Wed, 29 Sep 2021 18:30:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVSTkGdh2nQWQp+U@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 29.09.21 18:25, Mike Rapoport wrote:
> On Mon, Sep 27, 2021 at 05:05:16PM +0200, David Hildenbrand wrote:
>> We want to specify flags when hotplugging memory. Let's prepare to pass
>> flags to memblock_add_node() by adjusting all existing users.
>>
>> Note that when hotplugging memory the system is already up and running
>> and we don't want to add the memory first and apply flags later: it
>> should happen within one memblock call.
> 
> Why is it important that the system is up and why it should happen in a
> single call?
> I don't mind adding flags parameter to memblock_add_node() but this
> changelog does not really explain the reasons to do it.

"After memblock_add_node(), we could race with anybody performing a 
search for MEMBLOCK_NONE, like kexec_file -- and that only happens once 
the system is already up and running. So we want both steps to happen 
atomically."

I can add that to the patch description.

(I think it still won't be completely atomic because memblock isn't 
properly implementing locking yet, but that's a different story)

-- 
Thanks,

David / dhildenb

