Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C34F496F8B
	for <lists+linux-ia64@lfdr.de>; Sun, 23 Jan 2022 02:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiAWBgK (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 22 Jan 2022 20:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiAWBgK (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 22 Jan 2022 20:36:10 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E555BC06173B
        for <linux-ia64@vger.kernel.org>; Sat, 22 Jan 2022 17:36:09 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id d5so10337399pjk.5
        for <linux-ia64@vger.kernel.org>; Sat, 22 Jan 2022 17:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=JBo39Y+I2aAWyqSG6abXc/K7m8aUzAhFEBypnl/Snzg=;
        b=cJmaT2iXMKidSZeo6OIwaBWIEsIX9nIbYQZuitlC4w9viiRu+jZlCjbBbPZ21ExgcS
         Q6flSWiQxECCqHWKl/LUCAqlaygxfh2Bl5LwEwqs0r6TA/lAUV115DbaD86j25jftCMP
         etRPMYS/bFAlc2FTFOmJRzRo+DU2MUzrVCSUscVqSEwmxtPLSwJ/u6s7OIqLNvGWOCeY
         dPz29K+NQSsNaDBMTR1OtymcHq9pD+kU38/rk0p2QJeQQuJjeUmBdtf4fahF95LIIZxj
         p7vvf6q9BuKtqpaazQxv6hQkCpZCQyLWiKwbij+T372OM38H0GOPHr+lFV+37WEg9Iig
         wr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=JBo39Y+I2aAWyqSG6abXc/K7m8aUzAhFEBypnl/Snzg=;
        b=Mxv7plEvKm2iHssJISQnkHna1YKjELukdjZ6CELiGYtcuhs0kB5DpiUqlT/pEPEeEH
         3GoDclhkc9+fC1QOAnrm4jOSzpf40Elokut+Bo8TdPqr1TkuWm+uwT4iOrxtsnzoxoZp
         TJPv8gcIbmL7+W+ZD26Y9TclLFlx8SRyEClxewmSpnhHtXxk8T85ibldiURpO4qHKnEb
         VCU4zfy14TwPcIuxJYZOWZWqNI8w6W2V3VrZU5b0mVVJPbcjYe6yWbVVU3Ecij25NaYB
         b56YbnGEZeTbADsjsW9DP9CkaXGVQXJN8yDNo4TeRRxed28EtdYtyMiKUxCrJd2dyjAQ
         qv6g==
X-Gm-Message-State: AOAM533uQauEXRdsqoEScwYV/6otPtM7zogcHgfSZ2fLveBane+Drknc
        5JBB8/uVRZl03uuI4AJ2TpFJ/w0G6HT7fUP8e8c=
X-Google-Smtp-Source: ABdhPJzyx+wuq041uoQi6Z+qKjwBD2IBHoU/9Hw7xo2XElD314TTRr2SVVD/AIdWwpx4QlaqqBs6sWclUJzkjEnF0K4=
X-Received: by 2002:a17:90a:bc84:: with SMTP id x4mr7130159pjr.230.1642901769510;
 Sat, 22 Jan 2022 17:36:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:1251:0:0:0:0 with HTTP; Sat, 22 Jan 2022 17:36:09
 -0800 (PST)
Reply-To: huiman43@hotmail.com
From:   Yi Hiuman <bitcoin.minners250@gmail.com>
Date:   Sat, 22 Jan 2022 17:36:09 -0800
Message-ID: <CAHD-T39mPXBicEADX6rwJ4-FLBAP_h0=7tewLkrrCvat9fN3UQ@mail.gmail.com>
Subject: =?UTF-8?Q?Ich_habe_einen_Gesch=C3=A4ftsvorschlag_f=C3=BCr_Sie_=2F_I_have?=
        =?UTF-8?Q?_a_business_proposal_for_you?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hallo,

Ich bin Herr Yi Huiman, ehemaliger Vorsitzender der Industrial and
Commercial Bank of China (ICBC) und derzeitige China Securities
Regulatory Commission (CSRC). Ich habe einen Gesch=C3=A4ftsvorschlag, von
dem wir beide profitieren werden. Ich suche einen seri=C3=B6sen Partner, um
eine Transaktion im Wert von 45.275.000,00 USD anzuvertrauen. Kann ich
mich auf dich verlassen? Bitte kontaktieren Sie mich f=C3=BCr weitere
Informationen =C3=BCber meine pers=C3=B6nliche E-Mail-Adresse:
huiman43@hotmail.com

Yi Hiuman



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


Hello,

I'm Mr. Yi Huiman, former chairman of the Industrial and Commercial
Bank of China (ICBC) and current China Securities Regulatory
Commission (CSRC).. I have a business proposal that will benefit both
of us. I am looking for a serious partner to entrust a transaction
worth $45,275,000.00 USD. Can i rely on you? Please contact me for
more information via my personal email address: huiman43@hotmail.com

Yi Hiuman
