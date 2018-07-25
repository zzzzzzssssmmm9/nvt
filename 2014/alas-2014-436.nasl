# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2014-436.nasl 6759 2017-07-19 09:56:33Z teissa $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120345");
script_version("$Revision: 6759 $");
script_tag(name:"creation_date", value:"2015-09-08 13:24:16 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-19 11:56:33 +0200 (Wed, 19 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2014-436");
script_tag(name: "insight", value: "A resource consumption issue was found in the way Xerces-J handled XML declarations. A remote attacker could use an XML document with a specially crafted declaration using a long pseudo-attribute name that, when parsed by an application using Xerces-J, would cause that application to use an excessive amount of CPU."); 
script_tag(name : "solution", value : "Run yum update xerces-j2 to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2014-436.html");
script_cve_id("CVE-2013-4002");
script_tag(name:"cvss_base", value:"7.1");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
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
if ((res = isrpmvuln(pkg:"xerces-j2-javadoc-apis", rpm:"xerces-j2-javadoc-apis~2.7.1~12.7.19.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"xerces-j2-javadoc-xni", rpm:"xerces-j2-javadoc-xni~2.7.1~12.7.19.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"xerces-j2-javadoc-other", rpm:"xerces-j2-javadoc-other~2.7.1~12.7.19.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"xerces-j2-demo", rpm:"xerces-j2-demo~2.7.1~12.7.19.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"xerces-j2", rpm:"xerces-j2~2.7.1~12.7.19.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"xerces-j2-scripts", rpm:"xerces-j2-scripts~2.7.1~12.7.19.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"xerces-j2-javadoc-impl", rpm:"xerces-j2-javadoc-impl~2.7.1~12.7.19.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"xerces-j2", rpm:"xerces-j2~2.7.1~12.7.19.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
