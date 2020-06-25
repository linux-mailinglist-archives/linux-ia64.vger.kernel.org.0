Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D94209FB7
	for <lists+linux-ia64@lfdr.de>; Thu, 25 Jun 2020 15:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404829AbgFYNYK (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Thu, 25 Jun 2020 09:24:10 -0400
Received: from mga01.intel.com ([192.55.52.88]:31089 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404740AbgFYNYJ (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Thu, 25 Jun 2020 09:24:09 -0400
IronPort-SDR: +tDidLvzPYJbquK0D1mP2uVYc490LpVLEVxXwKbRnDZB+Kiz587/k/bit4fX42ZkYqrR0/CoF1
 RLUTIirjY/5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="162967841"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; 
   d="scan'208";a="162967841"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2020 06:24:09 -0700
IronPort-SDR: 2ezmgb/2u+6MiN49NBDP4+M+S621ypojUrDTBgV5HkQXZoiMnzdBYl7br8dvfIWQ31G+v5RuoY
 22igJXxP/XdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; 
   d="scan'208";a="263919837"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.255.28.52]) ([10.255.28.52])
  by fmsmga007.fm.intel.com with ESMTP; 25 Jun 2020 06:24:01 -0700
Cc:     baolu.lu@linux.intel.com, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, x86@kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        intel-gfx@lists.freedesktop.org, Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH 02/13] iommu/vt-d: Use dev_iommu_priv_get/set()
To:     Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org
References: <20200625130836.1916-1-joro@8bytes.org>
 <20200625130836.1916-3-joro@8bytes.org>
From:   Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <1f6c3feb-d8b0-3ade-db2e-133f40874c30@linux.intel.com>
Date:   Thu, 25 Jun 2020 21:24:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625130836.1916-3-joro@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

Hi Joerg,

On 2020/6/25 21:08, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Remove the use of dev->archdata.iommu and use the private per-device
> pointer provided by IOMMU core code instead.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>   .../gpu/drm/i915/selftests/mock_gem_device.c   | 10 ++++++++--
>   drivers/iommu/intel/iommu.c                    | 18 +++++++++---------

For changes in VT-d driver,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

>   2 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index 9b105b811f1f..e08601905a64 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -24,6 +24,7 @@
>   
>   #include <linux/pm_domain.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/iommu.h>
>   
>   #include <drm/drm_managed.h>
>   
> @@ -118,6 +119,9 @@ struct drm_i915_private *mock_gem_device(void)
>   {
>   	struct drm_i915_private *i915;
>   	struct pci_dev *pdev;
> +#if IS_ENABLED(CONFIG_IOMMU_API) && defined(CONFIG_INTEL_IOMMU)
> +	struct dev_iommu iommu;
> +#endif
>   	int err;
>   
>   	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
> @@ -136,8 +140,10 @@ struct drm_i915_private *mock_gem_device(void)
>   	dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>   
>   #if IS_ENABLED(CONFIG_IOMMU_API) && defined(CONFIG_INTEL_IOMMU)
> -	/* hack to disable iommu for the fake device; force identity mapping */
> -	pdev->dev.archdata.iommu = (void *)-1;
> +	/* HACK HACK HACK to disable iommu for the fake device; force identity mapping */
> +	memset(&iommu, 0, sizeof(iommu));
> +	iommu.priv = (void *)-1;
> +	pdev->dev.iommu = &iommu;
>   #endif
>   
>   	pci_set_drvdata(pdev, i915);
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index d759e7234e98..2ce490c2eab8 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -372,7 +372,7 @@ struct device_domain_info *get_domain_info(struct device *dev)
>   	if (!dev)
>   		return NULL;
>   
> -	info = dev->archdata.iommu;
> +	info = dev_iommu_priv_get(dev);
>   	if (unlikely(info == DUMMY_DEVICE_DOMAIN_INFO ||
>   		     info == DEFER_DEVICE_DOMAIN_INFO))
>   		return NULL;
> @@ -743,12 +743,12 @@ struct context_entry *iommu_context_addr(struct intel_iommu *iommu, u8 bus,
>   
>   static int iommu_dummy(struct device *dev)
>   {
> -	return dev->archdata.iommu == DUMMY_DEVICE_DOMAIN_INFO;
> +	return dev_iommu_priv_get(dev) == DUMMY_DEVICE_DOMAIN_INFO;
>   }
>   
>   static bool attach_deferred(struct device *dev)
>   {
> -	return dev->archdata.iommu == DEFER_DEVICE_DOMAIN_INFO;
> +	return dev_iommu_priv_get(dev) == DEFER_DEVICE_DOMAIN_INFO;
>   }
>   
>   /**
> @@ -2420,7 +2420,7 @@ static inline void unlink_domain_info(struct device_domain_info *info)
>   	list_del(&info->link);
>   	list_del(&info->global);
>   	if (info->dev)
> -		info->dev->archdata.iommu = NULL;
> +		dev_iommu_priv_set(info->dev, NULL);
>   }
>   
>   static void domain_remove_dev_info(struct dmar_domain *domain)
> @@ -2453,7 +2453,7 @@ static void do_deferred_attach(struct device *dev)
>   {
>   	struct iommu_domain *domain;
>   
> -	dev->archdata.iommu = NULL;
> +	dev_iommu_priv_set(dev, NULL);
>   	domain = iommu_get_domain_for_dev(dev);
>   	if (domain)
>   		intel_iommu_attach_device(domain, dev);
> @@ -2599,7 +2599,7 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
>   	list_add(&info->link, &domain->devices);
>   	list_add(&info->global, &device_domain_list);
>   	if (dev)
> -		dev->archdata.iommu = info;
> +		dev_iommu_priv_set(dev, info);
>   	spin_unlock_irqrestore(&device_domain_lock, flags);
>   
>   	/* PASID table is mandatory for a PCI device in scalable mode. */
> @@ -4004,7 +4004,7 @@ static void quirk_ioat_snb_local_iommu(struct pci_dev *pdev)
>   	if (!drhd || drhd->reg_base_addr - vtbar != 0xa000) {
>   		pr_warn_once(FW_BUG "BIOS assigned incorrect VT-d unit for Intel(R) QuickData Technology device\n");
>   		add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
> -		pdev->dev.archdata.iommu = DUMMY_DEVICE_DOMAIN_INFO;
> +		dev_iommu_priv_set(&pdev->dev, DUMMY_DEVICE_DOMAIN_INFO);
>   	}
>   }
>   DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_IOAT_SNB, quirk_ioat_snb_local_iommu);
> @@ -4043,7 +4043,7 @@ static void __init init_no_remapping_devices(void)
>   			drhd->ignored = 1;
>   			for_each_active_dev_scope(drhd->devices,
>   						  drhd->devices_cnt, i, dev)
> -				dev->archdata.iommu = DUMMY_DEVICE_DOMAIN_INFO;
> +				dev_iommu_priv_set(dev, DUMMY_DEVICE_DOMAIN_INFO);
>   		}
>   	}
>   }
> @@ -5665,7 +5665,7 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
>   		return ERR_PTR(-ENODEV);
>   
>   	if (translation_pre_enabled(iommu))
> -		dev->archdata.iommu = DEFER_DEVICE_DOMAIN_INFO;
> +		dev_iommu_priv_set(dev, DEFER_DEVICE_DOMAIN_INFO);
>   
>   	return &iommu->iommu;
>   }
> 
