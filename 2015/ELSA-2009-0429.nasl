# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2009-0429.nasl 6600 2017-07-07 09:58:31Z teissa $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122493");
script_version("$Revision: 6600 $");
script_tag(name:"creation_date", value:"2015-10-08 14:46:36 +0300 (Thu, 08 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:58:31 +0200 (Fri, 07 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2009-0429");
script_tag(name: "insight", value: "ELSA-2009-0429 -  cups security update - [1:1.3.7-8:.4]- Applied additional patches by Tim Waugh for batch3892.pdf, batch4781.pdf, batch5486.pdf, batch19856.pdf, batch19869.pdf testing files from CERT (bug #491864).- Resolves: rhbz#492386.[1:1.3.7-8:.3]- Applied patches to fix CVE-2009-0163 (bug #490596), CVE-2009-0146 (bug #490612), CVE-2009-0147 (bug #490614), and CVE-2009-0166 (bug #490625)."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2009-0429");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2009-0429.html");
script_cve_id("CVE-2009-0146","CVE-2009-0147","CVE-2009-0163","CVE-2009-0166","CVE-2009-0195","CVE-2009-0799","CVE-2009-0800","CVE-2009-1179","CVE-2009-1180","CVE-2009-1181","CVE-2009-1182","CVE-2009-1183");
script_tag(name:"cvss_base", value:"7.5");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
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
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"cups", rpm:"cups~1.3.7~8.el5_3.4", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"cups-devel", rpm:"cups-devel~1.3.7~8.el5_3.4", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"cups-libs", rpm:"cups-libs~1.3.7~8.el5_3.4", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"cups-lpd", rpm:"cups-lpd~1.3.7~8.el5_3.4", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

