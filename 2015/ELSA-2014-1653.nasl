# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2014-1653.nasl 8849 2018-02-16 14:02:28Z asteins $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123278");
script_version("$Revision: 8849 $");
script_tag(name:"creation_date", value:"2015-10-06 14:01:40 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2018-02-16 15:02:28 +0100 (Fri, 16 Feb 2018) $");
script_name("Oracle Linux Local Check: ELSA-2014-1653");
script_tag(name: "insight", value: "ELSA-2014-1653 -  openssl security update - [0.9.8e-31]- add support for fallback SCSV to partially mitigate CVE-2014-3566 (padding attack on SSL3)[0.9.8e-30]- fix CVE-2014-0221 - recursion in DTLS code leading to DoS- fix CVE-2014-3505 - doublefree in DTLS packet processing- fix CVE-2014-3506 - avoid memory exhaustion in DTLS- fix CVE-2014-3508 - fix OID handling to avoid information leak- fix CVE-2014-3510 - fix DoS in anonymous (EC)DH handling in DTLS[0.9.8e-29]- fix for CVE-2014-0224 - SSL/TLS MITM vulnerability[0.9.8e-28]- replace expired GlobalSign Root CA certificate in ca-bundle.crt"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2014-1653");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2014-1653.html");
script_cve_id("CVE-2014-3566", "CVE-2014-0221", "CVE-2014-3505", "CVE-2014-3506", "CVE-2014-3508", "CVE-2014-3510", "CVE-2014-0224");
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
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"openssl", rpm:"openssl~0.9.8e~31.el5_11", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"openssl-devel", rpm:"openssl-devel~0.9.8e~31.el5_11", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"openssl-perl", rpm:"openssl-perl~0.9.8e~31.el5_11", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

