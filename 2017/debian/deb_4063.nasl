###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4063.nasl 8104 2017-12-13 13:05:33Z teissa $
#
# Auto-generated from advisory DSA 4063-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704063");
  script_version("$Revision: 8104 $");
  script_cve_id("CVE-2017-15120");
  script_name("Debian Security Advisory DSA 4063-1 (pdns-recursor - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-12-13 14:05:33 +0100 (Wed, 13 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-12-11 00:00:00 +0100 (Mon, 11 Dec 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4063.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"pdns-recursor on Debian Linux");
  script_tag(name:"insight", value:"High-performance resolving name server, utilizing multiple
processor and including Lua scripting capabilities.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 4.0.4-1+deb9u3.

We recommend that you upgrade your pdns-recursor packages.

For the detailed security status of pdns-recursor please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/pdns-recursor");
  script_tag(name:"summary",  value:"Toshifumi Sakaguchi discovered that PowerDNS Recursor, a high-performance
resolving name server was susceptible to denial of service via a crafted
CNAME answer.

The oldstable distribution (jessie) is not affected.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"pdns-recursor", ver:"4.0.4-1+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
