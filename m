Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEF54EA11F
	for <lists+linux-ia64@lfdr.de>; Mon, 28 Mar 2022 22:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240517AbiC1UJR (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 28 Mar 2022 16:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244457AbiC1UJQ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 28 Mar 2022 16:09:16 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E425606E6;
        Mon, 28 Mar 2022 13:07:35 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1nYveG-000ivr-Et; Mon, 28 Mar 2022 22:07:32 +0200
Received: from p57bd9b9a.dip0.t-ipconnect.de ([87.189.155.154] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1nYveG-003h5A-89; Mon, 28 Mar 2022 22:07:32 +0200
Message-ID: <a6640ec8-0f1c-0c97-2550-84871ad95051@physik.fu-berlin.de>
Date:   Mon, 28 Mar 2022 22:07:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] ia64: topology: Fix an error handling path in
 cache_add_dev()
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Tony Luck <tony.luck@intel.com>,
        Zhang Yanmin <yanmin.zhang@intel.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-ia64@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
References: <452b20c160a20754022407acefd2abb170f43d14.1648494330.git.christophe.jaillet@wanadoo.fr>
 <facd6471-4c4f-ff5a-e81f-38acd855eb8d@physik.fu-berlin.de>
 <78d00a13-3cee-386c-07f1-8d16a24e4e67@wanadoo.fr>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <78d00a13-3cee-386c-07f1-8d16a24e4e67@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.155.154
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Christophe!

On 3/28/22 21:45, Christophe JAILLET wrote:
> For the other patch, it is just a clean-up. Based on Wikipedia, IA64 is
> discontinued, so such clean-up does not make that much sense either.
> (on the other hand, it should be eay to review and apply :) )

ia64 is still supported in Debian and Gentoo, so any kind of clean-up and
improvement of the kernel code is very welcome.

> I don't think you need to spent time on it. Sorry for the noise.

You didn't make any noise. If you have some improvements, I'm happy to test
them on my ia64 test system.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

