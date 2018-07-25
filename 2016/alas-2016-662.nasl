# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2016-662.nasl 6574 2017-07-06 13:41:26Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@iki.fi> 
#
# OpenVAS and security consultance available from openvas@solinor.com
# see https://solinor.fi/openvas-en/ for more information
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
script_oid("1.3.6.1.4.1.25623.1.0.120652");
script_version("$Revision: 6574 $");
script_tag(name:"creation_date", value:"2016-03-11 07:09:15 +0200 (Fri, 11 Mar 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:41:26 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2016-662");
script_tag(name: "insight", value: "An integer overflow flaw, leading to a heap-based buffer overflow, was found in the PostgreSQL handling code for regular expressions. A remote attacker could use a specially crafted regular expression to cause PostgreSQL to crash or possibly execute arbitrary code."); 
script_tag(name : "solution", value : "Run yum update postgresql94 to update your system.
                                    Run yum update postgresql93 to update your system.
                                    Run yum update postgresql92 to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2016-662.html");
script_cve_id("CVE-2016-0773");
script_tag(name:"cvss_base", value:"5.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
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
if ((res = isrpmvuln(pkg:"postgresql93-contrib", rpm:"postgresql93-contrib~9.3.11~1.61.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql93-debuginfo", rpm:"postgresql93-debuginfo~9.3.11~1.61.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql93-server", rpm:"postgresql93-server~9.3.11~1.61.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql93", rpm:"postgresql93~9.3.11~1.61.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql93-pltcl", rpm:"postgresql93-pltcl~9.3.11~1.61.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql93-docs", rpm:"postgresql93-docs~9.3.11~1.61.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql93-plperl", rpm:"postgresql93-plperl~9.3.11~1.61.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql93-devel", rpm:"postgresql93-devel~9.3.11~1.61.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql93-test", rpm:"postgresql93-test~9.3.11~1.61.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql93-libs", rpm:"postgresql93-libs~9.3.11~1.61.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql93-plpython27", rpm:"postgresql93-plpython27~9.3.11~1.61.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql93-plpython26", rpm:"postgresql93-plpython26~9.3.11~1.61.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92-plpython27", rpm:"postgresql92-plpython27~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92-server", rpm:"postgresql92-server~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92-plpython26", rpm:"postgresql92-plpython26~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92-pltcl", rpm:"postgresql92-pltcl~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92-docs", rpm:"postgresql92-docs~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92-contrib", rpm:"postgresql92-contrib~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92-test", rpm:"postgresql92-test~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92", rpm:"postgresql92~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92-devel", rpm:"postgresql92-devel~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92-plperl", rpm:"postgresql92-plperl~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92-libs", rpm:"postgresql92-libs~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92-server-compat", rpm:"postgresql92-server-compat~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql92-debuginfo", rpm:"postgresql92-debuginfo~9.2.15~1.57.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql94-server", rpm:"postgresql94-server~9.4.6~1.66.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql94-plperl", rpm:"postgresql94-plperl~9.4.6~1.66.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql94-devel", rpm:"postgresql94-devel~9.4.6~1.66.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql94-libs", rpm:"postgresql94-libs~9.4.6~1.66.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql94-plpython26", rpm:"postgresql94-plpython26~9.4.6~1.66.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql94-plpython27", rpm:"postgresql94-plpython27~9.4.6~1.66.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql94-contrib", rpm:"postgresql94-contrib~9.4.6~1.66.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql94", rpm:"postgresql94~9.4.6~1.66.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql94-test", rpm:"postgresql94-test~9.4.6~1.66.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql94-docs", rpm:"postgresql94-docs~9.4.6~1.66.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"postgresql94-debuginfo", rpm:"postgresql94-debuginfo~9.4.6~1.66.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
