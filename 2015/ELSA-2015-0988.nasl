# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2015-0988.nasl 6560 2017-07-06 11:58:38Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123112");
script_version("$Revision: 6560 $");
script_tag(name:"creation_date", value:"2015-10-06 13:59:31 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:58:38 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2015-0988");
script_tag(name: "insight", value: "ELSA-2015-0988 -  firefox security update - [38.0-3.0.1.el7_1]- Add firefox-oracle-default-prefs.js and remove the corresponding Red Hat file[38.0-3]- Enabled system nss- Removed unused patches[38.0-2]- Update to 38.0 ESR[38.0b8-0.11]- Update to 38.0 Beta 8[38.0b6-0.10]- Added patch for mozbz#1152515[38.0b6-0.9]- Update to 38.0 Beta 6[38.0b5-0.8]- Update to 38.0 Beta 5[38.0b3-0.7]- Update to 38.0 Beta 3[38.0b1-0.6]- Added patch for mozbz#1152391[38.0b1-0.5]- Fix build on AArch64 (based on upstream skia changes)[38.0b1-0.4]- Enabled debug build[38.0b1-1]- Update to 38.0b1"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2015-0988");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2015-0988.html");
script_cve_id("CVE-2015-0797","CVE-2015-2708","CVE-2015-2710","CVE-2015-2716","CVE-2015-2713");
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
  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~38.0~3.0.1.el7_1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~38.0~4.0.1.el5_11", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~38.0~4.0.1.el6_6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

