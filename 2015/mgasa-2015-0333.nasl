# OpenVAS Vulnerability Test 
# Description: Mageia Linux security check 
# $Id: mgasa-2015-0333.nasl 7156 2017-09-18 05:28:25Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://www.solinor.com
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
script_oid("1.3.6.1.4.1.25623.1.0.130052");
script_version("$Revision: 7156 $");
script_tag(name:"creation_date", value:"2015-10-15 10:42:04 +0300 (Thu, 15 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-09-18 07:28:25 +0200 (Mon, 18 Sep 2017) $");
script_name("Mageia Linux Local Check: mgasa-2015-0333");
script_tag(name: "insight", value: "When auditing the filesystem the names of files are logged. These filenames can contain escape sequences, when viewed using the ausearch programs -i option for example this can result in the escape sequences being processed unsafely by the terminal program being used to view the data (CVE-2015-5186)."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://advisories.mageia.org/MGASA-2015-0333.html");
script_cve_id("CVE-2015-5186");
script_tag(name:"cvss_base", value:"5.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/mageia_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name : "summary", value : "Mageia Linux Local Security Checks mgasa-2015-0333");
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
if ((res = isrpmvuln(pkg:"audit", rpm:"audit~2.4.4~1.mga5", rls:"MAGEIA5")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
