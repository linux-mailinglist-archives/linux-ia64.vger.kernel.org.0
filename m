Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBBAE70AAB9
	for <lists+linux-ia64@lfdr.de>; Sat, 20 May 2023 21:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjETT16 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ia64@lfdr.de>); Sat, 20 May 2023 15:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjETT15 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 20 May 2023 15:27:57 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3DFFE
        for <linux-ia64@vger.kernel.org>; Sat, 20 May 2023 12:27:56 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1q0SF4-002hpO-D0; Sat, 20 May 2023 21:27:50 +0200
Received: from p57bd9704.dip0.t-ipconnect.de ([87.189.151.4] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1q0SF4-003QtS-55; Sat, 20 May 2023 21:27:50 +0200
Message-ID: <88cd4f71bba353f47d8823de6dc3d75ca475e457.camel@physik.fu-berlin.de>
Subject: Re: [crosspost] dropping support for ia64
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Florian Weimer <fw@deneb.enyo.de>,
        matoro <matoro_mailinglist_kernel@matoro.tk>
Cc:     Frank Scheiner <frank.scheiner@web.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        distributions@lists.freedesktop.org, debian-ia64@lists.debian.org,
        linux-ia64@vger.kernel.org, port-ia64@netbsd.org,
        Tony Luck <tony.luck@intel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        Steve McIntyre <steve@einval.com>
Date:   Sat, 20 May 2023 21:27:48 +0200
In-Reply-To: <ff58a3e76e5102c94bb5946d99187b358def688a.camel@physik.fu-berlin.de>
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
         <59a76177-8ed4-e71e-9b11-a673298b5b4b@web.de>
         <87bkiilpc4.fsf@mid.deneb.enyo.de>
         <4e210d61adbe73a1673f113019401e5c@matoro.tk>
         <12a3e3c5-9465-c97f-58ab-938e80681fbc@web.de>
         <5e778e16f93f2286fa535597ba5da24b@matoro.tk>
         <87y1lj0x0m.fsf@mid.deneb.enyo.de>
         <ff58a3e76e5102c94bb5946d99187b358def688a.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.151.4
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Sat, 2023-05-20 at 21:22 +0200, John Paul Adrian Glaubitz wrote:
> Other projects such as LLVM, OpenJDK and Ruby already support native code generation
> support for ia64 although OpenJDK still works using the Zero port.

That should be »already removed native code generation support for ia64«.

Sorry, I'm already tired today. (-_-) zzz

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
