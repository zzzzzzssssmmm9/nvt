# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2014-1013.nasl 6559 2017-07-06 11:57:32Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123340");
script_version("$Revision: 6559 $");
script_tag(name:"creation_date", value:"2015-10-06 14:02:29 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:57:32 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2014-1013");
script_tag(name: "insight", value: "ELSA-2014-1013 -  php security update - [5.4.16-23]- fileinfo: cdf_unpack_summary_info() excessive looping DoS. CVE-2014-0237- fileinfo: CDF property info parsing nelements infinite loop. CVE-2014-0238- fileinfo: cdf_check_stream_offset insufficient boundary check. CVE-2014-3479- fileinfo: cdf_count_chain insufficient boundary check CVE-2014-3480- fileinfo: cdf_read_short_sector insufficient boundary check. CVE-2014-0207- fileinfo: cdf_read_property_info insufficient boundary check. CVE-2014-3487- fileinfo: fix extensive backtracking CVE-2013-7345- core: type confusion issue in phpinfo(). CVE-2014-4721- core: fix heap-based buffer overflow in DNS TXT record parsing. CVE-2014-4049- core: unserialize() SPL ArrayObject / SPLObjectStorage type confusion flaw. CVE-2014-3515"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2014-1013");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2014-1013.html");
script_cve_id("CVE-2013-7345","CVE-2014-0207","CVE-2014-0237","CVE-2014-0238","CVE-2014-3479","CVE-2014-3487","CVE-2014-4721","CVE-2014-4049","CVE-2014-3480","CVE-2014-3515");
script_tag(name:"cvss_base", value:"7.5");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
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
  if ((res = isrpmvuln(pkg:"php", rpm:"php~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-bcmath", rpm:"php-bcmath~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-cli", rpm:"php-cli~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-common", rpm:"php-common~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-dba", rpm:"php-dba~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-devel", rpm:"php-devel~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-embedded", rpm:"php-embedded~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-enchant", rpm:"php-enchant~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-fpm", rpm:"php-fpm~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-gd", rpm:"php-gd~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-intl", rpm:"php-intl~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-ldap", rpm:"php-ldap~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-mbstring", rpm:"php-mbstring~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-mysql", rpm:"php-mysql~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-mysqlnd", rpm:"php-mysqlnd~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-odbc", rpm:"php-odbc~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-pdo", rpm:"php-pdo~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-pgsql", rpm:"php-pgsql~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-process", rpm:"php-process~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-pspell", rpm:"php-pspell~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-recode", rpm:"php-recode~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-snmp", rpm:"php-snmp~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-soap", rpm:"php-soap~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-xml", rpm:"php-xml~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"php-xmlrpc", rpm:"php-xmlrpc~5.4.16~23.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

