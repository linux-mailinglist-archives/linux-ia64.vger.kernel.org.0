Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B886C561FCD
	for <lists+linux-ia64@lfdr.de>; Thu, 30 Jun 2022 17:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236131AbiF3P7i (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 30 Jun 2022 11:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235514AbiF3P7i (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 30 Jun 2022 11:59:38 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F80619038
        for <linux-ia64@vger.kernel.org>; Thu, 30 Jun 2022 08:59:37 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r20so27988351wra.1
        for <linux-ia64@vger.kernel.org>; Thu, 30 Jun 2022 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=3jgSr09lfZGa1mgqC4UCVhARExSS7BFwyn5rqXh2zdA=;
        b=qc8Q8PVfYc+G+xQxrpTc6yQSD+ZNgJidtIN6ZGg9PbsW9u+nhUGYiS4OvycNkvnQth
         e+mptU104IgNrLyoikAyHVq4e05pWt71ayIMXx3aPD9sK91cR9DouOal3h5TUymybm8l
         Z5DMH1gDVJfFM2jvZsiE0NUvw1ycbDCfU8hHT6l4eQ0fUxAaaAkhvSSohdLg0xE9i7tA
         pN/kaVZpxGSeHtqcS+jim7Ove1f9dvqSeXdPyflYvhHL0yucF0oRLTPmMbcFaeJBMKlX
         Jzjie36EyHNnPt8wGXSisAb5ignYrM0/uAwm2hE1M8dcuBip2GmeTbZY/bcyAdX67SHR
         AdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=3jgSr09lfZGa1mgqC4UCVhARExSS7BFwyn5rqXh2zdA=;
        b=55WqS5zOBMrPmsqjR1Ra0K6eKCb7ywZvu7J/2ahDrujePJKEXqKg7Zc1NTHwueHaUm
         HZJL4ILl2Q7utuqfsVIb8xFZx+5SPJ3y7gN55w554cE8DlNx4HaICKzU86jgZwK1nuGY
         e2WD/hDt3TOHnvZYQTzWFvYDv8Zy2tRbQdhfmllzePOrfwFYxgf1m749YncshI5Pn139
         KDr/CS1oCxoARbetVjKj04zDpwXCXgU3MPShlzLt+fuQ9Na5BdtgSwcSARaYnqxmSNoO
         wGEwTsZcoiwS0Oemm9HaUfQgqsqutDKYiHTtygqLRZKDykHAZaAGdlFTGriSF1gX3ZzJ
         +I3A==
X-Gm-Message-State: AJIora9tFfEqOBJnVDqSNGhsXsVS7QdllW2xaGr8aTn3zHyw8QZtRlwI
        iHyBPosAPVrGczFjBbaMdY3rRvez0kk=
X-Google-Smtp-Source: AGRyM1tbAvzcElz+wCJ6J1R4OV5VYZaRcxGCYVmWb2TqXPM6bZ9fURPiAx7gdc9AxrTPMYsH3KqHdQ==
X-Received: by 2002:a5d:648a:0:b0:21d:2cd8:8b87 with SMTP id o10-20020a5d648a000000b0021d2cd88b87mr8044843wri.241.1656604775767;
        Thu, 30 Jun 2022 08:59:35 -0700 (PDT)
Received: from DESKTOP-L1U6HLH ([39.53.244.205])
        by smtp.gmail.com with ESMTPSA id x11-20020adff0cb000000b0021b92171d28sm24429904wro.54.2022.06.30.08.59.34
        for <linux-ia64@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 30 Jun 2022 08:59:35 -0700 (PDT)
Message-ID: <62bdc867.1c69fb81.66eb0.036b@mx.google.com>
Date:   Thu, 30 Jun 2022 08:59:35 -0700 (PDT)
X-Google-Original-Date: 30 Jun 2022 11:59:37 -0400
MIME-Version: 1.0
From:   ariel.dreamlandestimation@gmail.com
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
Kind Regards=0D=0AAriel Goldman=0D=0ADreamland Estimation, LLC

