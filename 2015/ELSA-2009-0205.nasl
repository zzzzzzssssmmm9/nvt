# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2009-0205.nasl 6554 2017-07-06 11:53:20Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122524");
script_version("$Revision: 6554 $");
script_tag(name:"creation_date", value:"2015-10-08 14:47:16 +0300 (Thu, 08 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:53:20 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2009-0205");
script_tag(name: "insight", value: "ELSA-2009-0205 -  dovecot security and bug fix update - [1.0.7-7]- permissions of deliver and dovecot.conf from 1.0.7-5 reverted- password can be stored in different file readable only for root now- Resolves: #436287, CVE-2008-4870[1.0.7-6]- added missing directory in file list- Resolves: #436287[1.0.7-5]- change permissions of deliver and dovecot.conf to prevent possible password exposure- Resolves: #436287[1.0.7-4]- fix handling of negative rights in the ACL plugin- Resolves: #469015, CVE-2008-4577[1.0.7-3]- fix package ownership for /etc/pki/dovecot/private (#448089)- update init script (#238016)- ask for SSL cert password during start-up (#436287)- fix for illegal characters in passwd (#439369)- Resolves: #448089, #238016, #436287, #439369"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2009-0205");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2009-0205.html");
script_cve_id("CVE-2008-4577","CVE-2008-4870");
script_tag(name:"cvss_base", value:"6.4");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");
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
  if ((res = isrpmvuln(pkg:"dovecot", rpm:"dovecot~1.0.7~7.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

