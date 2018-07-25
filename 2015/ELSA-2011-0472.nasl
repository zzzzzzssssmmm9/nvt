# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2011-0472.nasl 8842 2018-02-16 09:52:40Z asteins $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122185");
script_version("$Revision: 8842 $");
script_tag(name:"creation_date", value:"2015-10-06 14:14:28 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2018-02-16 10:52:40 +0100 (Fri, 16 Feb 2018) $");
script_name("Oracle Linux Local Check: ELSA-2011-0472");
script_tag(name: "insight", value: "ELSA-2011-0472 -  nss security update - [3.12.8-3.0.1.el6_0]- Use blank image instead of clean.gif in nss-3.12.8-stripped.tar.bz2- Update expired PayPalEE.cert to fix build failure[3.12.8-3]- Update builtin certs to NSS_3.12.9_WITH_CKBI_1_82_RTM via a patch[3.12.8-2]- Update to builtin certs from NSS_3.12.9_WITH_CKBI_1_82_RTM"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2011-0472");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2011-0472.html");
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
  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.12.8~4.0.1.el5_6", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.12.8~4.0.1.el5_6", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.12.8~4.0.1.el5_6", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.12.8~4.0.1.el5_6", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.12.8~3.0.1.el6_0", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.12.8~3.0.1.el6_0", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.12.8~3.0.1.el6_0", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-sysinit", rpm:"nss-sysinit~3.12.8~3.0.1.el6_0", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.12.8~3.0.1.el6_0", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

