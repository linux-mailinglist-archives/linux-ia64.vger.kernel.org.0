Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C56D8621099
	for <lists+linux-ia64@lfdr.de>; Tue,  8 Nov 2022 13:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233383AbiKHM1R (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 8 Nov 2022 07:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234244AbiKHM1M (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 8 Nov 2022 07:27:12 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBF850F0F
        for <linux-ia64@vger.kernel.org>; Tue,  8 Nov 2022 04:27:09 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id a27so8510484qtw.10
        for <linux-ia64@vger.kernel.org>; Tue, 08 Nov 2022 04:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=pIKifzYsm2Cgt7CW/bcOJ93WkTm1io3rPOOj+9f1zC6lB7sB67wYnxEUpuBnKyRUlx
         SfPF0u2wYyxrahkLf1yQ4tczFc9SERo96uDfYcaPNAXoIHaf7KHDnu3+cnAraUwmacwy
         VAFhVk2dzd3MkxiKbkHoW6bYs2GCGvW2LoGPOcG8zOQoGLs0IRYb7QJV8Jf5wwcAAPKF
         6opWpaP0l0/M1d8GRF5HZe+ZhAaixOT9G9L3scITKM5AvX0MEmxapsBUnFRINNqPx0z9
         hRwzprOAdKhZJZluY4nIVCI0h/cAKkj7lKkzOXQfAECrtKSZl2XwwTS7PNjxU1hJ3tYb
         O/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=vrI0PvpQUdiAXd+KbLcd9L7cHAxP2xBIR4uFzuuIe//XeFLwjKeCRyxgvPa4UxTwwh
         hH+3nLLu7fD93fAJdQihR3xv2u78B40KtJL1dnJgbjcaOTv+DrF//STtfMyZt35fc5SP
         Ow8gTRkCg0gquB85ucLt96uKiD5BiwAXCogzeLoKe2iD6LOYcgIOwUFCLZVQ3aeUao+D
         xPjKYOhiRIgFM1SOlDOhVFohabDPq7ZI20eqI5wuaEeEmnVgTlWrE6kZrvsK5W+EV5dj
         BiRG0OkIxDxf/YCwy/5oHfNZtkMZMafKENX7BgkF69YJ9ZPKwT9yrpD7zoYRveXZBTeF
         uOiw==
X-Gm-Message-State: ANoB5pnT2uzykgMGDnEWh52r8QTi+v7rbECYAt80DTVXJO8O4QEQgwwo
        b1VEUXnHjvaB9Gx3JXYqsaS2giINmf9wM767Ztw=
X-Google-Smtp-Source: AA0mqf6hQM49zFskzAz7fucTuSO+Uh4xEcuAvShEmJ0YEAzJb3ts/0We8X6dQ/FpepotXXedScNq7tnCGKvOzxlQ1kM=
X-Received: by 2002:ac8:5ccd:0:b0:3a5:92a5:4427 with SMTP id
 s13-20020ac85ccd000000b003a592a54427mr6193386qta.391.1667910428928; Tue, 08
 Nov 2022 04:27:08 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6214:2f8a:b0:4bb:6e86:8303 with HTTP; Tue, 8 Nov 2022
 04:27:08 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   Mr Abraham <mr.abraham2021@gmail.com>
Date:   Tue, 8 Nov 2022 12:27:08 +0000
Message-ID: <CAJ2UK+bZ1hTEGrQ+FFXS4roEQsVOuz8=6tjXvgADsoAsEO7csQ@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:82d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4993]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mr.abraham2021[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mr.abraham2021[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
