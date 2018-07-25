# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2013-1119.nasl 6558 2017-07-06 11:56:55Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123589");
script_version("$Revision: 6558 $");
script_tag(name:"creation_date", value:"2015-10-06 14:05:55 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:56:55 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2013-1119");
script_tag(name: "insight", value: "ELSA-2013-1119 -  389-ds-base security and bug fix update - [1.2.11.15.20]- Resolves: Bug 984970 - Overflow in nsslapd-disk-monitoring-threshold(part 5 limits not displayed correctly). (ticket 47427)[1.2.11.15.19]- Resolves: Bug 984970 - Overflow in nsslapd-disk-monitoring-threshold(part 4). (ticket 47427)- Patch was not added[1.2.11.15.19]- Resolves: Bug 984970 - Overflow in nsslapd-disk-monitoring-threshold(part 4). (ticket 47427)[1.2.11.15.19]- Bump version to 1.2.11.15-19- Resolves: Bug 984970 - Overflow in nsslapd-disk-monitoring-threshold(part 3). (ticket 47427)[1.2.11.15.18]- Bump version to 1.2.11.15-18- Resolves: Bug 984970 - Overflow in nsslapd-disk-monitoring-threshold(part 2). (ticket 47427)- Resolves: Bug 987850 - Disk Monitoring not checking filesystem with logs (ticket 47741)[1.2.11.15-17]- Resolves: Bug 970995 - DS not shutting down when disk monitoring threshold is reached to half. (Ticket 47385)- Resolves: Bug 984970 - Overflow in nsslapd-disk-monitoring-threshold. (ticket 47427)[1.2.11.15-16]- Resolves: Bug 979514 - CVE-2013-2219 ACLs inoperative in some search scenarios. (Ticket 47405)[1.2.11.15-15]- Resolves: Bug 970995 - RHDS not shutting down when disk monitoring threshold is reached to half. (Ticket 47385)"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2013-1119");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2013-1119.html");
script_cve_id("CVE-2013-2219");
script_tag(name:"cvss_base", value:"4.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
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
  if ((res = isrpmvuln(pkg:"389-ds-base", rpm:"389-ds-base~1.2.11.15~20.el6_4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"389-ds-base-devel", rpm:"389-ds-base-devel~1.2.11.15~20.el6_4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"389-ds-base-libs", rpm:"389-ds-base-libs~1.2.11.15~20.el6_4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
