Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE6853E273
	for <lists+linux-ia64@lfdr.de>; Mon,  6 Jun 2022 10:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbiFFHxt (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 6 Jun 2022 03:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbiFFHxo (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 6 Jun 2022 03:53:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 68F6612AB8
        for <linux-ia64@vger.kernel.org>; Mon,  6 Jun 2022 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654502020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5tAtC8sWEQaHDrdHg4P+GFrcy06HggAEGufwFvj0o6E=;
        b=YhzPZ/yeC5BEPuhz0W18Gvm51PncqbTZQ/nYyP4uIPGBt/FCA5FphnLO8eIgY+olgOAYBx
        4Oi16q9lEjdZbGL8+YRMNsEpy2WCRTPwAaKhGYiZBeHDSygfhwyiOqhEJCqz86qC8Fwr/e
        YmAEuGrfYIwPaAuPwH+yh0q144YV5NQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-MSPXoiSLMQiWCdHK9zOFdA-1; Mon, 06 Jun 2022 03:53:38 -0400
X-MC-Unique: MSPXoiSLMQiWCdHK9zOFdA-1
Received: by mail-ed1-f72.google.com with SMTP id g7-20020a056402424700b0042dee9d11d0so9968805edb.3
        for <linux-ia64@vger.kernel.org>; Mon, 06 Jun 2022 00:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=5tAtC8sWEQaHDrdHg4P+GFrcy06HggAEGufwFvj0o6E=;
        b=mtAsXs9+89rVjr8KYY+wX3pMg8SwU2bZoXs2Qy3eX3cnLuROG8lid1SrH3WPUxxHFz
         WB89UFY7trwv5SNoZrZIsBATPquRysRY8YEcRYH+eMA3zoZw0S0oQF0mloXb0/1+QNWk
         O5cqHThoi550cK3woWCfoyDWDAw2g26bX7mEoiFYKqXej+21nYSfk5MUDDq3NgqM+tts
         6G6Y0GfIvsamiJmcaBI2aS0YP68Uvxkx1iHyVM1eVOF0gbkPqB3ucILYPV58E8YGSsH3
         a3de/jrNp+x5phYjRP10JMnNmifHfYUlplfOfveAiglTtFFvIi+ErTnWJFKXohLYC8nR
         7knw==
X-Gm-Message-State: AOAM532LT0iPOkJMGE7R911AERH+YXSB9p8RSqRNuHlbafzA4R0FCODt
        KOBMxbd0odYymS8NE5iI5GMdKFHvkRWEiCkB3SPkAx6eNS+olbP7PvmcNP8y8D4eK/VXNahwIDx
        ygLPl0zA+cWZu2lu6Eb2C2A==
X-Received: by 2002:a17:906:d54e:b0:6f6:3ea:8e7b with SMTP id cr14-20020a170906d54e00b006f603ea8e7bmr20495926ejc.292.1654502017686;
        Mon, 06 Jun 2022 00:53:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuLlvNrnpO67bvA3yDD6EgX1SApqQwL5qjFJPSpxYtyIiXQNA1ZhGKHu0cFcsiEyjLisdIrg==
X-Received: by 2002:a17:906:d54e:b0:6f6:3ea:8e7b with SMTP id cr14-20020a170906d54e00b006f603ea8e7bmr20495905ejc.292.1654502017355;
        Mon, 06 Jun 2022 00:53:37 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id k16-20020a1709061c1000b00705cdfec71esm5882371ejg.7.2022.06.06.00.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 00:53:36 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 4C41C4055A7; Mon,  6 Jun 2022 09:53:32 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ia64: fix sparse warnings with cmpxchg() & xchg()
In-Reply-To: <20220605160738.79736-1-luc.vanoostenryck@gmail.com>
References: <87h7547k8c.fsf@toke.dk>
 <20220605160738.79736-1-luc.vanoostenryck@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 06 Jun 2022 09:53:32 +0200
Message-ID: <871qw2xm6b.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Luc Van Oostenryck <luc.vanoostenryck@gmail.com> writes:

> On IA64, new sparse's warnings where issued after fixing
> some __rcu annotations in kernel/bpf/.
>
> These new warnings are false positives and appear on IA64 because
> on this architecture, the macros for cmpxchg() and xchg() make
> casts that ignore sparse annotations.
>
> This patch contains the minimal patch to fix this issue:
> adding a missing cast and some missing '__force'.
>
> Link: https://lore.kernel.org/r/20220601120013.bq5a3ynbkc3hngm5@mail
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

Ah, thank you for taking care of this! :)

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

