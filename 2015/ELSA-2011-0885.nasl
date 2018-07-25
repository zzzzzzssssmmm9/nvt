# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2011-0885.nasl 6556 2017-07-06 11:54:54Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122144");
script_version("$Revision: 6556 $");
script_tag(name:"creation_date", value:"2015-10-06 14:13:46 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:54:54 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2011-0885");
script_tag(name: "insight", value: "ELSA-2011-0885 -  firefox security and bug fix update - firefox:[3.6.18-1.0.1.el6_1]- Added firefox-oracle-default-prefs.js and removed firefox-redhat-default-prefs.js[3.6.18-1]- Update to 3.6.18xulrunner:[1.9.2.18-2.0.1.el6_1]- Replace xulrunner-redhat-default-prefs.js with xulrunner-oracle-default-prefs.js[1.9.2.18-2]- Update to 1.9.2.18"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2011-0885");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2011-0885.html");
script_cve_id("CVE-2011-0083","CVE-2011-0085","CVE-2011-2362","CVE-2011-2363","CVE-2011-2364","CVE-2011-2365","CVE-2011-2371","CVE-2011-2373","CVE-2011-2374","CVE-2011-2375","CVE-2011-2376","CVE-2011-2377","CVE-2011-2605");
script_tag(name:"cvss_base", value:"10.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
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
  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~3.6.18~1.0.1.el5_6", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~1.9.2.18~2.0.1.el5_6", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~1.9.2.18~2.0.1.el5_6", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~3.6.18~1.0.1.el6_1", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~1.9.2.18~2.0.1.el6_1", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~1.9.2.18~2.0.1.el6_1", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

