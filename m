Return-Path: <linux-ia64-owner@vger.kernel.org>
X-Original-To: lists+linux-ia64@lfdr.de
Delivered-To: lists+linux-ia64@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB2D268108
	for <lists+linux-ia64@lfdr.de>; Sun, 13 Sep 2020 21:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgIMTv0 (ORCPT <rfc822;lists+linux-ia64@lfdr.de>);
        Sun, 13 Sep 2020 15:51:26 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:36396 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725938AbgIMTvZ (ORCPT
        <rfc822;linux-ia64@vger.kernel.org>);
        Sun, 13 Sep 2020 15:51:25 -0400
Received: from [192.168.4.242] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1kHY1z-00027n-Jp; Sun, 13 Sep 2020 20:51:23 +0100
Received: from ben by deadeye with local (Exim 4.94)
        (envelope-from <ben@decadent.org.uk>)
        id 1kHY1z-000CRa-5y; Sun, 13 Sep 2020 20:51:23 +0100
Message-ID: <f0a93b2d435252b3878ce821142677754f5e434c.camel@decadent.org.uk>
Subject: vmlinux link failure on ia64 with zstd
From:   Ben Hutchings <ben@decadent.org.uk>
To:     linux-ia64@vger.kernel.org, Nick Terrell <terrelln@fb.com>
Date:   Sun, 13 Sep 2020 20:51:13 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-R1VkkNmnIse0QTyxO5M/"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.168.4.242
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-ia64-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ia64.vger.kernel.org>
X-Mailing-List: linux-ia64@vger.kernel.org


--=-R1VkkNmnIse0QTyxO5M/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Enabling CONFIG_RD_ZSTD (which is enabled by default) resulted in a
link failure on ia64:

+ ld -r -o vmlinux.o --whole-archive arch/ia64/kernel/head.o init/built-in.=
a usr/built-in.a arch/ia64/kernel/built-in.a arch/ia64/mm/built-in.a kernel=
/built-in.a certs/built-in.a mm/built-in.a fs/built-in.a ipc/built-in.a sec=
urity/built-in.a crypto/built-in.a block/built-in.a lib/built-in.a arch/ia6=
4/lib/built-in.a lib/lib.a arch/ia64/lib/lib.a drivers/built-in.a sound/bui=
lt-in.a net/built-in.a virt/built-in.a arch/ia64/pci/built-in.a arch/ia64/h=
p/common/built-in.a --no-whole-archive --start-group --end-group
ld: lib/zstd/entropy_common.o: linking constant-gp files with non-constant-=
gp files
ld: failed to merge target specific data of file lib/zstd/entropy_common.o
ld: lib/zstd/fse_decompress.o: linking constant-gp files with non-constant-=
gp files
ld: failed to merge target specific data of file lib/zstd/fse_decompress.o
ld: lib/zstd/zstd_common.o: linking constant-gp files with non-constant-gp =
files
ld: failed to merge target specific data of file lib/zstd/zstd_common.o

This is seen on Debian unstable, with gcc 10.2 and binutils 2.35.  A
full build log is available at:
https://buildd.debian.org/status/fetch.php?pkg=3Dlinux&arch=3Dia64&ver=3D5.=
9~rc4-1~exp1&stamp=3D1599955166&raw=3D1

Ben.

--=20
Ben Hutchings
Humour is the best antidote to reality.


--=-R1VkkNmnIse0QTyxO5M/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl9eeDIACgkQ57/I7JWG
EQkYAA/9GO3g4U7D4jY2QZKplQclmeu2SQWQpa//cNho69C3NLLq0XFCtTzFxIhJ
4PQIo7CThVghLOOUuEahDTwQe6xrI9JQOr0rcHs3qKbJGSa0InP+0psi7M5O6faZ
9qn04cHN1cLThmIBenh4m/E/5oFArCTSy8e8hCU+2wy7rLKcTbd3JeUghbQ4hXBn
KKqGk4wRWI4kNtcxNKLxVVSrqLd9NVcUze/9wPdXkXnzIZV3+Adv5Q8LodnOBhkf
q2GTzzFVgvam24hdBxBg3WnkGUTESphw4LUlXJGyFIl8WDBEP/muTE/3snA/HrMQ
YFMEuXS/uKJVTmqKSarjumlI6ObR+kXB7TKG74a4fpU3p9vHwYyWK1lPLguESlmf
Bfe2KT1PU7FepwlEDXCqIwBxDqDTDWKdyqEB0XuT+Uu79JfBV+i3c5fKf9FwzzlJ
pf0x4idFnDzDm+UsMtxLx7O4ZFziO7KQadZ8KnZrq0l3qdRdsydZpvWCyoYy9qDz
E8VTzuQAqmOO7Oo6IwuSBzxaNK2qTtzSAGC81I0sZQvZcNQCq8N91T51VVQQzps0
Bbjk73dXsOeEQC9uRxDnJqaCeGQeISVxeVMb5UfIMjqXNwRLjdbg176hESBzlhfw
YxTTPeULfEwWz/kbh4DS42ZNoZuou+S751rs0/WmPbDPy4qjHZk=
=BRRp
-----END PGP SIGNATURE-----

--=-R1VkkNmnIse0QTyxO5M/--
