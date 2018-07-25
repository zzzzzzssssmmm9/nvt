# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2015-515.nasl 6575 2017-07-06 13:42:08Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120532");
script_version("$Revision: 6575 $");
script_tag(name:"creation_date", value:"2015-09-08 13:28:45 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:42:08 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2015-515");
script_tag(name: "insight", value: "An off-by-one flaw, leading to a buffer overflow, was found in the font parsing code in the 2D component in OpenJDK. A specially crafted font file could possibly cause the Java Virtual Machine to execute arbitrary code, allowing an untrusted Java application or applet to bypass Java sandbox restrictions. (CVE-2015-0469 )A flaw was found in the way the Hotspot component in OpenJDK handled phantom references. An untrusted Java application or applet could use this flaw to corrupt the Java Virtual Machine memory and, possibly, execute arbitrary code, bypassing Java sandbox restrictions. (CVE-2015-0460 )A flaw was found in the way the JSSE component in OpenJDK parsed X.509 certificate options. A specially crafted certificate could cause JSSE to raise an exception, possibly causing an application using JSSE to exit unexpectedly. (CVE-2015-0488 )A flaw was discovered in the Beans component in OpenJDK. An untrusted Java application or applet could use this flaw to bypass certain Java sandbox restrictions. (CVE-2015-0477 )A directory traversal flaw was found in the way the jar tool extracted JAR archive files. A specially crafted JAR archive could cause jar to overwrite arbitrary files writable by the user running jar when the archive was extracted. (CVE-2005-1080 , CVE-2015-0480 )It was found that the RSA implementation in the JCE component in OpenJDK did not follow recommended practices for implementing RSA signatures. (CVE-2015-0478 )"); 
script_tag(name : "solution", value : "Run yum update java-1.6.0-openjdk to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2015-515.html");
script_cve_id("CVE-2015-0469","CVE-2015-0478","CVE-2015-0480","CVE-2015-0477","CVE-2015-0488","CVE-2005-1080","CVE-2015-0460");
script_tag(name:"cvss_base", value:"10.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
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
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-demo", rpm:"java-1.6.0-openjdk-demo~1.6.0.35~1.13.7.1.70.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-javadoc", rpm:"java-1.6.0-openjdk-javadoc~1.6.0.35~1.13.7.1.70.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk", rpm:"java-1.6.0-openjdk~1.6.0.35~1.13.7.1.70.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-debuginfo", rpm:"java-1.6.0-openjdk-debuginfo~1.6.0.35~1.13.7.1.70.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-src", rpm:"java-1.6.0-openjdk-src~1.6.0.35~1.13.7.1.70.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-devel", rpm:"java-1.6.0-openjdk-devel~1.6.0.35~1.13.7.1.70.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
