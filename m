Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E96515684B
	for <lists+linux-ia64@lfdr.de>; Sun,  9 Feb 2020 02:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbgBIBUd (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sat, 8 Feb 2020 20:20:33 -0500
Received: from mail01.vodafone.es ([217.130.24.71]:25520 "EHLO
        mail01.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbgBIBUd (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sat, 8 Feb 2020 20:20:33 -0500
IronPort-SDR: q3a0pHTKjCgVdieGHf2B64E5srhZjaUIXdXQ288R9his87+QYXC7oKw1UhfzIj9WHuO5NxpnOR
 +8/6zwPUZBMw==
IronPort-PHdr: =?us-ascii?q?9a23=3AfDw3HBOx/neO9VWtk3cl6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0Iv79rarrMEGX3/hxlliBBdydt6sYzbeG+PqxESxYuNDd6StEKMQNHz?=
 =?us-ascii?q?Y+yuwu1zQ6B8CEDUCpZNXLVAcdWPp4aVl+4nugOlJUEsutL3fbo3m18CJAUk?=
 =?us-ascii?q?6nbVk9Kev6AJPdgNqq3O6u5ZLTfx9IhD2gar9uMRm6twrcutQZjId4Kqs8yR?=
 =?us-ascii?q?TFrmVMdu9LwW9kOU+fkwzz68ut8pNv6Thct+4k+8VdTaj0YqM0QKBCAj87KW?=
 =?us-ascii?q?41/srrtRfCTQuL+HQRV3gdnwRLDQbY8hz0R4/9vSTmuOVz3imaJtD2QqsvWT?=
 =?us-ascii?q?u+9adrSQTnhzkBOjUk7WzYkM1wjKZcoBK8uxxyxpPfbY+JOPZieK7WYNUXTn?=
 =?us-ascii?q?dDUMlMTSxMGo2yYYsVD+QfPuhWsobyqEcBoxalGQmhBv/gxiNUinPqw6E31f?=
 =?us-ascii?q?kqHwHc3AwnGtIDqG7ao8vpNKgMS+C+0anHzTLFb/NZxDzw75DIfQ49of6SR7?=
 =?us-ascii?q?Jxf83RyU8gFw7elVqQrpHqMCmU1+QKtWiU8fBsWv6oi24isgx8pCWkyMQ0io?=
 =?us-ascii?q?TRmI4Z11LJ+T9kzIs7OdG0UlB3bNG+HJZetyyXMZZ9TNk4TGFyoik6z6ULuZ?=
 =?us-ascii?q?u8fCcX1psq3wXfa/mbc4iQ5RLjSfqRLS94hH17fLK/gA6/8U26xe39Usm0yk?=
 =?us-ascii?q?hFri5ZntTDrHwNyRvT5dWdRftz+Ueh3yiA2xrN5eFfOUw0lKzbJIA9wrMoiJ?=
 =?us-ascii?q?YfrEbOEjXrlEj4kKOabFso9+ey5+npYrjqvpqcOJV1igH6PKQugMu/AeEgPw?=
 =?us-ascii?q?gWQWeb5fqz1Kft/E3+RrVKgeY7nbLesJ/HP8sap6m5AwlL3Yo59xm/CDKm3M?=
 =?us-ascii?q?wCnXYbNFJFZA6Hj4/xNlHKIfD4C+q/glu1nDdq3f/LP7LsD47TLnjMjrjhZ6?=
 =?us-ascii?q?xx601Cxwopy9BQ+ZZUBqsGIPLpVU+i/ODfWxs4NRGkhufuVolVyIwTQySMD7?=
 =?us-ascii?q?WfPaeUtkWHtdgiO+2dWIhAgDvhJuJt2PnogjdtgVIBcLO22p0YaGuyFfRlC0?=
 =?us-ascii?q?qcaHvoxNwGFDFZkBA5SbnShUGPS3ZsYHC9F/Yk6y02Ep2hC4jrTIehia6G2i?=
 =?us-ascii?q?r9FZpTMDMVQmuQGGvlIt3XE8wHbzifd5ds?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2F5cgCkXT9emCMYgtlmHQEBAQkBEQU?=
 =?us-ascii?q?FAYF7AgGBPQKBVlINExKMZIZvgU0fg0OLaIEAgzOGCBOBZw0BAQEBATUCAQG?=
 =?us-ascii?q?EQIJGJDwCDQIDDQEBBQEBAQEBBQQBAQIQAQEBAQEICwsGKYVKQgEMAYFrIoN?=
 =?us-ascii?q?wIA85SkwBDgGDV4JLAQEzrk8NDQKFHoJNBAqBCIEbI4E2AgEBjCEagUE/gSM?=
 =?us-ascii?q?hgisIAYIBgn8BEgFugkiCWQSNUBIhiT+YMIJEBHiVa4I4AQ+IEYQ1A4JYD4E?=
 =?us-ascii?q?Lgx2DCIFnhFKBfp9YhBJXgSBzcTMaI4IdgSBPGA2ON44rAkCBFxACT4Q7hja?=
 =?us-ascii?q?CMgEB?=
X-IPAS-Result: =?us-ascii?q?A2F5cgCkXT9emCMYgtlmHQEBAQkBEQUFAYF7AgGBPQKBV?=
 =?us-ascii?q?lINExKMZIZvgU0fg0OLaIEAgzOGCBOBZw0BAQEBATUCAQGEQIJGJDwCDQIDD?=
 =?us-ascii?q?QEBBQEBAQEBBQQBAQIQAQEBAQEICwsGKYVKQgEMAYFrIoNwIA85SkwBDgGDV?=
 =?us-ascii?q?4JLAQEzrk8NDQKFHoJNBAqBCIEbI4E2AgEBjCEagUE/gSMhgisIAYIBgn8BE?=
 =?us-ascii?q?gFugkiCWQSNUBIhiT+YMIJEBHiVa4I4AQ+IEYQ1A4JYD4ELgx2DCIFnhFKBf?=
 =?us-ascii?q?p9YhBJXgSBzcTMaI4IdgSBPGA2ON44rAkCBFxACT4Q7hjaCMgEB?=
X-IronPort-AV: E=Sophos;i="5.70,419,1574118000"; 
   d="scan'208";a="315623785"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 09 Feb 2020 02:20:29 +0100
Received: (qmail 7938 invoked from network); 9 Feb 2020 00:49:07 -0000
Received: from unknown (HELO 192.168.1.163) (apamar@[217.217.179.17])
          (envelope-sender <peterwong@bodazone.com>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-ia64@vger.kernel.org>; 9 Feb 2020 00:49:07 -0000
Date:   Sun, 9 Feb 2020 01:49:06 +0100 (CET)
From:   Peter Wong <peterwong@bodazone.com>
Reply-To: Peter Wong <peterwonghsbchk@gmail.com>
To:     linux-ia64@vger.kernel.org
Message-ID: <9889210.233556.1581209347694.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Greetings,
Please check the attached email for a buisness proposal to explore.
Looking forward to hearing from you for more details.
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

