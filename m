Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5E194C3169
	for <lists+linux-ia64@lfdr.de>; Thu, 24 Feb 2022 17:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiBXQeR (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 24 Feb 2022 11:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiBXQeQ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 24 Feb 2022 11:34:16 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2711B6E11
        for <linux-ia64@vger.kernel.org>; Thu, 24 Feb 2022 08:33:45 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id l9so1755671pls.6
        for <linux-ia64@vger.kernel.org>; Thu, 24 Feb 2022 08:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hicd0tEo/b5LFaXhDInEJPUGfqEVOu+qbFlSudecvJ0=;
        b=fS9MOKL7PnyGYGUrEHm1W+CpwJy2baJ8/5LJyKMcAWjsJZogmHWVaUfDGQuZCkd8vP
         VK4ExEycU276xQ5S+kmUK8IVGZL9LtAPjVeyyI9yS6uqvs2uoRZiC/eOJqe8Vq9b+uvP
         xc4ZlO8+so2JceflzyF2iPU8/gIQZX3lFz5Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hicd0tEo/b5LFaXhDInEJPUGfqEVOu+qbFlSudecvJ0=;
        b=TdeuAjuAY7b6v9af3HNKqoy0p0zw6C87vUJVbZSSqPzHWqUQgkLzDoR7YY24CimfE7
         v9cCrrae0Bzes7E1SIlp7538Xd51yBcotVgfDI0hZsLKnzAmjNbcwXm7RgbwjVSUEg+q
         pI2I2CLX9zjQE6c6j/bIgWbU7W9glr6mtFmDTQA5HIg0WBLMnu8Mfyx1jcOFb/rsf3zJ
         +nloRpvpaqQzodnRUlCZvmsUgv+/qVV9fsk492/uCbzqfcR195v6vBUTtpGtgmJvM0eo
         /9ykIYR70RPeMtqo3Bh+JCb1oElJpcxL6kxF0Iibuio2LANW1opH3Dy5I4bIqD4KSges
         DUWA==
X-Gm-Message-State: AOAM530fYgmpDnhESI9IR1ONxlIksTs59UY7N2ZkwKNH8gBnzxJ1tlAX
        dxIJd/ol1GDzIUxADy+qSz2cmw==
X-Google-Smtp-Source: ABdhPJyWX2X03NpVP7OG9tb3/bOJYzu9SCAwlXij7cTFtfwKtKMcQhac3eTOvjUxx32AVPETPTB7Vw==
X-Received: by 2002:a17:902:e80c:b0:14f:f95c:41ee with SMTP id u12-20020a170902e80c00b0014ff95c41eemr3140315plg.31.1645720424809;
        Thu, 24 Feb 2022 08:33:44 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 19sm3998951pfz.153.2022.02.24.08.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 08:33:44 -0800 (PST)
Date:   Thu, 24 Feb 2022 08:33:43 -0800
From:   Kees Cook <keescook@chromium.org>
To:     matoro <matoro_mailinglist_kernel@matoro.tk>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Anthony Yznaga <anthony.yznaga@oracle.com>,
        matoro_bugzilla_kernel@matoro.tk,
        Andrew Morton <akpm@linux-foundation.org>,
        regressions@lists.linux.dev, linux-ia64@vger.kernel.org,
        Linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: regression: Bug 215601 - gcc segv at startup on ia64
Message-ID: <202202240832.F40AEB20@keescook>
References: <a3edd529-c42d-3b09-135c-7e98a15b150f@leemhuis.info>
 <823f70be-7661-0195-7c97-65673dc7c12a@leemhuis.info>
 <03497313-A472-4152-BD28-41C35E4E824E@chromium.org>
 <94c3be49-0262-c613-e5f5-49b536985dde@physik.fu-berlin.de>
 <9A1F30F8-3DE2-4075-B103-81D891773246@chromium.org>
 <4e42e754-d87e-5f6b-90db-39b4700ee0f1@physik.fu-berlin.de>
 <202202232030.B408F0E895@keescook>
 <7e3a93e7-1300-8460-30fb-789180a745eb@physik.fu-berlin.de>
 <65ed8ab4fad779fadf572fb737dfb789@matoro.tk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65ed8ab4fad779fadf572fb737dfb789@matoro.tk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, Feb 24, 2022 at 09:22:04AM -0500, matoro wrote:
> Hi Kees, I can provide live ssh access to my system exhibiting the issue.
> My system is a lot more stable due to using openrc rather than systemd, for
> me GCC seems to be the only binary affected.  Would that be helpful?

Yeah, that might be helpful. I have access to a Debian ia64 porter box,
but it's not running the broken kernel, so I can only examine "normal"
behavior.

I'll switch to off-list email...

-Kees

-- 
Kees Cook
