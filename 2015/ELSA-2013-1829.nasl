# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2013-1829.nasl 6558 2017-07-06 11:56:55Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123496");
script_version("$Revision: 6558 $");
script_tag(name:"creation_date", value:"2015-10-06 14:04:39 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:56:55 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2013-1829");
script_tag(name: "insight", value: "ELSA-2013-1829 -  nss, nspr, and nss-util security update - nspr[4.10.0-2]- Rebase to nspr-4.10.2- Resolves: rhbz#1032485 - CVE-2013-5607 (MFSA 2013-103) Avoid unsigned integer wrapping in PL_ArenaAllocate (MFSA 2013-103)nss[3.15.3-2.0.1]- Added nss-vendor.patch to change vendor[3.15.3-2]- Enable patch with fix for deadlock in trust domain lock and object lock- Resolves: Bug 1036477 - deadlock in trust domain lock and object lock- Disable hw gcm on rhel-5 based build environments where OS lacks support- Rollback changes to build nss without softokn until Bug 689919 is approved- Cipher suite was run as part of the nss-softokn build[3.15.3-1]- Update to NSS_3_15_3_RTM- Resolves: Bug 1032470 - CVE-2013-5605 CVE-2013-5606 CVE-2013-1741nss-util[3.15.3-1]- Update to NSS_3_15_3_RTM- Resolves: rhbz#1032470 - CVE-2013-5605 CVE-2013-5606 CVE-2013-1741"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2013-1829");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2013-1829.html");
script_cve_id("CVE-2013-1739","CVE-2013-1741","CVE-2013-5605","CVE-2013-5606","CVE-2013-5607");
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
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"nspr", rpm:"nspr~4.10.2~1.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nspr-devel", rpm:"nspr-devel~4.10.2~1.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.15.3~2.0.1.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.15.3~2.0.1.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.15.3~2.0.1.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-sysinit", rpm:"nss-sysinit~3.15.3~2.0.1.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.15.3~2.0.1.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-util", rpm:"nss-util~3.15.3~1.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-util-devel", rpm:"nss-util-devel~3.15.3~1.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

