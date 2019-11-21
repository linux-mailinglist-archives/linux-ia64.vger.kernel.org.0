Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9D58104D9E
	for <lists+linux-ia64@lfdr.de>; Thu, 21 Nov 2019 09:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfKUIPF (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 21 Nov 2019 03:15:05 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40216 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfKUIPF (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Thu, 21 Nov 2019 03:15:05 -0500
Received: by mail-wr1-f67.google.com with SMTP id q15so3185568wrw.7
        for <linux-ia64@vger.kernel.org>; Thu, 21 Nov 2019 00:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1C1QmRBY5rUzr8610O1JPTW5yINhKV4J9GK9i0/L/pM=;
        b=qIGvJTxTXDmbwIyDtlqIYYAUXIaYtGdTJGR7lqgnG+xb8D3OIIyXfIcKdYl74G6n1V
         6AIH/lJeNSVwczClPC49lgFaJqVZ0/r65Z7PNX1A3vOtgmoUBYb1zaecNbeEWdUfW0xx
         dH5a3QAg/Nq1/hqOvmMlLWj3Jt0oUX3+yMRr6O/ApH7azB2wkbGOdeDT5tk8xisFc37d
         OHPVDlHHnFFapo/g4fkgHh8hnkBeMXY44RksbqPzFmAWk0GNHtrN3LEHqk3oyL1TIxXo
         aSwoLS+o0Ltg8uyiqc3iFKIcrqF0VubpE5vU8fQao1QuzOpmVekeae0wxhhSLQV5npoQ
         EtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1C1QmRBY5rUzr8610O1JPTW5yINhKV4J9GK9i0/L/pM=;
        b=LHdEr2gkP5g86E2679E6qDsa5xOGUpiaC4wFPS2IZMD6ZUIpsY7yKQnbvlRCMecfsw
         BLdlHa6j1t7EDPL7PrOgTGzLdb3RqDLvVqaQERBgag955jfySQHekZ5IkZOZAcOieYpQ
         Etiu7OLqS3LJqWC/z9aUKLhwXilZttsR1OE3C30C0Cvhio6HNnWHS3AqV7SO0DQ1gI4W
         mE4QNhBlST3B8UUY50N44kl9GsHEOiMdYZRSawbpQrQjOjWxgl2jBUOmBn/OUSpTYTU7
         mk7Fwwx4NsaSAetgQTbR5Fg8p8w7UwdljcFdWtbVBvbXUoJr1u8VFUYI/BVDrmGTtWm8
         /ClA==
X-Gm-Message-State: APjAAAX4+j+MX1qqXP0HQ+C5wxijRyTb5j70ALnMW1c2+cppN5IbaZKu
        OaZCps0uHNIapbsnAhK4e3qEzA==
X-Google-Smtp-Source: APXvYqztb8qVXOxAbIRwJqdhDfpu1ArT0UyVuERd3YmJJq8AVG/TvHC6mWHqdly95ZzHd3gTlu9/lA==
X-Received: by 2002:a5d:5444:: with SMTP id w4mr8741914wrv.164.1574324103362;
        Thu, 21 Nov 2019 00:15:03 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id w13sm2315075wrm.8.2019.11.21.00.15.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 21 Nov 2019 00:15:02 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     airlied@redhat.com, airlied@linux.ie, arnd@arndb.de,
        fenghua.yu@intel.com, gregkh@linuxfoundation.org,
        tony.luck@intel.com
Cc:     linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 0/5] agp: minor fixes
Date:   Thu, 21 Nov 2019 08:14:40 +0000
Message-Id: <1574324085-4338-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hello

This patch serie fixes some minor problem found in the agp subsystem
There are no change since v1 (posted two years ago)
This is simply a repost for trying to get an answer (gentle ping 6 month
ago got no answer also).

Regards

Corentin Labbe (5):
  agp: remove unused variable size in agp_generic_create_gatt_table
  agp: move AGPGART_MINOR to include/linux/miscdevice.h
  agp: remove unused variable num_segments
  agp: Add bridge parameter documentation
  ia64: agp: Replace empty define with do while

 arch/ia64/include/asm/agp.h |  4 ++--
 drivers/char/agp/frontend.c |  3 +--
 drivers/char/agp/generic.c  | 12 +++++-------
 include/linux/agpgart.h     |  2 --
 include/linux/miscdevice.h  |  1 +
 5 files changed, 9 insertions(+), 13 deletions(-)

-- 
2.23.0

