Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD11670C473
	for <lists+linux-ia64@lfdr.de>; Mon, 22 May 2023 19:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjEVRjH (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 22 May 2023 13:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbjEVRjE (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 22 May 2023 13:39:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CF2102
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 10:39:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D229B614CD
        for <linux-ia64@vger.kernel.org>; Mon, 22 May 2023 17:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C262EC433D2;
        Mon, 22 May 2023 17:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1684777142;
        bh=s9wBP7GUR2lmtFB9K7FkgO8jEhf5+x0/tICqMDuaFqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bb8YjsbZy3qPZZkhAmhiiSxB8ZMPLrLRJZZ5aj9aBMMpNSR6WPoy6Ro5OMRFTSe2X
         6P6UcKUwXIDcWFWOvhXQnAY7NGQq1/qKW+vA11jsGNqls9M5U3WCM4rsLXl88Cz51E
         ZtBT8kRq1W98bhuAmlF9n/i/mogxa69h7YEeJ/ro=
Date:   Mon, 22 May 2023 18:38:59 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Luck, Tony" <tony.luck@intel.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Florian Weimer <fw@deneb.enyo.de>,
        matoro <matoro_mailinglist_kernel@matoro.tk>,
        Frank Scheiner <frank.scheiner@web.de>,
        "distributions@lists.freedesktop.org" 
        <distributions@lists.freedesktop.org>,
        "debian-ia64@lists.debian.org" <debian-ia64@lists.debian.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "port-ia64@netbsd.org" <port-ia64@netbsd.org>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        Steve McIntyre <steve@einval.com>
Subject: Re: [crosspost] dropping support for ia64
Message-ID: <2023052202-tuesday-ploy-9156@gregkh>
References: <4e210d61adbe73a1673f113019401e5c@matoro.tk>
 <12a3e3c5-9465-c97f-58ab-938e80681fbc@web.de>
 <5e778e16f93f2286fa535597ba5da24b@matoro.tk>
 <87y1lj0x0m.fsf@mid.deneb.enyo.de>
 <ff58a3e76e5102c94bb5946d99187b358def688a.camel@physik.fu-berlin.de>
 <CAMj1kXGmbtiosH3fwMuduFvjmb2PVsX-tMLTk96jPvmW+oKi-w@mail.gmail.com>
 <2023052230-lunacy-graffiti-0cee@gregkh>
 <CAMj1kXFWCo4kqkGeYDqY9JJ3bTesJefKTPFhnnszWHbbD4jXwQ@mail.gmail.com>
 <2023052202-stumble-debtless-8613@gregkh>
 <SJ1PR11MB60833AF98E6E9D3CD89AB393FC439@SJ1PR11MB6083.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB60833AF98E6E9D3CD89AB393FC439@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Mon, May 22, 2023 at 05:27:23PM +0000, Luck, Tony wrote:
> >> As far as we have been able to establish, the only people that use
> >> this arch and code are people that would hate to see it go, but don't
> >> actually use it for anything other than checking whether it still
> >> boots, and don't have the skills or bandwidth to step up and maintain
> >> it upstream.
> >
> > Great, then let's drop it today, there is no need to wait until the end
> > of the year as nothing is going to change then.
> 
> I think this also puts the existing stable and LTS trees in some interesting
> state. After arch/ia64 is removed, there may be some tree-wide change
> that gets backported to stable & LTS. That may break arch/ia64 in those
> trees (e.g. because arguments to some common function are changed).
> 
> Maybe just deal with that if it happens ... and if anyone notices ... are there
> automated builds and boot test for ia64 in those trees?

Guenter builds for that, but really, if the tree breaks and no one
notices, is it really broken?  :)

We handle this all the time in other types of removals (drivers,
subsystems, etc.)  I doubt this tiny amount of arch code will matter
much in the long run.

thanks,

greg k-h
