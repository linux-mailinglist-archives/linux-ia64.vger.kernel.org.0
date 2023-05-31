Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7AFD718930
	for <lists+linux-ia64@lfdr.de>; Wed, 31 May 2023 20:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbjEaSQK (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 31 May 2023 14:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjEaSQJ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 31 May 2023 14:16:09 -0400
Received: from mout.web.de (mout.web.de [212.227.15.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC0A98
        for <linux-ia64@vger.kernel.org>; Wed, 31 May 2023 11:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1685556936; x=1686161736; i=frank.scheiner@web.de;
 bh=cGvw9tyWXccQ2Mz8YQVkkf79tK6GfcF5WVkwEahNygE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=PaDmlnDN1qYJ+lyDXh/HcIAqE0zUc/PNvhRYM14SmknPF+bnpuBaI7C1Qbyztj3nUSJsWyU
 DclcXqsUUhSIV0ig3FAv9WESEk1X5jzRgs2cX3NRA3oRPr4GBnzV4rg6yYrz3LDg65VppX2sB
 jeH2T6QB6+x3YbVy8dvCMoPepVQM/955DZsDaNIQODSFCCv2zpE62iXD1fEFqjRZxL1KRtx53
 aFNW1pmFYEkWA+xofF0e7fseAkL8qlZd2Y1F807sIjYebpYwVoactQzXjQRsIRwjw8xEa6W+W
 AKcpFjk0Ps9lbVl8W5P2YSUTIaN0xA4Kl7jxfsFLqWVmY2UNhk5A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([79.200.219.36]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N6Jxd-1qAiuk3vbt-016bxL; Wed, 31
 May 2023 20:15:36 +0200
Message-ID: <b74bda58-8804-4456-eb52-b476e7b29f78@web.de>
Date:   Wed, 31 May 2023 20:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Boot regression in Linux v6.4-rc3
Content-Language: en-US
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Song Liu <song@kernel.org>
Cc:     linux-ia64@vger.kernel.org,
        debian-ia64 <debian-ia64@lists.debian.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <abb1166d-27a9-fbae-59cd-841480fba78a@web.de>
 <ZHErssbUSbSznTVA@bombadil.infradead.org>
 <CAHk-=whuaCqh0RJk1F+SKqdEHPzANoVVP5OU=c9wgogVLCQTVQ@mail.gmail.com>
 <c4ef98ad-cc4e-2949-179d-7edbc3c2a1b5@web.de>
 <CAHk-=whv0Mr_Gnwbm00vi76oTTw16KviVhC33segbjjZbxOswA@mail.gmail.com>
 <b2b47c19-d527-fbd2-1666-801f173b6174@web.de>
 <CAHk-=wjDQZ8snU__Y8qJ8M5H--1FtAwNq-oHKmY4CJuomWPvDw@mail.gmail.com>
 <CAPhsuW7Gcd7hkrD6RtBdJDMdVnaN8Bv_kVNdpyccUiuD-TqYDw@mail.gmail.com>
 <ea6bb10a-f830-1a9f-19b1-07269a073876@web.de>
 <42e4fbe4-2b4d-4f9a-222f-1d14d4836da3@web.de>
 <CAPhsuW5VdZiLwAax1Ax3OVD=Kp2y2i-U9Ap3LS3jY6jz59Nawg@mail.gmail.com>
From:   Frank Scheiner <frank.scheiner@web.de>
In-Reply-To: <CAPhsuW5VdZiLwAax1Ax3OVD=Kp2y2i-U9Ap3LS3jY6jz59Nawg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bb2UhP5M4sqBOHjFSekTX6PseiSBpnBO2uWwxA+yzYAD8rttrVx
 QLdRI8fH0OXOzUcTqzqpEcdDj31AnZnQi32stoAm+xRWjIsADVbu41AVs/WrKS+Ngem59L7
 /KKYgVX7FKszf7HKSZg0f4vzbADpW/WDSkXGgxbGrpj69JNVcuUQOP4aRU2iIdfNdE1PcOF
 dAc5rH7RsldaWVwLt2t8A==
UI-OutboundReport: notjunk:1;M01:P0:FmLlasxcNC0=;ule/R+CSLAWOQqOgkrAQLdzPEdE
 4FY64JEDlkU2zKBHhAGSLrHBAJuVuULqjlFBByjrqDDwYnA/g8soFLYJH+nVLrIEq9rPFTqib
 heXRAfu46co2cG0UZ+MkdRyEXhFkTowBYffY1EWMrgQI141mpBWAvcsA8VnWRKwNMrE3XS72h
 y9W86cw44avNw2HBPWWPkWn7XYin439FKsGQnczWGuOQfJzciFX+y4y2+eNJPz3M/cVS3zK4S
 V7iy8Qk406D42+ACUwFkHCApB1ZcQiqcpKHTH14wo3Hc9ElaMxn71289QG/Y2UycJWuBYHLVa
 OL5Ua9ES1jH8fOJx7Q87nAZKqtb3lJR3xpLnW26i7hpxmS/vMmDt+RKk/fbQ4vU8Ux2pPbb2K
 gbeAmggDKXfg1NBhFki7Gu0crNBZQ5dfeYaYvY3kEYLAVZmmR+5l1KRI2GdCdOW7c7lus5XAF
 x2sTfbnHFqvt4lpc7omyC6N5zyjBCRRlN3gnbnyoJu4vYDXMQG3m42r8YZ5pASb3BER0D/uzy
 P23WTymB3GM8yhVzdGYHWzs93xmSAVTC9QusvGaFMOBogy9cLkxlLz+ODc6/JOsSkMukeZOxe
 WDmfkDNbsrtESe6dMc1Y5tX1mt1bgUzH++rIrHNK7JYmGWFSm4djIAWd/0Kujpx3mYfpS9/8T
 Y4ANb+m0AN5J1BJXiTJ1GKyBRRfmQY3AAqE2TYw3MFz+XmuJWrm5LXkNlvBcVbBZt/mdfLRLb
 LvR5sUGfUoP0fwLI5GcDsNm6kf08NGz0bh0kgP2kcniGBViOLUA0eN2S63dxkcvf8n/Wef9vs
 EQTKsN8JVl1zvutQbUlGzSkmA3nhZAjH+ZVJcgAa+VOwTD0cYopg4L4JoD5vDf5L/YyhVwEGQ
 eCLJis/OKNOQTDK1+awYFUtxk4YKXvlL0HSoHu547O5dRSwhl42ryW8cV9mXos7UMXHjH8m4a
 WZnxJdeH38O8rCIQk4kdRp4V//0=
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

Hi Linus, hi Song,

On 29.05.23 00:46, Song Liu wrote:
> [...]
> Thanks for running the test!
>
> I will send the official patch.
>
> Thanks,
> Song

With the fix merged and to conclude this, I'd like to add that it was a
pleasure to work with you on this problem, although I didn't do much.

Looking forward to the next occasion - for your sake maybe on another
architecture, but can't promise... ;-)

Cheers,
Frank
