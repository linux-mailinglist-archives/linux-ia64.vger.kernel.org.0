Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDBD375705
	for <lists+linux-ia64@lfdr.de>; Thu,  6 May 2021 17:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbhEFP2n (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 6 May 2021 11:28:43 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:43103 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235613AbhEFP2H (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 6 May 2021 11:28:07 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 98937580B93;
        Thu,  6 May 2021 11:27:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 06 May 2021 11:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
        :to:cc:subject:date:message-id:in-reply-to:references:reply-to
        :mime-version:content-transfer-encoding; s=fm3; bh=FbRZXE7bST17Y
        nSdlcP8bsWaivyCC5qvTsiLA/pmPMU=; b=g19R6QCBByhaWnAudNOcOPg0FC8GF
        BYLgrbe2GpFbn8aiFMbJfkjfAP7I+idIgloc1puvSRm5QXSPjXc1FVYCRsWuxy3N
        4+RdTjNwWmB4CDQ9BruYX948D0TJQ7ABUpYoUhhNDJmpRabw6UHFIoR/yztt4C1x
        jpAA2fru8FeUtiUKkrUzkALe/+j95KJ8I5jQTIkECmLIobzung+2zJOXPFXI4iBG
        2gwK0c3pZYRSF4+H5QqwYqBPWxNVngm+qGjsDU7emPnuw3TXZCFsu2JQDIJN3tAa
        sUqKNHPtEjsUl+OLVjPjY46yYWmnCFI6q0K3OHn4Xh3LcGb3ffvyvUOSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:reply-to:subject
        :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=FbRZXE7bST17YnSdlcP8bsWaivyCC5qvTsiLA/pmPMU=; b=FjUx3ehA
        KBXkLVqnp+CZgmPRqcpQ+a4y2H1eLHkJBnxQMiHDRcENbL7f27xoAS6B5espCQYU
        NF2xKMFW65O1OIeUY877OfVjH8emx+SzWdRNe1gDdnYe/C8nSvrjkfvw29kGE8/o
        DY/Zm2uJyCRGCzGWOrC0W26OtOhpNOA4Kw30vahuL77+MWAKa9v9Cfr2QWt1rsoJ
        0ieOXX+7dnt17NcaXTVN0OqsKkVng1XtD/8uGsOpgbsIwKxus4ibj5pUEgOuZh+K
        2/5Yh68QoW2EWy933c+61oDgf4cgy5Zf9oXSEeXzueyp65r7quse/nt1Rm+wU1yT
        /S++4wnJppjsRg==
X-ME-Sender: <xms:zAqUYOOnOiRbBSl5OB9YcO0Y4aovjh6tGC8iL5ukxXeRCrA76fyiTg>
    <xme:zAqUYM-JCQcq2ZjpnpVsZydUZKshm49oClbOBd8HWBaD3HkOEQD9OinFPj0QciK1B
    2MR6aM2F2jlIaeR7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegtddgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
    rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
    dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecukfhppeef
    hedrudeigedrvdegiedrfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpe
    hmrghilhhfrhhomhepiihirdihrghnsehsvghnthdrtghomh
X-ME-Proxy: <xmx:zAqUYFT_ExVQa2U_3lG95ThdKyH5vQK1qbyb7faVKHhn4K5UYJJb2g>
    <xmx:zAqUYOuaPG9Z859Ro4ezAJtkZmoMwnYw3vgYxGvzh0vOc1IfjRVZtg>
    <xmx:zAqUYGfc5Ka1GtmZM3FvWqm9oXRydfPeXErhg7kjo2yGzuGzVU0q0Q>
    <xmx:zAqUYJsOFQ0-JbHaq7kNFbpgJr7Pe7UmIX9DMhZnWL78WxJN7iRX0Q>
Received: from Threadripper.local (ec2-35-164-246-34.us-west-2.compute.amazonaws.com [35.164.246.34])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Thu,  6 May 2021 11:27:04 -0400 (EDT)
From:   Zi Yan <zi.yan@sent.com>
To:     David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Michal Hocko <mhocko@suse.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
        Zi Yan <ziy@nvidia.com>
Subject: [RFC PATCH 4/7] mm: pageblock: allow set/unset migratetype for partial pageblock
Date:   Thu,  6 May 2021 11:26:20 -0400
Message-Id: <20210506152623.178731-5-zi.yan@sent.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210506152623.178731-1-zi.yan@sent.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
Reply-To: Zi Yan <ziy@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

From: Zi Yan <ziy@nvidia.com>

When we online subsections and pageblock size is larger than
a subsection, we should be able to change migratetype for partial
pageblocks. We also change the assumption that all pageblocks are in
a whole.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/page-isolation.h |  8 ++++++--
 mm/page_alloc.c                | 27 ++++++++++++++++++---------
 mm/page_isolation.c            | 26 ++++++++++++++------------
 3 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 572458016331..308b540865b7 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -33,11 +33,15 @@ static inline bool is_migrate_isolate(int migratetype)
 #define MEMORY_OFFLINE	0x1
 #define REPORT_FAILURE	0x2
=20
-struct page *has_unmovable_pages(struct zone *zone, struct page *page,
-				 int migratetype, int flags);
+struct page *has_unmovable_pages(struct zone *zone, unsigned long start_pf=
n,
+				 unsigned long end_pfn, int migratetype,
+				 int flags);
 void set_pageblock_migratetype(struct page *page, int migratetype);
 int move_freepages_block(struct zone *zone, struct page *page,
 				int migratetype, int *num_movable);
+int move_freepages(struct zone *zone,
+			  unsigned long start_pfn, unsigned long end_pfn,
+			  int migratetype, int *num_movable);
=20
 /*
  * Changes migrate type in [start_pfn, end_pfn) to be MIGRATE_ISOLATE.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 72bb4a300e03..bc410f45c355 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2433,7 +2433,7 @@ static inline struct page *__rmqueue_cma_fallback(str=
uct zone *zone,
  * Note that start_page and end_pages are not aligned on a pageblock
  * boundary. If alignment is required, use move_freepages_block()
  */
-static int move_freepages(struct zone *zone,
+int move_freepages(struct zone *zone,
 			  unsigned long start_pfn, unsigned long end_pfn,
 			  int migratetype, int *num_movable)
 {
@@ -6328,6 +6328,7 @@ void __meminit memmap_init_range(unsigned long size, =
int nid, unsigned long zone
 {
 	unsigned long pfn, end_pfn =3D start_pfn + size;
 	struct page *page;
+	bool set_migratetype =3D false;
=20
 	if (highest_memmap_pfn < end_pfn - 1)
 		highest_memmap_pfn =3D end_pfn - 1;
@@ -6374,10 +6375,16 @@ void __meminit memmap_init_range(unsigned long size=
, int nid, unsigned long zone
 		 */
 		if (IS_ALIGNED(pfn, pageblock_nr_pages)) {
 			set_pageblock_migratetype(page, migratetype);
+			set_migratetype =3D true;
 			cond_resched();
 		}
 		pfn++;
 	}
+	/* in case the range is smaller than a pageblock */
+	if (!set_migratetype && context =3D=3D MEMINIT_HOTPLUG) {
+		page =3D pfn_to_page(start_pfn);
+		set_pageblock_migratetype(page, migratetype);
+	}
 }
=20
 #ifdef CONFIG_ZONE_DEVICE
@@ -8524,12 +8531,14 @@ void *__init alloc_large_system_hash(const char *ta=
blename,
  * cannot get removed (e.g., via memory unplug) concurrently.
  *
  */
-struct page *has_unmovable_pages(struct zone *zone, struct page *page,
-				 int migratetype, int flags)
+struct page *has_unmovable_pages(struct zone *zone, unsigned long start_pf=
n,
+				 unsigned long end_pfn, int migratetype,
+				 int flags)
 {
 	unsigned long iter =3D 0;
-	unsigned long pfn =3D page_to_pfn(page);
-	unsigned long offset =3D pfn % pageblock_nr_pages;
+	unsigned long pfn =3D start_pfn;
+	struct page *page =3D pfn_to_page(pfn);
+
=20
 	if (is_migrate_cma_page(page)) {
 		/*
@@ -8543,11 +8552,11 @@ struct page *has_unmovable_pages(struct zone *zone,=
 struct page *page,
 		return page;
 	}
=20
-	for (; iter < pageblock_nr_pages - offset; iter++) {
-		if (!pfn_valid_within(pfn + iter))
+	for (pfn =3D start_pfn; pfn < end_pfn; pfn++) {
+		if (!pfn_valid_within(pfn))
 			continue;
=20
-		page =3D pfn_to_page(pfn + iter);
+		page =3D pfn_to_page(pfn);
=20
 		/*
 		 * Both, bootmem allocations and memory holes are marked
@@ -8596,7 +8605,7 @@ struct page *has_unmovable_pages(struct zone *zone, s=
truct page *page,
 		 */
 		if (!page_ref_count(page)) {
 			if (PageBuddy(page))
-				iter +=3D (1 << buddy_order(page)) - 1;
+				pfn +=3D (1 << buddy_order(page)) - 1;
 			continue;
 		}
=20
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index bddf788f45bf..c1b9b8848382 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -15,8 +15,10 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/page_isolation.h>
=20
-static int set_migratetype_isolate(struct page *page, int migratetype, int=
 isol_flags)
+static int set_migratetype_isolate(unsigned long start_pfn, unsigned long =
end_pfn,
+				   int migratetype, int isol_flags)
 {
+	struct page *page =3D pfn_to_page(start_pfn);
 	struct zone *zone =3D page_zone(page);
 	struct page *unmovable;
 	unsigned long flags;
@@ -37,15 +39,14 @@ static int set_migratetype_isolate(struct page *page, i=
nt migratetype, int isol_
 	 * FIXME: Now, memory hotplug doesn't call shrink_slab() by itself.
 	 * We just check MOVABLE pages.
 	 */
-	unmovable =3D has_unmovable_pages(zone, page, migratetype, isol_flags);
+	unmovable =3D has_unmovable_pages(zone, start_pfn, end_pfn, migratetype, =
isol_flags);
 	if (!unmovable) {
 		unsigned long nr_pages;
 		int mt =3D get_pageblock_migratetype(page);
=20
 		set_pageblock_migratetype(page, MIGRATE_ISOLATE);
 		zone->nr_isolate_pageblock++;
-		nr_pages =3D move_freepages_block(zone, page, MIGRATE_ISOLATE,
-									NULL);
+		nr_pages =3D move_freepages(zone, start_pfn, end_pfn, MIGRATE_ISOLATE, N=
ULL);
=20
 		__mod_zone_freepage_state(zone, -nr_pages, mt);
 		spin_unlock_irqrestore(&zone->lock, flags);
@@ -64,7 +65,8 @@ static int set_migratetype_isolate(struct page *page, int=
 migratetype, int isol_
 	return -EBUSY;
 }
=20
-static void unset_migratetype_isolate(struct page *page, unsigned migratet=
ype)
+static void unset_migratetype_isolate(unsigned long start_pfn, unsigned lo=
ng end_pfn,
+				unsigned migratetype)
 {
 	struct zone *zone;
 	unsigned long flags, nr_pages;
@@ -72,6 +74,7 @@ static void unset_migratetype_isolate(struct page *page, =
unsigned migratetype)
 	unsigned int order;
 	unsigned long pfn, buddy_pfn;
 	struct page *buddy;
+	struct page *page =3D pfn_to_page(start_pfn);
=20
 	zone =3D page_zone(page);
 	spin_lock_irqsave(&zone->lock, flags);
@@ -112,7 +115,7 @@ static void unset_migratetype_isolate(struct page *page=
, unsigned migratetype)
 	 * allocation.
 	 */
 	if (!isolated_page) {
-		nr_pages =3D move_freepages_block(zone, page, migratetype, NULL);
+		nr_pages =3D move_freepages(zone, start_pfn, end_pfn, migratetype, NULL);
 		__mod_zone_freepage_state(zone, nr_pages, migratetype);
 	}
 	set_pageblock_migratetype(page, migratetype);
@@ -195,7 +198,8 @@ int start_isolate_page_range(unsigned long start_pfn, u=
nsigned long end_pfn,
 	     pfn +=3D pageblock_nr_pages) {
 		page =3D __first_valid_page(pfn, pageblock_nr_pages);
 		if (page) {
-			if (set_migratetype_isolate(page, migratetype, flags)) {
+			if (set_migratetype_isolate(pfn, min(end_pfn, pfn + pageblock_nr_pages),
+				migratetype, flags)) {
 				undo_pfn =3D pfn;
 				goto undo;
 			}
@@ -209,7 +213,8 @@ int start_isolate_page_range(unsigned long start_pfn, u=
nsigned long end_pfn,
 		struct page *page =3D pfn_to_online_page(pfn);
 		if (!page)
 			continue;
-		unset_migratetype_isolate(page, migratetype);
+		unset_migratetype_isolate(pfn, min(pfn + pageblock_nr_pages, undo_pfn),
+					migratetype);
 	}
=20
 	return -EBUSY;
@@ -224,16 +229,13 @@ void undo_isolate_page_range(unsigned long start_pfn,=
 unsigned long end_pfn,
 	unsigned long pfn;
 	struct page *page;
=20
-	BUG_ON(!IS_ALIGNED(start_pfn, pageblock_nr_pages));
-	BUG_ON(!IS_ALIGNED(end_pfn, pageblock_nr_pages));
-
 	for (pfn =3D start_pfn;
 	     pfn < end_pfn;
 	     pfn +=3D pageblock_nr_pages) {
 		page =3D __first_valid_page(pfn, pageblock_nr_pages);
 		if (!page || !is_migrate_isolate_page(page))
 			continue;
-		unset_migratetype_isolate(page, migratetype);
+		unset_migratetype_isolate(pfn, min(pfn + pageblock_nr_pages, end_pfn), m=
igratetype);
 	}
 }
 /*
--=20
2.30.2

