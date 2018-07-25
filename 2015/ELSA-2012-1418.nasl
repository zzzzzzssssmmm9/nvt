# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2012-1418.nasl 6557 2017-07-06 11:55:33Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123693");
script_version("$Revision: 6557 $");
script_tag(name:"creation_date", value:"2015-10-06 14:07:19 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:55:33 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2012-1418");
script_tag(name: "insight", value: "ELSA-2012-1418 -  kdelibs security update - [6:4.3.4-19.0.1] - rebuild it with new rules add build requirement of installing libXdmcp-devel [6:4.3.4-19] - fix multilib conflict [6:4.3.4-18] - Resolves: bz#866230, CVE-2012-4512 CVE-2012-4513 [4.3.4-17] - Resolves: bz#754161, bz#587016, bz#682611, bz#734734, bz#826114, respin [6:4.3.4-16] - Resolves: bz#754161, stop/warn when a subdir is not accessible when copying [6:4.3.4-15] - Resolves: bz#587016, print dialogue does not remember previous settings - Resolves: bz#682611, Konqueror splash page in zh_TW is wrong - Resolves: bz#734734, plasma eating up cpu-time when systemtray some icon - Resolves: bz#826114, konqueror crash when trying to add 'Terminal Emulator' to main menu bar"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2012-1418");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2012-1418.html");
script_cve_id("CVE-2012-4512","CVE-2012-4513");
script_tag(name:"cvss_base", value:"6.4");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
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
  if ((res = isrpmvuln(pkg:"kdelibs", rpm:"kdelibs~4.3.4~19.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kdelibs-apidocs", rpm:"kdelibs-apidocs~4.3.4~19.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kdelibs-common", rpm:"kdelibs-common~4.3.4~19.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kdelibs-devel", rpm:"kdelibs-devel~4.3.4~19.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
