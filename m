Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFE85305C8
	for <lists+linux-ia64@lfdr.de>; Sun, 22 May 2022 22:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241222AbiEVUOi (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 22 May 2022 16:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351126AbiEVUOh (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 22 May 2022 16:14:37 -0400
X-Greylist: delayed 1533 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 22 May 2022 13:14:36 PDT
Received: from out1.nocdirect.com (out1.nocdirect.com [69.73.171.0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1450369DA
        for <linux-ia64@vger.kernel.org>; Sun, 22 May 2022 13:14:36 -0700 (PDT)
Received: from binky.nswebhost.com ([69.73.168.248])
        by spamexperts03.nocdirect.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <support@iesottawa.ca>)
        id 1nsrZS-0000RG-H0
        for linux-ia64@vger.kernel.org; Sun, 22 May 2022 15:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=iesottawa.ca; s=default; h=Sender:Content-Type:MIME-Version:Message-ID:
        Reply-To:From:Date:Subject:To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tsytaq9P6jbx84sZaeZ2ujyYY054YqWU2QI73VCcE8s=; b=g5pkGeumHBtQTDiZMag+aDeO1m
        yoCSP1rjRozXkX1YhcK9Zbw6XiEgN9GGTxkLyXN8VG9+SKRTc71lsezW2OUYYFmCjRIQZmhNq5weQ
        WRr99Y2CAowcAbiSP2dXpHryvuguL1gVV0hR/P+S1xw7X1PI9PLovpMEJYhrOBT1Twc0o8Spod65U
        Iey3tFuTI0KkOctzN+hommYql/vYcgCQL7V68nJ7t9fLcQNS+y0XWGCQlLl23pyHzEbdBmXt5R5Y5
        UbhtkkudMYWeymhR8DyJKyJJD9OdmCzFQosf0J/SURswziOhgXTfRzco3XZakWPSUCeXuUMu1GTL7
        rQvcg6cg==;
Received: from ottawa by binky.nswebhost.com with local (Exim 4.93)
        (envelope-from <support@iesottawa.ca>)
        id 1nsrYR-00079I-TJ
        for linux-ia64@vger.kernel.org; Sun, 22 May 2022 15:47:56 -0400
To:     linux-ia64@vger.kernel.org
Subject: Re: Looking forward to hearing from you
X-PHP-Script: iesottawa.ca/modules/mod_simplefileuploadv1.3/elements/bcqkhulk.php for 36.37.185.70
Date:   Sun, 22 May 2022 19:47:55 +0000
From:   "Mrs. Mamand Mashamsul" <support@iesottawa.ca>
Reply-To: mrsmamands@gmail.com
Message-ID: <644a46d52dd97a0c4d0ed867d4a677a0@iesottawa.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender:  <ottawa@binky.nswebhost.com>
X-Originating-IP: 69.73.168.248
X-SpamExperts-Domain: nocdirect.com
X-SpamExperts-Username: binky
Authentication-Results: nocdirect.com; auth=pass (login) smtp.auth=binky@nocdirect.com
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.83)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9NxnHXhFI9aLFhf4G9YVDvPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5w+q6ZTHb58r+xyQenkcGxyt8C9mOBdONdnsxgsk1D2pw/C
 h5SE4jAyhe1COeASyU9r2Irva2gpw5SYpBQlyhQ44ld5rdi2ZxohSIq+dqifZuwfXg3lLHvg5NA5
 Q4UKfXmxp/mE01KBSG8B+VR6ttEpv1+cB8x6sK/GtN6tmZVqFHuTaKzWYJN7hB19IACPtQaT73qE
 /bPEQRw1+/YAfTC609mB3MdpSV3sWIdO2eYbSvVLiitsLbvAhupvUnzDINDjcMbskMcaRQWUu9pQ
 An0SxmD/2Y9vQ6c+CWRhbvYX8/rD2tNFnxZmcBDP9GZo454L8e9V2yadybeHOMTl0mz22loBPGfx
 bYV/C90G1lGhhe/6sDrXXpSG4IEX5iNEcVtdjx85xQq9VD42UbTRudBo31/E3ahF5MMcDI7KdpjQ
 KTDdLlR8TbTgFjQZY9NlDQvzzkUyZY2wKDSP6xtXq/WhbbgVl4iunqFoEGZzSy+km6VHO6XhXqN3
 g0DWG4Tioc84Kpmg5+UpQ2PZprb+nvdWlgS6K9aAlnrXFI3hveFdl/03PID3XZmJFyZSBdUjoTdd
 vjenWNHvA5jfEJ3hHCEZ+efA8zpmTgPs/t4WetfXHlE0fVDhXnP6kGReswqtZAHzg1zcjVdIhfBo
 dOedlBBe92PNDpgLsd6Ddd/s7VM53kslpjM9zsleUEOBBiT9j3nwJ3XTYPX8/FYF1qeGoVdUbmMR
 muBOVM7E1dn+Ka3qTizbaCmNJWevNI0L1phQ/SBmMRr+w2X69ygMahiTQMBdz643WjsO7W/dj5iS
 OOwnyDheMPxghFsjIwINNqkbXC/I4+m/hj19mxilNKakCSQALvVEu1zJCMgvv3qd3SrMXiQCHNoV
 ZSIr6skNpUbpwLtbs5foXiuJWiv1/Vo4VRuN629ZC8+7qMn7BbctwahGsbM/Lgg1DmF6Ill58fwl
 wFp/x303qPlmX5UbR5AEwmer
X-Report-Abuse-To: spam@spamexperts01.nocdirect.com
X-Spam-Status: Yes, score=6.8 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        HK_NAME_MR_MRS,PHP_SCRIPT,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [69.73.171.0 listed in list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7380]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.7 SPF_SOFTFAIL SPF: sender does not match SPF record (softfail)
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.5 PHP_SCRIPT Sent by PHP script
        *  1.0 HK_NAME_MR_MRS No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Greatings Dear

I am Mrs. Mamand Mashamsul, from Kabul, Capital of Afghanistan. With due respect, I want to know if foreigners can buy and own properties in your beautiful country, I desire to relocate my investment capital abroad where it will generate more returns. 
 
I will appreciate your response. Please let me know your ideas and knowledge regarding my research. In Any viable investment idea you suggest to me will be also be considered. 
 
Looking forward to hearing from you.

Best regards,
Mrs. Mamand Mashamsul

