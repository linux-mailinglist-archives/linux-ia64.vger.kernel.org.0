Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2294A2EA62F
	for <lists+linux-ia64@lfdr.de>; Tue,  5 Jan 2021 08:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbhAEHwi (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 5 Jan 2021 02:52:38 -0500
Received: from verein.lst.de ([213.95.11.211]:60409 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725766AbhAEHwi (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 5 Jan 2021 02:52:38 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id BF82A68AFE; Tue,  5 Jan 2021 08:51:55 +0100 (CET)
Date:   Tue, 5 Jan 2021 08:51:55 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org
Subject: Re: [PATCH RESEND] ia64: remove duplicate entries in
 generic_defconfig
Message-ID: <20210105075155.GB30262@lst.de>
References: <20210101041442.4591-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210101041442.4591-1-rdunlap@infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
