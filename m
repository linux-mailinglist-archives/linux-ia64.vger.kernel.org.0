Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47895700F0F
	for <lists+linux-ia64@lfdr.de>; Fri, 12 May 2023 20:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239167AbjELSu0 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Fri, 12 May 2023 14:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239176AbjELSuX (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>); Fri, 12 May 2023 14:50:23 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2101.outbound.protection.outlook.com [40.107.94.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D189D5B90
        for <linux-ia64@vger.kernel.org>; Fri, 12 May 2023 11:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/v8H8K+fsJMM8MgrsoqsYwdze58ThovIgXMRT+FlGqp6gX14mcAGxNki+rrY5YbRe4q6p2s3kSNHx4zT7S1uH1ArW26gyH0GoQNKLTPB479etUKNPFO+z7wi+D0HYzwRWgbx2eH68howMs6Go2talvJONQ0KUPzpkxvIYzbpcaNIYpgJzWBMj2KpqDO5pqmS2tjbG/TI+nhvdKiXgNoOHN9FdDnZ0VyBIY98/64z0jx3Q9VLYyVE8qTzZfWZ8ytJfYIW1mB2Z6o2wMzvYmxgpDABSlLZClZpkQw6zoltPS8DiZFfg5Io7Zsckzx7BKqrkFGuiujiZy26Sg6ChqlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+Emavccg3uE5Sj5Z2zczf9K+/xFFXaUQNX6gE4NRls=;
 b=nbuqESGHarTi2+tv3jmEVgeropKmbLTqOreGvofSzj6oGEsA9h8hXzEZBU0kDBOWFaKSYzfHXVtvrBK1sLDxmfxwagx3RMNmHe8OJoikrynRN2ekPcLfENEyREnGDimETOQhnpcS5BKSIMI6C14G92H46iiIGiGH4ji6sQYFmPZ9Ll3lt7rEfYQIhovwi/UxJ3slzSWJY9z5CT90OHGJISy3PiJdZN1+MmS6ihV4Eon9lsTgd9J7idVzKxnT/N4LF6hYfEKyOoAQAChvGCzU9km664tsS/xVU7Mue1ZvoJYavI6wehYMoeuyKAC65exXxzOFsoQfsqoDel3ZTD+IfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cypress-tech.com; dmarc=pass action=none
 header.from=cypress-tech.com; dkim=pass header.d=cypress-tech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5074309.onmicrosoft.com; s=selector2-NETORG5074309-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+Emavccg3uE5Sj5Z2zczf9K+/xFFXaUQNX6gE4NRls=;
 b=LgVTNDtn2UHFnKGGOEc1pGpOFQSABZ58gSSmoKI5hi5pzNT9D9ZsxehWe3SWAEqUWFjlnqKxFAFl8Cg/agd4HlRme0JnbuIG5doz8YYWmjg52ML6O2Rz8/r/UtHX4edFGGjRKZyGWxZn5x5+vw2sM+9LRieHoTQEHu7ipstKN20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Cypress-Tech.com;
Received: from MW4PR17MB5642.namprd17.prod.outlook.com (2603:10b6:303:12d::13)
 by SJ0PR17MB4285.namprd17.prod.outlook.com (2603:10b6:a03:2a1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Fri, 12 May
 2023 18:50:10 +0000
Received: from MW4PR17MB5642.namprd17.prod.outlook.com
 ([fe80::1c4b:293b:c2b4:9bc7]) by MW4PR17MB5642.namprd17.prod.outlook.com
 ([fe80::1c4b:293b:c2b4:9bc7%6]) with mapi id 15.20.6387.022; Fri, 12 May 2023
 18:50:10 +0000
Message-ID: <8fea5127-c985-8057-2654-9001cb6256c0@Cypress-Tech.com>
Date:   Fri, 12 May 2023 14:50:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [crosspost] dropping support for ia64
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>,
        distributions@lists.freedesktop.org, debian-ia64@lists.debian.org,
        linux-ia64@vger.kernel.org, Florian Weimer <fw@deneb.enyo.de>,
        port-ia64@netbsd.org, Tony Luck <tony.luck@intel.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        matoro <matoro_mailinglist_kernel@matoro.tk>,
        Mike Rapoport <rppt@kernel.org>,
        Daniel Kiper <dkiper@net-space.pl>,
        Steve McIntyre <steve@einval.com>
References: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
From:   Jesse Dougherty <Jesse@Cypress-Tech.com>
In-Reply-To: <CAMj1kXFCMh_578jniKpUtx_j8ByHnt=s7S+yQ+vGbKt9ud7+kQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:408:e8::30) To MW4PR17MB5642.namprd17.prod.outlook.com
 (2603:10b6:303:12d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR17MB5642:EE_|SJ0PR17MB4285:EE_
X-MS-Office365-Filtering-Correlation-Id: 911398ce-0c4b-45ca-fef5-08db5319b61b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LFhkJRGIgOc43QCZn3eelHwECL8+QUBSP2Yb6TlGQsu/eGiCWFe4XmtfNfC2zDPYYbEE+xwy/ZlLvEjcB1y8hH+msnQAIrplnldjsF822lGRMV8mFf/Lvb4KNLeCe8HHsWmVc1VcrZy9mj4TdoVAi+oRCK3D7h/RCMgqmftg5xbfIG/BjOtbRxyusziAoK0Him6TBxuR0BsUYtCoUnXzADbQfj6oLrF0MCQdV66EvJeHwM7Tsbob4IKAAqPagykpMuM2agut/oBMo9XsG3PdHzEnqlDcWxa7jYDS577JEN5g14pQAxKG1qGS4ydsgjbCEuRyXt4W830TjyKEKpZSCRS5d6/eSyCLO1jEmVvL/gK+wq2vTAMxgXHKxVttF9oIljyEHAvFqYYFIFVxTz2enFZM6DNOjVtnVhHUtfvKWwGeT26ykMZiYJIAoCpvgt197hmyOFGgH1NWBjiWCo2Y1JPQgE3AzWSztrxmQMd7Be9ZcAcyNBXyW6UCaKg/Xa2ueD+d0MipCAND8lh7LaZiBHnFyw5Ad/jjfoCIwZMc9c5FFbtOFa/dvJVD+t+DAEDNoFnAV4hf/z//H6jiGsJVgP2XlmuLM5zt7Eji5Q2I7/9BwUXReJuzTpSSEE8TYpbroLW0YqOgAEDhl9lUjdl4Xhk0uS8Gy3QxI++h8FPNEUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR17MB5642.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39830400003)(366004)(376002)(136003)(396003)(346002)(451199021)(6512007)(6506007)(7416002)(8936002)(8676002)(2616005)(53546011)(41300700001)(31696002)(6666004)(6486002)(110136005)(478600001)(66899021)(316002)(66556008)(86362001)(186003)(66476007)(5660300002)(36756003)(66946007)(2906002)(83380400001)(921005)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1dRWTc1aXBWWFJKUjVWeVFOMmZ4SGdBR1QrV1YzK2F0UVlkWmpHbU5tTVNX?=
 =?utf-8?B?eGE3cmgwQzNUTXRRVjV2eTRETFh6Rnc0bll4SnBHejZmUitWTzUxaDZXZWtK?=
 =?utf-8?B?WSswalhBZ1JWbVI2T0V2ZGVwQjZxY2ZqYzltOXoyaEhWK0hPSEZQbjhaaWlJ?=
 =?utf-8?B?T1hNcEFlL0RWcXJhK0UvSi9POXdicjlJYlAwdGY2emVzV1hlVGRzUmRXblVi?=
 =?utf-8?B?Y1NiKzRzQU5MTkJHQW8wR0RJVXRsWGFpTkFwN2FyWlp1OEVDMjJNQXEzSUlL?=
 =?utf-8?B?WWZDMUJuOXhqUEVLc0NPMHJmRVJMKzd4MlorNHBqY1E3SjFmbE9USmhlc3p6?=
 =?utf-8?B?Yk1zNUxKdVNnSVl2WmpsZUFSRXlpNUZaNkduMStCaWFBUTdBVlcrdmVDY0pW?=
 =?utf-8?B?c0tBMThKUVNJUDVtaGlrVnNVNTdBZWhjRktSS005WXlVbTVHeVVZRW1TUmtQ?=
 =?utf-8?B?VUMzVWhpWnRhUlNoVVVhSmlEbFFGelFUYTdpNDRsT0N3VGRKTUtEK1A1NjRq?=
 =?utf-8?B?MWhkKzlvZlcwS2dtaTZVdUNhTUVZR0JkbTBaRnRsVHhOTjYvUHJhUkEwUitO?=
 =?utf-8?B?UktyS0NBNGNocFp4TzUvRmZML0hOekkvRFc2MkVaczhWMzN3cHZlbTVZUXFm?=
 =?utf-8?B?ejkyNytvbmxYcjVlTTUxcGZoUjN5cmJDTEIwMU9uUjlVTmpIVzFtTlFnWGpk?=
 =?utf-8?B?Mytneng5S0k0bngzc0dEWUtUcm8yQ1ZqbFJyU2o2dUZxQXJzWGR2bXNQNXVM?=
 =?utf-8?B?N3hJQUhYaks1aFVaR1FDU04xd3J6VGk5RVcvQTg3N2FKR0xhVll3ODErYXV2?=
 =?utf-8?B?dU5MNHVuK2QwZDNUa3lpYkoxa05UbmNWZVFjTDRsVlJXYUlDdElkRm5hMWlB?=
 =?utf-8?B?UVNlbXlmM3dDSS95M1JjamtEc3Fwd2ltTVZhN2tmQlg0YlQwSnZwdG5KSmJI?=
 =?utf-8?B?UStnRytHS3ZtWXQrNEVPZksrNVhoL0I2MTNlMSs5QSs3eGJjUzVBWG1CMDgw?=
 =?utf-8?B?NlNDdktsVWZ4YVJpK2JPS3pTZ0VNZ3VKYzUwUjU3c01FelB1ckVUd2d3QmZi?=
 =?utf-8?B?TkM1UzN1bjhkTGpyQmZMS3R1MVdydk01VFBNM2FuczYwRnJ1MFBFc0pOdjRU?=
 =?utf-8?B?aTZHY2FoZmdqeXZyQXVZT0daVU4yZUE3Tk9hNWlTVlAvMjZDK2Jzb0VONC9r?=
 =?utf-8?B?OVdacldUd0l6Skx2dXo4ejczc1E1d0FDbXdOMi9TbkxaR1ZzdGQyYXZtUXoz?=
 =?utf-8?B?Z0lDYkFUMzd6akJuYUw1anc3ODhxcHNRKytYWDVtMmY3UTdPZkZNcWdBWGN5?=
 =?utf-8?B?MUZwaUVMK0hjTnUyVXgxNVpsQnBueDZVN3g2V3ZMbG8yTElPYlE2bnlCVEh0?=
 =?utf-8?B?WU9ZWjhxcUVmelE3MENZNVVML3ZKNXpYbk5JeDlxTUYraXgvZENZcmRkZTlG?=
 =?utf-8?B?Y3BQbWFKR0lneU5QVERjZjJEOHZ6cnN5dWR6TzhKTk53U2RXWnpNelFYNDlh?=
 =?utf-8?B?NitHaUVKVmltWklpQjU0Y2w2TEQzK2Uybzk3WU9leVdTTHhPNzh4dVA5aHJ5?=
 =?utf-8?B?SC9VSnhNMkd6d3M1M09UaWNTeEdpSmErTkh1QUVyUnZvWlpSY05VK3gwaG1L?=
 =?utf-8?B?S1BkV2wxazBIVEd6V0d4c0M4dGZ6anFQQmNvSnI4ZEdHNlR3UGxXKy8wVUJQ?=
 =?utf-8?B?S3BCU1hlQVNneUY0c2QwUCtaNVNPU3VpSHNNK3k2bUFLSkNpSlVtSmNoMlgz?=
 =?utf-8?B?Y0UyTklMalVQRnU5K0VKcm9wMjRQSktIcWRVMldoOEhXTHhZQ2tDRitHMzdv?=
 =?utf-8?B?RVhrUFhQUHMvaFpnOFBXdk5qdms2MEg3OCtCc3MwZnZxT25VcStpcHpMQlZ6?=
 =?utf-8?B?WGpYNXNFTUNXN0V0YWgwTHNmbEpoaUlUdUVvR0lMdjVET3lmUHJ0QUtwam1l?=
 =?utf-8?B?ajQvaVVRRGx3bGdpeE8vTXFtRU5YV2Y4RWZKTnNJNmdHUklMemY4Q0M3alpw?=
 =?utf-8?B?cDFXcmNDbGZ4b2RBeU8rSXN3SXh3REd2ZWVaaXFHbzIrQ3ozUlZya0w4MGwy?=
 =?utf-8?B?RXpCY1JXcERuYUlYMHVsZkFTZUpMNm5SR1VsSHZ1bCtYd2M4ZGc2WnhXSXNQ?=
 =?utf-8?B?Q0x6OTR6bWtkQmFwcml1VFE0QllCbGpEL2kzbFR3RHE3NDhZUmErckM5K3NL?=
 =?utf-8?Q?iDhrdz3Pb28P9jIqW3lvXICoW3vAmhwm7f7dO3oU7Ri1?=
X-OriginatorOrg: cypress-tech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 911398ce-0c4b-45ca-fef5-08db5319b61b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR17MB5642.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 18:50:10.0022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: daf09015-3d9a-4dbb-b0c5-310700bdf5cb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtoWfgqG7SNsBiIn70aqYmtSNR+PC7bxTKVjQD8TRtMJLTDkYPGGjtaKuDgrVNgID0qQH3klilYF1HB3wzaXFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB4285
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org

I'm a little bias because my company is a re-sellers of the HP Itanium 
ia64 hardware (RX & ZX boxes), as well as PA-RISC. For that reason, I 
would hate to see it fade away in any sector. The ia64 platform is still 
widely used with HP-UX Unix and Open VMS users worldwide. This hardware 
is embedded in most every data center and large and medium companies 
that have been around since the 80s/90s, its probably the oldest box 
they have in there but its the one thats in the corner running for 20 
years, long before most people started working there. PA-RICS is also 
massively intertwined into the US military as well as foreign 
military's, they did that in the early 2000's and they are stuck with it..

I could go on but me as a hardware guy, I'm on team ia64 :-)

Thanks
Jesse Dougherty
Cypress Technology Inc



On 5/12/23 11:57, Ard Biesheuvel wrote:
> (cross posted to several ia64 related mailing list)
>
> Hello all,
>
> As the maintainer of the EFI subsystem in Linux, I am one of the
> people that have to deal with the impact that code refactoring for
> current platforms has on legacy use of such code, in this particular
> case, the use of shared EFI code in the Itanium Linux port.
>
> I am sending this message to gauge the remaining interest in ia64
> support across the OS/distro landscape, and whether people feel that
> the effort required to keep it alive is worth it or not.
>
> As a maintainer, I feel uncomfortable asking contributors to build
> test their changes for Itanium, and boot testing is infeasible for
> most, even if some people are volunteering access to infrastructure
> for this purpose. In general, hacking on kernels or bootloaders (which
> is where the EFI pieces live) is tricky using remote access.
>
> The bottom line is that, while I know of at least 2 people (on cc)
> that test stuff on itanium, and package software for it, I don't think
> there are any actual users remaining, and so it is doubtful whether it
> is justified to ask people to spend time and effort on this.
>
> And for GRUB in particular (which is what triggered this message), it
> is unclear to me why any machines still running would not be better
> served by sticking with their current bootloader build, rather than
> upgrading to a new build with a refactored EFI layer where the best
> case scenario is that it boots the kernel in exactly the same way,
> while there is a substantial risk of regressions.
>
> For the Linux kernel itself, the situation is quite similar. There is
> a non-zero effort involved in keeping things working, and if anyone
> still needs to run their programs on Itanium, it is not clear to me
> why that would require a recent version of the OS.
>
> So bottom line: I am proposing we drop support for Itanium across the
> board. Would anyone have any problems with that?
>
> Kind regards,
> Ard.
