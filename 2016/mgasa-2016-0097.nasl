# OpenVAS Vulnerability Test 
# Description: Mageia Linux security check 
# $Id: mgasa-2016-0097.nasl 6562 2017-07-06 12:22:42Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://www.solinor.com
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
script_oid("1.3.6.1.4.1.25623.1.0.131263");
script_version("$Revision: 6562 $");
script_tag(name:"creation_date", value:"2016-03-10 07:17:47 +0200 (Thu, 10 Mar 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 14:22:42 +0200 (Thu, 06 Jul 2017) $");
script_name("Mageia Linux Local Check: mgasa-2016-0097");
script_tag(name: "insight", value: "Updated graphite2 packages fix security vulnerabilities: Multiple security flaws were found in the graphite2 font library. A web page or document containing malicious content could cause an application using graphite2 to crash or, potentially, execute arbitrary code with the privileges of the user running the application (CVE-2016-1977, CVE-2016-2790, CVE-2016-2791, CVE-2016-2792, CVE-2016-2793, CVE-2016-2794, CVE-2016-2795, CVE-2016-2796, CVE-2016-2797, CVE-2016-2798, CVE-2016-2799, CVE-2016-2800, CVE-2016-2801, CVE-2016-2802). The graphite2 package has been updated to version 1.3.6 which fixes these security issues."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://advisories.mageia.org/MGASA-2016-0097.html");
script_cve_id("CVE-2016-1977","CVE-2016-2790","CVE-2016-2791","CVE-2016-2792","CVE-2016-2793","CVE-2016-2794","CVE-2016-2795","CVE-2016-2796","CVE-2016-2797","CVE-2016-2798","CVE-2016-2799","CVE-2016-2800","CVE-2016-2801","CVE-2016-2802");
script_tag(name:"cvss_base", value:"9.3");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/mageia_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name : "summary", value : "Mageia Linux Local Security Checks mgasa-2016-0097");
script_copyright("Eero Volotinen");
script_family("Mageia Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "MAGEIA5")
{
if ((res = isrpmvuln(pkg:"graphite2", rpm:"graphite2~1.3.6~1.mga5", rls:"MAGEIA5")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}