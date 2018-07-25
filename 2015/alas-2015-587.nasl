# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2015-587.nasl 6575 2017-07-06 13:42:08Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120506");
script_version("$Revision: 6575 $");
script_tag(name:"creation_date", value:"2015-09-08 13:28:04 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:42:08 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2015-587");
script_tag(name: "insight", value: "The mod_dav_svn server in Subversion 1.8.0 through 1.8.11 allows remote attackers to cause a denial of service (memory consumption) via a large number of REPORT requests, which trigger the traversal of FSFS repository nodes. (CVE-2015-0202 )An assertion failure flaw was found in the way the SVN server processed certain requests with dynamically evaluated revision numbers. A remote attacker could use this flaw to cause the SVN server (both svnserve and httpd with the mod_dav_svn module) to crash. (CVE-2015-0248 )It was found that the mod_dav_svn module did not properly validate the svn:author property of certain requests. An attacker able to create new revisions could use this flaw to spoof the svn:author property. (CVE-2015-0251 )"); 
script_tag(name : "solution", value : "Run yum update subversion mod_dav_svn to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2015-587.html");
script_cve_id("CVE-2015-0202","CVE-2015-0248","CVE-2015-0251");
script_tag(name:"cvss_base", value:"7.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
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
if ((res = isrpmvuln(pkg:"svn", rpm:"svn~1.8.13~7.50.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"svn-debuginfo", rpm:"svn-debuginfo~1.8.13~7.50.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-python26", rpm:"subversion-python26~1.8.13~7.52.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-libs", rpm:"subversion-libs~1.8.13~7.52.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-python27", rpm:"subversion-python27~1.8.13~7.52.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-tools", rpm:"subversion-tools~1.8.13~7.52.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-ruby", rpm:"subversion-ruby~1.8.13~7.52.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-debuginfo", rpm:"subversion-debuginfo~1.8.13~7.52.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-devel", rpm:"subversion-devel~1.8.13~7.52.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-javahl", rpm:"subversion-javahl~1.8.13~7.52.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion", rpm:"subversion~1.8.13~7.52.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"svn", rpm:"svn~1.8.13~7.52.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-perl", rpm:"subversion-perl~1.8.13~7.52.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
