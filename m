Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 388B318178D
	for <lists+linux-ia64@lfdr.de>; Wed, 11 Mar 2020 13:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729206AbgCKMLc (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 11 Mar 2020 08:11:32 -0400
Received: from mail-wr1-f74.google.com ([209.85.221.74]:43719 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729287AbgCKMLb (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 11 Mar 2020 08:11:31 -0400
Received: by mail-wr1-f74.google.com with SMTP id p11so880157wrn.10
        for <linux-ia64@vger.kernel.org>; Wed, 11 Mar 2020 05:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Vk9xA5EcmXtoOxvvPNjA5YPkn56q5Oj+pHYxZl8t1uI=;
        b=srZcLMtt9vVF3JbnFL8sj4nAZKdBG16UWw6cBzZfZz4mYApLQnRv5c6TVvP1kMWKfc
         sAsaK1ivjyIubGfgWzc7vGxKb2fTzDfXNcYGhNToScXvhdl7zuRlNWM1F6G+NEzMrSno
         JtTo1Kh1V/RUoS/OYYK74LmiWJeC6f0MZaCTPQfM4cKYykfkxnMT8psI8MG9UIbbbHoY
         PoLF2lT7Ol7wJboStuPbE1l1U4T8fnP9SWrSaDDMa8cmlDHtro6VmSQS1PpYqzWng9EY
         i1TAnG8AAAgcDift/xUjNuCGPGrdkYKaDUYJsSmumOxUaeSs82xgs87eqgg4SPcIy0tw
         Sg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Vk9xA5EcmXtoOxvvPNjA5YPkn56q5Oj+pHYxZl8t1uI=;
        b=nzT4zoux+qeFmolUfFTsH+lvaijtn2oGw6zw7W9ME3MNXnS/hrZtEBQ+T9OBSFbjxC
         +a+AC5GcenrcGAScW0vzxl3ANW3q98ptYmEjpCQb+MSAoPuwJsorwUDc9Or1rbVdM4XF
         L4O41gDRJbSCNzqGA4xMsy9nHQIbu92MGI5aFFNH7acfiQudLOpc5CjPCm/HMuJ1sOmX
         LZ/PJ4Wl3jN5uDRcdsUGAoT6znd3rmsE56eS9kragrAujuCygHL+fl5JOlC1TidAs5wQ
         fQTfhQqaOYo6nRi/dAe/bap+7Jjbbevtt+rrjHQzowu6n2caZqCdZcJKttR7w+gF/auj
         82ow==
X-Gm-Message-State: ANhLgQ08zXXgPKecK1pP9x0puhTx2UTExH1ukm3EvQtHr/v0Vfv/afbk
        5ulB5VgAcv202CyZwtaAb9ML3feldgE=
X-Google-Smtp-Source: ADFU+vvUEtjz2aIDSC76T/yEApf3PLdhNxRvKwjnfi1Tc8+9kd7HgbzyTPX6pMzpOVxkw7PdiGpJLj37XiI=
X-Received: by 2002:a05:6000:1206:: with SMTP id e6mr149301wrx.339.1583928688111;
 Wed, 11 Mar 2020 05:11:28 -0700 (PDT)
Date:   Wed, 11 Mar 2020 13:11:24 +0100
Message-Id: <20200311121124.243352-1-glider@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH 2/2] ia64: add IRQENTRY_TEXT and SOFTIRQENTRY_TEXT to linker script
From:   glider@google.com
To:     tony.luck@intel.com, fenghua.yu@intel.com
Cc:     linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        linux-ia64@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

This is needed to fix linker errors caused by lib/stackdepot.c
referencing __{soft,}irqentry_text_{start,end}.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 arch/ia64/kernel/vmlinux.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index 1ec6b703c5b4f..6b5652ee76f96 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -54,6 +54,8 @@ SECTIONS {
 		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
+		IRQENTRY_TEXT
+		SOFTIRQENTRY_TEXT
 		*(.gnu.linkonce.t*)
 	}
 
-- 
2.25.1.481.gfbce0eb801-goog

