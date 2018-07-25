# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2016-0534.nasl 6552 2017-07-06 11:49:41Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.fi> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.fi
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
script_oid("1.3.6.1.4.1.25623.1.0.122922");
script_version("$Revision: 6552 $");
script_tag(name:"creation_date", value:"2016-04-06 14:33:01 +0300 (Wed, 06 Apr 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:49:41 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2016-0534");
script_tag(name: "insight", value: "ELSA-2016-0534 -  mariadb security and bug fix update - [1:5.5.47-1]- Rebase to 5.5.47 Also fixes: CVE-2015-4792 CVE-2015-4802 CVE-2015-4815 CVE-2015-4816 CVE-2015-4819 CVE-2015-4826 CVE-2015-4830 CVE-2015-4836 CVE-2015-4858 CVE-2015-4861 CVE-2015-4870 CVE-2015-4879 CVE-2015-4913 CVE-2015-7744 CVE-2016-0505 CVE-2016-0546 CVE-2016-0596 CVE-2016-0597 CVE-2016-0598 CVE-2016-0600 CVE-2016-0606 CVE-2016-0608 CVE-2016-0609 CVE-2016-0616 CVE-2016-2047 Resolves: #1304515[1:5.5.44-3]- MDEV-8827 Duplicate key with auto increment fix innodb auto-increment handling three bugs: 1. innobase_next_autoinc treated the case of current"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2016-0534");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2016-0534.html");
script_cve_id("CVE-2015-4792","CVE-2015-4802","CVE-2015-4815","CVE-2015-4816","CVE-2015-4819","CVE-2015-4826","CVE-2015-4830","CVE-2015-4836","CVE-2015-4858","CVE-2015-4861","CVE-2015-4870","CVE-2015-4879","CVE-2015-4913","CVE-2016-0505","CVE-2016-0546","CVE-2016-0596","CVE-2016-0597","CVE-2016-0598","CVE-2016-0600","CVE-2016-0606","CVE-2016-0608","CVE-2016-0609","CVE-2016-0616","CVE-2016-2047");
script_tag(name:"cvss_base", value:"7.2");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
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
if(release == "OracleLinux7")
{
  if ((res = isrpmvuln(pkg:"mariadb", rpm:"mariadb~5.5.47~1.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"mariadb-bench", rpm:"mariadb-bench~5.5.47~1.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"mariadb-devel", rpm:"mariadb-devel~5.5.47~1.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"mariadb-embedded", rpm:"mariadb-embedded~5.5.47~1.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"mariadb-embedded-devel", rpm:"mariadb-embedded-devel~5.5.47~1.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"mariadb-libs", rpm:"mariadb-libs~5.5.47~1.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"mariadb-server", rpm:"mariadb-server~5.5.47~1.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"mariadb-test", rpm:"mariadb-test~5.5.47~1.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

