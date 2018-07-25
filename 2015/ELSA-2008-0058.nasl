# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2008-0058.nasl 6553 2017-07-06 11:52:12Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122614");
script_version("$Revision: 6553 $");
script_tag(name:"creation_date", value:"2015-10-08 14:49:22 +0300 (Thu, 08 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:52:12 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2008-0058");
script_tag(name: "insight", value: "ELSA-2008-0058 -  Moderate: wireshark security update - wireshark-0.99.7-1.el5.0.1: [0.99.7-1.el5.0.1] - Add oracle-ocfs2-network.patch [0.99.7-1] - upgrade to 0.99.7 - switch to libsmi from net-snmp - disable ADNS due to its lack of Ipv6 support - Resolves: #397411 libsmi-0.4.5-2.el5: [0.4.5-2] - Handle rpath problems in 64-bit systems (#209522). [0.4.5-1] - Update to 0.4.5. [0.4.4-1] - Update to 0.4.4. [0.4.3-1] - First build."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2008-0058");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2008-0058.html");
script_cve_id("CVE-2007-6111","CVE-2007-6112","CVE-2007-6113","CVE-2007-6114","CVE-2007-6115","CVE-2007-6116","CVE-2007-6117","CVE-2007-6118","CVE-2007-6119","CVE-2007-6120","CVE-2007-6121","CVE-2007-6438","CVE-2007-6439","CVE-2007-6441","CVE-2007-6450","CVE-2007-6451");
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
  if ((res = isrpmvuln(pkg:"libsmi", rpm:"libsmi~0.4.5~2.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libsmi-devel", rpm:"libsmi-devel~0.4.5~2.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"wireshark", rpm:"wireshark~0.99.7~1.el5.0.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"wireshark-gnome", rpm:"wireshark-gnome~0.99.7~1.el5.0.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

