# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2013-0217.nasl 6558 2017-07-06 11:56:55Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123735");
script_version("$Revision: 6558 $");
script_tag(name:"creation_date", value:"2015-10-06 14:07:51 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:56:55 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2013-0217");
script_tag(name: "insight", value: "ELSA-2013-0217 -  mingw32-libxml2 security update - [2.7.6-6]- Synchronize patch-set with mainline-version.- Bump version to 5, 6. Related: rhbz#891477[2.7.6-4] - Change release number to 4.- Added patch libxml2-Fix-an-off-by-one-pointer-access.patch- Added patch libxml2-Fix-a-segfault-on-XSD-validation-on-pattern-error.patch- Added patch libxml2-Fix-entities-local-buffers-size-problems.patch- Added patch libxml2-gnome-bug-561340-fix.patch- Added patch for CVE-2012-0841- Added patch for CVE-2011-0216- Added patch for CVE-2011-2834- Added patch for CVE-2011-3919- Added patch for CVE-2011-1944- Added patch for CVE-2011-3905 Related: rhbz#891477"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2013-0217");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2013-0217.html");
script_cve_id("CVE-2010-4008","CVE-2010-4494","CVE-2011-0216","CVE-2011-1944","CVE-2011-2821","CVE-2011-2834","CVE-2012-0841","CVE-2011-3905","CVE-2011-3919","CVE-2011-3102","CVE-2012-5134");
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
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"mingw32-libxml2", rpm:"mingw32-libxml2~2.7.6~6.el6_3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"mingw32-libxml2-static", rpm:"mingw32-libxml2-static~2.7.6~6.el6_3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

