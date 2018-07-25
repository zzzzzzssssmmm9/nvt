# OpenVAS Vulnerability Test
# Description: Amazon Linux security check
# $Id: alas-2016-737.nasl 6574 2017-07-06 13:41:26Z cfischer $
# 
# Authors:
# Autogenerated by alas-generator developed by Eero Volotinen <eero.volotinen@iki.fi>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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
script_oid("1.3.6.1.4.1.25623.1.0.120726");
script_version("$Revision: 6574 $");
script_tag(name:"creation_date", value:"2016-10-26 15:38:21 +0300 (Wed, 26 Oct 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:41:26 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2016-737");
script_tag(name: "insight", value: "Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows remote administrators to affect availability via vectors related to Server: RBR. (CVE-2016-5440 )Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows remote administrators to affect availability via vectors related to Server: InnoDB. (CVE-2016-3459 )Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows remote administrators to affect availability via vectors related to Server: Privileges. (CVE-2016-5439 )Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows local users to affect confidentiality, integrity, and availability via vectors related to Server: Parser. (CVE-2016-3477 )Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows remote authenticated users to affect availability via vectors related to Server: Security: Encryption. (CVE-2016-3614 )Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows remote authenticated users to affect availability via vectors related to Server: DML. (CVE-2016-3615 )Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows remote authenticated users to affect availability via vectors related to Server: Types. (CVE-2016-3521 )Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows remote authenticated users to affect availability via vectors related to Server: FTS. (CVE-2016-3486 )Unspecified vulnerability in Oracle MySQL 5.6.30 and earlier allows remote authenticated users to affect availability via vectors related to Server: Optimizer. (CVE-2016-3501 )"); 
script_tag(name : "solution", value : "Run yum update mysql56 to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2016-737.html");
script_cve_id("CVE-2016-5440","CVE-2016-3459","CVE-2016-5439","CVE-2016-3477","CVE-2016-3614","CVE-2016-3615","CVE-2016-3521","CVE-2016-3486","CVE-2016-3501");
script_tag(name:"cvss_base", value:"6.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
script_family("Amazon Linux Local Security Checks");
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

if(release == "AMAZON")
{
  if ((res = isrpmvuln(pkg:"common", rpm:"common~5.6.32~1.16.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"test", rpm:"test~5.6.32~1.16.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"devel", rpm:"devel~5.6.32~1.16.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"libs", rpm:"libs~5.6.32~1.16.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"server", rpm:"server~5.6.32~1.16.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"embedded-devel", rpm:"embedded-devel~5.6.32~1.16.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"errmsg", rpm:"errmsg~5.6.32~1.16.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"debuginfo", rpm:"debuginfo~5.6.32~1.16.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"embedded", rpm:"embedded~5.6.32~1.16.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"bench", rpm:"bench~5.6.32~1.16.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); #Not vulnerable
    exit(0);
}
