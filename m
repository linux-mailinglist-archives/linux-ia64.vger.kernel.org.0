Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3146B61DA73
	for <lists+linux-ia64@lfdr.de>; Sat,  5 Nov 2022 13:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiKEMny (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 5 Nov 2022 08:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiKEMnx (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 5 Nov 2022 08:43:53 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2633C23BFC
        for <linux-ia64@vger.kernel.org>; Sat,  5 Nov 2022 05:43:52 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id x2so11175798edd.2
        for <linux-ia64@vger.kernel.org>; Sat, 05 Nov 2022 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=mPMWJSv9+I/YyfOX/KhSq6QJxEVF9czxBjlZfOBHyBNprqZzbXMAaGfMuCUz15WUgd
         P8+TrngI9Rc3ViQGUSuldljbiqwUWen18O0hqt/Ie0OeGmALridq11sGaHqFDDc4lalJ
         acwKewZa0Z+JmHCFhOB1EPm3VoCXqyskBeWh+qI8WdUTyGDi2ZRZxfd09WAIYwZTAuE6
         D6FM36pRhxYi0ioJBBk7CWNeJYL6Gz2n7XR51nKKfVaOUPERzSe8HFAiowZB91Qmwfcs
         4SUmlVM/PGDPqE9RxpsHH7kHCVf7N827dpoIMP0fu4UEVHZDK4bGxZoR2Xec1mMJWH/r
         0h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=c7m3XCf5KSbfnNCJJ++Xrfhzf0g0dN7+MAB/SkVNAiTfLKSLB5JK83Acy8WStHbpbb
         iw7DgAdGuJwV/vEbV0Q7C/XX7Tdv9l/APcs7HRuyhjRCWcJQhSu5twYqwT72KJAvyB1C
         gkx06ISJHTHfTa4fGnPA34hDAsOWc0j7IUNfLiqDAPQiuO9jf541whl/3McmtOv+5mtF
         lzYCOH/YvDeLrD+h5bGzTOY6+bPdritoCS2dz+ZxclqIDA9XbN7/l2QAUuIzok1ISnUx
         UmuC1PR7NVnw0DlQlCjHtiWREUBAxXfDyZTOP7Wnd/8QFLh428fQDW9GnWyZsjkBvJNd
         MHTQ==
X-Gm-Message-State: ACrzQf2Me7CYL3sVqImNe/IrlAJgBEo1E+/pcAAh6h3OkxANzrR6zm2/
        dnxsUQVCh5kMh6oQ6Z2zGEqmLPd1KNU2Cknr4Rc=
X-Google-Smtp-Source: AMsMyM6+i/60GLAa/SmSMCVLMrWq6VlVwX7X2L0dN+kFhjV6izdhKjpdEAZB1JmiGGgnIYpSeGh29lOxg8cgnriAXMM=
X-Received: by 2002:aa7:c504:0:b0:461:122b:882b with SMTP id
 o4-20020aa7c504000000b00461122b882bmr41194609edq.14.1667652230661; Sat, 05
 Nov 2022 05:43:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:33:b0:5c:ee07:e4f3 with HTTP; Sat, 5 Nov 2022
 05:43:49 -0700 (PDT)
Reply-To: stefanopessia755@hotmail.com
From:   Stefano Pessina <francisnzioka80@gmail.com>
Date:   Sat, 5 Nov 2022 15:43:49 +0300
Message-ID: <CAL5scYq=1B=-RX8Eh9M9tf4CevQNnnh7JZ63=g4o=AHLN+9dbg@mail.gmail.com>
Subject: Geldspende
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

--=20
Die Summe von 500.000,00 =E2=82=AC wurde Ihnen von STEFANO PESSINA gespende=
t.
Bitte kontaktieren Sie uns f=C3=BCr weitere Informationen =C3=BCber
stefanopessia755@hotmail.com
