# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2009-0315.nasl 6554 2017-07-06 11:53:20Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122513");
script_version("$Revision: 6554 $");
script_tag(name:"creation_date", value:"2015-10-08 14:47:02 +0300 (Thu, 08 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:53:20 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2009-0315");
script_tag(name: "insight", value: "ELSA-2009-0315 -  firefox security update - firefox:[3.0.7-1.0.1]- Update firstrun and homepage URLs- Added firefox-oracle-default-prefs.js/firefox-oracle-default-bookmarks.html and removed the corresponding Red Hat ones- Added patch oracle-firefox-branding.patch[3.0.7-1]- Update to Firefox 3.0.7[3.0.6-2]- Fixed #481805 (Unowned directory /usr/lib/firefox-*/modules)xulrunner:[1.9.0.7-1.0.1]- Added xulrunner-oracle-default-prefs.js and removed xulrunner-redhat-default-prefs.js[1.9.0.7-1]- Update to 1.9.0.7"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2009-0315");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2009-0315.html");
script_cve_id("CVE-2009-0040","CVE-2009-0771","CVE-2009-0772","CVE-2009-0773","CVE-2009-0774","CVE-2009-0775","CVE-2009-0776","CVE-2009-0777");
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
  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~3.0.7~1.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~1.9.0.7~1.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~1.9.0.7~1.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"xulrunner-devel-unstable", rpm:"xulrunner-devel-unstable~1.9.0.7~1.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

