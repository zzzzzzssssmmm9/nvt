# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2013-1582.nasl 6558 2017-07-06 11:56:55Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123515");
script_version("$Revision: 6558 $");
script_tag(name:"creation_date", value:"2015-10-06 14:04:55 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:56:55 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2013-1582");
script_tag(name: "insight", value: "ELSA-2013-1582 -  python security, bug fix, and enhancement update - [2.6.6-51]- Fixed memory leak in _ssl._get_peer_alt_namesResolves: rhbz#1002983[2.6.6-50]- Added fix for CVE-2013-4238Resolves: rhbz#998784[2.6.6-49]- Fix shebangs in several files in python-tools subpackageResolves: rhbz#521898[2.6.6-48]- Fix sqlite3.Cursor.lastrowid under a Turkish locale.Resolves: rhbz#841937[2.6.6-47]- Urlparse now parses query and fragment of urls for any scheme.Resolves: rhbz#978129[2.6.6-46]- Add wrapper for select.select to restart a system callResolves: rhbz#948025[2.6.6-45]- Add try-except to catch OSError in WatchedFileHandlerResolves: rhbz#919163[2.6.6-44]- Fix urandom to throw proper exceptionResolves: rhbz#893034[2.6.6-43]- Backport of collections.OrderedDict from Python 2.7Resolves: rhbz#929258[2.6.6-42]- Add an explicit RPATH to _elementtree.so pointing at the directorycontaining system expatResolves: rhbz#962779[2.6.6-41]- Don't let failed incoming SSL connection stay open foreverResolves: rhbz#960168[2.6.6-40]- Fix Python not reading Alternative Subject Names from some SSLcertificatesResolves: rhbz#928390[2.6.6-39]- Remove BOM insertion code from SysLogHandler that causes messages to betreated as EMERG levelResolves: rhbz#845802[2.6.6-38]- move most of the payload of the core package to the libs subpackage, giventhat the libs aren't meaningfully usable without the standard libraries- preserve timestamps when fixing shebangs (patch 158) and when installing,to minimize .pyc/.pyo differences across architectures (due to the embeddedmtime in .pyc/.pyo headers)- fix multilib issue in /usr/bin/modulator and /usr/bin/pyncheRelated: rhbz#958256"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2013-1582");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2013-1582.html");
script_cve_id("CVE-2013-4238");
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
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"python", rpm:"python~2.6.6~51.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"python-devel", rpm:"python-devel~2.6.6~51.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"python-libs", rpm:"python-libs~2.6.6~51.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"python-test", rpm:"python-test~2.6.6~51.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"python-tools", rpm:"python-tools~2.6.6~51.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"tkinter", rpm:"tkinter~2.6.6~51.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

