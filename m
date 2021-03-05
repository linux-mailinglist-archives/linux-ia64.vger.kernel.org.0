Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D1832EBBB
	for <lists+linux-ia64@lfdr.de>; Fri,  5 Mar 2021 13:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbhCEM5N (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 5 Mar 2021 07:57:13 -0500
Received: from verein.lst.de ([213.95.11.211]:46588 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231515AbhCEM5B (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Fri, 5 Mar 2021 07:57:01 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id DDA3D68BEB; Fri,  5 Mar 2021 13:56:57 +0100 (CET)
Date:   Fri, 5 Mar 2021 13:56:57 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mm@kvack.org, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] mm: Generalize HUGETLB_PAGE_SIZE_VARIABLE
Message-ID: <20210305125657.GB7863@lst.de>
References: <1614914928-22039-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614914928-22039-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
