Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8CE56C0CB2
	for <lists+linux-ia64@lfdr.de>; Mon, 20 Mar 2023 10:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjCTJBa (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 20 Mar 2023 05:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjCTJB1 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 20 Mar 2023 05:01:27 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50B5976C
        for <linux-ia64@vger.kernel.org>; Mon, 20 Mar 2023 02:01:25 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so2113776wmq.3
        for <linux-ia64@vger.kernel.org>; Mon, 20 Mar 2023 02:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679302884;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jlL8pzL6NVZbuVjV4h5KPilkuQmPMJRpXcDIhZ2tX0=;
        b=kvNZSEfrPt2ARhJXUw+f9Op/uFdmej+cW0RpGmmfUU+wKNpwCVllRp2CvVwqyi9EGZ
         G3OStnNoE4MiKv/wEHY+lct9/uEYy6zzgKhQ/cVFHy/0nCwfVvzk5/Ibr+NAjonbtrX4
         zCYvpQLHmp0FsFJ6W5lNYHp7KnCOJrFD4RlF/EVm7iP5XNQVgfkAAO63rxK5VRGjx3uO
         Vj5pcdHefCyrJYgVqWi54PoeCNs/onJvYkaxqr/yNqdyyv7u9IRh0LLdnBmopXBPk7DK
         cl0/iIy4ZPNRjG+/nBloXVas2P5ulRTAnDfWOVH/qdYAXYmqDU691NDK4kaI2Cfo/rAG
         QY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679302884;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jlL8pzL6NVZbuVjV4h5KPilkuQmPMJRpXcDIhZ2tX0=;
        b=nvpmg5mWErVJcWKFfC/I9yEa1ClImj52i8PZb0WrP13Uf61N69j40KQSiP7KeQs5Te
         wbq/3Y1EnAnzBAXhGeQ8r3d2JGZTyf7cj8SYmnj9ekIP7ZpMJdpJqzaPFkVaXZ9x1STS
         VvY3VSrhgqfDsuj4Yxu9Dp2llbIGS3Nfdx3gKWl9bEQUkBQ7la1OMAy/ne/HjvuAof7w
         5bGXRm9iOS9lWkb1M2fI8BXDgLBZEAHYOUDbf+R0T5K+rCXRweJCbP+FtSP48CBJVSs7
         gFkWMbCOjVtSi+XxMmxWIlSLsegbaltA8pdYDfJQBRFyLXnDAGP7eLAtIIq0yVEIBcJ7
         pbGA==
X-Gm-Message-State: AO0yUKW10wUArt1NQjwkdcYNC4k9sn+gN+V5D7qFeQSu0fcUi04pD8ZD
        +4Z2QVV2qmsMTxPwCCVXP7sa63hOxAo47ybpZIU=
X-Google-Smtp-Source: AK7set/6VPSX/SY7/1Bk+1TftPM8DlKa8Oc4B0uxIt+VXT8vGB9EFnijkuFO+S58jXmk/hdwkfpckCT2raB2WJJoE9I=
X-Received: by 2002:a05:600c:3b29:b0:3ed:2e02:1bf5 with SMTP id
 m41-20020a05600c3b2900b003ed2e021bf5mr5813215wms.6.1679302884271; Mon, 20 Mar
 2023 02:01:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:db8d:0:b0:2cf:f0c8:4b6d with HTTP; Mon, 20 Mar 2023
 02:01:23 -0700 (PDT)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <regionalmanager.nina01@gmail.com>
Date:   Mon, 20 Mar 2023 02:01:23 -0700
Message-ID: <CADndTXu0r2n=sTS4pHcNvgSiJmAz1XLcZcZdh=Hm+b53d6nQXA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:32e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5868]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [regionalmanager.nina01[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [regionalmanager.nina01[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [ninacoulibaly03[at]myself.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibaly
