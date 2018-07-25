# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2015-1053.nasl 6552 2017-07-06 11:49:41Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122869");
script_version("$Revision: 6552 $");
script_tag(name:"creation_date", value:"2016-02-05 14:01:38 +0200 (Fri, 05 Feb 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:49:41 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2015-1053");
script_tag(name: "insight", value: "ELSA-2015-1053 -  php55 security and bug fix update - php55[2.0-1]- fix incorrect selinux contexts #1194336php55-php[5.5.21-2.0.1]- add dtrace-utils as build dependency[5.5.21-2]- core: fix use-after-free vulnerability in the process_nested_data function (unserialize) CVE-2015-2787- core: fix NUL byte injection in file name argument of move_uploaded_file() CVE-2015-2348- date: fix use after free vulnerability in unserialize() with DateTimeZone CVE-2015-0273- enchant: fix heap buffer overflow in enchant_broker_request_dict() CVE-2014-9705- ereg: fix heap overflow in regcomp() CVE-2015-2305- opcache: fix use after free CVE-2015-1351- phar: fix use after free in phar_object.c CVE-2015-2301- pgsql: fix NULL pointer dereference CVE-2015-1352- soap: fix type confusion through unserialize #1204868[5.5.21-1]- rebase to PHP 5.5.21[5.5.20-1]- rebase to PHP 5.5.20 #1057089- fix package name in description- php-fpm own session and wsdlcache dir- php-common doesn't provide php-gmp"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2015-1053");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2015-1053.html");
script_cve_id("CVE-2014-9427","CVE-2015-1351","CVE-2015-1352","CVE-2015-2305","CVE-2014-8142","CVE-2014-9652","CVE-2014-9705","CVE-2014-9709","CVE-2015-0231","CVE-2015-0232","CVE-2015-0273","CVE-2015-2301","CVE-2015-2348","CVE-2015-2787","CVE-2015-4147","CVE-2015-4148","CVE-2015-4599","CVE-2015-4600","CVE-2015-4601");
script_tag(name:"cvss_base", value:"10.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
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
  if ((res = isrpmvuln(pkg:"php55", rpm:"php55~2.0~1.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php", rpm:"php55-php~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-bcmath", rpm:"php55-php-bcmath~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-cli", rpm:"php55-php-cli~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-common", rpm:"php55-php-common~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-dba", rpm:"php55-php-dba~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-devel", rpm:"php55-php-devel~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-enchant", rpm:"php55-php-enchant~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-fpm", rpm:"php55-php-fpm~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-gd", rpm:"php55-php-gd~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-gmp", rpm:"php55-php-gmp~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-intl", rpm:"php55-php-intl~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-ldap", rpm:"php55-php-ldap~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-mbstring", rpm:"php55-php-mbstring~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-mysqlnd", rpm:"php55-php-mysqlnd~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-odbc", rpm:"php55-php-odbc~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-opcache", rpm:"php55-php-opcache~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-pdo", rpm:"php55-php-pdo~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-pgsql", rpm:"php55-php-pgsql~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-process", rpm:"php55-php-process~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-pspell", rpm:"php55-php-pspell~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-recode", rpm:"php55-php-recode~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-snmp", rpm:"php55-php-snmp~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-soap", rpm:"php55-php-soap~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-xml", rpm:"php55-php-xml~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-xmlrpc", rpm:"php55-php-xmlrpc~5.5.21~2.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-runtime", rpm:"php55-runtime~2.0~1.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-scldevel", rpm:"php55-scldevel~2.0~1.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"php55", rpm:"php55~2.0~1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php", rpm:"php55-php~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-bcmath", rpm:"php55-php-bcmath~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-cli", rpm:"php55-php-cli~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-common", rpm:"php55-php-common~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-dba", rpm:"php55-php-dba~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-devel", rpm:"php55-php-devel~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-enchant", rpm:"php55-php-enchant~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-fpm", rpm:"php55-php-fpm~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-gd", rpm:"php55-php-gd~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-gmp", rpm:"php55-php-gmp~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-imap", rpm:"php55-php-imap~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-intl", rpm:"php55-php-intl~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-ldap", rpm:"php55-php-ldap~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-mbstring", rpm:"php55-php-mbstring~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-mysqlnd", rpm:"php55-php-mysqlnd~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-odbc", rpm:"php55-php-odbc~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-opcache", rpm:"php55-php-opcache~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-pdo", rpm:"php55-php-pdo~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-pgsql", rpm:"php55-php-pgsql~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-process", rpm:"php55-php-process~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-pspell", rpm:"php55-php-pspell~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-recode", rpm:"php55-php-recode~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-snmp", rpm:"php55-php-snmp~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-soap", rpm:"php55-php-soap~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-tidy", rpm:"php55-php-tidy~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-xml", rpm:"php55-php-xml~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-php-xmlrpc", rpm:"php55-php-xmlrpc~5.5.21~2.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-runtime", rpm:"php55-runtime~2.0~1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php55-scldevel", rpm:"php55-scldevel~2.0~1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
