# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2013-0125.nasl 6558 2017-07-06 11:56:55Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123763");
script_version("$Revision: 6558 $");
script_tag(name:"creation_date", value:"2015-10-06 14:08:12 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:56:55 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2013-0125");
script_tag(name: "insight", value: "ELSA-2013-0125 -  wireshark security, bug fix, and enhancement update - [1.0.15-5.0.1.el5] - Added oracle-ocfs2-network.patch - increase max packet size to 65536 (Herbert van den Bergh) [orabug 13542633] [1.0.15-5] - fixed CVE-2012-4285, CVE-2012-4289, CVE-2012-4291 and CVE-2012-4290 (#849521) [1.0.15-4] - fixed NetDump dissector (#484999) [1.0.15-3] - fixed various flaws: CVE-2011-1959 CVE-2011-2175 CVE-2011-1958 CVE-2011-2698 CVE-2011-4102 CVE-2012-0041 CVE-2012-0042 CVE-2012-0066 CVE-2012-0067 [1.0.15-2] - fixed tshark -s option (#580513) - fixed tshark exit code when dumpcap fails (#580510) - fixed editing of columns in Wireshark preferences (#493693) - added netdump protocol dissector (#484999) - fixed tshark / Wireshark automatic filter when started in ssh connection over IPv6 (#438473)"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2013-0125");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2013-0125.html");
script_cve_id("CVE-2011-1958","CVE-2011-1959","CVE-2011-2175","CVE-2011-2698","CVE-2011-4102","CVE-2012-0041","CVE-2012-0042","CVE-2012-0066","CVE-2012-0067","CVE-2012-4285","CVE-2012-4289","CVE-2012-4290","CVE-2012-4291");
script_tag(name:"cvss_base", value:"4.3");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
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
  if ((res = isrpmvuln(pkg:"wireshark", rpm:"wireshark~1.0.15~5.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"wireshark-gnome", rpm:"wireshark-gnome~1.0.15~5.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

