Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A796E0710
	for <lists+linux-ia64@lfdr.de>; Tue, 22 Oct 2019 17:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732204AbfJVPKu (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 22 Oct 2019 11:10:50 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:46323 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731453AbfJVPKu (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Tue, 22 Oct 2019 11:10:50 -0400
Received: by mail-pf1-f172.google.com with SMTP id q5so10822289pfg.13
        for <linux-ia64@vger.kernel.org>; Tue, 22 Oct 2019 08:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=8AwEM/obC8LRWaCg0EJY39OUdBAOiIs+mtoo3/7ay7o=;
        b=FeOKbp7mNk3JOA1aJUAMjgmf2QlO3Ur9RWSf+6OfL/Dqhq+7qD3qDLPatOv8ettg29
         Q8WxSQT0OXKocEfxtPEs/gs8lMIJXcDblN52EqfmTZxUjq24ncs4FalyxT4X9wU+WRs7
         NaxOZMGnSTB+aFAEvhc7Vgc2OPjb98WlVCIX+ykiIgCt0kW+dIa802GJ7yRn3bF+JpXN
         zCasLsx0mB2kRX/7lBg/8COxXpHGMZKCXcjs0eD/+isto41ya7IunpPKWdH9uHKKjKsW
         NtcTg9BdJE+iRGLmIbQ0UG3AP0kaFvsijpYiIGjq0pVmgOadqadMsPcEXmDq0Kg0QA46
         kGrw==
X-Gm-Message-State: APjAAAWUq6KnkWTDv//CHsZEg1EISocLN1CZKBDAM1qiHV7DeXpTtb1n
        uBQVQWwfIR3EivCzmXpZ3UmwrA==
X-Google-Smtp-Source: APXvYqwpcdig5U0KlygiWr/07ufZuXhgsDfX0+P8KVKTiRMi0+u8a5sKyE5qZZmPdgiu+6Nh3jLGkg==
X-Received: by 2002:aa7:9156:: with SMTP id 22mr4907293pfi.246.1571757049387;
        Tue, 22 Oct 2019 08:10:49 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id t12sm15557832pjq.18.2019.10.22.08.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 08:10:48 -0700 (PDT)
Date:   Tue, 22 Oct 2019 08:10:48 -0700 (PDT)
X-Google-Original-Date: Tue, 22 Oct 2019 08:10:42 PDT (-0700)
Subject:     Re: PCI/MSI: Remove the PCI_MSI_IRQ_DOMAIN architecture whitelist
In-Reply-To: <995f625b-1f56-6d97-ba99-9a4298e9dd37@xilinx.com>
CC:     Christoph Hellwig <hch@infradead.org>, michal.simek@xilinx.com,
        helgaas@kernel.org, tony.luck@intel.com, fenghua.yu@intel.com,
        heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, bhelgaas@google.com, will@kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        kstewart@linuxfoundation.org, pbonzini@redhat.com,
        firoz.khan@linaro.org, yamada.masahiro@socionext.com,
        longman@redhat.com, mingo@kernel.org, peterz@infradead.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-pci@vger.kernel.org
From:   Palmer Dabbelt <palmer@sifive.com>
To:     michal.simek@xilinx.com
Message-ID: <mhng-d42f23ae-e51f-49cd-9533-a4c793cd70fe@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, 17 Oct 2019 23:20:09 PDT (-0700), michal.simek@xilinx.com wrote:
> Hi,
>
> On 17. 10. 19 20:19, Palmer Dabbelt wrote:
>> This came up in the context of the microblaze port, where a patch was
>> recently posted to extend the whitelist.
>
> I hoped you were aware about this discussion we have with Christoph.
> https://lkml.org/lkml/2019/10/8/682
>
> It means 1/3 and 2/3 should be replaced by mandatory-y and I expect
> msi.h can be removed from architecture Kbuild too.

I'd missed it, but that seems like a better way to do it.  I'm going to assume 
you guys are going to handle this, so feel free to drop my patch set.

Thanks!
