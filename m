Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80C86911D6
	for <lists+linux-ia64@lfdr.de>; Sat, 17 Aug 2019 18:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfHQQBJ (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 17 Aug 2019 12:01:09 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46638 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfHQQBI (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 17 Aug 2019 12:01:08 -0400
Received: by mail-lf1-f65.google.com with SMTP id n19so6057861lfe.13
        for <linux-ia64@vger.kernel.org>; Sat, 17 Aug 2019 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1+7TiPxmJ3iAAUyU8+nGKfNJ+qg4H69wdJGgYgGKXe4=;
        b=renwLVE4t6MRcP5ZcmILI4AbPfXwqYVjMBTfKIElNDtgfcIFYeU8tIrB/gUAytl6lf
         GUpFHkf80zb+V0K3tM4r1Ot/9rCYkg84zdkCVJdaGdaWLOpozsDhzbvufdrpihHrN3tR
         TMxRzxhlJOIgtqRCrMKBJjP0q/GTzQu3Y+xuowVJpW1Icfg6Gn+WBtpfMuxFGsqNj8oB
         RlW1kLKfSyibvLnhWNBdW0PJ1JnQ35HN0rADSVoKpu7sfG7Xl0X/7sr2FWTSDPYnsGg8
         aLYzSLDdBf8VJM9zqhQZCDbdbFM9CTE+LknLwNOfmvJpyWjg0Gz9hP3js+7ih/iHtfFi
         vrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1+7TiPxmJ3iAAUyU8+nGKfNJ+qg4H69wdJGgYgGKXe4=;
        b=ZN/AC2ywo1D+4+42nLq+2ezG/PWmA1ot9tvdhGb8s4haAB8BIf3u6WWMZFzfTNNZoF
         xXiGawQtSUdIPnbFtq1nBo+UfQEAUUPOCWlG3GSkrmzmRQzJ9DA+L77C9qnZFAfWcXKH
         WB1Q+XYf/KCldHXE/UcfWpJFTtrCGVTMF00wE4JHKWDdEhSmP0Ek0mCLJKQjykCCvxZv
         rHZ7C+Z25WHWg/BgXyIsFiMFl8ss1s6OVFO91trskXmbi5wTy/KnTTPpy6aspA9se3DM
         9XMi6OTAJZ7TvTRz/1xyugdyTPiXJDZJ9jXFHBfbB/3gBl5Lj8XHSj5IP/X5hl0oXiZE
         JSOQ==
X-Gm-Message-State: APjAAAVp16yc643zz6lZ0V/HJhgJAnHXg/TYj37M6vEWYaRjVCGPAZWs
        RUl5N8wDxHIu2jAS4TSbwL0UTA==
X-Google-Smtp-Source: APXvYqzgHOkrd316w+DBxyDOOMOwfJvlMQJHfKxSm3Tpn7OUxlUzLbfoBMdqodlTlf7xRwkY3y0i2g==
X-Received: by 2002:ac2:456d:: with SMTP id k13mr7785781lfm.77.1566057666460;
        Sat, 17 Aug 2019 09:01:06 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4817:8b14:6cce:9848:7977:d7d5? ([2a00:1fa0:4817:8b14:6cce:9848:7977:d7d5])
        by smtp.gmail.com with ESMTPSA id b10sm1517289ljk.79.2019.08.17.09.01.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 17 Aug 2019 09:01:05 -0700 (PDT)
Subject: Re: [PATCH 06/26] ia64: rename ioremap_nocache to ioremap_uc
To:     Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
        Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org
Cc:     linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-mtd@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-7-hch@lst.de>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b19607c1-07aa-e361-3c26-8bcb063ed8c1@cogentembedded.com>
Date:   Sat, 17 Aug 2019 19:00:48 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190817073253.27819-7-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hello!

On 17.08.2019 10:32, Christoph Hellwig wrote:

> On ia64 ioremap_nocache fails if attributs don't match.  Not other

    Attributes. :-)

> architectures does this, and we plan to get rid of ioremap_nocache.
> So get rid of the special semantics and define ioremap_nocache in
> terms of ioremap as no portable driver could rely on the behavior
> anyway.
> 
> However x86 implements ioremap_uc with a in a similar way as the ia64

    "With a" not really needed?

> version of ioremap_nocache, so implement that instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
