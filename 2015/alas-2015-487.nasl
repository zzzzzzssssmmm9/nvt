# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2015-487.nasl 6575 2017-07-06 13:42:08Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120327");
script_version("$Revision: 6575 $");
script_tag(name:"creation_date", value:"2015-09-08 13:23:40 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:42:08 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2015-487");
script_tag(name: "insight", value: "Format string vulnerability in the yyerror function in lib/cgraph/scan.l in Graphviz allows remote attackers to have unspecified impact via format string specifiers in unknown vector, which are not properly handled in an error string."); 
script_tag(name : "solution", value : "Run yum update graphviz to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2015-487.html");
script_cve_id("CVE-2014-9157");
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
if ((res = isrpmvuln(pkg:"graphviz-python", rpm:"graphviz-python~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-php54", rpm:"graphviz-php54~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-perl", rpm:"graphviz-perl~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-ruby", rpm:"graphviz-ruby~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-guile", rpm:"graphviz-guile~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-R", rpm:"graphviz-R~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-devel", rpm:"graphviz-devel~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-debuginfo", rpm:"graphviz-debuginfo~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-graphs", rpm:"graphviz-graphs~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-tcl", rpm:"graphviz-tcl~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz", rpm:"graphviz~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-java", rpm:"graphviz-java~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-doc", rpm:"graphviz-doc~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-lua", rpm:"graphviz-lua~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"graphviz-gd", rpm:"graphviz-gd~2.38.0~18.44.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
