# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2014-1635.nasl 6559 2017-07-06 11:57:32Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123283");
script_version("$Revision: 6559 $");
script_tag(name:"creation_date", value:"2015-10-06 14:01:43 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:57:32 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2014-1635");
script_tag(name: "insight", value: "ELSA-2014-1635 -  firefox security update - firefox[31.2.0-3.0.1.el7_0]- Add firefox-oracle-default-prefs.js and remove the corresponding Red Hat one[31.2.0-3]- Update to 31.2.0 ESR- Fix for mozbz#1042889[31.1.0-7]- Enable WebM on all archesxulrunner[31.2.0-1.0.1]- Replaced xulrunner-redhat-default-prefs.js with xulrunner-oracle-default-prefs.js- Removed XULRUNNER_VERSION from SOURCE21[31.2.0-1]- Update to 31.2.0[31.1.0-3]- move /sdk/bin to xulrunner libdir[31.1.0-2]- Sync preferences with Firefox package[31.1.0-1]- Update to 31.1.0 ESR[31.0-2]- Fix header wrapper for aarch64[31.0-1]- Update to 31.0 ESR"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2014-1635");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2014-1635.html");
script_cve_id("CVE-2014-1574","CVE-2014-1576","CVE-2014-1577","CVE-2014-1578","CVE-2014-1581","CVE-2014-1583");
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
if(release == "OracleLinux7")
{
  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~31.2.0~3.0.1.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~31.2.0~1.0.1.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~31.2.0~1.0.1.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~31.2.0~3.0.1.el5_11", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~31.2.0~3.0.1.el6_6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

