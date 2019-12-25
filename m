Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E25612A696
	for <lists+linux-ia64@lfdr.de>; Wed, 25 Dec 2019 08:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbfLYHbZ (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Wed, 25 Dec 2019 02:31:25 -0500
Received: from mail02.vodafone.es ([217.130.24.81]:49166 "EHLO
        mail02.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfLYHbZ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Wed, 25 Dec 2019 02:31:25 -0500
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Dec 2019 02:31:24 EST
IronPort-SDR: ojCoRRFcjNagaSs+KZFddpmnv8vEwZMvCxWaoZWJ746PDBdul3mDkV1CYPlSE0wt44f2KSGRxQ
 BZ+64wIu38Kw==
IronPort-PHdr: =?us-ascii?q?9a23=3AaVGcQx2ZOdw5+zw7smDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZseIXK/ad9pjvdHbS+e9qxAeQG9mCsLQe0bGd7vGocFdDyK7JiGoFfp1IWk?=
 =?us-ascii?q?1NouQttCtkPvS4D1bmJuXhdS0wEZcKflZk+3amLRodQ56mNBXdrXKo8DEdBA?=
 =?us-ascii?q?j0OxZrKeTpAI7SiNm82/yv95HJbAhEmTSwbalsIBmoowjduckbjI9/Iast1x?=
 =?us-ascii?q?XFpWdFdf5Lzm1yP1KTmBj85sa0/JF99ilbpuws+c1dX6jkZqo0VbNXAigoPG?=
 =?us-ascii?q?Az/83rqALMTRCT6XsGU2UZiQRHDg7Y5xznRJjxsy/6tu1g2CmGOMD9UL45VS?=
 =?us-ascii?q?i+46ptVRTljjoMOTwk/2HNksF+gqJVoAi/qRJ83oDbb52aOvVlc6PBf94VWX?=
 =?us-ascii?q?ZNUtpNWyBfBI63cosBD/AGPeZdt4TzoUEBpgakCwm2BePvzz5IhmP33a0kye?=
 =?us-ascii?q?sqDAbL3BA9H9IKrHvUrcj6O70JUe2uyanH1zTDb/dM1Tfh9ofIdg4uoemWUr?=
 =?us-ascii?q?1sa8bR0VUvGhrDg16NqoLlJyuY2voQv2WZ9eZsSOyih3I9pw1vrTWj3Mkhh4?=
 =?us-ascii?q?nPi4kI0F7L7z95z5wwJdCgTU57ZsOrH4VIuiGBMot2XtsiQ2Z1uCYm0rEGuY?=
 =?us-ascii?q?C0fCwNyJk/wh7Qcf2Hc4yS4h39UOadPTh1iGh7eLK4mhm960agyur6Vsaqyl?=
 =?us-ascii?q?pFsDFFnsHNtnALyRPT9tCKRuVg8kqjwzqDyg7e5v1eLUwqmqfXMZAsz74omp?=
 =?us-ascii?q?oWq0vDHyv2mEvsjK+Rc0Up4vSo6/njYrr6p5+TKpV7ihrlP6QrgMO/AOA4Ph?=
 =?us-ascii?q?ISX2eF/eSzyqXj8lflT7lQlv02jrHVsIrGKsQDuq65HwhV354n6xa+CTemzd?=
 =?us-ascii?q?sZkWAGLF1feR+KgJPkO0/BIP/mF/ezmVesnylxx/DAILLhBo/BLn/ZkLfuLv?=
 =?us-ascii?q?5B7BtYyQwu3ZVe7swIIq8OLei1WULrstHcSBgjPF+Ozv7jGel6g6cXEVqVA6?=
 =?us-ascii?q?qYLKLMuBfc4us3OeiJZZMUpj/wMNA34P7piHY4nRkQYP/684EQbSWcF7xeOU?=
 =?us-ascii?q?ScYGbtnN5JRXsXugE/QOXxoFiLUDoVe3u2Uro17XcjFNT1Xs/4WomxjenZj2?=
 =?us-ascii?q?+AFZpMazUeBw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GEKgDyDQNelyMYgtllgkQBGAEBgns?=
 =?us-ascii?q?3GyASk0JUBnUdihKFM4N8FYYaDIFbDQEBAQEBNQIBAYRAgiIkOBMCAw0BAQU?=
 =?us-ascii?q?BAQEBAQUEAQECEAEBAQEBCBYGhXNCAQwBgWsihBeBA4EsgwOCUymtGhoChSO?=
 =?us-ascii?q?Ec4E2AYwYGnmBB4FEgjKFAgESAWyFIQSNRSGIS2GXfoI+BJYwDYIpAYw4A4J?=
 =?us-ascii?q?UiRGnIoI3VYELgQpxTTiBchmBHU8YDY0sji1AgRYQAk+FQIdcgjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GEKgDyDQNelyMYgtllgkQBGAEBgns3GyASk0JUBnUdi?=
 =?us-ascii?q?hKFM4N8FYYaDIFbDQEBAQEBNQIBAYRAgiIkOBMCAw0BAQUBAQEBAQUEAQECE?=
 =?us-ascii?q?AEBAQEBCBYGhXNCAQwBgWsihBeBA4EsgwOCUymtGhoChSOEc4E2AYwYGnmBB?=
 =?us-ascii?q?4FEgjKFAgESAWyFIQSNRSGIS2GXfoI+BJYwDYIpAYw4A4JUiRGnIoI3VYELg?=
 =?us-ascii?q?QpxTTiBchmBHU8YDY0sji1AgRYQAk+FQIdcgjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.69,353,1571695200"; 
   d="scan'208";a="317866489"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 25 Dec 2019 08:26:20 +0100
Received: (qmail 32240 invoked from network); 25 Dec 2019 04:33:51 -0000
Received: from unknown (HELO 192.168.1.88) (seigo@[217.217.179.17])
          (envelope-sender <tulcidas@mail.telepac.pt>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-ia64@vger.kernel.org>; 25 Dec 2019 04:33:51 -0000
Date:   Wed, 25 Dec 2019 05:33:42 +0100 (CET)
From:   La Primitiva <tulcidas@mail.telepac.pt>
Reply-To: La Primitiva <laprimitivaes@zohomail.eu>
To:     linux-ia64@vger.kernel.org
Message-ID: <21249373.259372.1577248422827.JavaMail.javamailuser@localhost>
Subject: Take home 750,000 Euros this end of year
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Attn: Email User,

You have won, you are to reply back with your name and phone number for
claim.

La Primitiva




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

