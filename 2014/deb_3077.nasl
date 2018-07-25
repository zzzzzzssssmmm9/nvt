# OpenVAS Vulnerability Test
# $Id: deb_3077.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 3077-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703077");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2014-6457", "CVE-2014-6502", "CVE-2014-6504", "CVE-2014-6506", "CVE-2014-6511", "CVE-2014-6512", "CVE-2014-6517", "CVE-2014-6519", "CVE-2014-6531", "CVE-2014-6558");
    script_name("Debian Security Advisory DSA 3077-1 (openjdk-6 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2014-11-26 00:00:00 +0100 (Wed, 26 Nov 2014)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3077.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "openjdk-6 on Debian Linux");
        script_tag(name: "insight",   value: "OpenJDK is a development environment for building applications,
applets, and components using the Java programming language.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy), these problems have been fixed in
version 6b33-1.13.5-2~deb7u1.

We recommend that you upgrade your openjdk-6 packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities have been discovered in OpenJDK, an
implementation of the Oracle Java platform, resulting in the execution
of arbitrary code, information disclosure or denial of service.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedtea-6-jre-jamvm", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-dbg", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-demo", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-doc", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jdk", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-source", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedtea-6-jre-jamvm", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-dbg", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-demo", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-doc", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jdk", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-source", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedtea-6-jre-jamvm", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-dbg", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-demo", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-doc", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jdk", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-source", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedtea-6-jre-jamvm", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-dbg", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-demo", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-doc", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jdk", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-6-source", ver:"6b33-1.13.5-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}