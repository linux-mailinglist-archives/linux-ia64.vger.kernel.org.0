Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B46716F90
	for <lists+linux-ia64@lfdr.de>; Tue, 30 May 2023 23:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbjE3VTe (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 30 May 2023 17:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbjE3VTd (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 30 May 2023 17:19:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB61AC0;
        Tue, 30 May 2023 14:19:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45357633B6;
        Tue, 30 May 2023 21:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD934C433EF;
        Tue, 30 May 2023 21:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685481571;
        bh=niUCWjvGYPfPMSEsThlHQ2cG8bG0laDOcvyHoI/nf58=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=cpvL0Wle9T34ssE75tJEg6jPoyh/vaiSqI6CqTONVMFoWfUVQyCn1/V1dQZa8QWVS
         ImorouV/yLw1P3lp73MfxAVKp/O00lMWxhukp60jk+MLTD1iF/TSphziAwNEV1ov4D
         diKUsRK5iioirix/qf1QXLXidkWg52iXumyvc85xLhQ9Bx7gMsTwUDcKunkAo8onvD
         xFvHIfg8mPXmxSPnDkvP6yIBhraUDPtDs4YLF7sf8Pp+ILM/BU7yUj1tStufTaJGL+
         q4y7pj5ECyBk12XoNKQdVOD1XuiQM1/3LhuzcdtVao++snRwGDYiRcRjRMCG5Vr/zK
         NzEwfsm5gd4tw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9A9AAE52BF6;
        Tue, 30 May 2023 21:19:31 +0000 (UTC)
Subject: Re: [GIT PULL] Modules changes for v6.4-rc5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZHYlj7jks1GIxNSn@bombadil.infradead.org>
References: <ZHYlj7jks1GIxNSn@bombadil.infradead.org>
X-PR-Tracked-List-Id: <linux-modules.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZHYlj7jks1GIxNSn@bombadil.infradead.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/ tags/modules-6.4-rc5
X-PR-Tracked-Commit-Id: db3e33dd8bd956f165436afdbdbf1c653fb3c8e6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6d86b56f54533025d94df25d77ed324344e02337
Message-Id: <168548157162.4416.3202071710934741568.pr-tracker-bot@kernel.org>
Date:   Tue, 30 May 2023 21:19:31 +0000
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-modules@vger.kernel.org, linux-ia64@vger.kernel.org,
        debian-ia64@lists.debian.org, glaubitz@physik.fu-berlin.de,
        Frank Scheiner <frank.scheiner@web.de>,
        Song Liu <song@kernel.org>, mcgrof@kernel.org
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

The pull request you sent on Tue, 30 May 2023 09:34:23 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/ tags/modules-6.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6d86b56f54533025d94df25d77ed324344e02337

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
