###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4042.nasl 7839 2017-11-21 06:06:39Z teissa $
#
# Auto-generated from advisory DSA 4042-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704042");
  script_version("$Revision: 7839 $");
  script_cve_id("CVE-2017-10672");
  script_name("Debian Security Advisory DSA 4042-1 (libxml-libxml-perl - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-11-21 07:06:39 +0100 (Tue, 21 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-11-19 00:00:00 +0100 (Sun, 19 Nov 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4042.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"libxml-libxml-perl on Debian Linux");
  script_tag(name:"insight", value:"XML::LibXML is a Perl interface to the GNOME libxml2 library, which provides
interfaces for parsing and manipulating XML files. This module allows Perl
programmers to make use of the highly capable validating XML parser and the
high performance Document Object Model (DOM) implementation. Additionally, it
supports using the XML Path Language (XPath) to find and extract information.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 2.0116+dfsg-1+deb8u2.

For the stable distribution (stretch), this problem has been fixed in
version 2.0128+dfsg-1+deb9u1.

We recommend that you upgrade your libxml-libxml-perl packages.

For the detailed security status of libxml-libxml-perl please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/libxml-libxml-perl");
  script_tag(name:"summary",  value:"A use-after-free vulnerability was discovered in XML::LibXML, a Perl
interface to the libxml2 library, allowing an attacker to execute
arbitrary code by controlling the arguments to a replaceChild() call.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libxml-libxml-perl", ver:"2.0128+dfsg-1+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-libxml-perl", ver:"2.0116+dfsg-1+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
