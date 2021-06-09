Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19E63A11B2
	for <lists+linux-ia64@lfdr.de>; Wed,  9 Jun 2021 12:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238299AbhFIKzv (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 9 Jun 2021 06:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42216 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236007AbhFIKzj (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 9 Jun 2021 06:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623236025;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JBWPCdmnHsH7qQGe81DFl3a6ru5xcOhjproglm1WObM=;
        b=SedtYsjxMaQhR5CjOgiuDrw3GNR9NX1oTbZoGNgWb2don5i1RYydwOFlk+tI7be5H3TtRe
        zDBvF9y4X6YwLGqksExPQxck41D7b5v5j/x7NYGOHvgcjH924LEb8B4Edd/I9hALknW3u/
        yAY7bEOaWjuQkG+9FMGH+u33d7Xwxe8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-dCoqWIAcNQSC4_P1YbdLxQ-1; Wed, 09 Jun 2021 06:53:43 -0400
X-MC-Unique: dCoqWIAcNQSC4_P1YbdLxQ-1
Received: by mail-wr1-f72.google.com with SMTP id t14-20020adfe44e0000b029011851efa802so10547857wrm.11
        for <linux-ia64@vger.kernel.org>; Wed, 09 Jun 2021 03:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=JBWPCdmnHsH7qQGe81DFl3a6ru5xcOhjproglm1WObM=;
        b=Ga/e1Z8kxxQz/wUgg0BmnPJiv+V8P3lmnDhi6ttAtV4MOGroVO2HpBsiXhFusRjXlh
         xrhpHPSx2bwe+xtgjyPSmPtWz8ME4LtJWJyIUeHz9tjnW+jS5/5auXoXi58CRYkuYrOK
         3WSoI802VBHWVisnpa34qaUuzfFRxuuo1VUSrqzkP9QnAbx+k69LvKDDaLHY40yjuK5s
         Pa13toBr01PuahrO1fnuPVTI2sl90EmpUxOE30GvblxZjaQu6X9GtaTVw1pWkPBVCGz9
         N9h45g68c5wELnTfOUR+VKYR09DEXg/GTn7atTYrMfoTxTLs+Qir9DyBetYGFT4zQPZX
         KzgA==
X-Gm-Message-State: AOAM531T80CwBjs5ddZYCQJalRea3MBlhbU54pM/ZoNqoOqae8YT4Rf9
        rXVOHeH9Cq9OacrnE5PMuuEil/WoywKZ1Jm6BFT9Zh5/SLJRBlggEyzRFdXL4hcWJySyNoO7uH6
        aBvj/IgoO6vleNPkWor0t5w==
X-Received: by 2002:a05:600c:b50:: with SMTP id k16mr26766710wmr.137.1623236022753;
        Wed, 09 Jun 2021 03:53:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytaUEoH1yZlmOCQRNfd+wo+CI/GKYwuDVo1xp/A/CuJsfRh3qeLKHuz3pPcIzWarSKIwDzSA==
X-Received: by 2002:a05:600c:b50:: with SMTP id k16mr26766696wmr.137.1623236022628;
        Wed, 09 Jun 2021 03:53:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
        by smtp.gmail.com with ESMTPSA id v15sm1695174wrw.24.2021.06.09.03.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 03:53:42 -0700 (PDT)
Subject: Re: [PATCH 3/9] arc: remove support for DISCONTIGMEM
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-4-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e9ef94f5-02bc-920b-9e6a-2d234e5bbbc5@redhat.com>
Date:   Wed, 9 Jun 2021 12:53:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-4-rppt@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 02.06.21 12:53, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
> in v5.11.
> 
> Remove the support for DISCONTIGMEM entirely.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

