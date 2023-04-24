Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49D276ED26E
	for <lists+linux-ia64@lfdr.de>; Mon, 24 Apr 2023 18:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbjDXQ1s (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 24 Apr 2023 12:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbjDXQ1r (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 24 Apr 2023 12:27:47 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06D79001
        for <linux-ia64@vger.kernel.org>; Mon, 24 Apr 2023 09:27:42 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-247296def99so3336080a91.1
        for <linux-ia64@vger.kernel.org>; Mon, 24 Apr 2023 09:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682353662; x=1684945662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFJ9uSsbbq6fAnU3Kv89VxYbJecjLW72W/BsfIeB9rQ=;
        b=7WIX6XPYI7rfI6hh42UI6sWlQhx9+LKXBe8Db1y/QvAQf+qO/GC2QqpYPFoRXAnZTY
         i49gD3v5iMIP9i2LGxTGBTXwvmGSeJ41WyTF/pArxQJlxh59Buiay20PgEVNBkwQPDxY
         9Zceo6WX/6zNR43ftcPHMAAxNDABYWMVPSPNruZgincKTPBncPsQORsD+moF3WHmL+jH
         yFyZgyJzZRlVvF9K8oRVi73oFD7ZgXokph2iRWDlOwnNFgPbl+dCLUABCzwyAdImCVcG
         x7979WgWT8AvKCHLJ8OMCeumUVFJ1n2obaDMWTJOiYB7BmH3pEE1rOcoWNt92oyrrdpY
         yrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682353662; x=1684945662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFJ9uSsbbq6fAnU3Kv89VxYbJecjLW72W/BsfIeB9rQ=;
        b=hmYGxnt/V+kRVFkH5zzEHtrdEcHdl6oNDoq/XM2qkOGu5kDuvHs7xRV/Gca0Ba9bh7
         l5VBUZ5DcatHOkngCEMOryTnMxUUpL3Zs5pOiY9Q2WTKL/J8WWmRiMOPHpltiCDCqnzE
         hyzQzlH1YZyIRehdp64wDwQi/dlng5JjnaBmMy2Ur+z/JglrswhhycoPe8MlRoMdxQ+S
         1nVSCCk5fWVYz3mlzzDIVYMcksl8TtU8R/iKQHp6lhTQ7cZqE2qs2mf/cBJdksb6xYW+
         lW8mRYRWfIulAbZ4n7pSgu3e0KNd6juwwFYE5pZc1cwfwP1v8RuFONfPEovwGlUHCZgo
         6pzQ==
X-Gm-Message-State: AAQBX9cyxcgJYlbakGS/ChrcLQacy+Wy6JJH/UfVR3cJXiTCX7eUgfFw
        lXt+4Ccp+dWB3o44txZZ9BkMfAgTB8uI33fE7OisAQ==
X-Google-Smtp-Source: AKy350b8aiAxCyJyr7zba8Bh8V5VEKgimMMOMCQt+dlZihQrf/+7KBsPdSakpLSBULrc+qjyBWMlyos/sAIHVLgf+I0=
X-Received: by 2002:a17:90a:290d:b0:23e:f8e2:9ed3 with SMTP id
 g13-20020a17090a290d00b0023ef8e29ed3mr14856964pjd.43.1682353662007; Mon, 24
 Apr 2023 09:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221016182349.49308-1-masahiroy@kernel.org> <20230424162110.11082-1-lrh2000@pku.edu.cn>
In-Reply-To: <20230424162110.11082-1-lrh2000@pku.edu.cn>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 24 Apr 2023 09:27:30 -0700
Message-ID: <CAKwvOd=sDakt6Pay08=xh4mDiFnq8esXDm-Df9z2jz-5PpHMFg@mail.gmail.com>
Subject: Re: [PATCH] scripts: Remove ICC-related dead code
To:     Ruihan Li <lrh2000@pku.edu.cn>
Cc:     torvalds@linux-foundation.org, masahiroy@kernel.org, arnd@arndb.de,
        bp@alien8.de, dave.hansen@linux.intel.com, devel@acpica.org,
        lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, mingo@redhat.com, nathan@kernel.org,
        ojeda@kernel.org, rafael@kernel.org, robert.moore@intel.com,
        terrelln@fb.com, tglx@linutronix.de, trix@redhat.com,
        x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, Apr 24, 2023 at 9:21=E2=80=AFAM Ruihan Li <lrh2000@pku.edu.cn> wrot=
e:
>
> Intel compiler support has already been completely removed in commit
> 95207db8166a ("Remove Intel compiler support"). However, it appears that
> there is still some ICC-related code in scripts/cc-version.sh. There is
> no harm in leaving the code as it is, but removing the dead code makes
> the codebase a bit cleaner.
>
> Hopefully all ICC-related stuff in the build scripts will be removed
> after this commit, given the grep output as below:
>
>         (linux/scripts) $ grep -i -w -R 'icc'
>         cc-version.sh:ICC)
>         cc-version.sh:  min_version=3D$($min_tool_version icc)
>         dtc/include-prefixes/arm64/qcom/sm6350.dtsi:#include <dt-bindings=
/interconnect/qcom,icc.h>
>
> Fixes: 95207db8166a ("Remove Intel compiler support")
> Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/cc-version.sh | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
> index 0573c92e8..a7e28b6a5 100755
> --- a/scripts/cc-version.sh
> +++ b/scripts/cc-version.sh
> @@ -45,10 +45,6 @@ Clang)
>         version=3D$2.$3.$4
>         min_version=3D$($min_tool_version llvm)
>         ;;
> -ICC)
> -       version=3D$(($2 / 100)).$(($2 % 100)).$3
> -       min_version=3D$($min_tool_version icc)
> -       ;;
>  *)
>         echo "$orig_args: unknown C compiler" >&2
>         exit 1
> --
> 2.40.0
>


--=20
Thanks,
~Nick Desaulniers
