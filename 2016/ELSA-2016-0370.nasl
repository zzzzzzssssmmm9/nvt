# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2016-0370.nasl 6552 2017-07-06 11:49:41Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.fi> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.fi
#
# OpenVAS and security consultance available from openvas@solinor.com
# see https://solinor.fi/openvas-en/ for more information
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
script_oid("1.3.6.1.4.1.25623.1.0.122895");
script_version("$Revision: 6552 $");
script_tag(name:"creation_date", value:"2016-03-11 07:06:40 +0200 (Fri, 11 Mar 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:49:41 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2016-0370");
script_tag(name: "insight", value: "ELSA-2016-0370 -  nss-util security update - [3.19.1-5]- Actually apply the fix for CVE-2016-1950 from NSS 3.19.2.3 ...[3.19.1-4]- Rebuild to ensure use of correct NSPR.[3.19.1-3]- Include the fix for CVE-2016-1950 from NSS 3.19.2.3"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2016-0370");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2016-0370.html");
script_cve_id("CVE-2016-1950");
script_tag(name:"cvss_base", value:"6.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
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
  if ((res = isrpmvuln(pkg:"nss-util", rpm:"nss-util~3.19.1~9.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-util-devel", rpm:"nss-util-devel~3.19.1~9.el7_2", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"nss-util", rpm:"nss-util~3.19.1~5.el6_7", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-util-devel", rpm:"nss-util-devel~3.19.1~5.el6_7", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

