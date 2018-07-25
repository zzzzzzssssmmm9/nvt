###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-ti-omap4 USN-2561-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.842163");
  script_version("$Revision: 9652 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:09:48 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2015-04-09 07:09:48 +0200 (Thu, 09 Apr 2015)");
  script_cve_id("CVE-2014-8159", "CVE-2015-1593", "CVE-2015-2041", "CVE-2015-2042");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-ti-omap4 USN-2561-1");
  script_tag(name: "summary", value: "Check the version of linux-ti-omap4");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "It was discovered that the Linux kernel's
Infiniband subsystem did not properly sanitize its input parameters while
registering memory regions from userspace. A local user could exploit this flaw
to cause a denial of service (system crash) or to potentially gain administrative
privileges. (CVE-2014-8159)

An integer overflow was discovered in the stack randomization feature of
the Linux kernel on 64 bit platforms. A local attacker could exploit this
flaw to bypass the Address Space Layout Randomization (ASLR) mitigation
mechanism. (CVE-2015-1593)

An information leak was discovered in the Linux kernel's handling of
userspace configuration of the link layer control (LLC). A local user could
exploit this flaw to read data from other sysctl settings. (CVE-2015-2041)

An information leak was discovered in how the Linux kernel handles setting
the Reliable Datagram Sockets (RDS) settings. A local user could exploit
this flaw to read data from other sysctl settings. (CVE-2015-2042)");
  script_tag(name: "affected", value: "linux-ti-omap4 on Ubuntu 12.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "USN", value: "2561-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2561-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU12\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-1462-omap4", ver:"3.2.0-1462.82", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
