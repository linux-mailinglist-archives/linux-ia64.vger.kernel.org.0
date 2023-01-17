Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D94C66DFCE
	for <lists+linux-ia64@lfdr.de>; Tue, 17 Jan 2023 15:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjAQOCw (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 17 Jan 2023 09:02:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbjAQOCk (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 17 Jan 2023 09:02:40 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD61839CDF
        for <linux-ia64@vger.kernel.org>; Tue, 17 Jan 2023 06:02:39 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id k8so16184469wrc.9
        for <linux-ia64@vger.kernel.org>; Tue, 17 Jan 2023 06:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qnONv6ljq41Tulih2wNiX8/3YbIpOSq+P5AfGvqItI4=;
        b=Ws+mjG2NzzEZQgO3+83tVSol4c+qN51rxRe9UNPSA7L9D4kkcAwgwujbPfWU8ZM10F
         VfPYoF+64BCBQhxMCv3OWM6++l4cp6kz0eEk+juxFsVfH4D2ZqOfAgT7jlO5odctqCTD
         gCHax0Z4F8DXXl2DeaVWpbHeNwZCKtnvSs/beS98UvDdh7hM2d3TkY3EQFuJp59/hM5r
         /cSbOpUsn1DHXYJWlDxW8ldv2BLNsUAPyOVh4XpMSI/TvpHGn29cA2BRJPrvr5qHZx4C
         /vZOsifO9zJGr9BujsmZCcrc2ojfeBpuJjQxx/hxQxpBMMavE1xe2BSmOGj3ddDGrqB/
         gLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnONv6ljq41Tulih2wNiX8/3YbIpOSq+P5AfGvqItI4=;
        b=zBlZ7KLGkl0zCBb79r3OsDKYn2AdVfq97GCcpAwHCcp53+1b9Yg2mRG0w8XMvFE2C9
         t+vCNKxwHMr3OBmvaK5ipCz84+KAkTQxI+pSCfoP7FV6uo5mdVvp20cC8udSfOt0taa1
         TS+o7W2CuMhpvogC7ATlbkTVPT4shCNklQr8rdsE6AT+KSM3KaCvxvbUfvTQ7ggYo7Tv
         wwgP/SnzALdVJy6XjEusO6+OnB6MW77An5YtY8l6E8mK8QSaSHoLghUR6ex0jRqmn65q
         PckFNPISLmQwbl2hXbTIT+D5AA1gC3dRxspgtj96JWbZi1cVu73BRUIv5TWRX7L+cPRw
         4NfQ==
X-Gm-Message-State: AFqh2kqsBU19wI9uuvla7UHNyazvFSBnU/99J6o4cOsWqhfJOYGm4pc8
        ZB2fjPp4eWyLN7P9W04nYwdcO+bQL4s=
X-Google-Smtp-Source: AMrXdXtBgoui25MAJbNWchSD+Kg0e9BHroXMp8Q0qorZNgRQ8A1dnNCg5YNIK/DN4ZPlUFiGinC8LQ==
X-Received: by 2002:adf:f384:0:b0:2b7:26c1:e81a with SMTP id m4-20020adff384000000b002b726c1e81amr2975946wro.25.1673964157765;
        Tue, 17 Jan 2023 06:02:37 -0800 (PST)
Received: from DESKTOP-53HLT22 ([39.42.156.237])
        by smtp.gmail.com with ESMTPSA id e36-20020a5d5964000000b002be0b1e556esm4317792wri.59.2023.01.17.06.02.36
        for <linux-ia64@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 17 Jan 2023 06:02:36 -0800 (PST)
Message-ID: <63c6aa7c.5d0a0220.9c028.026d@mx.google.com>
Date:   Tue, 17 Jan 2023 06:02:36 -0800 (PST)
X-Google-Original-Date: 17 Jan 2023 09:04:12 -0500
MIME-Version: 1.0
From:   felixjosiah47@gmail.com
To:     linux-ia64@vger.kernel.org
Subject: TakeOff
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

=0D=0AHi,=0D=0A=0D=0ADo you have any estimating projects for us=0D=0A=
=0D=0AIf you are holding a project, please send over the plans in=
 PDF format for getting a firm quote on your project.=0D=0A=0D=0A=
Let me know if you have any questions or if you would like to see=
 some samples.=0D=0A=0D=0AWe will be happy to answer any question=
s you have. Thank you=0D=0A=0D=0ARegards,=0D=0AFelix Josiah=0D=0A=
Crossland Estimation, INC

