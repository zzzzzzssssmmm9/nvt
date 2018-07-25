# OpenVAS Vulnerability Test
# $Id: deb_3619.nasl 8154 2017-12-18 07:30:14Z teissa $
# Auto-generated from advisory DSA 3619-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#


if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.703619");
    script_version("$Revision: 8154 $");
    script_cve_id("CVE-2016-5116", "CVE-2016-5766", "CVE-2016-6128", "CVE-2016-6132",
                  "CVE-2016-6161", "CVE-2016-6214");
    script_name("Debian Security Advisory DSA 3619-1 (libgd2 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-18 08:30:14 +0100 (Mon, 18 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-07-15 00:00:00 +0200 (Fri, 15 Jul 2016)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3619.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "libgd2 on Debian Linux");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
these problems have been fixed in version 2.1.0-5+deb8u4.

For the unstable distribution (sid), these problems have been fixed in
version 2.2.2-29-g3c2b605-1 or earlier.

We recommend that you upgrade your libgd2 packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were discovered
in libgd2, a library for programmatic graphics creation and manipulation. A remote
attacker can take advantage of these flaws to cause a denial-of-service against an
application using the libgd2 library (application crash), or potentially
to execute arbitrary code with the privileges of the user running the
application.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libgd-dbg:amd64", ver:"2.1.0-5+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgd-dbg:i386", ver:"2.1.0-5+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgd-dev:amd64", ver:"2.1.0-5+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgd-dev:i386", ver:"2.1.0-5+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if ((res = isdpkgvuln(pkg:"libgd-tools", ver:"2.1.0-5+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgd2-noxpm-dev", ver:"2.1.0-5+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgd2-xpm-dev", ver:"2.1.0-5+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgd3:amd64", ver:"2.1.0-5+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgd3:i386", ver:"2.1.0-5+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
