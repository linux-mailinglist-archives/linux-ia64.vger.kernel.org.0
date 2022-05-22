Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9BE5301DC
	for <lists+linux-ia64@lfdr.de>; Sun, 22 May 2022 10:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240341AbiEVIbO (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 22 May 2022 04:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235045AbiEVIbN (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 22 May 2022 04:31:13 -0400
X-Greylist: delayed 142 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 22 May 2022 01:31:11 PDT
Received: from jari.cn (unknown [218.92.28.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A0385E0D5
        for <linux-ia64@vger.kernel.org>; Sun, 22 May 2022 01:31:11 -0700 (PDT)
Received: by ajax-webmail-localhost.localdomain (Coremail) ; Sun, 22 May
 2022 16:23:47 +0800 (GMT+08:00)
X-Originating-IP: [182.148.12.156]
Date:   Sun, 22 May 2022 16:23:47 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?6ZmI5a2m5YW1?= <chenxuebing@jari.cn>
To:     akpm@linux-foundation.org, yang.guang5@zte.com.cn,
        linux-ia64@vger.kernel.org
Subject: [PATCH] ia64: Use strscpy to replace strlcpy
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.1 build 20210329(c53f3fee)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-4e503810-ca60-4ec8-a188-7102c18937cf-zhkzyfz.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6af8430e.9e0.180eadd8394.Coremail.chenxuebing@jari.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwA3QnAT84liKOs2AA--.644W
X-CM-SenderInfo: hfkh05pxhex0nj6mt2flof0/1tbiAQAOCmFEYxskqQACsX
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW5Jw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=3.6 required=5.0 tests=BAYES_05,RCVD_IN_PBL,RDNS_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_PERMERROR,T_SPF_PERMERROR,XPRIO
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

ClRoZSBzdHJsY3B5IHNob3VsZCBub3QgYmUgdXNlZCBiZWNhdXNlIGl0IGRvZXNuJ3QgbGltaXQg
dGhlIHNvdXJjZQpsZW5ndGguICBQcmVmZXJyZWQgaXMgc3Ryc2NweS4KClNpZ25lZC1vZmYtYnk6
IFh1ZUJpbmcgQ2hlbiA8Y2hlbnh1ZWJpbmdAamFyaS5jbj4KLS0tCiBhcmNoL2lhNjQva2VybmVs
L3NldHVwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2lhNjQva2VybmVsL3NldHVwLmMgYi9hcmNoL2lhNjQv
a2VybmVsL3NldHVwLmMKaW5kZXggNTAxMDM0OGZhMjFiLi4wOWE5YzY2YjgxODggMTAwNjQ0Ci0t
LSBhL2FyY2gvaWE2NC9rZXJuZWwvc2V0dXAuYworKysgYi9hcmNoL2lhNjQva2VybmVsL3NldHVw
LmMKQEAgLTU1Miw3ICs1NTIsNyBAQCBzZXR1cF9hcmNoIChjaGFyICoqY21kbGluZV9wKQogCWlh
NjRfcGF0Y2hfdnRvcCgodTY0KSBfX3N0YXJ0X19fdnRvcF9wYXRjaGxpc3QsICh1NjQpIF9fZW5k
X19fdnRvcF9wYXRjaGxpc3QpOwogCiAJKmNtZGxpbmVfcCA9IF9fdmEoaWE2NF9ib290X3BhcmFt
LT5jb21tYW5kX2xpbmUpOwotCXN0cmxjcHkoYm9vdF9jb21tYW5kX2xpbmUsICpjbWRsaW5lX3As
IENPTU1BTkRfTElORV9TSVpFKTsKKwlzdHJzY3B5KGJvb3RfY29tbWFuZF9saW5lLCAqY21kbGlu
ZV9wLCBDT01NQU5EX0xJTkVfU0laRSk7CiAKIAllZmlfaW5pdCgpOwogCWlvX3BvcnRfaW5pdCgp
OwotLSAKMi4zNi4xCg==
