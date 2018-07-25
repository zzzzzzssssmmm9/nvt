# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2015-601.nasl 6575 2017-07-06 13:42:08Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120520");
script_version("$Revision: 6575 $");
script_tag(name:"creation_date", value:"2015-10-22 08:25:44 +0300 (Thu, 22 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:42:08 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2015-601");
script_tag(name: "insight", value: "As reported upstream, A NULL pointer dereference flaw was found in the way PHP's Phar extension parsed Phar archives. A specially crafted archive could cause PHP to crash. (CVE-2015-7803  )Use after free vulnerability was found in unserialize() function. We can create ZVAL and free it via Serializable::unserialize. However the unserialize() will still allow to use R: or r: to set references to that already freed memory. It is possible to use-after-free attack and execute arbitrary code remotely. (CVE-2015-6834 )A use-after-free vulnerability was found in session deserializer. When session deserializer (php/php_binary) is deserializing multiple data, it will call php_var_unserialize() multiple times. We can create ZVAL and free it via the php_var_unserialize() with a crafted serialized string. Then the next call php_var_unserialize() will still allow to use R: or r: to set references to that already freed memory. It is possible to use-after-free attack and execute arbitrary code remotely. (CVE-2015-6835 )As reported upstream, an uninitialized pointer use flaw was found in the phar_make_dirstream() function of PHP's Phar extension. A specially crafted phar file in the ZIP format with a directory entry with a file name /ZIP could cause a PHP application function to crash. (CVE-2015-7804 )"); 
script_tag(name : "solution", value : "Run yum update php56 to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2015-601.html");
script_cve_id("CVE-2015-7803","CVE-2015-6834","CVE-2015-6835","CVE-2015-7804");
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
if ((res = isrpmvuln(pkg:"php56-xmlrpc", rpm:"php56-xmlrpc~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-xml", rpm:"php56-xml~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-odbc", rpm:"php56-odbc~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-imap", rpm:"php56-imap~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-pdo", rpm:"php56-pdo~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-debuginfo", rpm:"php56-debuginfo~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-gmp", rpm:"php56-gmp~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-mcrypt", rpm:"php56-mcrypt~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-dba", rpm:"php56-dba~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-tidy", rpm:"php56-tidy~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-enchant", rpm:"php56-enchant~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-opcache", rpm:"php56-opcache~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-common", rpm:"php56-common~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-devel", rpm:"php56-devel~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-fpm", rpm:"php56-fpm~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-mssql", rpm:"php56-mssql~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-pspell", rpm:"php56-pspell~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-snmp", rpm:"php56-snmp~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-process", rpm:"php56-process~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-cli", rpm:"php56-cli~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-mysqlnd", rpm:"php56-mysqlnd~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-ldap", rpm:"php56-ldap~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-gd", rpm:"php56-gd~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-intl", rpm:"php56-intl~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-embedded", rpm:"php56-embedded~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-dbg", rpm:"php56-dbg~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56", rpm:"php56~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-bcmath", rpm:"php56-bcmath~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-soap", rpm:"php56-soap~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-pgsql", rpm:"php56-pgsql~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-recode", rpm:"php56-recode~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"php56-mbstring", rpm:"php56-mbstring~5.6.14~1.119.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}