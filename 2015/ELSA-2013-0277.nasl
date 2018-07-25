# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2013-0277.nasl 6558 2017-07-06 11:56:55Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123712");
script_version("$Revision: 6558 $");
script_tag(name:"creation_date", value:"2015-10-06 14:07:33 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:56:55 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2013-0277");
script_tag(name: "insight", value: "ELSA-2013-0277 -  dnsmasq security, bug fix and enhancement update - [2.48-13]- Fix the DHCP RELEASE problem when two or more dnsmasq instances are running (rhbz#887156)[2.48-12]- Fixing initscript restart stop functions (rhbz#850944)[2.48-11]- Revert previous changes because of many problems with --bind-dynamic option backport.- Dropping dnsmasq-2.48-add-bind-dynamic-option.patch- Set SO_BINDTODEVICE socket option when using --bind-interfaces (rhbz#884957)[2.48-10]- Fixed dnsmasq-2.48-add-bind-dynamic-option.patch - the option --bind-dynamic was not set correctly when used[2.48-9]- Added cc flag -fno-strict-aliasing to solve Testsuite regressions[2.48-8]- Fix CVE-2012-3411 (rhbz#882251)[2.48-7]- Fix lease-change script (rhbz#815819)- Check tftp-root exists and is accessible at startup (rhbz#824214)"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2013-0277");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2013-0277.html");
script_cve_id("CVE-2012-3411");
script_tag(name:"cvss_base", value:"5.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
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
  if ((res = isrpmvuln(pkg:"dnsmasq", rpm:"dnsmasq~2.48~13.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"dnsmasq-utils", rpm:"dnsmasq-utils~2.48~13.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

