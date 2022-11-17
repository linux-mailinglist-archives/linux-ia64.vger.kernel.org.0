Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0874262DDFA
	for <lists+linux-ia64@lfdr.de>; Thu, 17 Nov 2022 15:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240367AbiKQOZd (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 17 Nov 2022 09:25:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240380AbiKQOZM (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 17 Nov 2022 09:25:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3321D79E16
        for <linux-ia64@vger.kernel.org>; Thu, 17 Nov 2022 06:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668695052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nZPY6OJIRrwMZkBLytVOAK+0kIpEYMOqoTEpl19M6ws=;
        b=hUoTaAGanTb+dFIsYwLLhlfnQMB0aCJFI9TmBYC8BxqKf5kYiKSFMU1gc6yg+LJPykT3QI
        AQrYDFewqG1MLEo8qoJH249WxuNB2l2pc5tXg0Naq9dxoGM5YDnXWSrqtv7q7eO8D1WDeD
        +n08eYwOA2FxLtBRxb//jc3lRNwC9S8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-486-jDglYvd3PIWLsVaNONYQIg-1; Thu, 17 Nov 2022 09:24:11 -0500
X-MC-Unique: jDglYvd3PIWLsVaNONYQIg-1
Received: by mail-wr1-f72.google.com with SMTP id l1-20020adfa381000000b0024184dfcb5eso770049wrb.21
        for <linux-ia64@vger.kernel.org>; Thu, 17 Nov 2022 06:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZPY6OJIRrwMZkBLytVOAK+0kIpEYMOqoTEpl19M6ws=;
        b=PK64lJpNUN4W8SaPE21pL+XWxPGgNaJoi9QKMQ/jTwJ+rniqj2nEUDL2KhqezmmLlL
         aXh0xbW+hjtqWesrKKmOGeKQmWcINVpiwT/S22wTLpyyOlq2v/IW++lfA+RznxaF1/IG
         IRdxq/R++/FgxNrg3Qz+5usRxpKNs8Ax9Z4hG9U3mUwK3BGavstRB4bi7oBbUtc+eeNx
         QEBwfIp3a66dBKnnUAdTyYXRh3VMe27w1bL6M7EtYd0MgSD1evu6Yo6E0Yf7cDH5bq6p
         P9+UKLRI2CPzGIA+UHcaV987xGYYE+40wC2lGVlPazJYIDFRgSficg3z/2/oKdv2+mOT
         dDgw==
X-Gm-Message-State: ANoB5pmYxOpCidtqhdDjnmhAJOl3Nf1Lc/2cY3fJRp1gLPHJcPwt6irB
        +QviUhEuczNH/w2xZfcJqzhiuS1drsePRw5guui8KWWF3OAU9bvCtB4KR3Ah3cujYY+7wpNZyxv
        8tRF/XE9Rk4N7yXe989xYnQ==
X-Received: by 2002:a05:600c:24e:b0:3c5:f9f1:f956 with SMTP id 14-20020a05600c024e00b003c5f9f1f956mr5602413wmj.50.1668695049910;
        Thu, 17 Nov 2022 06:24:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf660kXw1O9nDmBZzBp9eoh92b2B6Bcx05wnz8U6SS8Dy3l/finKWGNWkc/ihpfy4N9vMJHAMQ==
X-Received: by 2002:a05:600c:24e:b0:3c5:f9f1:f956 with SMTP id 14-20020a05600c024e00b003c5f9f1f956mr5602401wmj.50.1668695049758;
        Thu, 17 Nov 2022 06:24:09 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d6112000000b00236e834f050sm1095385wrt.35.2022.11.17.06.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 06:24:09 -0800 (PST)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org, Guo Ren <guoren@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicholas Piggin <npiggin@gmail.com>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [RFC PATCH v2 6/8] treewide: Trace IPIs sent via
 smp_send_reschedule()
In-Reply-To: <Y3X7CijMXpqQIHhk@hirez.programming.kicks-ass.net>
References: <20221102182949.3119584-1-vschneid@redhat.com>
 <20221102183336.3120536-5-vschneid@redhat.com>
 <Y3X7CijMXpqQIHhk@hirez.programming.kicks-ass.net>
Date:   Thu, 17 Nov 2022 14:24:04 +0000
Message-ID: <xhsmhiljdy7zv.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 17/11/22 10:12, Peter Zijlstra wrote:
> On Wed, Nov 02, 2022 at 06:33:34PM +0000, Valentin Schneider wrote:
>
>> diff --git a/kernel/smp.c b/kernel/smp.c
>> index c4d561cf50d45..44fa4b9b1f46b 100644
>> --- a/kernel/smp.c
>> +++ b/kernel/smp.c
>> @@ -167,6 +167,14 @@ send_call_function_ipi_mask(const struct cpumask *mask)
>>      arch_send_call_function_ipi_mask(mask);
>>  }
>>
>> +void smp_send_reschedule(int cpu)
>> +{
>> +	/* XXX scheduler_ipi is inline :/ */
>> +	trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, NULL);
>> +	arch_smp_send_reschedule(cpu);
>> +}
>> +EXPORT_SYMBOL_GPL(smp_send_reschedule);
>
> Yeah, no.. I see some crazy archs do this, but no we're not exporting
> this in generic.

So the list is: ia64, powerpc, riscv
and they all seem to do it because of KVM:
  c4cb768f0277 ("[IA64] export smp_send_reschedule")
  de56a948b918 ("KVM: PPC: Add support for Book3S processors in hypervisor mode")
  d3d7a0ce020e ("RISC-V: Export kernel symbols for kvm")

Other archs get out of it either because their smp_send_reschedule() is
inline (e.g. x86), or because they don't allow building KVM as a module
(e.g. arm64).

If I can cobble the tracepoint+reschedule in an inline helper, then that
wouldn't require any new exports - I'm fighting a bit with the header maze
ATM, but hopefully I can get somewhere with this.

