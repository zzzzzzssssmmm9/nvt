# OpenVAS Vulnerability Test 
# Description: Mageia Linux security check 
# $Id: mgasa-2016-0153.nasl 6562 2017-07-06 12:22:42Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.131296");
script_version("$Revision: 6562 $");
script_tag(name:"creation_date", value:"2016-05-09 14:18:00 +0300 (Mon, 09 May 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 14:22:42 +0200 (Thu, 06 Jul 2017) $");
script_name("Mageia Linux Local Check: mgasa-2016-0153");
script_tag(name: "insight", value: "Updated wireshark packages fix security vulnerabilities: The NCP dissector could crash (CVE-2016-4076). TShark could crash due to a packet reassembly bug (CVE-2016-4077). The IEEE 802.11 dissector could crash (CVE-2016-4078). The PKTC dissector could crash (CVE-2016-4079). The PKTC dissector could crash (CVE-2016-4080). The IAX2 dissector could go into an infinite loop (CVE-2016-4081). Wireshark and TShark could exhaust the stack (CVE-2016-4006). The GSM CBCH dissector could crash (CVE-2016-4082). MS-WSP dissector crash (CVE-2016-4083, CVE-2016-4084)."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://advisories.mageia.org/MGASA-2016-0153.html");
script_cve_id("CVE-2016-4076","CVE-2016-4077","CVE-2016-4078","CVE-2016-4079","CVE-2016-4080","CVE-2016-4081","CVE-2016-4006","CVE-2016-4082","CVE-2016-4083","CVE-2016-4084");
script_tag(name:"cvss_base", value:"4.3");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/mageia_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name : "summary", value : "Mageia Linux Local Security Checks mgasa-2016-0153");
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
if ((res = isrpmvuln(pkg:"wireshark", rpm:"wireshark~2.0.3~1.mga5", rls:"MAGEIA5")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
