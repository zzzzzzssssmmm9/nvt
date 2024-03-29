###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1335.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 1335-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.891335");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2018-1071", "CVE-2018-1083");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1335-1] zsh security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-04-02 00:00:00 +0200 (Mon, 02 Apr 2018)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/03/msg00038.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"zsh on Debian Linux");
  script_tag(name:"insight", value:"Zsh is a UNIX command interpreter (shell) usable as an
interactive login shell and as a shell script command
processor. Of the standard shells, zsh most closely resembles
ksh but includes many enhancements. Zsh has command-line editing,
built-in spelling correction, programmable command completion,
shell functions (with autoloading), a history mechanism, and a
host of other features.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
4.3.17-1+deb7u2.

We recommend that you upgrade your zsh packages.");
  script_tag(name:"summary",  value:"Two security vulnerabilities were discovered in the Z shell.

CVE-2018-1071
Stack-based buffer overflow in the exec.c:hashcmd() function.
A local attacker could exploit this to cause a denial of service.

CVE-2018-1083
Buffer overflow in the shell autocomplete functionality. A local
unprivileged user can create a specially crafted directory path which
leads to code execution in the context of the user who tries to use
autocomplete to traverse the before mentioned path. If the user
affected is privileged, this leads to privilege escalation.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"zsh", ver:"4.3.17-1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zsh-dbg", ver:"4.3.17-1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zsh-dev", ver:"4.3.17-1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zsh-doc", ver:"4.3.17-1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zsh-static", ver:"4.3.17-1+deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
