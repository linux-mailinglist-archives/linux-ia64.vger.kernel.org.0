Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF92210E307
	for <lists+linux-ia64@lfdr.de>; Sun,  1 Dec 2019 19:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfLASVA (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 1 Dec 2019 13:21:00 -0500
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:9691 "EHLO mtax.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727252AbfLASVA (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Sun, 1 Dec 2019 13:21:00 -0500
X-Greylist: delayed 6658 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 13:20:59 EST
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1575217632; h=DKIM-Filter:X-Virus-Scanned:
         Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Message-Id:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-SAAS-TrackingID:
         X-NAI-Spam-Flag:X-NAI-Spam-Threshold:X-NAI-Spam-Score:
         X-NAI-Spam-Rules:X-NAI-Spam-Version; bh=M
        8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs4
        8=; b=IzG4SmDOoNtHrHwrrAizpRFkUSveIMq3vzCSk0lVJ7xO
        iSH14vN30qkr0XDRT3OzD7l++mlJkTAr3bqAcYx4rW4V+2BXVP
        knXmnyBVdZqaCIoBdxIyuJTsZEfXj9Fl1sTOXLx5Q7hOp5ryG6
        FYoTuC+FvzvIaOoMfQQKkVlQkj0=
Received: from cdmx.gob.mx (correo.cdmx.gob.mx [10.250.108.150]) by mtax.cdmx.gob.mx with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 217f_63ae_a080e2e6_97a3_44a1_9dd6_8ca3236c97d8;
        Sun, 01 Dec 2019 10:27:11 -0600
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id A54821E2286;
        Sun,  1 Dec 2019 10:18:49 -0600 (CST)
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id NaCf-hKI5QBR; Sun,  1 Dec 2019 10:18:49 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 76A981E2B9E;
        Sun,  1 Dec 2019 10:14:16 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx 76A981E2B9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=72359050-3965-11E6-920A-0192F7A2F08E; t=1575216856;
        bh=M8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs48=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Message-Id;
        b=Ba8yychDed6bSohA96nOchpj20euRY5bj5/fHo4XbNIUYHdqyB5pWXUkNURA3JpFc
         OSFlHnKwkwPyQSOp071ZHh3hB8z0ZWgxmt/V4iIFY5Kb5lWCuuPQwXoUfKJS/LHTZw
         qoJAswTU18PXjY+iZlNjxczun/OrqC0+UlfGIrZY=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id lhXHhq4EUUEQ; Sun,  1 Dec 2019 10:14:16 -0600 (CST)
Received: from [192.168.0.104] (unknown [188.125.168.160])
        by cdmx.gob.mx (Postfix) with ESMTPSA id 8EFA61E2851;
        Sun,  1 Dec 2019 10:05:15 -0600 (CST)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Congratulations
To:     Recipients <aac-styfe@cdmx.gob.mx>
From:   "Bishop Johnr" <aac-styfe@cdmx.gob.mx>
Date:   Sun, 01 Dec 2019 17:05:07 +0100
Message-Id: <20191201160515.8EFA61E2851@cdmx.gob.mx>
X-AnalysisOut: [v=2.2 cv=Rf/gMxlv c=1 sm=1 tr=0 p=6K-Ig8iNAUou4E5wYCEA:9 p]
X-AnalysisOut: [=zRI05YRXt28A:10 a=T6zFoIZ12MK39YzkfxrL7A==:117 a=9152RP8M]
X-AnalysisOut: [6GQqDhC/mI/QXQ==:17 a=8nJEP1OIZ-IA:10 a=pxVhFHJ0LMsA:10 a=]
X-AnalysisOut: [pGLkceISAAAA:8 a=wPNLvfGTeEIA:10 a=M8O0W8wq6qAA:10 a=Ygvjr]
X-AnalysisOut: [iKHvHXA2FhpO6d-:22]
X-SAAS-TrackingID: dd9e3ed5.0.105104962.00-2303.176706151.s12p02m011.mxlogic.net
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6686> : inlines <7165> : streams
 <1840193> : uri <2949750>
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Money was donated to you by Mr and Mrs Allen and Violet Large, just contact=
 them with this email for more information =


EMail: allenandvioletlargeaward@gmail.com
