Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366775A383F
	for <lists+linux-ia64@lfdr.de>; Sat, 27 Aug 2022 16:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbiH0O73 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 27 Aug 2022 10:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233180AbiH0O72 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 27 Aug 2022 10:59:28 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D70042D1C5
        for <linux-ia64@vger.kernel.org>; Sat, 27 Aug 2022 07:59:21 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id s10-20020a0568302a8a00b0063b1cac26deso815626otu.2
        for <linux-ia64@vger.kernel.org>; Sat, 27 Aug 2022 07:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc;
        bh=uonFvdv3a8aimxowqf4c576MH34LT2sS62BdkqR1oQE=;
        b=IuP2The/ho2AtXZHHW3MxAjeQRgW1EBIbiAlMx6j1mpw/24AyBviHJFhgFSnjhtLaD
         ihCJCGH/D/icfwLGnsv7McBmbH9sZowJHBQpUIMK17r66a4uBijPJ1Secv3qIem3o0PX
         woGt/4uJQQfNSnnUMTZtF2uMV+pYnJ6MnD7gU+r+v5mbkE2asYC2eMgk0YXmvs08LRp0
         1PlExQsSOpwSuPuhWlp8XxKc2qlg0xxF2x+y35IcG3FHPfMHOCthn8IND5QK4cDlVlK0
         XaXvyEXbPKg9MtpbY7ro0ERmB70Ry/vJMaHSe9RRGgo252cE11dS6q35LoDAKtto5EsO
         a8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc;
        bh=uonFvdv3a8aimxowqf4c576MH34LT2sS62BdkqR1oQE=;
        b=Tgjv3/TOZpyBfdSyAmmuY4trcZhI0VG/naK2wv6TDRPFyl2FKbbxrg+YVB25ubxB5E
         KadMEXBSdv98D6Wj62ygzFAq+mjqxM6hEbSZs79ecEE4eUaiOzl1NhCnICBuFW3AShB4
         5q3HTQyFn8DONehZvVUyXFR1aTy4TRnaAZS1RlQK+68QTcYvH3zmxJG3Q1sN1NR5Nirr
         L9aXOrPZo23PoSlvJKAn+nDO3fzziEGqHuh580emamoOYzRrhmclaZhNK0Ys4xNGPCVS
         XjapcqS4SiuDeuy+qf42UPEq8d+2tX9COuGXzjVyKWwSvf5PNQMpLpM/6Mw8cedB2MyI
         Ktyw==
X-Gm-Message-State: ACgBeo01f9bei48RlHcVtjnQnfpqE4Vh9nYMGNFktUst4U1CyjoH+54F
        V10h5v0XS5JVcWoQ7OrtphLKQj+iWPzuzPoh77o=
X-Google-Smtp-Source: AA6agR5itoibQEWoel89lC9iWs87xaJ7tJcJh//+PubU9x5apN2E2Lu2jQ6wdOWvIp9pD1L5QBBi9G0wbmDuMcjpD9c=
X-Received: by 2002:a05:6830:1bc4:b0:636:e925:c3b6 with SMTP id
 v4-20020a0568301bc400b00636e925c3b6mr3418571ota.86.1661612360968; Sat, 27 Aug
 2022 07:59:20 -0700 (PDT)
MIME-Version: 1.0
Sender: samco.chambers1988@gmail.com
Received: by 2002:a05:6358:9ac7:b0:b5:b306:3f95 with HTTP; Sat, 27 Aug 2022
 07:59:20 -0700 (PDT)
From:   Doris David <mrs.doris.david02@gmail.com>
Date:   Sat, 27 Aug 2022 07:59:20 -0700
X-Google-Sender-Auth: kTRj4yyY37lfFE825wGg5yfFYi0
Message-ID: <CACePhLnXGOz724dQa6ouKbHnorDXJRggwOe=qiT3vMFQ4NHynQ@mail.gmail.com>
Subject: Re: Greetings My Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.0 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:32d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [samco.chambers1988[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [samco.chambers1988[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  2.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Greetings,

I sent this mail praying it will find you in a good condition, since I
myself am in a very critical health condition in which I sleep every
night  without knowing if I may be alive to see the next day. I am
Mrs.Doris David, a widow suffering from a long time illness. I have
some funds I  inherited from my late husband, the sum of ($11 000 000
00) my Doctor told me recently that I have serious sickness which is a
cancer problem. What disturbs me most is my stroke sickness. Having
known my condition, I decided to donate this fund to a good person
that will utilize it the way I am going to instruct herein. I need a
very Honest God.

fearing a person who can claim this money and use it for charity
works, for orphanages, widows and also build schools for less
privileges that will be named after my late husband if possible and to
promote the word of God and the effort that the house of God is
maintained. I do not want a situation where this money will be used in
an ungodly manner. That's why I' making this decision. I'm not afraid
of death so I know where I'm going. I accept this decision because I
do not have any child who will inherit this money after I die. Please
I want your sincere and urgent answer to know if you will be able to
execute this project, and I will give you more information on how
thunder will be transferred to your bank account. I am waiting for
your reply.

May God Bless you,
Mrs.Doris David,
