Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7345680A6
	for <lists+linux-ia64@lfdr.de>; Wed,  6 Jul 2022 10:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbiGFIAH (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 6 Jul 2022 04:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbiGFIAF (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 6 Jul 2022 04:00:05 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA1E17E26;
        Wed,  6 Jul 2022 01:00:03 -0700 (PDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2667keKq016868;
        Wed, 6 Jul 2022 07:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=lAz8CYxgUuAr2chjH7/qX9SQzUwR8SFIV6N9oFUZ63E=;
 b=ke6CAJjmJf2Q80cYtNn+NPtDlE44OOkSYVBTPsaCCIleXnAJBq8ryJOi0xfa8NhX0yvo
 as/CzQSvXanOxYGd858EmsxJYTm5OGs78ztWzotP8Ccf/mTtIjjCeQ8pys01gELDkABP
 iGFxKTKkan7+uZl7u6R3iQtv8f7X+qvQyNF4qkIFMUyYbabRiWLNCT1cbIAejTYSFfyp
 TiEnz6H3opgkfYlRIqzlJeUGJ488p61gict+zTC8LFxNdfjRwAKx+lkbAp2YCcpaxwYe
 uEJKSVZ8wQKR07Fgt2NRsEodCol5E5jF9hP/Q8AI03owTGjymWTEHJ88oE9KNKKb2Mxm LA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h56a5g7sg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 07:59:02 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2667lVQ3019089;
        Wed, 6 Jul 2022 07:59:02 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h56a5g7rb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 07:59:01 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2667pldW016665;
        Wed, 6 Jul 2022 07:58:59 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma06ams.nl.ibm.com with ESMTP id 3h4usd0mwx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 07:58:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2667wu4Y25035184
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 6 Jul 2022 07:58:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 977604C04A;
        Wed,  6 Jul 2022 07:58:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DC1DC4C040;
        Wed,  6 Jul 2022 07:58:55 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed,  6 Jul 2022 07:58:55 +0000 (GMT)
From:   Sven Schnelle <svens@linux.ibm.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-kernel@vger.kernel.org, rjw@rjwysocki.net,
        Oleg Nesterov <oleg@redhat.com>, mingo@kernel.org,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        mgorman@suse.de, bigeasy@linutronix.de,
        Will Deacon <will@kernel.org>, tj@kernel.org,
        linux-pm@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, linux-ia64@vger.kernel.org
Subject: Re: [PATCH v4 12/12] sched,signal,ptrace: Rework TASK_TRACED,
 TASK_STOPPED state
References: <87a6bv6dl6.fsf_-_@email.froward.int.ebiederm.org>
        <20220505182645.497868-12-ebiederm@xmission.com>
        <YrHA5UkJLornOdCz@li-4a3a4a4c-28e5-11b2-a85c-a8d192c6f089.ibm.com>
        <877d5ajesi.fsf@email.froward.int.ebiederm.org>
        <YrHgo8GKFPWwoBoJ@li-4a3a4a4c-28e5-11b2-a85c-a8d192c6f089.ibm.com>
        <20220628191541.34a073fc@gandalf.local.home>
        <yt9d5ykbekn3.fsf@linux.ibm.com> <yt9dpmijcvu6.fsf@linux.ibm.com>
        <YsSQRmCZSIQ1ewzo@worktop.programming.kicks-ass.net>
Date:   Wed, 06 Jul 2022 09:58:55 +0200
In-Reply-To: <YsSQRmCZSIQ1ewzo@worktop.programming.kicks-ass.net> (Peter
        Zijlstra's message of "Tue, 5 Jul 2022 21:25:58 +0200")
Message-ID: <yt9dsfneaczk.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s6Dr1WmnUBuWfDZCTQXpLRNWOROw7oYK
X-Proofpoint-GUID: ROzuHG_ntV65qYicxOU284KWExlpFIQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_04,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207060027
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Peter,

Peter Zijlstra <peterz@infradead.org> writes:

> On Tue, Jul 05, 2022 at 07:28:49PM +0200, Sven Schnelle wrote:
>> Sven Schnelle <svens@linux.ibm.com> writes:
>
>> I think there's a race in ptrace_check_attach(). It first calls
>> ptrace_freeze_task(), which checks whether JOBCTL_TRACED is set.
>> If it is (and a few other conditions match) it will set ret = 0.
>> 
>> Later outside of siglock and tasklist_lock it will call
>> wait_task_inactive, assuming the target is in TASK_TRACED, but it isn't.
>> 
>> ptrace_stop(), which runs on another CPU, does:
>> 
>> set_special_state(TASK_TRACED);
>> current->jobctl |= JOBCTL_TRACED;
>> 
>> which looks ok on first sight, but in this case JOBCTL is already set,
>> so the reading CPU will immediately move on to wait_task_inactive(),
>> before JOBCTL_TRACED is set. I don't know whether this is a valid
>> combination. I never looked into JOBCTL_* semantics, but i guess now
>> is a good time to do so. I added some debugging statements, and that
>> gives:
>> 
>> [   86.218488] kill_chi-300545    2d.... 79990135us : ptrace_stop: state 8
>> [   86.218492] kill_chi-300545    2d.... 79990136us : signal_generate: sig=17 errno=0 code=4 comm=strace pid=300542 grp=1 res=1
>> [   86.218496] kill_chi-300545    2d.... 79990136us : sched_stat_runtime: comm=kill_child pid=300545 runtime=3058 [ns] vruntime=606165713178 [ns]
>> [ 86.218500] kill_chi-300545 2d.... 79990136us : sched_switch:
>> prev_comm=kill_child prev_pid=300545 prev_prio=120 prev_state=t ==>
>> next_comm=swapper/2 next_pid=0 next_prio=120
>> [   86.218504]   strace-300542    7..... 79990139us : sys_ptrace -> 0x50
>> [   86.218508]   strace-300542    7..... 79990139us : sys_write(fd: 2, buf: 2aa198f7ad0, count: 12)
>> [   86.218512]   strace-300542    7..... 79990140us : sys_write -> 0x12
>> [   86.218515]   <idle>-0         6dNh.. 79990140us : sched_wakeup: comm=kill_child pid=343805 prio=120 target_cpu=006
>> [ 86.218519] <idle>-0 6d.... 79990140us : sched_switch:
>> prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==>
>> next_comm=kill_child next_pid=343805 next_prio=120
>> [   86.218524]   strace-300542    7..... 79990140us : sys_write(fd: 2, buf: 2aa198f7ad0, count: 19)
>> [   86.218527]   strace-300542    7..... 79990141us : sys_write -> 0x19
>> [   86.218531] kill_chi-343805    6..... 79990141us : sys_sched_yield -> 0xffffffffffffffda
>> [   86.218535]   strace-300542    7..... 79990141us : sys_ptrace(request: 18, pid: 53efd, addr: 0, data: 0)
>> [   86.218539] kill_chi-343805    6d.... 79990141us : signal_deliver: sig=9 errno=0 code=0 sa_handler=0 sa_flags=0
>> [   86.218543]   strace-300542    7d.... 79990141us : ptrace_check_attach: task_is_traced: 1, fatal signal pending: 0
>> [   86.218547]   strace-300542    7..... 79990141us : ptrace_check_attach: child->pid = 343805, child->__flags=0
>> [   86.218551] kill_chi-343805    6d.... 79990141us : ptrace_stop: JOBCTL_TRACED already set, state=0 <------ valid combination of flags?
>
> Yeah, that's not supposed to be so. JOBCTL_TRACED is supposed to follow
> __TASK_TRACED for now. Set when __TASK_TRACED, cleared when
> TASK_RUNNING.
>
> Specifically {ptrace_,}signal_wake_up() in signal.h clear JOBCTL_TRACED
> when they would wake a __TASK_TRACED task.

try_to_wake_up() clears TASK_TRACED in this case because a signal
(SIGKILL) has to be delivered. As a test I put the following change
on top, and it "fixes" the problem:

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index da0bf6fe9ecd..f2e0f5e70e77 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4141,6 +4149,9 @@ try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
         * TASK_WAKING such that we can unlock p->pi_lock before doing the
         * enqueue, such as ttwu_queue_wakelist().
         */
+       if (p->__state & TASK_TRACED)
+               trace_printk("clearing TASK_TRACED 2\n");
+       p->jobctl &= ~JOBCTL_TRACED;
        WRITE_ONCE(p->__state, TASK_WAKING);

        /*

There are several places where the state is changed from TASK_TRACED to
something else without clearing JOBCTL_TRACED.
