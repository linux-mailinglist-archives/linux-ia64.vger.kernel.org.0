Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3510569E2F3
	for <lists+linux-ia64@lfdr.de>; Tue, 21 Feb 2023 16:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbjBUPCn (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 21 Feb 2023 10:02:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233498AbjBUPCm (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 21 Feb 2023 10:02:42 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041259EEF
        for <linux-ia64@vger.kernel.org>; Tue, 21 Feb 2023 07:02:41 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id j2so4583181wrh.9
        for <linux-ia64@vger.kernel.org>; Tue, 21 Feb 2023 07:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tfmbaOk39v3tpFcFBIAfnl0q1Vg7mXkD/6hfnYSguRg=;
        b=AFIA1x+YeK8o4T8XZ8KbfO9GPSs0eDJLCP6sPdAyz0lmSPUd3b0LkcCsNy7eiS9lCT
         5LItdV8YyU81jFPCOwS/7APg9FKouK3Y0+IHdI0zFWRsrDMWDFR8VhWsIcjW4cwA6AMf
         KGql8RM2ZRAHRtV6S3wH9hsUiSd4T/fT+E+YArpweuyNu/1L3W+eVeJsuIK8LxzUVS7S
         4gT+HkJ4u84of1ERY+oiMhDAfHWWza5tuRl+Z4uR320qI/NJo6EozM5Qd1Hd5plzn80H
         4df8L7WP9mMQhViS8R16pdS2F2S2/5vl1cG8rXuoNey0qqK3W/uO7psgPW5LCyLFp3Ts
         q/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfmbaOk39v3tpFcFBIAfnl0q1Vg7mXkD/6hfnYSguRg=;
        b=3wsLfPzBVkXCKhMaXDEm/cQU4xukrAO0TZqGytkl1iEaw0Qk6W6Ppu/PseG9fLM9aV
         TnPufXytKHlc13HZT2oEiTkNZZdT8e+wLMRzwImfHTbVeCy2b1yREjwN8VZoxJWiFdyO
         DqwA7PIv/Ntc5077pAd2z+JtopXavKdmB7SUPa40eDOK0nRV0uqfHaMonBIlH9MypZmb
         Oyw8sduNTF8w4ivREQqlA3fkz1ORRD/SDIJPhi5aM2rNNQ4kIeubiQRb+ctef+av1WUU
         MJpThYL1tguXJO5Y9i+2vOYct2UV7LOwBNh4Qx8vMSCH6+75LPvnHCNaOg5bvSfHjoDN
         oRvw==
X-Gm-Message-State: AO0yUKUIR3C9vEzIJ1/H0Tt+MlBe5cgsNIfOLLXifxqzGxuEdTE0VJMg
        gyo651YKvpDiWL1Zry+nw46m+JXFMys=
X-Google-Smtp-Source: AK7set+QdhRTJll70ad1w28ht8V7ya/klT15FEEdhZAQImISdCHiUaY64DkOEXCkbVqy7C0va8T//A==
X-Received: by 2002:a5d:4a84:0:b0:2c5:4f41:e0 with SMTP id o4-20020a5d4a84000000b002c54f4100e0mr4924668wrq.62.1676991759081;
        Tue, 21 Feb 2023 07:02:39 -0800 (PST)
Received: from DESKTOP-L1U6HLH ([39.42.138.70])
        by smtp.gmail.com with ESMTPSA id g4-20020a056000118400b002c5544b3a69sm1763361wrx.89.2023.02.21.07.02.37
        for <linux-ia64@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 21 Feb 2023 07:02:38 -0800 (PST)
Message-ID: <63f4dd0e.050a0220.8a634.504f@mx.google.com>
Date:   Tue, 21 Feb 2023 07:02:38 -0800 (PST)
X-Google-Original-Date: 21 Feb 2023 10:02:39 -0500
MIME-Version: 1.0
From:   karen.dreamlandestimation@gmail.com
To:     linux-ia64@vger.kernel.org
Subject: Building Estimates
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi,=0D=0A=0D=0AIn case you really want take-offs for a developmen=
t project, we ought to be your consultancy of decision. Reach out=
 to us assuming that you have any undertakings for departure whic=
h could utilize our administrations.=0D=0A=0D=0ASend over the pla=
ns and notice the exact extent of work you need us to assess.=0D=0A=
We will hit you up with a statement on our administration charges=
 and turnaround time.=0D=0AIn case you endorse that individual st=
atement then we will continue further with the gauge.=0D=0A=0D=0A=
For a superior comprehension of our work, go ahead and ask us que=
stions .=0D=0A=0D=0AKind Regards=0D=0AKaren Reed	=0D=0ADreamland =
Estimation, LLC

