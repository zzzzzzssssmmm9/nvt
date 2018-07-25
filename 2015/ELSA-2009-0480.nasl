# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2009-0480.nasl 6554 2017-07-06 11:53:20Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122485");
script_version("$Revision: 6554 $");
script_tag(name:"creation_date", value:"2015-10-08 14:46:26 +0300 (Thu, 08 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:53:20 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2009-0480");
script_tag(name: "insight", value: "ELSA-2009-0480 -  poppler security update - [0.5.4-4.4.el5_3.9]- Another fix of integer overflows.- Adds memory-allocation.patch.- Resolves: #490707[0.5.4-4.4.el5_3.8]- Change calling of exit() to _exit().- Adds exit-handling.patch.- Resolves: #490707[0.5.4-4.4.el5_3.7]- Improve handling of EOF at JBIG2Stream.cc.- Adds eof-handling.patch.- Resolves: #490707[0.5.4-4.4.el5_3.6]- Memory handling from upstream.- Removes CVE-2009-0146.CVE-2009-0147.CVE-2009-0166.allocation-size-check.patch.- Adds upstream-memory-handling.patch.- Resolves: #490707[0.5.4-4.4.el5_3.5]- Fix allocation of memory in several functions.- Adds CVE-2009-0146.CVE-2009-0147.CVE-2009-0166.allocation-size-check.patch.- Removes CVE-2009-0146.CVE-2009-0147.CVE-2009-0166.long-int.patch.- Resolves: #490707[0.5.4-4.4.el5_3.4]- Fix allocation of memory in several functions.- Add CVE-2009-0146.CVE-2009-0147.CVE-2009-0166.long-type.patch.- Resolves: #490707[0.5.4-4.4.el5_3.3]- Add CVE-2009-0146.CVE-2009-0147.CVE-2009-0166.mem.patch.- Resolves: #490707[0.5.4-4.4.el5_3.2]- A little change of spec file because to pass *RPM requires/provides* test.- Resolves: #490707[0.5.4-4.4.el5_3.1]- Add CVE-2009-0146.CVE-2009-0147.CVE-2009-0166.patch.- Resolves: #490707"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2009-0480");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2009-0480.html");
script_cve_id("CVE-2009-0146","CVE-2009-0147","CVE-2009-0166","CVE-2009-0195","CVE-2009-0791","CVE-2009-0799","CVE-2009-0800","CVE-2009-1179","CVE-2009-1180","CVE-2009-1181","CVE-2009-1182","CVE-2009-1183","CVE-2009-1187","CVE-2009-1188","CVE-2009-3604","CVE-2009-3606");
script_tag(name:"cvss_base", value:"9.3");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
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
  if ((res = isrpmvuln(pkg:"poppler", rpm:"poppler~0.5.4~4.4.el5_3.9", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"poppler-devel", rpm:"poppler-devel~0.5.4~4.4.el5_3.9", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"poppler-utils", rpm:"poppler-utils~0.5.4~4.4.el5_3.9", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

