Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E407102DB2
	for <lists+linux-ia64@lfdr.de>; Tue, 19 Nov 2019 21:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfKSUoI (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 19 Nov 2019 15:44:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726711AbfKSUoI (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 19 Nov 2019 15:44:08 -0500
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D13B2068F;
        Tue, 19 Nov 2019 20:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574196246;
        bh=tYk3NzkyGFMwfIfw621e64JBWLZbc2P157zpqSHKBfU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=F7dezTirkHNZxF7r6iTVPjtQ2Gbnu/LKU0RXnzga76cLNAMs/2QcxVsC33X8jJNzH
         oI7UYI/oLaywEAbINKt2ngiHBiK1DoXioL9Ijnjil8D+Sp/npeg+W2IAQV+IJ+AhP6
         ci4IOmZuWXhLBr5x71GSi1Uw1czpCbFrPEBd3sr8=
Date:   Tue, 19 Nov 2019 12:44:05 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, x86@kernel.org,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Toshiki Fukasawa <t-fukasawa@vx.jp.nec.com>,
        Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH v6 04/10] mm/memory_hotplug: Don't access uninitialized
 memmaps in shrink_zone_span()
Message-Id: <20191119124405.60a1f92f8e1cffed1afa0442@linux-foundation.org>
In-Reply-To: <8bbbd4f1-e2c9-b654-ab73-aa4314135f21@redhat.com>
References: <20191006085646.5768-1-david@redhat.com>
        <20191006085646.5768-5-david@redhat.com>
        <5a4573de-bd8a-6cd3-55d0-86d503a236fd@redhat.com>
        <20191014121719.cb9b9efe51a7e9e985b38075@linux-foundation.org>
        <8bbbd4f1-e2c9-b654-ab73-aa4314135f21@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Tue, 19 Nov 2019 15:16:22 +0100 David Hildenbrand <david@redhat.com> wrote:

> On 14.10.19 21:17, Andrew Morton wrote:
> > On Mon, 14 Oct 2019 11:32:13 +0200 David Hildenbrand <david@redhat.com> wrote:
> > 
> >>> Fixes: d0dc12e86b31 ("mm/memory_hotplug: optimize memory hotplug")
> >>
> >> @Andrew, can you convert that to
> >>
> >> Fixes: f1dd2cd13c4b ("mm, memory_hotplug: do not associate hotadded
> >> memory to zones until online") # visible after d0dc12e86b319
> >>
> >> and add
> >>
> >> Cc: stable@vger.kernel.org # v4.13+
> > 
> > Done, thanks.
> > 
> 
> Just a note that Toshiki reported a BUG (race between delayed
> initialization of ZONE_DEVICE memmaps without holding the memory
> hotplug lock and concurrent zone shrinking).
> 
> https://lkml.org/lkml/2019/11/14/1040
> 
> "Iteration of create and destroy namespace causes the panic as below:
> 
> [   41.207694] kernel BUG at mm/page_alloc.c:535!
> [   41.208109] invalid opcode: 0000 [#1] SMP PTI
> [   41.208508] CPU: 7 PID: 2766 Comm: ndctl Not tainted 5.4.0-rc4 #6
> [   41.209064] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.11.0-0-g63451fca13-prebuilt.qemu-project.org 04/01/2014
> [   41.210175] RIP: 0010:set_pfnblock_flags_mask+0x95/0xf0
> [   41.210643] Code: 04 41 83 e2 3c 48 8d 04 a8 48 c1 e0 07 48 03 04 dd e0 59 55 bb 48 8b 58 68 48 39 da 73 0e 48 c7 c6 70 ac 11 bb e8 1b b2 fd ff <0f> 0b 48 03 58 78 48 39 da 73 e9 49 01 ca b9 3f 00 00 00 4f 8d 0c
> [   41.212354] RSP: 0018:ffffac0d41557c80 EFLAGS: 00010246
> [   41.212821] RAX: 000000000000004a RBX: 0000000000244a00 RCX: 0000000000000000
> [   41.213459] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffffbb1197dc
> [   41.214100] RBP: 000000000000000c R08: 0000000000000439 R09: 0000000000000059
> [   41.214736] R10: 0000000000000000 R11: ffffac0d41557b08 R12: ffff8be475ea72b0
> [   41.215376] R13: 000000000000fa00 R14: 0000000000250000 R15: 00000000fffc0bb5
> [   41.216008] FS:  00007f30862ab600(0000) GS:ffff8be57bc40000(0000) knlGS:0000000000000000
> [   41.216771] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   41.217299] CR2: 000055e824d0d508 CR3: 0000000231dac000 CR4: 00000000000006e0
> [   41.217934] Call Trace:
> [   41.218225]  memmap_init_zone_device+0x165/0x17c
> [   41.218642]  memremap_pages+0x4c1/0x540
> [   41.218989]  devm_memremap_pages+0x1d/0x60
> [   41.219367]  pmem_attach_disk+0x16b/0x600 [nd_pmem]
> [   41.219804]  ? devm_nsio_enable+0xb8/0xe0
> [   41.220172]  nvdimm_bus_probe+0x69/0x1c0
> [   41.220526]  really_probe+0x1c2/0x3e0
> [   41.220856]  driver_probe_device+0xb4/0x100
> [   41.221238]  device_driver_attach+0x4f/0x60
> [   41.221611]  bind_store+0xc9/0x110
> [   41.221919]  kernfs_fop_write+0x116/0x190
> [   41.222326]  vfs_write+0xa5/0x1a0
> [   41.222626]  ksys_write+0x59/0xd0
> [   41.222927]  do_syscall_64+0x5b/0x180
> [   41.223264]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   41.223714] RIP: 0033:0x7f30865d0ed8
> [   41.224037] Code: 89 02 48 c7 c0 ff ff ff ff eb b3 0f 1f 80 00 00 00 00 f3 0f 1e fa 48 8d 05 45 78 0d 00 8b 00 85 c0 75 17 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 41 54 49 89 d4 55
> [   41.225920] RSP: 002b:00007fffe5d30a78 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [   41.226608] RAX: ffffffffffffffda RBX: 000055e824d07f40 RCX: 00007f30865d0ed8
> [   41.227242] RDX: 0000000000000007 RSI: 000055e824d07f40 RDI: 0000000000000004
> [   41.227870] RBP: 0000000000000007 R08: 0000000000000007 R09: 0000000000000006
> [   41.228753] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
> [   41.229419] R13: 00007f30862ab528 R14: 0000000000000001 R15: 000055e824d07f40
> 
> While creating a namespace and initializing memmap, if you destroy the namespace
> and shrink the zone, it will initialize the memmap outside the zone and
> trigger VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page) in
> set_pfnblock_flags_mask()."
> 
> 
> This BUG is also mitigated by this commit, where we for now stop to
> shrink the ZONE_DEVICE zone until we can do it in a safe and clean
> way.
> 

OK, thanks.  I updated the changelog, added Reported-by:Toshiki and
shall squeeze this fix into 5.4.

