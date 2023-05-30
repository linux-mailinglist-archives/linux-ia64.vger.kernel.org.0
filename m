Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E871716E93
	for <lists+linux-ia64@lfdr.de>; Tue, 30 May 2023 22:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbjE3UWA (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 30 May 2023 16:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232524AbjE3UV6 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 30 May 2023 16:21:58 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51145102
        for <linux-ia64@vger.kernel.org>; Tue, 30 May 2023 13:21:57 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6260a07bf3cso22611786d6.0
        for <linux-ia64@vger.kernel.org>; Tue, 30 May 2023 13:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685478116; x=1688070116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v/3khj0OsDy6tiCUQa6DdJBJ1cpK2oDwQcTTJMzzcJc=;
        b=R4sY6uBA9xpTTwjINUq4tRu020jlYtzE4fpmVtq5TMdY+sLOXEfFFnY0J1dSp1yiKb
         HJsPVH0SyYip1Xc0kqQgu+OHkNyl29V6bCwGh8X2eeFu7074y/Yal0m3koRVt4O/EyNb
         cp6OLX0zOJQF8ddWuSr/uQ7ieBPR7PpVx7qCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685478116; x=1688070116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/3khj0OsDy6tiCUQa6DdJBJ1cpK2oDwQcTTJMzzcJc=;
        b=bTkYGejmWCa0R1PAY5rOeUPbAC623RH0vec8W5cNBYaNwaTOkVBW8x/vVS10z3xEeI
         uIjxMxdhmLX5eqqPn6W1StO5QQq5V3YuxDFWBhGOlfFj483fQ42arT+lm+YOB43T338f
         mFLmPqXCZ5RekUP6gEWq+7aHlaX2xuqXuCcXdsItRSxy42W7NPVh570OGfDwNotLzoFW
         AsDBRtFMYH3r4g1b5NzSAc4zKDD6JYE1W1qka3y1X3d+J1KbXK8yy4rw4zv4zfQueNnY
         1ETV9KEP6Sei+4xuyW4JIBkq1nHc6A7xlhysTXr/Nw8wTSgmbQ6wlkt82EhMd+Dru9JG
         Pynw==
X-Gm-Message-State: AC+VfDxZ/JZb7HCTblvl2s1GkKvcgsuPwtxq47rIM3TeiYzsBxFLvQvS
        jEYOLpA8p8m9c1HqyP+pWcsCfQ==
X-Google-Smtp-Source: ACHHUZ4M90sWYI2mGbM0H4wT7TfJ5A4GnDZ+mmZf0bKLNB8ll3fTsc0shmi0ZAh8RQK3dcfhx3nvHQ==
X-Received: by 2002:a05:6214:1c4a:b0:625:88f5:7c3d with SMTP id if10-20020a0562141c4a00b0062588f57c3dmr5068575qvb.1.1685478116466;
        Tue, 30 May 2023 13:21:56 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id bd12-20020ad4568c000000b0061b7784b3basm4927432qvb.84.2023.05.30.13.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 13:21:55 -0700 (PDT)
Date:   Tue, 30 May 2023 16:21:53 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Frank Scheiner <frank.scheiner@web.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>, linux-ia64@vger.kernel.org,
        song@kernel.org, debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: Boot regression in Linux v6.4-rc3
Message-ID: <20230530-purchase-amber-fa77ba@meerkat>
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
 <ZHErssbUSbSznTVA@bombadil.infradead.org>
 <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
 <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de>
 <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Sat, May 27, 2023 at 10:08:24AM -0700, Linus Torvalds wrote:
> This does make it clear just how great a mailing list archive lore is.
> Konstantin, is there any particular reason why
> linux-ia64@vger.kernel.org isn't in lore? Is it just a rational hatred
> of all things itanium?

We only add things to lore when someone asks, and nobody's asked. :) I guess
I'll consider this an ask and put it on the radar.

Regards,
-K
