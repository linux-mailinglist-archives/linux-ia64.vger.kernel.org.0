Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0BD7517325
	for <lists+linux-ia64@lfdr.de>; Mon,  2 May 2022 17:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381029AbiEBPuw (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Mon, 2 May 2022 11:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347174AbiEBPuv (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Mon, 2 May 2022 11:50:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD6A511166
        for <linux-ia64@vger.kernel.org>; Mon,  2 May 2022 08:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651506440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/b/wf3TlWHf9Zjpyk+RTfXxkRyQ7N7k9txwQlidxwcU=;
        b=dcjYdt6T3CXbPZ9xdZo/9OgUUeKr+2xmJ6T1MkIN7bQSn9iDh2/LSpIuxdEkVb3hq52Ier
        HdRvXW/1Kf5bOCoBWIRTHyoG6IsMTrH8iJVW4NY83By3fqf/TppTTtNkslvYD5WIPIvonN
        4oLjD+C8gwotMo75k+vpmy+acTpX0so=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-odXXuIkvOQOAXangaYPWDQ-1; Mon, 02 May 2022 11:47:15 -0400
X-MC-Unique: odXXuIkvOQOAXangaYPWDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 460001E10B42;
        Mon,  2 May 2022 15:47:14 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.34])
        by smtp.corp.redhat.com (Postfix) with SMTP id 8BEDD9E60;
        Mon,  2 May 2022 15:47:09 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Mon,  2 May 2022 17:47:13 +0200 (CEST)
Date:   Mon, 2 May 2022 17:47:08 +0200
From:   Oleg Nesterov <oleg@redhat.com>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     linux-kernel@vger.kernel.org, rjw@rjwysocki.net, mingo@kernel.org,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, mgorman@suse.de, bigeasy@linutronix.de,
        Will Deacon <will@kernel.org>, tj@kernel.org,
        linux-pm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, linux-ia64@vger.kernel.org
Subject: Re: [PATCH v2 07/12] ptrace: Don't change __state
Message-ID: <20220502154708.GE17276@redhat.com>
References: <87k0b7v9yk.fsf_-_@email.froward.int.ebiederm.org>
 <20220429214837.386518-7-ebiederm@xmission.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429214837.386518-7-ebiederm@xmission.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On 04/29, Eric W. Biederman wrote:
>
>  static void ptrace_unfreeze_traced(struct task_struct *task)
>  {
> -	if (READ_ONCE(task->__state) != __TASK_TRACED)
> -		return;
> -
> -	WARN_ON(!task->ptrace || task->parent != current);
> +	unsigned long flags;
>
>  	/*
> -	 * PTRACE_LISTEN can allow ptrace_trap_notify to wake us up remotely.
> -	 * Recheck state under the lock to close this race.
> +	 * The child may be awake and may have cleared
> +	 * JOBCTL_PTRACE_FROZEN (see ptrace_resume).  The child will
> +	 * not set JOBCTL_PTRACE_FROZEN or enter __TASK_TRACED anew.
>  	 */
> -	spin_lock_irq(&task->sighand->siglock);
> -	if (READ_ONCE(task->__state) == __TASK_TRACED) {
> +	if (lock_task_sighand(task, &flags)) {
> +		task->jobctl &= ~JOBCTL_PTRACE_FROZEN;

Well, I think that the fast-path

	if (!(task->jobctl & JOBCTL_PTRACE_FROZEN))
		return;

at the start makes sense, we can avoid lock_task_sighand() if the tracee
was resumed.

Oleg.

