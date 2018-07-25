###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4009.nasl 7819 2017-11-20 05:26:56Z teissa $
#
# Auto-generated from advisory DSA 4009-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.704009");
  script_version("$Revision: 7819 $");
  script_cve_id("CVE-2017-15924");
  script_name("Debian Security Advisory DSA 4009-1 (shadowsocks-libev - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-11-20 06:26:56 +0100 (Mon, 20 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-10-29 00:00:00 +0200 (Sun, 29 Oct 2017)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4009.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"shadowsocks-libev on Debian Linux");
  script_tag(name:"insight", value:"Shadowsocks-libev is a lightweight and secure socks5 proxy for
embedded devices and low end boxes.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 2.6.3+ds-3+deb9u1.

We recommend that you upgrade your shadowsocks-libev packages.");
  script_tag(name:"summary",  value:"Niklas Abel discovered that insufficient input sanitising in the
ss-manager component of shadowsocks-libev, a lightweight socks5 proxy,
could result in arbitrary shell command execution.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libshadowsocks-libev-dev", ver:"2.6.3+ds-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libshadowsocks-libev2", ver:"2.6.3+ds-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"shadowsocks-libev", ver:"2.6.3+ds-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
