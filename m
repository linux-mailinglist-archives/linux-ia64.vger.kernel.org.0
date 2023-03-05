Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED606AB1C4
	for <lists+linux-ia64@lfdr.de>; Sun,  5 Mar 2023 19:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjCESxQ (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 5 Mar 2023 13:53:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjCESxP (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 5 Mar 2023 13:53:15 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E29683E4
        for <linux-ia64@vger.kernel.org>; Sun,  5 Mar 2023 10:53:14 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id o12so29995102edb.9
        for <linux-ia64@vger.kernel.org>; Sun, 05 Mar 2023 10:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1678042392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AN0CzpsMcXbcM4GDtUWIdtCQSMN2+Da6rXDKr4ksjhc=;
        b=LZghsG8mVSU4d/kMrcH1eGWygi+MoTcU2SvrbQGyRAQpJkt5jALmDWly0xaa52LJyU
         +hglCxgMPYqSVsocyFBtwV86+AxJYfeH+1xlIg7QjFBPSiYj9q+q41U2dCXTymKEHoD0
         7F9xqQwG8rcYjVYh4b1aZFy0zxNQU0ihsdjAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678042392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AN0CzpsMcXbcM4GDtUWIdtCQSMN2+Da6rXDKr4ksjhc=;
        b=Y/6hmPMjHl3gUu1F0cpOgfhQnDsMHZc6wYjnFdhQHqj/oTG/UyF19Dj43rSu/eNsat
         MeaITWq8H8VGf1/kpyfMrl0cpwWZRJbS9WJl98qt9nB4vrDST9RSt4zh0KXWnoplzWly
         JRfj+lTGzPD2Xxxgexh2wQIolYaMJbhES70ckwv1SvSAEM5V1COcNloTCG9pjy4YCtC6
         yyZ6a18L1ZOJf9uF7l0u0ywTZA2ozWE5bHvOQUxlsApmhiJcXQBJoKMaDpQz4dF14pGO
         QKcNkJAWfovABgmM7Wb5wk05Ne0Tq/H2KfbWo8F5i5ESCLwM0jc4uD645nSj6Bkzdz+8
         h6Og==
X-Gm-Message-State: AO0yUKUpOOC4U8+qNOXsMBxaqFWhL8nYWmGwr2qqxMA49HiLx5Eq6ZzF
        K4J3QBW64iCTzw3RLWuqDtG4Mkc6AmWO6t9JXs4RvQ==
X-Google-Smtp-Source: AK7set8BgvMPZW8KibnnqySoTIRiYYDatyEE+xI1LJBOvAJrj447BMlAPs3cro/bRH2+8WTmrmdq2g==
X-Received: by 2002:a17:906:9f28:b0:8b1:3813:7b6 with SMTP id fy40-20020a1709069f2800b008b1381307b6mr8583248ejc.30.1678042392501;
        Sun, 05 Mar 2023 10:53:12 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id l23-20020a50d6d7000000b004c06f786602sm4006443edj.85.2023.03.05.10.53.11
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 10:53:11 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id f13so30045231edz.6
        for <linux-ia64@vger.kernel.org>; Sun, 05 Mar 2023 10:53:11 -0800 (PST)
X-Received: by 2002:a17:906:4997:b0:877:7480:c75d with SMTP id
 p23-20020a170906499700b008777480c75dmr3946134eju.0.1678042390949; Sun, 05 Mar
 2023 10:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20221016182349.49308-1-masahiroy@kernel.org> <CAK7LNASQfrL2JnL2QDE_fBLV6KmMuJATpvRk2vaB0db49OysEA@mail.gmail.com>
In-Reply-To: <CAK7LNASQfrL2JnL2QDE_fBLV6KmMuJATpvRk2vaB0db49OysEA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 5 Mar 2023 10:52:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wibvZQoNu3VCuH+WfOHdWeVG_Zz6GWXQwQ4EmSAQd8Avg@mail.gmail.com>
Message-ID: <CAHk-=wibvZQoNu3VCuH+WfOHdWeVG_Zz6GWXQwQ4EmSAQd8Avg@mail.gmail.com>
Subject: Re: [PATCH v3] Remove Intel compiler support
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>, Len Brown <lenb@kernel.org>,
        Nick Terrell <terrelln@fb.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Tom Rix <trix@redhat.com>, devel@acpica.org,
        linux-acpi@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Sun, Mar 5, 2023 at 4:19=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Are you happy with picking this up?
> https://lore.kernel.org/lkml/20221016182349.49308-1-masahiroy@kernel.org/

Done.

              Linus
