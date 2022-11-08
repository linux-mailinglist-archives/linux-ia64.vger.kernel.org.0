Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9AD620E77
	for <lists+linux-ia64@lfdr.de>; Tue,  8 Nov 2022 12:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233945AbiKHLSv (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 8 Nov 2022 06:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233873AbiKHLSu (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 8 Nov 2022 06:18:50 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95D710FC0
        for <linux-ia64@vger.kernel.org>; Tue,  8 Nov 2022 03:18:49 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id q5so7286749ilt.13
        for <linux-ia64@vger.kernel.org>; Tue, 08 Nov 2022 03:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1oIX0Lu3jFWZXVxNPQntM2Fj3qbMNn8z1UsbYrWkRo=;
        b=TqAJAtnRKoLLqO+UA4agXF2ZpjkGLJQNMh5p7LOvK6RWqq3mdRHYz9dlusjAIOcuJH
         k7CQ5zSjktT3Lt5wbjaT3xvCmQunW7dq0IrN1vxh0AmU4ExktRz0rv0Ly+WzptL9mcQF
         unp0lwIWt30r/UNmdNXqxaPwxO5ofAE0YCwahNppZi9NVZ8hv1WX+Ddbnkd4/+B1Walw
         Lsuu/PZPozZHaKkzXxiPAOnyPSyDlnBz/nZ1gash0XuvZ5X+eOT8hq/0cR1q3piCO25u
         0VZ18Mj7zjkIZtFWIuBYy0Pg1mP1TpHDE2rWkEW8sUnCrdeNLAbByAEqBQIrQD36fJ7u
         akWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1oIX0Lu3jFWZXVxNPQntM2Fj3qbMNn8z1UsbYrWkRo=;
        b=hJfVQEprYsKoTYPzOKdwH+U4pziFPTGByPdLxi6epdxTGPvbToJRGoodsG1e+nBsjx
         qLpu/R0McUMCPOF01dGCBNeVFyl8HcHABOobIWZ/dKlH35q3b+Er1fguKw2mVd1lia8x
         7vlgMmMIui9kOmT2rArtBOb5JcFj5klUoNTlI2woVMe9LiXsYcTKgv1ZTWP5ygQNjnRz
         cYeUioyEf3TBR2BMYEYvQSaqxOUj4oJHPiufIkcz5UDIjKGYZGU7nQ9Vip66u6Cy6E9K
         gFzkZiXiNyrJharIz0L8ULqmOSOm3Ka3ux9rsnbw37jweTxM3P/A+I5zf9LXtcSWVoHY
         XQ/w==
X-Gm-Message-State: ANoB5pmO+7nWdviPKl+bdsnMouBu/3p0FlGvsw1SCQUeD1flk+pbw/WO
        zDCSj1lAsnsBCPALzcw4wcT5TVBABNMkXIamGGA=
X-Google-Smtp-Source: AA0mqf6EWnGgZf4XUdjQjERPqg2+IOmAn/TL1KGLb7B2gYQllwGz3waSmsw6gYQyyb6O5aj455DBRi5NEz+F2SVD1zI=
X-Received: by 2002:a05:6e02:220e:b0:302:906:8957 with SMTP id
 j14-20020a056e02220e00b0030209068957mr373575ilf.200.1667906329089; Tue, 08
 Nov 2022 03:18:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6638:38a9:b0:375:4a9b:180d with HTTP; Tue, 8 Nov 2022
 03:18:48 -0800 (PST)
Reply-To: mrinvest1010@gmail.com
From:   "K. A. Mr. Kairi" <ctocik1@gmail.com>
Date:   Tue, 8 Nov 2022 03:18:48 -0800
Message-ID: <CAKfr4JU1Sr=ZzEzsQr_CDOe86_NkuT6ua_A02_NmJOp9mAXehg@mail.gmail.com>
Subject: Re: My Response..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:12c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5007]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrinvest1010[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ctocik1[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ctocik1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

-- 
Dear

How are you with your family, I have a serious client, whom will be
interested to invest in your country, I got your Details through the
Investment Network and world Global Business directory.

Let me know, If you are interested for more details.....

Regards,
Andrew
