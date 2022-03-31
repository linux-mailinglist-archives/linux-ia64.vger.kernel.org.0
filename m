Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9E3D4EDE86
	for <lists+linux-ia64@lfdr.de>; Thu, 31 Mar 2022 18:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239370AbiCaQRR (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 31 Mar 2022 12:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239805AbiCaQRP (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 31 Mar 2022 12:17:15 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B507F1F1D09
        for <linux-ia64@vger.kernel.org>; Thu, 31 Mar 2022 09:15:23 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id b19so440462wrh.11
        for <linux-ia64@vger.kernel.org>; Thu, 31 Mar 2022 09:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=4v6D8ncinWhWpgelM96jETgo+dLI3vXRBbUCussjBmU=;
        b=HnyNqGKcuL9QSixRE3rozr3GKRy3gH7BYfxhUeLDpFf2X+mbw0hgvYRv6/rGm+f391
         cy4RxqXCohkoFkhz2cGe+336EyEBLZg7+yFM4e+Cv/uFFCENZ7Yn9AIjmC1uQFfgmKGo
         54C82EICuGU74dhG/uAKFgc0PZoayQuKw1E/tgyx0eO7TDY81T26nZrUIdQg7bpPBcSf
         YERxVnUXBdsLzZg3sHsOOjRZ2h87VESjr4OZam/1LR/nb6en0I9T6dzywgXEJfJRU0wV
         /2oFV70QaWLwdNI7P1xYaDiRmeGZXBe4xlEyHurylS4wS3dHjWgpmmJDJJGQEMJO+jd1
         mR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=4v6D8ncinWhWpgelM96jETgo+dLI3vXRBbUCussjBmU=;
        b=NriBIGV3uqRcq9TnPHYsDzK6fTj215k7m/ak7VpjiZan8dYm3FPrWP9PWMIMJTuW3h
         9b0u4jnBalN2lgmAVMlAdCNEKWujbsZ6C/Y90lD+mgbiJ+pKjqktuTSOnhgZ4cdhwC0X
         wEaOMbNygh+ojYVfLQF6pEFN652L4mUb+2wKqGBe9QmP7h/1gNntKixScCe8wueKmJqb
         qaHQQOmS/xUevI/1FaYS2v6f/+tlarwjFbonk4Wv9w/gmvqXzBh8fMGq8mAhF7zd9aJo
         iHMdEtIa1Vzzu/HX2TNlR/8HFjh9sPmYmGBIKVAVlONFkcUr9GW4PYie89aGLi1WBdPA
         Nvsw==
X-Gm-Message-State: AOAM532qrn7WZkaLX9mYrEIA93anvj+/KLPMgqK2aPBgWGK8jOaaH2Er
        d4YN3zRd0yJ4Bc4XYv02KwKxVbc24h0=
X-Google-Smtp-Source: ABdhPJy8ssIEpCcwrI89dbq5L+yPCaZ5qTIEyZBueymKVg3tAS38JcOpox7nBMR80EqRyiUdknPZSw==
X-Received: by 2002:a05:6000:1085:b0:205:ab9b:8cf5 with SMTP id y5-20020a056000108500b00205ab9b8cf5mr4731836wrw.196.1648743321947;
        Thu, 31 Mar 2022 09:15:21 -0700 (PDT)
Received: from DESKTOP-R5VBAL5 ([39.53.224.185])
        by smtp.gmail.com with ESMTPSA id m3-20020a5d64a3000000b00203ed35b0aesm34173562wrp.108.2022.03.31.09.15.21
        for <linux-ia64@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 31 Mar 2022 09:15:21 -0700 (PDT)
Message-ID: <6245d399.1c69fb81.c0910.6a96@mx.google.com>
Date:   Thu, 31 Mar 2022 09:15:21 -0700 (PDT)
X-Google-Original-Date: 31 Mar 2022 12:15:21 -0400
MIME-Version: 1.0
From:   jacintodreamlandestimation@gmail.com
To:     linux-ia64@vger.kernel.org
Subject: Estimating Services
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AJacinto Keeling=0D=0ADreamland Estimation, LLC

