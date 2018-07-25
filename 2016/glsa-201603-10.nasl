# OpenVAS Vulnerability Test
# Description: Gentoo Linux security check
# $Id: glsa-201603-10.nasl 8032 2017-12-07 14:40:57Z teissa $

# Authors:
# Eero Volotinen <eero.volotinen@solinor.fi>
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
#
# OpenVAS and security consultance available from openvas@solinor.com
# see https://solinor.fi/openvas-en/ for more information
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.121452");
script_version("$Revision: 8032 $");
script_tag(name:"creation_date", value:"2016-03-14 15:52:46 +0200 (Mon, 14 Mar 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-12-07 15:40:57 +0100 (Thu, 07 Dec 2017) $");
script_name("Gentoo Linux Local Check: https://security.gentoo.org/glsa/201603-10");
script_tag(name: "insight", value: "Multiple buffer overflow vulnerabilities have been discovered in QtGui. It is possible for remote attackers to construct specially crafted BMP, ICO, or GIF images that lead to buffer overflows. After successfully overflowing the buffer the remote attacker can then cause a Denial of Service or execute arbitrary code."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://security.gentoo.org/glsa/201603-10");
script_cve_id("CVE-2015-1858","CVE-2015-1859","CVE-2015-1860");
script_tag(name:"cvss_base", value:"6.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
script_category(ACT_GATHER_INFO);
script_tag(name: "summary" , value: "Gentoo Linux Local Security Checks https://security.gentoo.org/glsa/201603-10");
script_copyright("Eero Volotinen");
script_family("Gentoo Local Security Checks");
exit(0);
}
include("revisions-lib.inc");

include("pkg-lib-gentoo.inc");

res = "";
report = "";

if((res=ispkgvuln(pkg:"dev-qt/qtgui", unaffected: make_list("ge 5.4.1-r1"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-qt/qtgui", unaffected: make_list("ge 4.8.6-r4"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-qt/qtgui", unaffected: make_list("ge 4.8.7"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-qt/qtgui", unaffected: make_list(), vulnerable: make_list("lt 5.4.1-r1"))) != NULL) {

  report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
