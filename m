Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8476D104DA7
	for <lists+linux-ia64@lfdr.de>; Thu, 21 Nov 2019 09:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKUIPV (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 21 Nov 2019 03:15:21 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36202 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKUIPH (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 21 Nov 2019 03:15:07 -0500
Received: by mail-wr1-f68.google.com with SMTP id z3so3206649wru.3
        for <linux-ia64@vger.kernel.org>; Thu, 21 Nov 2019 00:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PWu78UINgvkRWlyy7C2l33u4Ab0VHrEoRAcLucw18qk=;
        b=XqOdQRqr10yWN+dWU90C3TOiiM7U+afUg5RoCUD9mrhxJ1chH1NB1cHYSxBuOAECJW
         FNsZkI594sRUM9YOwxkKlrZSOZ1DWPa4TJH/8c/8UhKxOIqlY94ZnZ0bv2P08b2SEgtt
         4uROj1VyG+qDB4rfkZKxIqfSHMUS1PaT82DZj0PNxKvmOU7n8NUyMSmLO6hw6IZa6p8a
         t0MzYI/aEdjlZriIJFmuVu2xI/k2B+xqPkOoNey2HytPq+CDNOM/rghrPKhC+rbEJeIo
         KXnYygs0HWRYuJFqMX32jbpkOjrkDhlf1Dg0YebmPya8KmjBXPshBqZMwJbng6uzcAZu
         ukqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PWu78UINgvkRWlyy7C2l33u4Ab0VHrEoRAcLucw18qk=;
        b=qaYZl8GHDux/ONRoHpbHYJz8nGN6bj0My4wAW9cT4qF+RBK8THEW2JtxNzvzS1kiTH
         4d5v11ygOoj8oetIM8JdbLZ1jcSQHeSwFrOGa5L/fUP7mtvPeiFLpYlobk9DfnRh6c6Q
         iVsqO74WmbGypHz3+LfOsr+okXkzwck8Di5yUArQd7SFMrEQ8Ft4hhlNfX9op9GVli/6
         +DayPRYE/6hfzlbGxt1Cgw7/EdnsWVHGGXfbBX4GQClMuD3wcEDMiqKPw4JScbEUaF/d
         tw32c7SlxofhvB0C0jnqD6UX+tJG1TQbyjeck4rIhUYRt1OLTd5R+MsACXEN6632kc25
         J7dA==
X-Gm-Message-State: APjAAAVkLcqupf28KN83Cm2O342XVfbYBsC9iufy5RggsK57LEv/J3ge
        NJv6FigG6haJGzMZluH2LltuTw==
X-Google-Smtp-Source: APXvYqxdYs0ZCbj2Oo3SWAIgbzvdDddpJsbWDdSZQ+EtdgnmJT1X2EeAckZD4HKkVNYhYfEZuzV4sg==
X-Received: by 2002:adf:f150:: with SMTP id y16mr561679wro.192.1574324106029;
        Thu, 21 Nov 2019 00:15:06 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id w13sm2315075wrm.8.2019.11.21.00.15.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 21 Nov 2019 00:15:05 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     airlied@redhat.com, airlied@linux.ie, arnd@arndb.de,
        fenghua.yu@intel.com, gregkh@linuxfoundation.org,
        tony.luck@intel.com
Cc:     linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 3/5] agp: remove unused variable num_segments
Date:   Thu, 21 Nov 2019 08:14:43 +0000
Message-Id: <1574324085-4338-4-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
References: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

This patch fix the following build warning:
warning: variable 'num_segments' set but not used [-Wunused-but-set-variable]

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/char/agp/frontend.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/char/agp/frontend.c b/drivers/char/agp/frontend.c
index f6955888e676..47098648502d 100644
--- a/drivers/char/agp/frontend.c
+++ b/drivers/char/agp/frontend.c
@@ -102,14 +102,13 @@ agp_segment_priv *agp_find_seg_in_client(const struct agp_client *client,
 					    int size, pgprot_t page_prot)
 {
 	struct agp_segment_priv *seg;
-	int num_segments, i;
+	int i;
 	off_t pg_start;
 	size_t pg_count;
 
 	pg_start = offset / 4096;
 	pg_count = size / 4096;
 	seg = *(client->segments);
-	num_segments = client->num_segments;
 
 	for (i = 0; i < client->num_segments; i++) {
 		if ((seg[i].pg_start == pg_start) &&
-- 
2.23.0

