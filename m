Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36BA5662FB4
	for <lists+linux-ia64@lfdr.de>; Mon,  9 Jan 2023 20:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237259AbjAITCP (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 9 Jan 2023 14:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234827AbjAITCO (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 9 Jan 2023 14:02:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66C337394
        for <linux-ia64@vger.kernel.org>; Mon,  9 Jan 2023 11:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673290889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bU+svoPcyEEDaWYmIcNec69dTXz5hTgyu3b7xJNjXUQ=;
        b=iflefN2DlMtAjzC/hgBZNZ/9Mxmuy6Mv2BQNZTP7HxFc9zBhjzmItsXKEXpOlFV6NJHpD+
        GPPIhzd6Ymwu5k1HOoNQYWJGVNx2+ka3tUCJlQno7GpZz1LDeT97uZvS3+lF22t4BeS+Bb
        6qMQQSPRl/T0/PxBUFv+HxfP3xpKYI4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-fjzl6CD6MUGDCSt3OiBPYQ-1; Mon, 09 Jan 2023 14:01:28 -0500
X-MC-Unique: fjzl6CD6MUGDCSt3OiBPYQ-1
Received: by mail-qt1-f198.google.com with SMTP id e18-20020ac84912000000b003a96d6f436fso4299800qtq.0
        for <linux-ia64@vger.kernel.org>; Mon, 09 Jan 2023 11:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bU+svoPcyEEDaWYmIcNec69dTXz5hTgyu3b7xJNjXUQ=;
        b=qfJZsnlJZIpG4VE46JW068X9EGI5N4J74fDcA5iN7uVvoypYXk3hhuNozdydq0BKwt
         JKuaWoE/t9jEnJMDV9fjRiG2gp0di5/qCcAj0nueejQiuwEwZXiH/7uQyG0U7050CYgO
         xkr4sWq9hlD8WNIj644x2rxaCLw7bOs/9V8ZZkvXOuIk92KsnJI5Ap8vIVpLTJcB5uOd
         wfPWby9kxBguT7cSRsG8fJbE16oeH4L2rkMfzTjws9p8gk5PbZnjc10vbDdj9+o24KRu
         MpUplZKbi6NrsJmj8Orwqc8wp3gCXA3IwnXCVu27WSgQh0i3qh7fuDYJCu37Sg740pG2
         4giw==
X-Gm-Message-State: AFqh2kqfzDo7Gnnge2duSTzv+aKcpZP0yLZlzIqeVmZpigNC2/9xu8QX
        GluKCEb7YLqRu3Q3K14uqIkFM1CX8LgOaekgY1WSjJsMKMLyIBCRpEFVEjZqsMUWLdzJC62o6ty
        zjzDkIUTiHK02oyee7mH2ZA==
X-Received: by 2002:ac8:7395:0:b0:3a7:ed31:a618 with SMTP id t21-20020ac87395000000b003a7ed31a618mr91336687qtp.7.1673290887988;
        Mon, 09 Jan 2023 11:01:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXseRLv5+JCaBFPqzT7E7Yv2YOrloRSyhYUUSWRG6zA8srvH9gyrV5oV35teC9nwwkDxbanAYA==
X-Received: by 2002:ac8:7395:0:b0:3a7:ed31:a618 with SMTP id t21-20020ac87395000000b003a7ed31a618mr91336646qtp.7.1673290887764;
        Mon, 09 Jan 2023 11:01:27 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id cj12-20020a05622a258c00b0039cc0fbdb61sm4985479qtb.53.2023.01.09.11.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:01:27 -0800 (PST)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Huacai Chen <chenhuacai@kernel.org>
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
        Peter Zijlstra <peterz@infradead.org>,
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
Subject: Re: [PATCH v3 6/8] treewide: Trace IPIs sent via smp_send_reschedule()
In-Reply-To: <CAAhV-H6Oii6t-4aHFjgPkCgFAd+LcVVg+7jMu_w4mEa0Ecuwaw@mail.gmail.com>
References: <20221202155817.2102944-1-vschneid@redhat.com>
 <20221202155817.2102944-7-vschneid@redhat.com>
 <CAAhV-H6Oii6t-4aHFjgPkCgFAd+LcVVg+7jMu_w4mEa0Ecuwaw@mail.gmail.com>
Date:   Mon, 09 Jan 2023 19:01:22 +0000
Message-ID: <xhsmh5ydfedml.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 08/01/23 20:17, Huacai Chen wrote:
> Hi, Valentin,
>
> On Fri, Dec 2, 2022 at 11:59 PM Valentin Schneider <vschneid@redhat.com> wrote:
>> @@ -83,7 +83,7 @@ extern void show_ipi_list(struct seq_file *p, int prec);
>>   * it goes straight through and wastes no time serializing
>>   * anything. Worst case is that we lose a reschedule ...
>>   */
>> -static inline void smp_send_reschedule(int cpu)
>> +static inline void arch_smp_send_reschedule(int cpu)
>>  {
>>         loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
>>  }
> This function has been moved to arch/loongarch/kernel/smp.c since 6.2.
>

Thanks! I'll make sure to rerun the coccinelle script for the next version.

