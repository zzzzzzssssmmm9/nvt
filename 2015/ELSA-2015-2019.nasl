# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2015-2019.nasl 6560 2017-07-06 11:58:38Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122731");
script_version("$Revision: 6560 $");
script_tag(name:"creation_date", value:"2015-11-11 09:59:50 +0200 (Wed, 11 Nov 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:58:38 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2015-2019");
script_tag(name: "insight", value: "ELSA-2015-2019 -  sssd security and bug fix update - [1.12.4-47.4]- Resolves: rhbz#1268783 - Memory leak / possible DoS with krb auth.[1.12.4-47.3]- Resolves: rhbz#1268784 - SSSD POSIX attribute check is too strict[1.12.4-47.2]- Resolves: rhbz#1264098 - cleanup_groups should sanitize dn of groups[1.12.4-47.1]- Resolves: rhbz#1258398 - sysdb sudo search doesn't escape special characters"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2015-2019");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2015-2019.html");
script_cve_id("CVE-2015-5292");
script_tag(name:"cvss_base", value:"6.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:C");
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
  if ((res = isrpmvuln(pkg:"libipa_hbac", rpm:"libipa_hbac~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libipa_hbac-devel", rpm:"libipa_hbac-devel~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libipa_hbac-python", rpm:"libipa_hbac-python~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libsss_idmap", rpm:"libsss_idmap~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libsss_idmap-devel", rpm:"libsss_idmap-devel~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libsss_nss_idmap", rpm:"libsss_nss_idmap~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libsss_nss_idmap-devel", rpm:"libsss_nss_idmap-devel~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libsss_nss_idmap-python", rpm:"libsss_nss_idmap-python~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libsss_simpleifp", rpm:"libsss_simpleifp~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libsss_simpleifp-devel", rpm:"libsss_simpleifp-devel~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"python-sssdconfig", rpm:"python-sssdconfig~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sssd", rpm:"sssd~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sssd-ad", rpm:"sssd-ad~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sssd-client", rpm:"sssd-client~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sssd-common", rpm:"sssd-common~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sssd-common-pac", rpm:"sssd-common-pac~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sssd-dbus", rpm:"sssd-dbus~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sssd-ipa", rpm:"sssd-ipa~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sssd-krb5", rpm:"sssd-krb5~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sssd-krb5-common", rpm:"sssd-krb5-common~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sssd-ldap", rpm:"sssd-ldap~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sssd-proxy", rpm:"sssd-proxy~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sssd-tools", rpm:"sssd-tools~1.12.4~47.el6_7.4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

