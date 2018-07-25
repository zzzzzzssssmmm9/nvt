# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2012-1037.nasl 6557 2017-07-06 11:55:33Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123896");
script_version("$Revision: 6557 $");
script_tag(name:"creation_date", value:"2015-10-06 14:09:59 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:55:33 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2012-1037");
script_tag(name: "insight", value: "ELSA-2012-1037 -  postgresql and postgresql84 security update - [8.4.12-1]- Update to PostgreSQL 8.4.12, for various fixes described at http://www.postgresql.org/docs/8.4/static/release-8-4-12.html including the fixes for CVE-2012-2143, CVE-2012-2655Resolves: #830723[8.4.11-2]- Add patches for CVE-2012-2143, CVE-2012-2655Resolves: #830723[8.4.11-1]- Update to PostgreSQL 8.4.11, for various fixes described at http://www.postgresql.org/docs/8.4/static/release-8-4-11.html http://www.postgresql.org/docs/8.4/static/release-8-4-10.html including the fixes for CVE-2012-0866, CVE-2012-0867, CVE-2012-0868Resolves: #812077"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2012-1037");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2012-1037.html");
script_cve_id("CVE-2012-2143","CVE-2012-2655");
script_tag(name:"cvss_base", value:"4.3");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
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
  if ((res = isrpmvuln(pkg:"postgresql84", rpm:"postgresql84~8.4.12~1.el5_8", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql84-contrib", rpm:"postgresql84-contrib~8.4.12~1.el5_8", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql84-devel", rpm:"postgresql84-devel~8.4.12~1.el5_8", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql84-docs", rpm:"postgresql84-docs~8.4.12~1.el5_8", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql84-libs", rpm:"postgresql84-libs~8.4.12~1.el5_8", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql84-plperl", rpm:"postgresql84-plperl~8.4.12~1.el5_8", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql84-plpython", rpm:"postgresql84-plpython~8.4.12~1.el5_8", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql84-pltcl", rpm:"postgresql84-pltcl~8.4.12~1.el5_8", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql84-python", rpm:"postgresql84-python~8.4.12~1.el5_8", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql84-server", rpm:"postgresql84-server~8.4.12~1.el5_8", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql84-tcl", rpm:"postgresql84-tcl~8.4.12~1.el5_8", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql84-test", rpm:"postgresql84-test~8.4.12~1.el5_8", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"postgresql", rpm:"postgresql~8.4.12~1.el6_2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql-contrib", rpm:"postgresql-contrib~8.4.12~1.el6_2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql-devel", rpm:"postgresql-devel~8.4.12~1.el6_2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql-docs", rpm:"postgresql-docs~8.4.12~1.el6_2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql-libs", rpm:"postgresql-libs~8.4.12~1.el6_2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql-plperl", rpm:"postgresql-plperl~8.4.12~1.el6_2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql-plpython", rpm:"postgresql-plpython~8.4.12~1.el6_2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql-pltcl", rpm:"postgresql-pltcl~8.4.12~1.el6_2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql-server", rpm:"postgresql-server~8.4.12~1.el6_2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"postgresql-test", rpm:"postgresql-test~8.4.12~1.el6_2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

