Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C8941AA21
	for <lists+linux-ia64@lfdr.de>; Tue, 28 Sep 2021 09:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239496AbhI1H4G (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Tue, 28 Sep 2021 03:56:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:36074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239357AbhI1H4F (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Tue, 28 Sep 2021 03:56:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B80DD611C3;
        Tue, 28 Sep 2021 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632815665;
        bh=JwfWSl4lOeGQdDMCaqzC/YoR5dLIQUBHyX/TyVwAtrk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B9DErRv0DXvR79z0gAToMQix95rYf1C7EZpx01Zx4vKlfkZEb0dTcwcHyclo66CNs
         +kMEasFS5dFlnuses0vfgEA8cVtmJTf95pNfn4OyiKfJPOAVVSyBFGgi6PYZ40mMr/
         lyS2acpMRFpyufwCoovmBfdDpm5HF4HHeMHZWcN+Wm+jnCDFj/NcLLoTdxhHkWGu9/
         ktzZG7k/GDNoFUREQkQ+rtAcsMsBvPDVxXZWc9w0Bb+1mpLgaRpioNK0EGSQ7Z6DDj
         ZSe0j1Uo2ARkHoiSqNjIl7LAvtUK2tk3alnXiAat/zi8dUUwpZk9r4kjuLwljK7Dq7
         Jz7Xz09aLl5eg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        Kalle Valo <kvalo@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Joerg Roedel <joro@8bytes.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Elder <elder@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] [v2] qcom_scm: hide Kconfig symbol
Date:   Tue, 28 Sep 2021 09:50:27 +0200
Message-Id: <20210928075216.4193128-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210928075216.4193128-1-arnd@kernel.org>
References: <20210928075216.4193128-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Now that SCM can be a loadable module, we have to add another
dependency to avoid link failures when ipa or adreno-gpu are
built-in:

aarch64-linux-ld: drivers/net/ipa/ipa_main.o: in function `ipa_probe':
ipa_main.c:(.text+0xfc4): undefined reference to `qcom_scm_is_available'

ld.lld: error: undefined symbol: qcom_scm_is_available
>>> referenced by adreno_gpu.c
>>>               gpu/drm/msm/adreno/adreno_gpu.o:(adreno_zap_shader_load) in archive drivers/built-in.a

This can happen when CONFIG_ARCH_QCOM is disabled and we don't select
QCOM_MDT_LOADER, but some other module selects QCOM_SCM. Ideally we'd
use a similar dependency here to what we have for QCOM_RPROC_COMMON,
but that causes dependency loops from other things selecting QCOM_SCM.

This appears to be an endless problem, so try something different this
time:

 - CONFIG_QCOM_SCM becomes a hidden symbol that nothing 'depends on'
   but that is simply selected by all of its users

 - All the stubs in include/linux/qcom_scm.h can go away

 - arm-smccc.h needs to provide a stub for __arm_smccc_smc() to
   allow compile-testing QCOM_SCM on all architectures.

 - To avoid a circular dependency chain involving RESET_CONTROLLER
   and PINCTRL_SUNXI, drop the 'select RESET_CONTROLLER' statement.
   According to my testing this still builds fine, and the QCOM
   platform selects this symbol already.

Acked-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Changes in v2:
  - drop the 'select RESET_CONTROLLER' line, rather than adding
    more of the same
---
 drivers/firmware/Kconfig                |  5 +-
 drivers/gpu/drm/msm/Kconfig             |  4 +-
 drivers/iommu/Kconfig                   |  2 +-
 drivers/media/platform/Kconfig          |  2 +-
 drivers/mmc/host/Kconfig                |  2 +-
 drivers/net/ipa/Kconfig                 |  1 +
 drivers/net/wireless/ath/ath10k/Kconfig |  2 +-
 drivers/pinctrl/qcom/Kconfig            |  3 +-
 include/linux/arm-smccc.h               | 10 ++++
 include/linux/qcom_scm.h                | 71 -------------------------
 10 files changed, 20 insertions(+), 82 deletions(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 220a58cf0a44..cda7d7162cbb 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -203,10 +203,7 @@ config INTEL_STRATIX10_RSU
 	  Say Y here if you want Intel RSU support.
 
 config QCOM_SCM
-	tristate "Qcom SCM driver"
-	depends on ARM || ARM64
-	depends on HAVE_ARM_SMCCC
-	select RESET_CONTROLLER
+	tristate
 
 config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
 	bool "Qualcomm download mode enabled by default"
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index e9c6af78b1d7..3ddf739a6f9b 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -17,7 +17,7 @@ config DRM_MSM
 	select DRM_SCHED
 	select SHMEM
 	select TMPFS
-	select QCOM_SCM if ARCH_QCOM
+	select QCOM_SCM
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
@@ -55,7 +55,7 @@ config DRM_MSM_GPU_SUDO
 
 config DRM_MSM_HDMI_HDCP
 	bool "Enable HDMI HDCP support in MSM DRM driver"
-	depends on DRM_MSM && QCOM_SCM
+	depends on DRM_MSM
 	default y
 	help
 	  Choose this option to enable HDCP state machine
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 124c41adeca1..989c83acbfee 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -308,7 +308,7 @@ config APPLE_DART
 config ARM_SMMU
 	tristate "ARM Ltd. System MMU (SMMU) Support"
 	depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
-	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
+	select QCOM_SCM
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU if ARM
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 157c924686e4..80321e03809a 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -565,7 +565,7 @@ config VIDEO_QCOM_VENUS
 	depends on VIDEO_DEV && VIDEO_V4L2 && QCOM_SMEM
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select QCOM_MDT_LOADER if ARCH_QCOM
-	select QCOM_SCM if ARCH_QCOM
+	select QCOM_SCM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	help
diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 71313961cc54..95b3511b0560 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -547,7 +547,7 @@ config MMC_SDHCI_MSM
 	depends on MMC_SDHCI_PLTFM
 	select MMC_SDHCI_IO_ACCESSORS
 	select MMC_CQHCI
-	select QCOM_SCM if MMC_CRYPTO && ARCH_QCOM
+	select QCOM_SCM if MMC_CRYPTO
 	help
 	  This selects the Secure Digital Host Controller Interface (SDHCI)
 	  support present in Qualcomm SOCs. The controller supports
diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
index 8f99cfa14680..d037682fb7ad 100644
--- a/drivers/net/ipa/Kconfig
+++ b/drivers/net/ipa/Kconfig
@@ -4,6 +4,7 @@ config QCOM_IPA
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on QCOM_RPROC_COMMON || (QCOM_RPROC_COMMON=n && COMPILE_TEST)
 	select QCOM_MDT_LOADER if ARCH_QCOM
+	select QCOM_SCM
 	select QCOM_QMI_HELPERS
 	help
 	  Choose Y or M here to include support for the Qualcomm
diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 741289e385d5..ca007b800f75 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -44,7 +44,7 @@ config ATH10K_SNOC
 	tristate "Qualcomm ath10k SNOC support"
 	depends on ATH10K
 	depends on ARCH_QCOM || COMPILE_TEST
-	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
+	select QCOM_SCM
 	select QCOM_QMI_HELPERS
 	help
 	  This module adds support for integrated WCN3990 chip connected
diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 32ea2a8ec02b..5ff4207df66e 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -3,7 +3,8 @@ if (ARCH_QCOM || COMPILE_TEST)
 
 config PINCTRL_MSM
 	tristate "Qualcomm core pin controller driver"
-	depends on GPIOLIB && (QCOM_SCM || !QCOM_SCM) #if QCOM_SCM=m this can't be =y
+	depends on GPIOLIB
+	select QCOM_SCM
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 7d1cabe15262..63ccb5252190 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -321,10 +321,20 @@ asmlinkage unsigned long __arm_smccc_sve_check(unsigned long x0);
  * from register 0 to 3 on return from the SMC instruction.  An optional
  * quirk structure provides vendor specific behavior.
  */
+#ifdef CONFIG_HAVE_ARM_SMCCC
 asmlinkage void __arm_smccc_smc(unsigned long a0, unsigned long a1,
 			unsigned long a2, unsigned long a3, unsigned long a4,
 			unsigned long a5, unsigned long a6, unsigned long a7,
 			struct arm_smccc_res *res, struct arm_smccc_quirk *quirk);
+#else
+static inline void __arm_smccc_smc(unsigned long a0, unsigned long a1,
+			unsigned long a2, unsigned long a3, unsigned long a4,
+			unsigned long a5, unsigned long a6, unsigned long a7,
+			struct arm_smccc_res *res, struct arm_smccc_quirk *quirk)
+{
+	*res = (struct arm_smccc_res){};
+}
+#endif
 
 /**
  * __arm_smccc_hvc() - make HVC calls
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index c0475d1c9885..81cad9e1e412 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -61,7 +61,6 @@ enum qcom_scm_ice_cipher {
 #define QCOM_SCM_PERM_RW (QCOM_SCM_PERM_READ | QCOM_SCM_PERM_WRITE)
 #define QCOM_SCM_PERM_RWX (QCOM_SCM_PERM_RW | QCOM_SCM_PERM_EXEC)
 
-#if IS_ENABLED(CONFIG_QCOM_SCM)
 extern bool qcom_scm_is_available(void);
 
 extern int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
@@ -115,74 +114,4 @@ extern int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 extern int qcom_scm_lmh_profile_change(u32 profile_id);
 extern bool qcom_scm_lmh_dcvsh_available(void);
 
-#else
-
-#include <linux/errno.h>
-
-static inline bool qcom_scm_is_available(void) { return false; }
-
-static inline int qcom_scm_set_cold_boot_addr(void *entry,
-		const cpumask_t *cpus) { return -ENODEV; }
-static inline int qcom_scm_set_warm_boot_addr(void *entry,
-		const cpumask_t *cpus) { return -ENODEV; }
-static inline void qcom_scm_cpu_power_down(u32 flags) {}
-static inline u32 qcom_scm_set_remote_state(u32 state,u32 id)
-		{ return -ENODEV; }
-
-static inline int qcom_scm_pas_init_image(u32 peripheral, const void *metadata,
-		size_t size) { return -ENODEV; }
-static inline int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr,
-		phys_addr_t size) { return -ENODEV; }
-static inline int qcom_scm_pas_auth_and_reset(u32 peripheral)
-		{ return -ENODEV; }
-static inline int qcom_scm_pas_shutdown(u32 peripheral) { return -ENODEV; }
-static inline bool qcom_scm_pas_supported(u32 peripheral) { return false; }
-
-static inline int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
-		{ return -ENODEV; }
-static inline int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
-		{ return -ENODEV; }
-
-static inline bool qcom_scm_restore_sec_cfg_available(void) { return false; }
-static inline int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
-		{ return -ENODEV; }
-static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
-		{ return -ENODEV; }
-static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
-		{ return -ENODEV; }
-extern inline int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
-						 u32 cp_nonpixel_start,
-						 u32 cp_nonpixel_size)
-		{ return -ENODEV; }
-static inline int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
-		unsigned int *src, const struct qcom_scm_vmperm *newvm,
-		unsigned int dest_cnt) { return -ENODEV; }
-
-static inline bool qcom_scm_ocmem_lock_available(void) { return false; }
-static inline int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
-		u32 size, u32 mode) { return -ENODEV; }
-static inline int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id,
-		u32 offset, u32 size) { return -ENODEV; }
-
-static inline bool qcom_scm_ice_available(void) { return false; }
-static inline int qcom_scm_ice_invalidate_key(u32 index) { return -ENODEV; }
-static inline int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
-				       enum qcom_scm_ice_cipher cipher,
-				       u32 data_unit_size) { return -ENODEV; }
-
-static inline bool qcom_scm_hdcp_available(void) { return false; }
-static inline int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
-		u32 *resp) { return -ENODEV; }
-
-static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
-		{ return -ENODEV; }
-
-static inline int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
-				     u64 limit_node, u32 node_id, u64 version)
-		{ return -ENODEV; }
-
-static inline int qcom_scm_lmh_profile_change(u32 profile_id) { return -ENODEV; }
-
-static inline bool qcom_scm_lmh_dcvsh_available(void) { return -ENODEV; }
-#endif
 #endif
-- 
2.29.2

