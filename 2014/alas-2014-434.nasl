# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2014-434.nasl 6692 2017-07-12 09:57:43Z teissa $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120347");
script_version("$Revision: 6692 $");
script_tag(name:"creation_date", value:"2015-09-08 13:24:18 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:57:43 +0200 (Wed, 12 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2014-434");
script_tag(name: "insight", value: "An out of bounds read flaw was found in the way the xmlrpc extension parsed dates in the ISO 8601 format. A specially crafted XML-RPC request or response could possibly cause a PHP application to crash. (CVE-2014-3668 )An integer overflow flaw was found in the way custom objects were unserialized. Specially crafted input processed by the unserialize() function could cause a PHP application to crash. (CVE-2014-3669 )A buffer overflow flaw was found in the Exif extension. A specially crafted JPEG or TIFF file could cause a PHP application using the exif_thumbnail() function to crash or, possibly, execute arbitrary code with the privileges of the user running that PHP application. (CVE-2014-3670 )"); 
script_tag(name : "solution", value : "Run yum update php54 to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2014-434.html");
script_cve_id("CVE-2014-3669", "CVE-2014-3668", "CVE-2014-3670");
script_tag(name:"cvss_base", value:"7.5");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
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
if ((res = isrpmvuln(pkg:"php54-debuginfo", rpm:"php54-debuginfo~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-mbstring", rpm:"php54-mbstring~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54", rpm:"php54~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-xml", rpm:"php54-xml~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-devel", rpm:"php54-devel~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-bcmath", rpm:"php54-bcmath~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-odbc", rpm:"php54-odbc~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-snmp", rpm:"php54-snmp~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-gd", rpm:"php54-gd~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-soap", rpm:"php54-soap~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-xmlrpc", rpm:"php54-xmlrpc~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-intl", rpm:"php54-intl~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-fpm", rpm:"php54-fpm~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-pdo", rpm:"php54-pdo~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-mssql", rpm:"php54-mssql~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-imap", rpm:"php54-imap~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-mysql", rpm:"php54-mysql~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-pgsql", rpm:"php54-pgsql~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-embedded", rpm:"php54-embedded~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-pspell", rpm:"php54-pspell~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-enchant", rpm:"php54-enchant~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-common", rpm:"php54-common~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-recode", rpm:"php54-recode~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-dba", rpm:"php54-dba~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-ldap", rpm:"php54-ldap~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-cli", rpm:"php54-cli~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-tidy", rpm:"php54-tidy~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-mcrypt", rpm:"php54-mcrypt~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-mysqlnd", rpm:"php54-mysqlnd~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php54-process", rpm:"php54-process~5.4.34~1.62.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
