# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2013-183.nasl 6577 2017-07-06 13:43:46Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120283");
script_version("$Revision: 6577 $");
script_tag(name:"creation_date", value:"2015-09-08 13:22:32 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:43:46 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2013-183");
script_tag(name: "insight", value: "Multiple flaws were discovered in the font layout engine in the 2D component. An untrusted Java application or applet could possibly use these flaws to trigger Java Virtual Machine memory corruption. (CVE-2013-1569 , CVE-2013-2383 , CVE-2013-2384 )Multiple improper permission check issues were discovered in the Beans, Libraries, JAXP, and RMI components in OpenJDK. An untrusted Java application or applet could use these flaws to bypass Java sandbox restrictions. (CVE-2013-1558 , CVE-2013-2422 , CVE-2013-2436 , CVE-2013-1518 , CVE-2013-1557 )The previous default value of the java.rmi.server.useCodebaseOnly property permitted the RMI implementation to automatically load classes from remotely specified locations. An attacker able to connect to an application using RMI could use this flaw to make the application execute arbitrary code. (CVE-2013-1537 )The 2D component did not properly process certain images. An untrusted Java application or applet could possibly use this flaw to trigger Java Virtual Machine memory corruption. (CVE-2013-2420 )It was discovered that the Hotspot component did not properly handle certain intrinsic frames, and did not correctly perform access checks and MethodHandle lookups. An untrusted Java application or applet could use these flaws to bypass Java sandbox restrictions. (CVE-2013-2431 , CVE-2013-2421 , CVE-2013-2423 )It was discovered that JPEGImageReader and JPEGImageWriter in the ImageIO component did not protect against modification of their state while performing certain native code operations. An untrusted Java application or applet could possibly use these flaws to trigger Java Virtual Machine memory corruption. (CVE-2013-2429 , CVE-2013-2430 )The JDBC driver manager could incorrectly call the toString() method in JDBC drivers, and the ConcurrentHashMap class could incorrectly call the defaultReadObject() method. An untrusted Java application or applet could possibly use these flaws to bypass Java sandbox restrictions. (CVE-2013-1488 , CVE-2013-2426 )The sun.awt.datatransfer.ClassLoaderObjectInputStream class may incorrectly invoke the system class loader. An untrusted Java application or applet could possibly use this flaw to bypass certain Java sandbox restrictions. (CVE-2013-0401 )Flaws were discovered in the Network component's InetAddress serialization, and the 2D component's font handling. An untrusted Java application or applet could possibly use these flaws to crash the Java Virtual Machine. (CVE-2013-2417 , CVE-2013-2419 )The MBeanInstantiator class implementation in the OpenJDK JMX component did not properly check class access before creating new instances. An untrusted Java application or applet could use this flaw to create instances of non-public classes. (CVE-2013-2424 )It was discovered that JAX-WS could possibly create temporary files with insecure permissions. A local attacker could use this flaw to access temporary files created by an application using JAX-WS. (CVE-2013-2415 )"); 
script_tag(name : "solution", value : "Run yum update java-1.7.0-openjdk to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2013-183.html");
script_cve_id("CVE-2013-2419","CVE-2013-1569","CVE-2013-1537","CVE-2013-2383","CVE-2013-1518","CVE-2013-2415","CVE-2013-2417","CVE-2013-2421","CVE-2013-2420","CVE-2013-2430","CVE-2013-2431","CVE-2013-2436","CVE-2013-2424","CVE-2013-2426","CVE-2013-2429","CVE-2013-1488","CVE-2013-2423","CVE-2013-1558","CVE-2013-2422","CVE-2013-2384","CVE-2013-0401","CVE-2013-1557");
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
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-demo", rpm:"java-1.7.0-openjdk-demo~1.7.0.19~2.3.9.1.25.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-src", rpm:"java-1.7.0-openjdk-src~1.7.0.19~2.3.9.1.25.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.19~2.3.9.1.25.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-debuginfo", rpm:"java-1.7.0-openjdk-debuginfo~1.7.0.19~2.3.9.1.25.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.19~2.3.9.1.25.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-javadoc", rpm:"java-1.7.0-openjdk-javadoc~1.7.0.19~2.3.9.1.25.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
