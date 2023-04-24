Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B72476ED3A4
	for <lists+linux-ia64@lfdr.de>; Mon, 24 Apr 2023 19:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbjDXRhA (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 24 Apr 2023 13:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbjDXRgw (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 24 Apr 2023 13:36:52 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B5AA247
        for <linux-ia64@vger.kernel.org>; Mon, 24 Apr 2023 10:36:39 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so35396478a12.1
        for <linux-ia64@vger.kernel.org>; Mon, 24 Apr 2023 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682357793; x=1684949793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixBLe3NtbULr+G7HNCZvSVu77/ESFEdi1SlI0hk10s0=;
        b=Vop/A+ltDUrXNIDXCB1UYGC7Bmhv6UtKIIjeOO/eGUfPc00HIjgiBXwR7SyjfWMYHq
         dLPXjcwnO0S/SO2hgwgoTIRTdBUaxlrG3DO+acSE/o+kRsR75kh9r1KRQEMVg7oAS/jh
         s+oGQre943RTut1OQTAUAx3nJmEsPBWU255eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682357793; x=1684949793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixBLe3NtbULr+G7HNCZvSVu77/ESFEdi1SlI0hk10s0=;
        b=GlEBc9ajEKkl8gj2OuZAmgdv9IF7BEXmg8sdHnvlec2I+2aK+0Tqy3YmjbGsufc/TH
         HWKWPnmGwVnpbY1kmoTy/WsyWWdAi9hewgkaUknxKJXXOPTyC1YwQxwxshUj/D1ejQgH
         I42cD7LpwlzP0Je9Oo/5vuGtEuBAmraRmq/rNja02B63fbawPrGicny5NcqbA1JxZUtj
         nNghxiV0d5DdCTwwVZBdOWrtfLd+AwGvdC9hhuPCToFPtWWO0DzTVh3H49EfrR2h7ECR
         ZO07k1gg11MZdwVfBwWUo09shuPWlmyCSk5Tkuul0IMt5H+aI7H4m4GmKv1anyv+INjG
         FCXw==
X-Gm-Message-State: AAQBX9e8CunqCmOC8AdV6TEgiex19JS3kYMR72QpeW6p3xtvQQSwDOPK
        PwDBRwz6r/KA44vXI7+er8siFDZ/pwOp71enlE1hvQ==
X-Google-Smtp-Source: AKy350bqoIRNmX1DxURV/MDiodGYAxQOO3LnT3MjsT6IPKXmqGi4wJgXBWQphJ0XBMp39dth0sAeNw==
X-Received: by 2002:a17:906:5488:b0:953:834d:899b with SMTP id r8-20020a170906548800b00953834d899bmr10194959ejo.29.1682357793306;
        Mon, 24 Apr 2023 10:36:33 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id g17-20020a1709063b1100b0094e6db4d4a1sm5701677ejf.186.2023.04.24.10.36.32
        for <linux-ia64@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 10:36:32 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so35472765a12.0
        for <linux-ia64@vger.kernel.org>; Mon, 24 Apr 2023 10:36:32 -0700 (PDT)
X-Received: by 2002:a05:6402:d1:b0:506:c238:4067 with SMTP id
 i17-20020a05640200d100b00506c2384067mr13659251edu.8.1682357791917; Mon, 24
 Apr 2023 10:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221016182349.49308-1-masahiroy@kernel.org> <20230424162110.11082-1-lrh2000@pku.edu.cn>
 <CANiq72=Kb6ckhU8Ss9=Dg4Zn11Us+DLbKnNWAVaTb-nv7Y=ARA@mail.gmail.com>
In-Reply-To: <CANiq72=Kb6ckhU8Ss9=Dg4Zn11Us+DLbKnNWAVaTb-nv7Y=ARA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 24 Apr 2023 10:36:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whDAYoWVEPSn2cD5YMjPN+nNYbHw3t8_=UiRi5V7WKgaA@mail.gmail.com>
Message-ID: <CAHk-=whDAYoWVEPSn2cD5YMjPN+nNYbHw3t8_=UiRi5V7WKgaA@mail.gmail.com>
Subject: Re: [PATCH] scripts: Remove ICC-related dead code
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Ruihan Li <lrh2000@pku.edu.cn>, masahiroy@kernel.org,
        arnd@arndb.de, bp@alien8.de, dave.hansen@linux.intel.com,
        devel@acpica.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, mingo@redhat.com, nathan@kernel.org,
        ndesaulniers@google.com, ojeda@kernel.org, rafael@kernel.org,
        robert.moore@intel.com, terrelln@fb.com, tglx@linutronix.de,
        trix@redhat.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, Apr 24, 2023 at 10:27=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

I took that patch before this email came in, so that reviewed-by will
be missing in the tree, I'm afraid.

                     Linus
