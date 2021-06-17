Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE573AAA46
	for <lists+linux-ia64@lfdr.de>; Thu, 17 Jun 2021 06:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhFQEnP (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 17 Jun 2021 00:43:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34076 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229515AbhFQEnO (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Thu, 17 Jun 2021 00:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623904867;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NRH1mIv3BE8eD5JB0vSdN7Y05iQZJajr4cyJmYooT0M=;
        b=cPbwn7MwMbmNjYnzDZy2m8tTsU6m/3idVD8Xuuvd/uBf8Fu4WLAagbmZvU16g12wqHDHTc
        D5NpTwVQc2YyO0y2MOiq210wK8WbHAVh7r/HGwSFUtMzPr7HHthV6QwdgxFKIZtVyv9n4i
        FLgxZ5ky/juGP3uoxzYzOcakgnT/ySE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-juvsTvnSNwuFbJpkcCf0Pw-1; Thu, 17 Jun 2021 00:41:03 -0400
X-MC-Unique: juvsTvnSNwuFbJpkcCf0Pw-1
Received: by mail-qt1-f200.google.com with SMTP id r17-20020ac842510000b02902456ec03025so3048143qtm.3
        for <linux-ia64@vger.kernel.org>; Wed, 16 Jun 2021 21:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NRH1mIv3BE8eD5JB0vSdN7Y05iQZJajr4cyJmYooT0M=;
        b=G2PMpTgyX3l6pIYZ7wuNZrSTyhul25lt1ICiA4gLhvcnpM9dGt3EBvV8pCD2d1vcV/
         PZmOd4s7rc2q03SoZSTTjgGy5PpyjIt+xFWCeIunuPfXrT3Md4RIA5VFpfaExYf02Ny+
         hY1+VG+M3pG0pukEk9Y8X4NN/hfLOeR5Bq6rWQ/gjzcatODqSTkYfVwQS7iqveK5tCay
         RAulR9g4w/GkSm3Iq8v19efqwryuXmxQsTAnWG46yYUxSdR/1eTvyzjiYl+NVdS7SFzu
         z0dcFzumJiDKHVSScSPMqpagrM8vCe51oU7XcuE2rttM6gROlM86o+fPaWxlZYe2kt1k
         BOeg==
X-Gm-Message-State: AOAM533XB3Whf09CbssjZF68B0Z+10JbEfLalhD+8u/CLRm0QOV2Vlyk
        sjXD8RJMxiugwOdo7DHaiAn89cHge7RPQ8TdqZZuakoUHcEZfCFBw2BjmzlEtITD23D+l4+ILrz
        aLDattyihhakNiiVjq85i5g==
X-Received: by 2002:a37:a389:: with SMTP id m131mr1852465qke.134.1623904862697;
        Wed, 16 Jun 2021 21:41:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy/rnTImZkYqGlwtbUgW/jE8SgnPZVG2s9z6nNoS60Q0zHIRP2wQA0sGlLTIxkcaBzfQbNYA==
X-Received: by 2002:a37:a389:: with SMTP id m131mr1852440qke.134.1623904862501;
        Wed, 16 Jun 2021 21:41:02 -0700 (PDT)
Received: from treble ([68.52.236.68])
        by smtp.gmail.com with ESMTPSA id w8sm967908qkp.136.2021.06.16.21.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 21:41:02 -0700 (PDT)
Date:   Wed, 16 Jun 2021 23:41:00 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, X86 ML <x86@kernel.org>,
        Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org,
        bpf@vger.kernel.org, kuba@kernel.org, mingo@redhat.com,
        ast@kernel.org, tglx@linutronix.de, kernel-team@fb.com, yhs@fb.com,
        linux-ia64@vger.kernel.org,
        Abhishek Sagar <sagar.abhishek@gmail.com>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>
Subject: Re: [PATCH -tip v7 10/13] x86/kprobes: Push a fake return address at
 kretprobe_trampoline
Message-ID: <20210617044100.swsgkyio5wwdl2ic@treble>
References: <162209754288.436794.3904335049560916855.stgit@devnote2>
 <162209763886.436794.6585363781863933939.stgit@devnote2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <162209763886.436794.6585363781863933939.stgit@devnote2>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, May 27, 2021 at 03:40:39PM +0900, Masami Hiramatsu wrote:
> This changes x86/kretprobe stack frame on kretprobe_trampoline
> a bit, which now push the kretprobe_trampoline as a fake return
> address at the bottom of the stack frame. With this fix, the ORC
> unwinder will see the kretprobe_trampoline as a return address.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Tested-by: Andrii Nakryik <andrii@kernel.org>

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

