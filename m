Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64A77BDC8
	for <lists+linux-ia64@lfdr.de>; Mon, 29 Apr 2019 00:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfD1WVN (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 28 Apr 2019 18:21:13 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:44302 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbfD1WVM (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Sun, 28 Apr 2019 18:21:12 -0400
Received: by mail-vs1-f42.google.com with SMTP id j184so4835039vsd.11
        for <linux-ia64@vger.kernel.org>; Sun, 28 Apr 2019 15:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=UMoBcF/GJRpB3jLRDPiY4Ide1k3SS+GiLSoD190B2CY=;
        b=V9mkuWfq2NZYSQ5O+x0Fgokz0cH07q9/xmzRLsAjXAftjEfdCCq4dDn3YIFyr/h18p
         MQfcP85k49LBXIb6eltvLpDKgjyZcNgHU4gvP9zZVdazq2e1oHM2ACD1oqclZtSP+Fh4
         rK01DT31B5gNndR9bO+CO79TwGBzS8Qv6UtbITL732U0/851b+argENHZByq3ahbFJWb
         jrxqbWQo3upIjzhaT2ky/lreHzZoBuDWyWP0SVpgCGjF03KLCm0+RwcX0t8kZ0hrl8EC
         Ei4C58l80WfYOKSY3dXMaba7IygHrkjYqYw+JN1aQQFpTI2I654VrcAiblqa04xU8YiR
         /jHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=UMoBcF/GJRpB3jLRDPiY4Ide1k3SS+GiLSoD190B2CY=;
        b=RqBeRfuL84yWnqs5GgkOyEW551sg7rmbQWcRsrLa9KX6NK24ydQsJSpWFJE+nYETgB
         PX9SefFdxNCmi619v6tVpanDyVda3x42/XqGRMRaOeL2x53r1hyc1LkHSaKOzrPOXFEm
         hF16z26hXs2o+k7nJKQC1xOObCS+3o/aMDRvQs4itW+9Rk4+hn4GZZvuOksigqQCYgi6
         S+Pvr7m2rS/IEgvO/zzeL4EuZI2c7cDfPix9xt+PfkB4/M/tNm5DleT8eKDrcbU81dLG
         qxmxcAruAM7TF9Q9jjrpi/bbMk8MmLH+lwedR8kDZhzt39RLpeek/ao8yOjhYylJWV/3
         6kMQ==
X-Gm-Message-State: APjAAAWS4VsGwSZ+j7VxZdsiV1k1kwMkL/lONbg7RD+o5OtVrvmRi1u7
        KWRGaNZdqOgROi6gWZ0Qo0LzLOy9td5IZ2H3SfyMtA==
X-Google-Smtp-Source: APXvYqyokwyR7ckECGODcTVleHI/BKuvMqP8J2kAUT62E77nwFzTHpRLOUugmfWbWkaAIDXKc2bKhHjNTBZRMBr1zys=
X-Received: by 2002:a67:fe91:: with SMTP id b17mr14900863vsr.217.1556490071555;
 Sun, 28 Apr 2019 15:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAGn-Tgg9qOoFNKKrbK1=XQEKj8wwD26NWY+1G4cDHRySsJWcYQ@mail.gmail.com>
 <CAGn-TgiVjo_Ko1YXoJJEWNUtcKpAFmt6TwYv1-C_TaeU_nju=A@mail.gmail.com>
In-Reply-To: <CAGn-TgiVjo_Ko1YXoJJEWNUtcKpAFmt6TwYv1-C_TaeU_nju=A@mail.gmail.com>
From:   Adam Richter <adamrichter4@gmail.com>
Date:   Sun, 28 Apr 2019 22:21:00 +0000
Message-ID: <CAGn-TghMGi-wqWF-v9qRkZHtqh01byXXOQKfVWgAvNxm5hxMoQ@mail.gmail.com>
Subject: [Untested patch] ia64: Eliminate goto from ftrace_modify_code
To:     linux-ia64@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000cfdd9605879e95cc"
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

--000000000000cfdd9605879e95cc
Content-Type: text/plain; charset="UTF-8"

The attached untested patch avoids a cppcheck warning by eliminating
an unnecessary use of goto, which apparently caused cppcheck not to
recognize the impossibility of a null pointer dereference in one case.
It as a revision to my previous incorrect patch from two days ago
("Suspected null pointer dereference in ftrace_make_nop() for ia64").

Ideally, cppcheck should be enhanced to recognize "goto" usage in this
form and do the same analysis that it does with "if" statements (and I
intend to look into that), but, even with such a cppcheck enhancement,
I believe it still helps maintainability to avoid using "goto"
statements that do not provide some technical benefit.

I have not built or tested this change, and I am aware that yesterday
Greg K-H asked everyone to avoid device driver churn for untested
code.  So, I am not requesting integration without someone else trying
it first.  I am, however, posting this patch just in case anyone to
try it at some point and then submit it upstream if it actually works
and their are no complaints.

I hereby release my copyright interest in this contribution to the
public domain.  Please let me know if anyone needs me to make any
other statements with regard to this patch.

Adam

--000000000000cfdd9605879e95cc
Content-Type: text/x-diff; charset="US-ASCII"; 
	name="ia64_ftrace_modify_code.remove_goto.diff"
Content-Disposition: attachment; 
	filename="ia64_ftrace_modify_code.remove_goto.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_jv1hdt5t0>
X-Attachment-Id: f_jv1hdt5t0

ZGlmZiAtLWdpdCBhL2FyY2gvaWE2NC9rZXJuZWwvZnRyYWNlLmMgYi9hcmNoL2lhNjQva2VybmVs
L2Z0cmFjZS5jCmluZGV4IDdmYzhjOTYxYjFmNy4uNzg4ZjcwZWY1MzQ2IDEwMDY0NAotLS0gYS9h
cmNoL2lhNjQva2VybmVsL2Z0cmFjZS5jCisrKyBiL2FyY2gvaWE2NC9rZXJuZWwvZnRyYWNlLmMK
QEAgLTEwNiwxOCArMTA2LDE3IEBAIGZ0cmFjZV9tb2RpZnlfY29kZSh1bnNpZ25lZCBsb25nIGlw
LCB1bnNpZ25lZCBjaGFyICpvbGRfY29kZSwKIAkgKiBrc3RvcF9tYWNoaW5lLCBvciBiZWZvcmUg
U01QIHN0YXJ0cy4KIAkgKi8KIAotCWlmICghZG9fY2hlY2spCi0JCWdvdG8gc2tpcF9jaGVjazsK
KwlpZiAoZG9fY2hlY2spIHsKIAotCS8qIHJlYWQgdGhlIHRleHQgd2Ugd2FudCB0byBtb2RpZnkg
Ki8KLQlpZiAocHJvYmVfa2VybmVsX3JlYWQocmVwbGFjZWQsICh2b2lkICopaXAsIE1DT1VOVF9J
TlNOX1NJWkUpKQotCQlyZXR1cm4gLUVGQVVMVDsKKwkJLyogcmVhZCB0aGUgdGV4dCB3ZSB3YW50
IHRvIG1vZGlmeSAqLworCQlpZiAocHJvYmVfa2VybmVsX3JlYWQocmVwbGFjZWQsICh2b2lkICop
aXAsIE1DT1VOVF9JTlNOX1NJWkUpKQorCQkJcmV0dXJuIC1FRkFVTFQ7CiAKLQkvKiBNYWtlIHN1
cmUgaXQgaXMgd2hhdCB3ZSBleHBlY3QgaXQgdG8gYmUgKi8KLQlpZiAobWVtY21wKHJlcGxhY2Vk
LCBvbGRfY29kZSwgTUNPVU5UX0lOU05fU0laRSkgIT0gMCkKLQkJcmV0dXJuIC1FSU5WQUw7CisJ
CS8qIE1ha2Ugc3VyZSBpdCBpcyB3aGF0IHdlIGV4cGVjdCBpdCB0byBiZSAqLworCQlpZiAobWVt
Y21wKHJlcGxhY2VkLCBvbGRfY29kZSwgTUNPVU5UX0lOU05fU0laRSkgIT0gMCkKKwkJCXJldHVy
biAtRUlOVkFMOworCX0KIAotc2tpcF9jaGVjazoKIAkvKiByZXBsYWNlIHRoZSB0ZXh0IHdpdGgg
dGhlIG5ldyB0ZXh0ICovCiAJaWYgKHByb2JlX2tlcm5lbF93cml0ZSgoKHZvaWQgKilpcCksIG5l
d19jb2RlLCBNQ09VTlRfSU5TTl9TSVpFKSkKIAkJcmV0dXJuIC1FUEVSTTsK
--000000000000cfdd9605879e95cc--
