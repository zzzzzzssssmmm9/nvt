# OpenVAS Vulnerability Test
# $Id: deb_3536.nasl 8154 2017-12-18 07:30:14Z teissa $
# Auto-generated from advisory DSA 3536-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703536");
    script_version("$Revision: 8154 $");
    script_cve_id("CVE-2015-0899");
    script_name("Debian Security Advisory DSA 3536-1 (libstruts1.2-java - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-18 08:30:14 +0100 (Mon, 18 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-03-31 00:00:00 +0200 (Thu, 31 Mar 2016)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3536.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "libstruts1.2-java on Debian Linux");
    script_tag(name: "insight",   value: "The core of the Struts framework is
a flexible control layer based on standard technologies like Servlets, JavaBeans,
ResourceBundles, and Extensible Markup Language (XML), as well as various Apache
Commons packages. Struts encourages application architectures based on the Model
2 approach, a variation of the classic Model-View-Controller (MVC) design
paradigm.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
this problem has been fixed in version 1.2.9-5+deb7u2.

We recommend that you upgrade your libstruts1.2-java packages.");
    script_tag(name: "summary",   value: "It was discovered that libstruts1.2-java,
a Java framework for MVC applications, contains a bug in its multi-page validation
code. This allows input validation to be bypassed, even if MPV is not used
directly.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libstruts1.2-java", ver:"1.2.9-5+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
