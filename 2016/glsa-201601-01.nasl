# OpenVAS Vulnerability Test
# Description: Gentoo Linux security check
# $Id: glsa-201601-01.nasl 8029 2017-12-07 12:38:42Z teissa $

# Authors:
# Eero Volotinen <eero.volotinen@solinor.com>
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
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
script_oid("1.3.6.1.4.1.25623.1.0.121436");
script_version("$Revision: 8029 $");
script_tag(name:"creation_date", value:"2016-01-18 07:58:41 +0200 (Mon, 18 Jan 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-12-07 13:38:42 +0100 (Thu, 07 Dec 2017) $");
script_name("Gentoo Linux Local Check: https://security.gentoo.org/glsa/201601-01");
script_tag(name: "insight", value: "Qualys have reported two issues in the roaming code included in the OpenSSH client, which provides undocumented, experimental support for resuming SSH connections. An OpenSSH client could be tricked into leaking parts of its memory to a malicious server. Furthermore, a buffer overflow can be exploited by a malicious server, but its exploitation requires non-default options and is mitigated due to another bug."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://security.gentoo.org/glsa/201601-01");
script_cve_id("CVE-2016-0777","CVE-2016-0778");
script_tag(name:"cvss_base", value:"4.6");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:S/C:P/I:P/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
script_category(ACT_GATHER_INFO);
script_tag(name: "summary" , value: "Gentoo Linux Local Security Checks https://security.gentoo.org/glsa/201601-01");
script_copyright("Eero Volotinen");
script_family("Gentoo Local Security Checks");
exit(0);
}
include("revisions-lib.inc");

include("pkg-lib-gentoo.inc");

res = "";
report = "";

if((res=ispkgvuln(pkg:"net-misc/openssh", unaffected: make_list("ge 7.1_p2"), vulnerable: make_list("lt 7.1_p2"))) != NULL) {

  report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}