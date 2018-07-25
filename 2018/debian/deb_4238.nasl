###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4238.nasl 10405 2018-07-05 05:51:36Z cfischer $
#
# Auto-generated from advisory DSA 4238-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704238");
  script_version("$Revision: 10405 $");
  script_cve_id("CVE-2018-10958", "CVE-2018-10998", "CVE-2018-10999", "CVE-2018-11531", "CVE-2018-12264",
                "CVE-2018-12265");
  script_name("Debian Security Advisory DSA 4238-1 (exiv2 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-05 07:51:36 +0200 (Thu, 05 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-03 00:00:00 +0200 (Tue, 03 Jul 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4238.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"exiv2 on Debian Linux");
  script_tag(name:"insight", value:"Exiv2 is a C++ library and a command line utility to manage image metadata.
It provides fast and easy read and write access to the Exif, IPTC and XMP
metadata of images in various formats");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 0.25-3.1+deb9u1.

We recommend that you upgrade your exiv2 packages.

For the detailed security status of exiv2 please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/exiv2");
  script_tag(name:"summary",  value:"Several vulnerabilities have been discovered in Exiv2, a C++ library and
a command line utility to manage image metadata which could result in
denial of service or the execution of arbitrary code if a malformed file
is parsed.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"exiv2", ver:"0.25-3.1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libexiv2-14", ver:"0.25-3.1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libexiv2-dbg", ver:"0.25-3.1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libexiv2-dev", ver:"0.25-3.1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libexiv2-doc", ver:"0.25-3.1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}