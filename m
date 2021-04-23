Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70D0368E1C
	for <lists+linux-ia64@lfdr.de>; Fri, 23 Apr 2021 09:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241184AbhDWHtP (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 23 Apr 2021 03:49:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:50972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229456AbhDWHtO (ORCPT <rfc822;linux-ia64@vger.kernel.org>);
        Fri, 23 Apr 2021 03:49:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57E79611C2;
        Fri, 23 Apr 2021 07:48:34 +0000 (UTC)
Date:   Fri, 23 Apr 2021 09:48:31 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Richard Guy Briggs <rgb@redhat.com>
Cc:     linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-parisc@vger.kernel.org, x86@kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, Aleksa Sarai <cyphar@cyphar.com>,
        Linux-Audit Mailing List <linux-audit@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
        Eric Paris <eparis@parisplace.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] audit: add support for the openat2 syscall
Message-ID: <20210423074831.lc4jqqtyuun2fnws@wittgenstein>
References: <cover.1616031035.git.rgb@redhat.com>
 <49510cacfb5fbbaa312a4a389f3a6619675007ab.1616031035.git.rgb@redhat.com>
 <20210318104843.uiga6tmmhn5wfhbs@wittgenstein>
 <20210318120801.GK3141668@madcap2.tricolour.ca>
 <20210423023408.GB2174828@madcap2.tricolour.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210423023408.GB2174828@madcap2.tricolour.ca>
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

On Thu, Apr 22, 2021 at 10:34:08PM -0400, Richard Guy Briggs wrote:
> On 2021-03-18 08:08, Richard Guy Briggs wrote:
> > On 2021-03-18 11:48, Christian Brauner wrote:
> > > [+Cc Aleksa, the author of openat2()]
> > 
> > Ah!  Thanks for pulling in Aleksa.  I thought I caught everyone...
> > 
> > > and a comment below. :)
> > 
> > Same...
> > 
> > > On Wed, Mar 17, 2021 at 09:47:17PM -0400, Richard Guy Briggs wrote:
> > > > The openat2(2) syscall was added in kernel v5.6 with commit fddb5d430ad9
> > > > ("open: introduce openat2(2) syscall")
> > > > 
> > > > Add the openat2(2) syscall to the audit syscall classifier.
> > > > 
> > > > See the github issue
> > > > https://github.com/linux-audit/audit-kernel/issues/67
> > > > 
> > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > ---
> > > >  arch/alpha/kernel/audit.c          | 2 ++
> > > >  arch/ia64/kernel/audit.c           | 2 ++
> > > >  arch/parisc/kernel/audit.c         | 2 ++
> > > >  arch/parisc/kernel/compat_audit.c  | 2 ++
> > > >  arch/powerpc/kernel/audit.c        | 2 ++
> > > >  arch/powerpc/kernel/compat_audit.c | 2 ++
> > > >  arch/s390/kernel/audit.c           | 2 ++
> > > >  arch/s390/kernel/compat_audit.c    | 2 ++
> > > >  arch/sparc/kernel/audit.c          | 2 ++
> > > >  arch/sparc/kernel/compat_audit.c   | 2 ++
> > > >  arch/x86/ia32/audit.c              | 2 ++
> > > >  arch/x86/kernel/audit_64.c         | 2 ++
> > > >  kernel/auditsc.c                   | 3 +++
> > > >  lib/audit.c                        | 4 ++++
> > > >  lib/compat_audit.c                 | 4 ++++
> > > >  15 files changed, 35 insertions(+)
> > > > 
> > > > diff --git a/arch/alpha/kernel/audit.c b/arch/alpha/kernel/audit.c
> > > > index 96a9d18ff4c4..06a911b685d1 100644
> > > > --- a/arch/alpha/kernel/audit.c
> > > > +++ b/arch/alpha/kernel/audit.c
> > > > @@ -42,6 +42,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
> > > >  		return 3;
> > > >  	case __NR_execve:
> > > >  		return 5;
> > > > +	case __NR_openat2:
> > > > +		return 6;
> > > >  	default:
> > > >  		return 0;
> > > >  	}
> > > > diff --git a/arch/ia64/kernel/audit.c b/arch/ia64/kernel/audit.c
> > > > index 5192ca899fe6..5eaa888c8fd3 100644
> > > > --- a/arch/ia64/kernel/audit.c
> > > > +++ b/arch/ia64/kernel/audit.c
> > > > @@ -43,6 +43,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
> > > >  		return 3;
> > > >  	case __NR_execve:
> > > >  		return 5;
> > > > +	case __NR_openat2:
> > > > +		return 6;
> > > >  	default:
> > > >  		return 0;
> > > >  	}
> > > > diff --git a/arch/parisc/kernel/audit.c b/arch/parisc/kernel/audit.c
> > > > index 9eb47b2225d2..fc721a7727ba 100644
> > > > --- a/arch/parisc/kernel/audit.c
> > > > +++ b/arch/parisc/kernel/audit.c
> > > > @@ -52,6 +52,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
> > > >  		return 3;
> > > >  	case __NR_execve:
> > > >  		return 5;
> > > > +	case __NR_openat2:
> > > > +		return 6;
> > > >  	default:
> > > >  		return 0;
> > > >  	}
> > > > diff --git a/arch/parisc/kernel/compat_audit.c b/arch/parisc/kernel/compat_audit.c
> > > > index 20c39c9d86a9..fc6d35918c44 100644
> > > > --- a/arch/parisc/kernel/compat_audit.c
> > > > +++ b/arch/parisc/kernel/compat_audit.c
> > > > @@ -35,6 +35,8 @@ int parisc32_classify_syscall(unsigned syscall)
> > > >  		return 3;
> > > >  	case __NR_execve:
> > > >  		return 5;
> > > > +	case __NR_openat2:
> > > > +		return 6;
> > > >  	default:
> > > >  		return 1;
> > > >  	}
> > > > diff --git a/arch/powerpc/kernel/audit.c b/arch/powerpc/kernel/audit.c
> > > > index a2dddd7f3d09..8f32700b0baa 100644
> > > > --- a/arch/powerpc/kernel/audit.c
> > > > +++ b/arch/powerpc/kernel/audit.c
> > > > @@ -54,6 +54,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
> > > >  		return 4;
> > > >  	case __NR_execve:
> > > >  		return 5;
> > > > +	case __NR_openat2:
> > > > +		return 6;
> > > >  	default:
> > > >  		return 0;
> > > >  	}
> > > > diff --git a/arch/powerpc/kernel/compat_audit.c b/arch/powerpc/kernel/compat_audit.c
> > > > index 55c6ccda0a85..ebe45534b1c9 100644
> > > > --- a/arch/powerpc/kernel/compat_audit.c
> > > > +++ b/arch/powerpc/kernel/compat_audit.c
> > > > @@ -38,6 +38,8 @@ int ppc32_classify_syscall(unsigned syscall)
> > > >  		return 4;
> > > >  	case __NR_execve:
> > > >  		return 5;
> > > > +	case __NR_openat2:
> > > > +		return 6;
> > > >  	default:
> > > >  		return 1;
> > > >  	}
> > > > diff --git a/arch/s390/kernel/audit.c b/arch/s390/kernel/audit.c
> > > > index d395c6c9944c..d964cb94cfaf 100644
> > > > --- a/arch/s390/kernel/audit.c
> > > > +++ b/arch/s390/kernel/audit.c
> > > > @@ -54,6 +54,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
> > > >  		return 4;
> > > >  	case __NR_execve:
> > > >  		return 5;
> > > > +	case __NR_openat2:
> > > > +		return 6;
> > > >  	default:
> > > >  		return 0;
> > > >  	}
> > > > diff --git a/arch/s390/kernel/compat_audit.c b/arch/s390/kernel/compat_audit.c
> > > > index 444fb1f66944..f7b32933ce0e 100644
> > > > --- a/arch/s390/kernel/compat_audit.c
> > > > +++ b/arch/s390/kernel/compat_audit.c
> > > > @@ -39,6 +39,8 @@ int s390_classify_syscall(unsigned syscall)
> > > >  		return 4;
> > > >  	case __NR_execve:
> > > >  		return 5;
> > > > +	case __NR_openat2:
> > > > +		return 6;
> > > >  	default:
> > > >  		return 1;
> > > >  	}
> > > > diff --git a/arch/sparc/kernel/audit.c b/arch/sparc/kernel/audit.c
> > > > index a6e91bf34d48..b6dcca9c6520 100644
> > > > --- a/arch/sparc/kernel/audit.c
> > > > +++ b/arch/sparc/kernel/audit.c
> > > > @@ -55,6 +55,8 @@ int audit_classify_syscall(int abi, unsigned int syscall)
> > > >  		return 4;
> > > >  	case __NR_execve:
> > > >  		return 5;
> > > > +	case __NR_openat2:
> > > > +		return 6;
> > > >  	default:
> > > >  		return 0;
> > > >  	}
> > > > diff --git a/arch/sparc/kernel/compat_audit.c b/arch/sparc/kernel/compat_audit.c
> > > > index 10eeb4f15b20..d2652a1083ad 100644
> > > > --- a/arch/sparc/kernel/compat_audit.c
> > > > +++ b/arch/sparc/kernel/compat_audit.c
> > > > @@ -39,6 +39,8 @@ int sparc32_classify_syscall(unsigned int syscall)
> > > >  		return 4;
> > > >  	case __NR_execve:
> > > >  		return 5;
> > > > +	case __NR_openat2:
> > > > +		return 6;
> > > >  	default:
> > > >  		return 1;
> > > >  	}
> > > > diff --git a/arch/x86/ia32/audit.c b/arch/x86/ia32/audit.c
> > > > index 6efe6cb3768a..57a02ade5503 100644
> > > > --- a/arch/x86/ia32/audit.c
> > > > +++ b/arch/x86/ia32/audit.c
> > > > @@ -39,6 +39,8 @@ int ia32_classify_syscall(unsigned syscall)
> > > >  	case __NR_execve:
> > > >  	case __NR_execveat:
> > > >  		return 5;
> > > > +	case __NR_openat2:
> > > > +		return 6;
> > > >  	default:
> > > >  		return 1;
> > > >  	}
> > > > diff --git a/arch/x86/kernel/audit_64.c b/arch/x86/kernel/audit_64.c
> > > > index 83d9cad4e68b..39de1e021258 100644
> > > > --- a/arch/x86/kernel/audit_64.c
> > > > +++ b/arch/x86/kernel/audit_64.c
> > > > @@ -53,6 +53,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
> > > >  	case __NR_execve:
> > > >  	case __NR_execveat:
> > > >  		return 5;
> > > > +	case __NR_openat2:
> > > > +		return 6;
> > > >  	default:
> > > >  		return 0;
> > > >  	}
> > > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > > index 8bb9ac84d2fb..f5616e70d129 100644
> > > > --- a/kernel/auditsc.c
> > > > +++ b/kernel/auditsc.c
> > > > @@ -76,6 +76,7 @@
> > > >  #include <linux/fsnotify_backend.h>
> > > >  #include <uapi/linux/limits.h>
> > > >  #include <uapi/linux/netfilter/nf_tables.h>
> > > > +#include <uapi/linux/openat2.h>
> > > >  
> > > >  #include "audit.h"
> > > >  
> > > > @@ -195,6 +196,8 @@ static int audit_match_perm(struct audit_context *ctx, int mask)
> > > >  		return ((mask & AUDIT_PERM_WRITE) && ctx->argv[0] == SYS_BIND);
> > > >  	case 5: /* execve */
> > > >  		return mask & AUDIT_PERM_EXEC;
> > > > +	case 6: /* openat2 */
> > > > +		return mask & ACC_MODE((u32)((struct open_how *)ctx->argv[2])->flags);
> > > 
> > > That looks a bit dodgy. Maybe sm like the below would be a bit better?
> > 
> > Ah, ok, fair enough, since original flags use a u32 and this was picked
> > as u64 for alignment.  It was just occurring to me last night that I
> > might have the dubious honour of being the first usage of 0%llo format
> > specifier in the kernel...  ;-)
> 
> > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > index 47fb48f42c93..531e882a5096 100644
> > > --- a/kernel/auditsc.c
> > > +++ b/kernel/auditsc.c
> > > @@ -159,6 +159,7 @@ static const struct audit_nfcfgop_tab audit_nfcfgs[] = {
> > > 
> > >  static int audit_match_perm(struct audit_context *ctx, int mask)
> > >  {
> > > +       struct open_how *openat2;
> > >         unsigned n;
> > >         if (unlikely(!ctx))
> > >                 return 0;
> > > @@ -195,6 +196,12 @@ static int audit_match_perm(struct audit_context *ctx, int mask)
> > >                 return ((mask & AUDIT_PERM_WRITE) && ctx->argv[0] == SYS_BIND);
> > >         case 5: /* execve */
> > >                 return mask & AUDIT_PERM_EXEC;
> > > +       case 6: /* openat2 */
> > > +               openat2 = ctx->argv[2];
> > > +               if (upper_32_bits(openat2->flags))
> > > +                       pr_warn("Some sensible warning about unknown flags");
> > > +
> > > +               return mask & ACC_MODE(lower_32_bits(openat2->flags));
> > >         default:
> > >                 return 0;
> > >         }
> > > 
> > > (Ideally we'd probably notice at build-time that we've got flags
> > > exceeding 32bits. Could probably easily been done by exposing an all
> > > flags macro somewhere and then we can place a BUILD_BUG_ON() or sm into
> > > such places.)
> 
> open_how arguments are translated to open_flags which is limited to 32 bits.
> 
> This code is shared with the other open functions that are limited to 32 bits
> in open_flags.  openat2 was created to avoid the limitations of openat, so at
> some point it isn't unreasonable that flags exceed 32 bits, but open_flags
> would have to be modified at that point to accommodate.
> 
> This value is handed in from userspace, and could be handed in without being
> defined in the kernel, so those values need to be properly checked regardless
> of the flags defined in the kernel.
> 
> The openat2 syscall claims to check all flags but no check is done on the top
> 32 bits.

Hm, I think this is an oversight because of the different semantics for
openat() and openat2(). We should check that no upper 32 bits are set
for openat2(). That's the intended semantics. For old openat()
we can't error on unknown flags because it has traditionally ignored
unknown flags.

> 
> build_open_flags() assigns how->flags to an int, effectively dropping the top
> 32 bits, before being checked against ~VALID_OPEN_FLAGS.  This happens after
> audit mode filtering, but has the same result.

Right. That's at bug we should return an error to userspace. We do for
any unkown values that fall within the lower 32 bit range so it's silly
to ignore unknown values in the upper 32 bit range.

> 
> Audit mode filtering using ACC_MODE() already masks out all but the lowest two
> bits with O_ACCMODE, so there is no danger of overflowing a u32.
> 
> tomoyo_check_open_permission() assigns ACC_MODE() to u8 without a check.
> 
> All FMODE_* flags are clamped at u32.
> 
> 6 bits remain at top and 4 bits just above O_ACCMODE, so there is no immediate
> danger of overflow and if any additional mode bits are needed they are
> available.
> 000377777703 used
> 037777777777 available
> 10 bits remaining
> 
> So, I don't think a check at this point in the code is useful, but do agree

Maybe but note that a defensive posture here might be a good thing
instead of tripping over the issue later.

> that there should be some changes and checks added in sys_openat2 and
> build_open_flags().
> 
> 
> Also noticed: It looks like fddb5d430ad9f left in VALID_UPGRADE_FLAGS for
> how->upgrade_mask that was removed.  This may be used at a later date, but at
> this point is dead code.

I'll take a look now.

Christian
