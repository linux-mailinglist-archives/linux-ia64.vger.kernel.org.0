Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6796B7132D8
	for <lists+linux-ia64@lfdr.de>; Sat, 27 May 2023 09:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbjE0HCa (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 27 May 2023 03:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjE0HC3 (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 27 May 2023 03:02:29 -0400
Received: from mout.web.de (mout.web.de [212.227.15.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA993EB
        for <linux-ia64@vger.kernel.org>; Sat, 27 May 2023 00:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1685170905; x=1685775705; i=frank.scheiner@web.de;
 bh=rAryRTxS0T5TuVGbciON9htWPIgfBVBJWk1P4zA/ctU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=jd2HliAWHq5ad1yzmXPETRgjXNSaKCXddXzvhdisTkhtJd8sceV6khT9/RLnSz1MvoWAFB8
 ED1B4fvMHw8GYxzap0W9B8H1Ot2JaTtQvuUCsHmg2TiYaYx0D/3xy1628kgMBQxu3Zm6vKtdR
 LYlnHuwE3IPJNG0dmjNpRhIbypTHwqYTZ+8zk3FeNoVwHUx35bQNd7DKIWuMnOneDi3pACcWq
 6MjVwhz9m/DqpzfQWCDbhXWGi2G8gAtpQ+VqAyt96UPNp9Y1qnaT2DuRiggU4AjmUiWKGflB1
 8nPVxfkabBPgc5n06DOB0WPbu+QhIswcLqgGRaxygy2zOFrp6iPA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([217.247.45.222]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjgXH-1qVUmp3yzD-00lC2D; Sat, 27
 May 2023 09:01:45 +0200
Message-ID: <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de>
Date:   Sat, 27 May 2023 09:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Boot regression in Linux v6.4-rc3
Content-Language: en-US
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
        linux-ia64@vger.kernel.org, song@kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Luis Chamberlain <mcgrof@kernel.org>
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
 <ZHErssbUSbSznTVA@bombadil.infradead.org>
 <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
From:   Frank Scheiner <frank.scheiner@web.de>
In-Reply-To: <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:yd8+d93OVU0ZLxv9/1gCHTip7cfkMhuRCqrbsyCeNyxid2eaA5/
 g5ZTe3a7A/W8v4kt111glk/OAM3m3N3bzR5AxBn2238YyikoNezCRQ1HOT42s//sK8VD6rt
 YwrO9+/Hdg/fZOJFvPZddoGiDZYJcl58dgLcAmsHLWFOcl5BAxLfvLPyrDCx7miUJIgLNnT
 tK8CgSuO/P7oGXnAeVynQ==
UI-OutboundReport: notjunk:1;M01:P0:NGRlIucQATA=;9q7LgZHxEAOEFcyLgPrwrmRvB5T
 aDeOl4RAPakBT9dDVtS+DwRuq8/CoLnneb5DqrpSXz77mvP5kHwGjbs2HaPwqXuHMPpdB2jpY
 CKbvXd6zhNjHRyOAbSZdQ6XN0mJD+Joqtq3ssShUrJlzjHwqGasHn7TYN8Ms1UwstHZWOul95
 rt/TnnQcjIV35iGQLc9Yx1AbBi6B3EZmFEJBkI9eQ4q2A+LCee+yQyNRqzzR6kaWfys1sHzu0
 92s3ypag4HV6h0UoXB7Gq3El4iW7H0196IcQM6o2X7jZP75xjMJXctdtbwpZmxXBbdHQWMEs/
 SmSWN2ZqXi2NgQdfpDj2MBMPYNhs+TM1AkgWlhUg/W6IjGx6L5C1i9zZt4UNeYNgEsaIaJvZ/
 a3/6KxqmTwNvb8V7zBYslGXmyo8cgXlNMbxXgOSxsR0J8ecAak4ohAd1B+wduvCd0yF2wPhWQ
 JB1+bWStwymp2/2sdnZuRbFOX01/0G3jZPbvAcGMAdGonWTL0hVVpRnIYmVrUv9qzQUSTIT1A
 FSS4A2Q6mDt5DAqJC1J8cp8Norp9w7jHzfUX5TPggl+FyQZNAS76fcLYG9XbnIoc71VsbuXMR
 KRupNlxaCw2Pxd9X0CVkfvyr6YwqUAbNR8hQBl8d/6Kc3IBOPhmnE8N57SXwF5DkL9WPmonZx
 Jq8VEqXdHfLsqQ+Z1WlZf9zuzwR71AprfHV8Nhbj0n8WklKOd9jx7qL6PokJgXGvhBCJEslSg
 lTEetDsXKymxl5WJdan9m4qWjytC2gwiSIbZ67IZpncbCsXgCqZAD5Hh2/reMXN68mO6hYHVA
 q19R+aTItGPwF7WuPATUFvQkT8Hf1CcltmghyjjLc3/xYmIhlqn07F0ukVll6GWcEfsyF8evi
 iEj4ndEvsVt58trEGhyEx+0q3h6shWAqaJqt3VHCmPL++KbD5xaDogHioACC697OD6bDWtvdX
 Ht4EOOl46T3OyAulLPSILxo+Hpc=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 27.05.23 00:22, Linus Torvalds wrote:
> [...]
> But this is my "monkey see, monkey do" pattern matching reaction, not
> from any deeper understanding of the problem (I can't even see the
> report) or really even the code.

If it is of any help, my initial report is available for example via:

https://marc.info/?l=linux-ia64&m=168509859125505&w=2

...the whole thread is currently at:

https://marc.info/?t=168509868200003&r=1&w=2

Cheers,
Frank
