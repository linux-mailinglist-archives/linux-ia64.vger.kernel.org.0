Return-Path: <linux-ia64+bounces-3-lists+linux-ia64=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A017E9397
	for <lists+linux-ia64@lfdr.de>; Mon, 13 Nov 2023 01:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83248280A4B
	for <lists+linux-ia64@lfdr.de>; Mon, 13 Nov 2023 00:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0800B2F33
	for <lists+linux-ia64@lfdr.de>; Mon, 13 Nov 2023 00:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d1f23R4z"
X-Original-To: linux-ia64@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145651FAE
	for <linux-ia64@vger.kernel.org>; Mon, 13 Nov 2023 00:03:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E521FEF
	for <linux-ia64@vger.kernel.org>; Sun, 12 Nov 2023 16:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699833810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZHIbA5dSDa0YFUBZZETUQKKTVizuf5JaF0jClraxRM=;
	b=d1f23R4z4J7igoUx6O4n+PBCHwLpONwfAsSnhIgC4GvGIowSKfk6qf6UxT80F9sjTYJzZu
	zcKuhjWoyb/e+4Y8YDWci5HlDbhlMNjvZNoNy2g4lJZj8ByT6vYo6XLB5znFJVYAcKpLM/
	yPWvUpsFCOLgfemle8hx1EqVVrxEumU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-ZZNBqJQ0PjS-5SLyEuAuOg-1; Sun, 12 Nov 2023 19:03:28 -0500
X-MC-Unique: ZZNBqJQ0PjS-5SLyEuAuOg-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1cc281f1214so43559205ad.2
        for <linux-ia64@vger.kernel.org>; Sun, 12 Nov 2023 16:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699833808; x=1700438608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZHIbA5dSDa0YFUBZZETUQKKTVizuf5JaF0jClraxRM=;
        b=p1ksRSruzEQ8ISCacbsmQ4swMUCdwHV+fv58CAmTfztVgb3JHd3mrgKgxvGvpSLB+0
         o1PPZDg0kxwlTsoCcy9mhdSQpPEeIM2aOXkRY/u3KFwYMmmJz9sMS4+DOCxm+ReYV1gQ
         ZAJdV0rGQ7CwekvBm+Pducyess9353M3h/VgTyIqa1Sa2Zdzxx3c/5xv+g+fcBta3U1T
         8Yier2WqBD6imz2/26YDGxbR9y3RP8rhOjy8U7i2BfT0hajxYW9MrOMGIW5K2H//yh04
         i5OvrDUipw5H5KGqV9FAlRVqpHVwShfw4aPIHAV5KhM3Oqs0NEKAOpaFz2IQKSjHWVqj
         DiIQ==
X-Gm-Message-State: AOJu0YwWC2gAn1V+h9Qs1D7V3B7c1o+O4Zk/nHoMwdJDvXOTktBXMoxi
	8H2SPrQXBbtpRyGpDwP+P2CxKYTQr0+q37eVkkxoPq/db4zVetOKdAzZkMIc16v6zS2jZ79gF8d
	JJ9kTxpUhgmYIATWYkJJ69w==
X-Received: by 2002:a17:903:124a:b0:1ca:7f91:aa5d with SMTP id u10-20020a170903124a00b001ca7f91aa5dmr7816447plh.16.1699833807797;
        Sun, 12 Nov 2023 16:03:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECTuRNfb72TOfAtkV7pMmjD+8xBNsdITfj8lqsTmhB+HwPaZ/5CGTlMF5gZ/CbtXGVZnzltA==
X-Received: by 2002:a17:903:124a:b0:1ca:7f91:aa5d with SMTP id u10-20020a170903124a00b001ca7f91aa5dmr7816433plh.16.1699833807525;
        Sun, 12 Nov 2023 16:03:27 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id jj3-20020a170903048300b001cc29ffcd96sm3038705plb.192.2023.11.12.16.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:03:27 -0800 (PST)
Message-ID: <e4f752f9-3c8c-4d96-8efd-d9dc157cc976@redhat.com>
Date: Mon, 13 Nov 2023 10:03:17 +1000
Precedence: bulk
X-Mailing-List: linux-ia64@vger.kernel.org
List-Id: <linux-ia64.vger.kernel.org>
List-Subscribe: <mailto:linux-ia64+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ia64+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/22] x86: intel_epb: Don't rely on link order
Content-Language: en-US
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JKq-00CTwZ-Mh@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JKq-00CTwZ-Mh@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/23 20:29, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> intel_epb_init() is called as a subsys_initcall() to register cpuhp
> callbacks. The callbacks make use of get_cpu_device() which will return
> NULL unless register_cpu() has been called. register_cpu() is called
> from topology_init(), which is also a subsys_initcall().
> 
> This is fragile. Moving the register_cpu() to a different
> subsys_initcall()  leads to a NULL dereference during boot.
> 
> Make intel_epb_init() a late_initcall(), user-space can't provide a
> policy before this point anyway.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> subsys_initcall_sync() would be an option, but moving the register_cpu()
> calls into ACPI also means adding a safety net for CPUs that are online
> but not described properly by firmware. This lives in subsys_initcall_sync().
> ---
>   arch/x86/kernel/cpu/intel_epb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


