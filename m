Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC4075BA9F
	for <lists+linux-ia64@lfdr.de>; Fri, 21 Jul 2023 00:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjGTWaN (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 20 Jul 2023 18:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjGTWaL (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 20 Jul 2023 18:30:11 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6789C1737
        for <linux-ia64@vger.kernel.org>; Thu, 20 Jul 2023 15:30:09 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b89b0c73d7so2084595ad.1
        for <linux-ia64@vger.kernel.org>; Thu, 20 Jul 2023 15:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1689892209; x=1690497009;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OYtWiRM7tW34YhdFkeTv7dseSSbFStm63dF6+Qox3nQ=;
        b=MyqgL2NZqt3wX0CokyEny0Cwv/QsIUvLQOor+cmnA4MIv2EiV+FBkg66Y4ke77fWae
         YvPRKYytFhLv/dVRhUKLfuu5tlPGcQQ3xVIB0EWrZSzyhYWmxzlg0imabFmTc2CkJwxD
         13vSVKB9rgoFfygewisdYMC/bKR5uZ4CjOLdVOyocKtgEN0Rzl/hAxKYsiWSpMGDoZ56
         Tk6vbG3nU9Uhr7fJIyindPCBu35kd92Xy1jpztoLmm/YvClb5BTSzRNfaec/3WPSW2jR
         c5NameHAftIb9C/R1Nky/LzOgp2BoFn4/sccXZxbDn1EP8xphM+0gkQUX2sGWHoV7Zqx
         5Z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689892209; x=1690497009;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYtWiRM7tW34YhdFkeTv7dseSSbFStm63dF6+Qox3nQ=;
        b=ayxXsmmFMb/gpU1ncZxTa5Zha/zxSnGK4OLf0wEliTX24JPAxWsoCQ+mNX1H6bN9b2
         V4AhOXz+NAoUvm21SI6YNfcaa/FmHHXAtvg36iVYyw6AQgicUcPK7ae/GFvUDLcKbi9m
         DxRwc9RMb1IMjyA4TcZkvVx/ZeB13DUXMM6idRakbfQbi5xYcaEHtS/xp458WmSXwTeZ
         cnBxnx+37kuvPTFH9pOALCAxJG3UAiGL7cuP4lVetCYo2nQ4f82rOq3A8qHKU+G8sUOx
         2hLOazTA8VKID54fLPSQzSJPNnlmUNoIhFDoEcYkILT+ZxiMEoQKxKEavKBJaBxv2lVH
         wdZw==
X-Gm-Message-State: ABy/qLbMn4aSX+tC2V113LtFHlDHl3fwrPjeilva+l3RFjHR8ki5Evf8
        fK4Ywhs2aZ+T+QAoP69izZyY3A==
X-Google-Smtp-Source: APBJJlFPE7arqfyDqpoa3K2IU9QzoSW/YKuPQOZnYoRE0MUhsBKypGOXt/lhN417Z1pR6qwaOQJrTw==
X-Received: by 2002:a17:902:d4c6:b0:1b8:85c4:48f5 with SMTP id o6-20020a170902d4c600b001b885c448f5mr398893plg.2.1689892208853;
        Thu, 20 Jul 2023 15:30:08 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id f8-20020a170902ce8800b001b893b689a0sm1919839plg.84.2023.07.20.15.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 15:30:08 -0700 (PDT)
Message-ID: <0a242157-6dd6-77fd-b218-52e3ba06e450@kernel.dk>
Date:   Thu, 20 Jul 2023 16:30:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH][RFC] io_uring: Fix io_uring_mmu_get_unmapped_area() for
 IA-64
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, io-uring@vger.kernel.org,
        linux-ia64@vger.kernel.org, matoro_mailinglist_kernel@matoro.tk,
        linux-parisc@vger.kernel.org
References: <ZLhTuTPecx2fGuH1@p100>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZLhTuTPecx2fGuH1@p100>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 7/19/23 3:20?PM, Helge Deller wrote:
> The io_uring testcase is broken on IA-64 since commit d808459b2e31
> ("io_uring: Adjust mapping wrt architecture aliasing requirements").
> 
> The reason is, that this commit introduced an own architecture
> independend get_unmapped_area() search algorithm which doesn't suite the
> memory region requirements for IA-64.
> 
> To avoid similar problems in the future it's better to switch back to
> the architecture-provided get_unmapped_area() function and adjust the
> needed input parameters before the call.  Additionally
> io_uring_mmu_get_unmapped_area() will now become easier to understand
> and maintain.
> 
> This patch has been tested on physical IA-64 and PA-RISC machines,
> without any failures in the io_uring testcases. On PA-RISC the
> LTP mmmap testcases did not report any regressions either.
> 
> I don't expect issues for other architectures, but it would be nice if
> this patch could be tested on other machines too.

Any comments from the IA64 folks?

Helge, should this be split into three patches? One for hppa, one for
ia64, and then the io_uring one?

-- 
Jens Axboe

