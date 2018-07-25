###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for java-1.8.0-openjdk RHSA-2016:0049-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.871542");
  script_version("$Revision: 6690 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:51:07 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-01-21 06:14:11 +0100 (Thu, 21 Jan 2016)");
  script_cve_id("CVE-2015-7575", "CVE-2016-0402", "CVE-2016-0448", "CVE-2016-0466",
                "CVE-2016-0475", "CVE-2016-0483", "CVE-2016-0494");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for java-1.8.0-openjdk RHSA-2016:0049-01");
  script_tag(name: "summary", value: "Check the version of java-1.8.0-openjdk");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of
detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The java-1.8.0-openjdk packages provide the
OpenJDK 8 Java Runtime Environment and the OpenJDK 8 Java Software Development Kit.

An out-of-bounds write flaw was found in the JPEG image format decoder in
the AWT component in OpenJDK. A specially crafted JPEG image could cause
a Java application to crash or, possibly execute arbitrary code. An
untrusted Java application or applet could use this flaw to bypass Java
sandbox restrictions. (CVE-2016-0483)

An integer signedness issue was found in the font parsing code in the 2D
component in OpenJDK. A specially crafted font file could possibly cause
the Java Virtual Machine to execute arbitrary code, allowing an untrusted
Java application or applet to bypass Java sandbox restrictions.
(CVE-2016-0494)

It was discovered that the password-based encryption (PBE) implementation
in the Libraries component in OpenJDK used an incorrect key length. This
could, in certain cases, lead to generation of keys that were weaker than
expected. (CVE-2016-0475)

It was discovered that the JAXP component in OpenJDK did not properly
enforce the totalEntitySizeLimit limit. An attacker able to make a Java
application process a specially crafted XML file could use this flaw to
make the application consume an excessive amount of memory. (CVE-2016-0466)

A flaw was found in the way TLS 1.2 could use the MD5 hash function for
signing ServerKeyExchange and Client Authentication packets during a TLS
handshake. A man-in-the-middle attacker able to force a TLS connection to
use the MD5 hash function could use this flaw to conduct collision attacks
to impersonate a TLS server or an authenticated TLS client. (CVE-2015-7575)

Multiple flaws were discovered in the Networking and JMX components in
OpenJDK. An untrusted Java application or applet could use these flaws to
bypass certain Java sandbox restrictions. (CVE-2016-0402, CVE-2016-0448)

Note: If the web browser plug-in provided by the icedtea-web package was
installed, the issues exposed via Java applets could have been exploited
without user interaction if a user visited a malicious website.

Note: This update also disallows the use of the MD5 hash algorithm in the
certification path processing. The use of MD5 can be re-enabled by removing
MD5 from the jdk.certpath.disabledAlgorithms security property defined in
the java.security file.

All users of java-1.8.0-openjdk are advised to upgrade to these updated
packages, which resolve these issues. All running instances of OpenJDK Java
must be restarted for the update to take effect.
");
  script_tag(name: "affected", value: "java-1.8.0-openjdk on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2016:0049-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2016-January/msg00023.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk", rpm:"java-1.8.0-openjdk~1.8.0.71~2.b15.el7_2", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-debug", rpm:"java-1.8.0-openjdk-debug~1.8.0.71~2.b15.el7_2", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-debuginfo", rpm:"java-1.8.0-openjdk-debuginfo~1.8.0.71~2.b15.el7_2", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-devel", rpm:"java-1.8.0-openjdk-devel~1.8.0.71~2.b15.el7_2", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-headless", rpm:"java-1.8.0-openjdk-headless~1.8.0.71~2.b15.el7_2", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-headless-debug", rpm:"java-1.8.0-openjdk-headless-debug~1.8.0.71~2.b15.el7_2", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
