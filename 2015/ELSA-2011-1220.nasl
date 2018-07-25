# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2011-1220.nasl 6556 2017-07-06 11:54:54Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122101");
script_version("$Revision: 6556 $");
script_tag(name:"creation_date", value:"2015-10-06 14:13:05 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:54:54 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2011-1220");
script_tag(name: "insight", value: "ELSA-2011-1220 -  samba3x security update - [3.5.4-0.83.2]- Security Release, add fix for CVE-2011-2724- related: #722555[3.5.4-0.83.1]- Security Release, fixes CVE-2011-2694, CVE-2011-2522, CVE-2011-1678- resolves: #722555"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2011-1220");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2011-1220.html");
script_cve_id("CVE-2011-1678","CVE-2011-2522","CVE-2011-2694","CVE-2011-2724");
script_tag(name:"cvss_base", value:"6.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
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
  if ((res = isrpmvuln(pkg:"samba3x", rpm:"samba3x~3.5.4~0.83.el5_7.2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba3x-client", rpm:"samba3x-client~3.5.4~0.83.el5_7.2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba3x-common", rpm:"samba3x-common~3.5.4~0.83.el5_7.2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba3x-doc", rpm:"samba3x-doc~3.5.4~0.83.el5_7.2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba3x-domainjoin-gui", rpm:"samba3x-domainjoin-gui~3.5.4~0.83.el5_7.2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba3x-swat", rpm:"samba3x-swat~3.5.4~0.83.el5_7.2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba3x-winbind", rpm:"samba3x-winbind~3.5.4~0.83.el5_7.2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba3x-winbind-devel", rpm:"samba3x-winbind-devel~3.5.4~0.83.el5_7.2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

