Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F356610EAD7
	for <lists+linux-ia64@lfdr.de>; Mon,  2 Dec 2019 14:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfLBNdB (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 2 Dec 2019 08:33:01 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36426 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfLBNdB (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 2 Dec 2019 08:33:01 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so44260711wru.3
        for <linux-ia64@vger.kernel.org>; Mon, 02 Dec 2019 05:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z+QGY7jr44pYxe54+7M8En72VvMMFxWIK2gqrMhHkc0=;
        b=le27mUD5UzEV0sC6F+c2OWBzFaCE/ZZFIDGVHEaMHQdzCZ4pKSL6hu1C/MTBt3Baz7
         XZ5hEl18r+IM/w35GemiYipJGhyW+W6zAYo/fV2aQN4d+/ugKQ3hOVK4mc4MrlMCt69Z
         6AImhqwukeBqGJHM7m3vIshhmgyiNfvs8LBgpYdPRrsoKsFsFFxYka93um+o7DBBkez6
         sjfx9V0wKoYfNP1qza7FpXhtvveHssOCpsbi6q+QeIFc7w+/bBF+K1O/oowkekvNic0U
         ozb5hhWTYjrBNsj19K+USAL/YorGBXuM+haGGDsyMoDAKYsGX/QJ0aTUmNdNY9r986cW
         bnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z+QGY7jr44pYxe54+7M8En72VvMMFxWIK2gqrMhHkc0=;
        b=O+MVs4vf9cIK1eVeC1LVCD2TVyHFuzA9jqXlSTMm+7Dmp6fC/M/Ms3JHqWG0J4WGbW
         ETWDVj1Ad72ljB7AwFxi4RrnDrwOtITsEJkGzGJxl1vb/pfqdF2rGBbmySKNjxPNfhR9
         +RHhxbviUwAmyQ07Fpz/8VZPyd263OM/zGnGMEpTE/+3FYV6K4SV9seXApxeAu2owfdO
         rlbqieVGvtDYp8dk7tnpAmR0fmUevkjo3D0HPmTTNl0wyu0o6vfV9Q7DvKLdL9MXOazr
         BCENVAPnYC9v+sKdKdIU3ath/mRLrtQ6JYs5qZh4hDkiAKFFMeLwi72owvtcLSva5UEa
         IASQ==
X-Gm-Message-State: APjAAAUGLPyRK4trADXolcxGC2FEHPycUKbDmd8Ycn43JCefFRGg1YcT
        92dkgiAQGUk842BKDnauXT/qKA==
X-Google-Smtp-Source: APXvYqzXLdveSYJmzHMioR623raAZQnudeDTjtbXpxlDpAqRENKmsL2huGVsIN+qfrtE1GNKlFMp4w==
X-Received: by 2002:a5d:558d:: with SMTP id i13mr27621576wrv.364.1575293577633;
        Mon, 02 Dec 2019 05:32:57 -0800 (PST)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id s10sm18753106wrw.12.2019.12.02.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 05:32:56 -0800 (PST)
Date:   Mon, 2 Dec 2019 14:32:54 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     airlied@redhat.com, airlied@linux.ie, arnd@arndb.de,
        fenghua.yu@intel.com, gregkh@linuxfoundation.org,
        tony.luck@intel.com
Cc:     linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] agp: minor fixes, does the maintainer still there
 ?
Message-ID: <20191202133254.GA21550@Red>
References: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, Nov 21, 2019 at 08:14:40AM +0000, Corentin Labbe wrote:
> Hello
> 
> This patch serie fixes some minor problem found in the agp subsystem
> There are no change since v1 (posted two years ago)
> This is simply a repost for trying to get an answer (gentle ping 6 month
> ago got no answer also).
> 
> Regards
> 

Hello

Does the AGP maintainer still maintain it ?

Regards
