###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux USN-2667-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842443");
  script_version("$Revision: 9652 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:09:48 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2015-09-18 10:43:12 +0200 (Fri, 18 Sep 2015)");
  script_cve_id("CVE-2015-1420", "CVE-2015-4001", "CVE-2015-4002", "CVE-2015-4003");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux USN-2667-1");
  script_tag(name: "summary", value: "Check the version of linux");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "A race condition was discovered in the
Linux kernel's file_handle size verification. A local user could exploit this
flaw to read potentially sensative memory locations. (CVE-2015-1420)

A underflow error was discovered in the Linux kernel's Ozmo Devices USB
over WiFi host controller driver. A remote attacker could exploit this flaw
to cause a denial of service (system crash) or potentially execute
arbitrary code via a specially crafted packet. (CVE-2015-4001)

A bounds check error was discovered in the Linux kernel's Ozmo Devices USB
over WiFi host controller driver. A remote attacker could exploit this flaw
to cause a denial of service (system crash) or potentially execute
arbitrary code via a specially crafted packet. (CVE-2015-4002)

A division by zero error was discovered in the Linux kernel's Ozmo Devices
USB over WiFi host controller driver. A remote attacker could exploit this
flaw to cause a denial of service (system crash). (CVE-2015-4003)");
  script_tag(name: "affected", value: "linux on Ubuntu 15.04");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "USN", value: "2667-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2667-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU15\.04");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU15.04")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-22-generic", ver:"3.19.0-22.22", rls:"UBUNTU15.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-22-generic-lpae", ver:"3.19.0-22.22", rls:"UBUNTU15.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-22-lowlatency", ver:"3.19.0-22.22", rls:"UBUNTU15.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-22-powerpc-e500mc", ver:"3.19.0-22.22", rls:"UBUNTU15.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-22-powerpc-smp", ver:"3.19.0-22.22", rls:"UBUNTU15.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-22-powerpc64-emb", ver:"3.19.0-22.22", rls:"UBUNTU15.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.19.0-22-powerpc64-smp", ver:"3.19.0-22.22", rls:"UBUNTU15.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
