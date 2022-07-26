Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 910BA580743
	for <lists+linux-ia64@lfdr.de>; Tue, 26 Jul 2022 00:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237235AbiGYWWi (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 25 Jul 2022 18:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236925AbiGYWWh (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 25 Jul 2022 18:22:37 -0400
X-Greylist: delayed 1800 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 25 Jul 2022 15:22:36 PDT
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2910C252B7;
        Mon, 25 Jul 2022 15:22:36 -0700 (PDT)
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.17])
        by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
        id 1oG508-006V3d-JH; Mon, 25 Jul 2022 21:48:29 +0100
Message-ID: <a5b079bb-64ab-092d-27d4-d32d0d35afcb@codethink.co.uk>
Date:   Mon, 25 Jul 2022 21:48:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] profile: setup_profiling_timer() is moslty not
 implemented
Content-Language: en-GB
To:     Andrew Morton <akpm@linux-foundation.org>,
        Ben Dooks <ben-linux@fluff.org>
Cc:     linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-parisc@vger.kernel.org, openrisc@lists.librecores.org,
        linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org
References: <20220721195509.418205-1-ben-linux@fluff.org>
 <20220725123948.f16674b10022404814161d4a@linux-foundation.org>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220725123948.f16674b10022404814161d4a@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 25/07/2022 20:39, Andrew Morton wrote:
> On Thu, 21 Jul 2022 20:55:09 +0100 Ben Dooks <ben-linux@fluff.org> wrote:
> 
>> The setup_profiling_timer() is mostly un-implemented by many
>> architectures. In many places it isn't guarded by CONFIG_PROFILE
>> which is needed for it to be used. Make it a weak symbol in
>> kernel/profile.c and remove the 'return -EINVAL' implementations
>> from the kenrel.
>>
>> There are a couple of architectures which do return 0 from
>> the setup_profiling_timer() function but they don't seem to
>> do anything else with it. To keep the /proc compatibility for
>> now, leave these for a future update or removal.
>>
>> On ARM, this fixes the following sparse warning:
>> arch/arm/kernel/smp.c:793:5: warning: symbol 'setup_profiling_timer' was not declared. Should it be static?
> 
> I'll grab this.
> 
> We have had some problems with weak functions lately.  See
> 
> https://lore.kernel.org/all/87ee0q7b92.fsf@email.froward.int.ebiederm.org/T/#u
> 
> Hopefully that was a rare corner case.

Great, thanks.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
