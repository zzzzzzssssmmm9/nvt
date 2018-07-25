# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2015-0800.nasl 6560 2017-07-06 11:58:38Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123135");
script_version("$Revision: 6560 $");
script_tag(name:"creation_date", value:"2015-10-06 13:59:48 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:58:38 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2015-0800");
script_tag(name: "insight", value: "ELSA-2015-0800 -  openssl security update - [0.9.8e-33]- fix CVE-2014-8275 (without introduction of CVE-2015-0286) - various certificate fingerprint issues- fix CVE-2015-0204 - remove support for RSA ephemeral keys for non-export ciphersuites and on server- fix CVE-2015-0287 - ASN.1 structure reuse decoding memory corruption- fix CVE-2015-0288 - X509_to_X509_REQ NULL pointer dereference- fix CVE-2015-0289 - NULL dereference decoding invalid PKCS#7 data- fix CVE-2015-0292 - integer underflow in base64 decoder- fix CVE-2015-0293 - triggerable assert in SSLv2 server"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2015-0800");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2015-0800.html");
script_cve_id("CVE-2014-8275","CVE-2015-0204","CVE-2015-0287","CVE-2015-0288","CVE-2015-0289","CVE-2015-0292","CVE-2015-0293");
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
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"openssl", rpm:"openssl~0.9.8e~33.0.1.el5_11", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"openssl-devel", rpm:"openssl-devel~0.9.8e~33.0.1.el5_11", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"openssl-perl", rpm:"openssl-perl~0.9.8e~33.0.1.el5_11", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

