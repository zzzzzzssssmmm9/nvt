# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2015-502.nasl 6575 2017-07-06 13:42:08Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120367");
script_version("$Revision: 6575 $");
script_tag(name:"creation_date", value:"2015-09-08 13:24:44 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:42:08 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2015-502");
script_tag(name: "insight", value: "Multiple integer overflow flaws and an integer signedness flaw, leading to heap-based buffer overflows, were found in the way FreeType handled Mac fonts. If a specially crafted font file was loaded by an application linked against FreeType, it could cause the application to crash or, potentially, execute arbitrary code with the privileges of the user running the application. (CVE-2014-9673 , CVE-2014-9674 )Multiple flaws were found in the way FreeType handled fonts in various formats. If a specially crafted font file was loaded by an application linked against FreeType, it could cause the application to crash or, possibly, disclose a portion of the application memory. (CVE-2014-9657 , CVE-2014-9658 , CVE-2014-9660 , CVE-2014-9661 , CVE-2014-9663 , CVE-2014-9664 , CVE-2014-9667 , CVE-2014-9669 , CVE-2014-9670 , CVE-2014-9671 , CVE-2014-9675 )"); 
script_tag(name : "solution", value : "Run yum update freetype to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2015-502.html");
script_cve_id("CVE-2014-9663", "CVE-2014-9657", "CVE-2014-9661", "CVE-2014-9660", "CVE-2014-9667", "CVE-2014-9664", "CVE-2014-9669", "CVE-2014-9658", "CVE-2014-9674", "CVE-2014-9675", "CVE-2014-9670", "CVE-2014-9671", "CVE-2014-9673");
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
if ((res = isrpmvuln(pkg:"freetype-debuginfo", rpm:"freetype-debuginfo~2.3.11~15.14.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"freetype-demos", rpm:"freetype-demos~2.3.11~15.14.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"freetype", rpm:"freetype~2.3.11~15.14.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"freetype-devel", rpm:"freetype-devel~2.3.11~15.14.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
