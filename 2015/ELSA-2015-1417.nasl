# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2015-1417.nasl 6560 2017-07-06 11:58:38Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123059");
script_version("$Revision: 6560 $");
script_tag(name:"creation_date", value:"2015-10-06 13:58:50 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:58:38 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2015-1417");
script_tag(name: "insight", value: "ELSA-2015-1417 -  mailman security and bug fix update - [3:2.1.12-25]- fix CVE-2002-0389 - local users able to read private mailing list archives[3:2.1.12-24]- fix CVE-2015-2775 - directory traversal in MTA transports[3:2.1.12-23]- fix #1095359 - handle update when some mailing lists have been created by newer Mailman than this one[3:2.1.12-22]- fix #1095359 - add support for DMARC[3:2.1.12-21]- fix #1056366 - fix bad subject of the welcome email when creating list using newlist command[3:2.1.12-20]- fix #745409 - do not set Indexes in httpd configuration for public archive- fix #1008139 - fix traceback when list_data_dir is not a child of var_prefix[3:2.1.12-19]- fix #765807 - fix traceback when message is received to moderated list"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2015-1417");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2015-1417.html");
script_cve_id("CVE-2015-2775","CVE-2002-0389");
script_tag(name:"cvss_base", value:"7.6");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
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
  if ((res = isrpmvuln(pkg:"mailman", rpm:"mailman~2.1.12~25.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

