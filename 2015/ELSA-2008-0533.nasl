# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2008-0533.nasl 6553 2017-07-06 11:52:12Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122571");
script_version("$Revision: 6553 $");
script_tag(name:"creation_date", value:"2015-10-08 14:48:21 +0300 (Thu, 08 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:52:12 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2008-0533");
script_tag(name: "insight", value: "ELSA-2008-0533 -  bind security update - bind: [9.3.4-6.0.1.P1]- CVE-2008-1447selinux-policy:[2.4.6-137.1]- Allow named to bind to any udp portResolves: #451971"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2008-0533");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2008-0533.html");
script_cve_id("CVE-2008-1447");
script_tag(name:"cvss_base", value:"5.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
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
  if ((res = isrpmvuln(pkg:"bind", rpm:"bind~9.3.4~6.0.1.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind", rpm:"bind~9.3.4~6.0.2.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind-chroot", rpm:"bind-chroot~9.3.4~6.0.1.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind-chroot", rpm:"bind-chroot~9.3.4~6.0.2.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind-devel", rpm:"bind-devel~9.3.4~6.0.1.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind-devel", rpm:"bind-devel~9.3.4~6.0.2.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind-libbind-devel", rpm:"bind-libbind-devel~9.3.4~6.0.1.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind-libbind-devel", rpm:"bind-libbind-devel~9.3.4~6.0.2.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind-libs", rpm:"bind-libs~9.3.4~6.0.1.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind-libs", rpm:"bind-libs~9.3.4~6.0.2.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind-sdb", rpm:"bind-sdb~9.3.4~6.0.1.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind-sdb", rpm:"bind-sdb~9.3.4~6.0.2.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind-utils", rpm:"bind-utils~9.3.4~6.0.1.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"bind-utils", rpm:"bind-utils~9.3.4~6.0.2.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"caching-nameserver", rpm:"caching-nameserver~9.3.4~6.0.1.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"caching-nameserver", rpm:"caching-nameserver~9.3.4~6.0.2.P1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"selinux-policy", rpm:"selinux-policy~2.4.6~137.1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"selinux-policy-devel", rpm:"selinux-policy-devel~2.4.6~137.1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"selinux-policy-mls", rpm:"selinux-policy-mls~2.4.6~137.1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"selinux-policy-strict", rpm:"selinux-policy-strict~2.4.6~137.1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"selinux-policy-targeted", rpm:"selinux-policy-targeted~2.4.6~137.1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

