Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB122671CEC
	for <lists+linux-ia64@lfdr.de>; Wed, 18 Jan 2023 14:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjARNFs (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 18 Jan 2023 08:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbjARNFQ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 18 Jan 2023 08:05:16 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB37B683EF
        for <linux-ia64@vger.kernel.org>; Wed, 18 Jan 2023 04:26:32 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pI7WR-002IF8-4U; Wed, 18 Jan 2023 13:26:31 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pI7WP-001tOi-HW; Wed, 18 Jan 2023 13:26:31 +0100
Message-ID: <77eacc0d-086f-505d-37ea-30611b0b35e2@physik.fu-berlin.de>
Date:   Wed, 18 Jan 2023 13:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
Cc:     Sergei Trofimovich <slyich@gmail.com>,
        Jessica Clarke <jrtc27@debian.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Boot regression on ia64 with 6.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi!

There is a boot regression on ia64 with 6.1 that causes the machine to reset
during boot. I haven't bisected the bad commit yet, this will happen later today:

[    1.296316] Unpacking initramfs...
[    1.313806] Entered OS MCA handler. PSP=20010000fff21320 cpu=2 monarch=1
[    1.313806] 6All OS MCA slaves have reached rendezvous
[    1.313806] mlogbuf_finish: printing switched to urgent mode, MCA/INIT might be dodgy or fail.
[    1.313806] Delaying for 5 seconds...

Just in case anyone already has an idea.

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
