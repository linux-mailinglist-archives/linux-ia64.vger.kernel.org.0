Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F29CE62FA8C
	for <lists+linux-ia64@lfdr.de>; Fri, 18 Nov 2022 17:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242224AbiKRQnn (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 18 Nov 2022 11:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242000AbiKRQnl (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 18 Nov 2022 11:43:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018E093738
        for <linux-ia64@vger.kernel.org>; Fri, 18 Nov 2022 08:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668789759;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iCeupirs0oRwfAYdrtKDNR33oxtw0kRHF9WhmcxURbs=;
        b=GipMlCWkfb+V2x5o/tgGRU9w4p0tdNI13TeFFNdOr+JVkdECvJaLQf8VNms7thvkKpH5zE
        5g5kuKg+9KpkGfkpcbVwgenGKd0eWqwyGitQEqx4FkjtGoQ75CXt+ajHZrc3Djs248nwZ9
        KZ0dJGRGEoVsjiR0zYgZCToGUJ9YQGU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-vC_Gfj6kNKCi0UTBc7xyqA-1; Fri, 18 Nov 2022 11:42:38 -0500
X-MC-Unique: vC_Gfj6kNKCi0UTBc7xyqA-1
Received: by mail-ed1-f69.google.com with SMTP id b14-20020a056402278e00b004621a2642d7so3280546ede.1
        for <linux-ia64@vger.kernel.org>; Fri, 18 Nov 2022 08:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iCeupirs0oRwfAYdrtKDNR33oxtw0kRHF9WhmcxURbs=;
        b=TyTB3ET3qOuMw5h6usSfaovOWnETFBi4EaM65tgJUd3w7jkkAjuPxPlFv3+tIQidl/
         fVQVOWwPBHgpV8lEECAk85fIXpOiysC+cAbmLiJ0ioxXswy/xFxvgFnFCWeI6eh4fiZt
         UJDdeSuYh1+ODgO8zH9xUDRd6Iulp+TiVJo3bgZb9XXb+AQhMBqyvGwyCkNgHlSTNBJI
         MjucXG70gfy940hhyYPwLsovpXB7M7EEnyaIGzuBjDURvA1vAIOqabt/dLyaxCYDtf56
         Dy/O9QqIXPiqRKLFpwubuTBlv/pfO6L9N8H5Bwep7lMil61GlNCcmzEea6rLyGzEha4z
         /N2w==
X-Gm-Message-State: ANoB5plMRzrXPiE3/KIdmWoxWg629kTRCm98jzgOyDaUOMciRi6lJ7Zn
        gLjhzLQw2vv0KTg7YpxKr+f7HVCrVCIaYMdNKmMPBULqzM8ciHQkjmoJIRD4gYP7FfdhkQmYSQ1
        +6BcqN86vRWX3dmyjJCp30w==
X-Received: by 2002:aa7:d4cf:0:b0:461:a9ce:5408 with SMTP id t15-20020aa7d4cf000000b00461a9ce5408mr6997421edr.201.1668789757507;
        Fri, 18 Nov 2022 08:42:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5TaV9WywAgyEkJUjIKk83rbFXBQR8khfDHnlKNNSiUU8k8aohx0CjQn5lly7hEq5+W3BWrVw==
X-Received: by 2002:aa7:d4cf:0:b0:461:a9ce:5408 with SMTP id t15-20020aa7d4cf000000b00461a9ce5408mr6997376edr.201.1668789757207;
        Fri, 18 Nov 2022 08:42:37 -0800 (PST)
Received: from [192.168.0.46] (host-95-248-159-81.retail.telecomitalia.it. [95.248.159.81])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709063caa00b0073d83f80b05sm1912134ejh.94.2022.11.18.08.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 08:42:36 -0800 (PST)
Message-ID: <1ab5082c-bec5-53f2-501b-f15f7e8edbd9@redhat.com>
Date:   Fri, 18 Nov 2022 17:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH v2 8/8] sched, smp: Trace smp callback causing an IPI
To:     Peter Zijlstra <peterz@infradead.org>,
        Valentin Schneider <vschneid@redhat.com>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Juri Lelli <juri.lelli@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicholas Piggin <npiggin@gmail.com>,
        Guo Ren <guoren@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
References: <20221102182949.3119584-1-vschneid@redhat.com>
 <20221102183336.3120536-7-vschneid@redhat.com>
 <Y3ZBUMteJysc1/lA@hirez.programming.kicks-ass.net>
 <xhsmhfsehy706.mognet@vschneid.remote.csb>
 <Y3dMiyFn6TG1s5g3@hirez.programming.kicks-ass.net>
Content-Language: en-US
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
In-Reply-To: <Y3dMiyFn6TG1s5g3@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 11/18/22 10:12, Peter Zijlstra wrote:
> On Thu, Nov 17, 2022 at 02:45:29PM +0000, Valentin Schneider wrote:
> 
>>> +	if (trace_ipi_send_cpumask_enabled()) {
>>> +		call_single_data_t *csd;
>>> +		smp_call_func_t func;
>>> +
>>> +		csd = container_of(node, call_single_data_t, node.llist);
>>> +
>>> +		func = sched_ttwu_pending;
>>> +		if (CSD_TYPE(csd) != CSD_TYPE_TTWU)
>>> +			func = csd->func;
>>> +
>>> +		if (raw_smp_call_single_queue(cpu, node))
>>> +			trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, func);
>> So I went with the tracepoint being placed *before* the actual IPI gets
>> sent to have a somewhat sane ordering between trace_ipi_send_cpumask() and
>> e.g. trace_call_function_single_entry().
>>
>> Packaging the call_single_queue logic makes the code less horrible, but it
>> does mix up the event ordering...
> Keeps em sharp ;-)
> 

Having the trace before the IPI avoids the (non ideal) case where the trace stops because of
an IPI execution before we have trace about who sent it... :-(.

-- Daniel

