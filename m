Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBBB5933F8
	for <lists+linux-ia64@lfdr.de>; Mon, 15 Aug 2022 19:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiHORZH (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 15 Aug 2022 13:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiHORZH (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 15 Aug 2022 13:25:07 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A1563DB
        for <linux-ia64@vger.kernel.org>; Mon, 15 Aug 2022 10:25:05 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id p14-20020a17090a74ce00b001f4d04492faso7326178pjl.4
        for <linux-ia64@vger.kernel.org>; Mon, 15 Aug 2022 10:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc;
        bh=3uHbtzBqgh0H5akjJ3bAEB7e/E12DWM6pHrWDu/4z94=;
        b=F15pNs3vGOw9CO75NQ/R2oQTEBPkpJ6+ms0tFGdV0FbrGi0GVfsW3cg6LrUb76q0cv
         4zdHSyeo6F7Ydo9GkynvwoXV7V7oSWMbsUNsgU/jd4bSvIoFxMAq7oOS5bfKxTsb0RPQ
         Udb8gA0vwAmA3USzxr9Qa84y5FDmCW6hZWoodFYHL4iKHeIbDFf91SxnI4sQpOIT7I5/
         Zeech7Ty2vQPnRV5kugYA8qKMXXLZUrQDMqDST28tOVq0JrcSblUr1bNEPujShwnZ9Bg
         GN61kw+9C/uH0xFpW+f3hqSVuA1BEJBs5V7/2NsjKK5igyzmvXemUT8DNdG6YDtoLfzj
         ea2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=3uHbtzBqgh0H5akjJ3bAEB7e/E12DWM6pHrWDu/4z94=;
        b=e+ZGbGtU2N/ljbZ5Mr4CIVykvDNmh8RoqFW1paxdQHbqOUJIvFX3sAJaXVY/pNQMET
         prMQNEZMEmY8yhm8fFUpvQLsCfgXwtZwvDvGN7LaMdxb9ngM0AkSszlOl7BDyU5lxA0N
         07RByKuMeuII73AzHI4PQE6l/gcU3ypvWwcW7OQsgo12hAc5Blqx1CO8KDG1UQsp62yh
         o2PGA3cbPDIS9hUUBEkOMpTb2JIbTcTpbL0mTR4DBiFhK4T0/SsxrrNHYjbOpXnZ2OHF
         siWrGGgTDOZ8edyrdErmiBHYf6HnqAunKHuhnAcI5GH7v2e3caoEm/R6asw6d886CGC0
         7abQ==
X-Gm-Message-State: ACgBeo3zkzlzZ2Jmgg/E5pIYXAl8rHvSW1qbXD5IgyN+3PLZCwaWdqh2
        ddUPbQc5Rt4NAnPgkUYozxkggLzSVB4qQ8jpKEw=
X-Google-Smtp-Source: AA6agR6RTJfZw6d+5vHvB/K9aDPTmvsCLpeVAYKqnNRTNG3w94IPxyU/WGOigXq4BV8QrSyMRQtZdZHQdf90eGRtaVU=
X-Received: by 2002:a17:903:2301:b0:16e:f916:22b4 with SMTP id
 d1-20020a170903230100b0016ef91622b4mr17540725plh.52.1660584304670; Mon, 15
 Aug 2022 10:25:04 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mayumisakimoto7@gmail.com
Sender: yusufosman1082@gmail.com
Received: by 2002:a05:7300:b907:b0:6c:126c:1893 with HTTP; Mon, 15 Aug 2022
 10:25:03 -0700 (PDT)
From:   Mayumi Sakimoto <mayumisakimot7@gmail.com>
Date:   Mon, 15 Aug 2022 20:25:03 +0300
X-Google-Sender-Auth: SqTfui3GH1hK0CMQlcHODGqrqRo
Message-ID: <CA+RYSU7cmr8gr0fZaPaKQKhWZEChQLwT=vekUKq5r=eTfqK=NQ@mail.gmail.com>
Subject: Urgent Reply
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY,URG_BIZ autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1034 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5023]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mayumisakimoto7[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mayumisakimot7[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [yusufosman1082[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.6 URG_BIZ Contains urgent matter
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Greetings,

I hope this email finds you well, Please accept my sincere apologies if
my email does not meet your business or personal ethics. Please I have something
very important to discuss with you. I need to entrust you with a
humanitarian project, Please reply to me as soon as possible.


Kind Regards,
mayumi sakimoto
