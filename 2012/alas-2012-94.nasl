# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2012-94.nasl 6578 2017-07-06 13:44:33Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@iki.fi> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org 
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
script_oid("1.3.6.1.4.1.25623.1.0.120099");
script_version("$Revision: 6578 $");
script_tag(name:"creation_date", value:"2015-09-08 13:17:23 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:44:33 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2012-94");
script_tag(name: "insight", value: "A flaw was found in the way the crypt() password hashing function from the optional PostgreSQL pgcrypto contrib module performed password transformation when used with the DES algorithm. If the password string to be hashed contained the 0x80 byte value, the remainder of the string was ignored when calculating the hash, significantly reducing the password strength. This made brute-force guessing more efficient as the whole password was not required to gain access to protected resources. (CVE-2012-2143 )Note: With this update, the rest of the string is properly included in the DES hash; therefore, any previously stored password values that are affected by this issue will no longer match. In such cases, it will be necessary for those stored password hashes to be updated.A denial of service flaw was found in the way the PostgreSQL server performed a user privileges check when applying SECURITY DEFINER or SET attributes to a procedural language's (such as PL/Perl or PL/Python) call handler function. A non-superuser database owner could use this flaw to cause the PostgreSQL server to crash due to infinite recursion. (CVE-2012-2655 )"); 
script_tag(name : "solution", value : "Run yum update postgresql8 to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2012-94.html");
script_cve_id("CVE-2012-2655", "CVE-2012-2143");
script_tag(name:"cvss_base", value:"4.3");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("Eero Volotinen");
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
if ((res = isrpmvuln(pkg:"postgresql8-test", rpm:"postgresql8-test~8.4.12~1.35.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql8-pltcl", rpm:"postgresql8-pltcl~8.4.12~1.35.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql8-plperl", rpm:"postgresql8-plperl~8.4.12~1.35.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql8-contrib", rpm:"postgresql8-contrib~8.4.12~1.35.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql8-docs", rpm:"postgresql8-docs~8.4.12~1.35.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql8-debuginfo", rpm:"postgresql8-debuginfo~8.4.12~1.35.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql8-server", rpm:"postgresql8-server~8.4.12~1.35.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql8", rpm:"postgresql8~8.4.12~1.35.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql8-libs", rpm:"postgresql8-libs~8.4.12~1.35.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql8-plpython", rpm:"postgresql8-plpython~8.4.12~1.35.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql8-devel", rpm:"postgresql8-devel~8.4.12~1.35.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
