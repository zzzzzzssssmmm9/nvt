# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2014-1327.nasl 6559 2017-07-06 11:57:32Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123295");
script_version("$Revision: 6559 $");
script_tag(name:"creation_date", value:"2015-10-06 14:01:53 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:57:32 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2014-1327");
script_tag(name: "insight", value: "ELSA-2014-1327 -  php security update - [5.4.16-23.1]- gd: fix NULL pointer dereference in gdImageCreateFromXpm(). CVE-2014-2497- gd: fix NUL byte injection in file names. CVE-2014-5120- fileinfo: fix extensive backtracking in regular expression (incomplete fix for CVE-2013-7345). CVE-2014-3538- fileinfo: fix mconvert incorrect handling of truncated pascal string size. CVE-2014-3478- fileinfo: fix cdf_read_property_info (incomplete fix for CVE-2012-1571). CVE-2014-3587- spl: fix use-after-free in ArrayIterator due to object change during sorting. CVE-2014-4698- spl: fix use-after-free in SPL Iterators. CVE-2014-4670- network: fix segfault in dns_get_record (incomplete fix for CVE-2014-4049). CVE-2014-3597"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2014-1327");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2014-1327.html");
script_cve_id("CVE-2014-2497","CVE-2014-3478","CVE-2014-3538","CVE-2014-3587","CVE-2014-3597","CVE-2014-4670","CVE-2014-4698","CVE-2014-5120");
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
  if ((res = isrpmvuln(pkg:"php", rpm:"php~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-bcmath", rpm:"php-bcmath~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-cli", rpm:"php-cli~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-common", rpm:"php-common~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-dba", rpm:"php-dba~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-devel", rpm:"php-devel~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-embedded", rpm:"php-embedded~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-enchant", rpm:"php-enchant~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-fpm", rpm:"php-fpm~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-gd", rpm:"php-gd~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-intl", rpm:"php-intl~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-ldap", rpm:"php-ldap~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-mbstring", rpm:"php-mbstring~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-mysql", rpm:"php-mysql~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-mysqlnd", rpm:"php-mysqlnd~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-odbc", rpm:"php-odbc~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-pdo", rpm:"php-pdo~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-pgsql", rpm:"php-pgsql~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-process", rpm:"php-process~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-pspell", rpm:"php-pspell~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-recode", rpm:"php-recode~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-snmp", rpm:"php-snmp~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-soap", rpm:"php-soap~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-xml", rpm:"php-xml~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-xmlrpc", rpm:"php-xmlrpc~5.4.16~23.el7_0.1", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

