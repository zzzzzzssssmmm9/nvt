###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1533_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux USN-1533-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");



if(description)
{
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1533-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.841111");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-08-14 10:40:49 +0530 (Tue, 14 Aug 2012)");
  script_cve_id("CVE-2012-2136", "CVE-2012-2373", "CVE-2012-3375", "CVE-2012-3400");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_xref(name:"USN", value:"1533-1");
  script_name("Ubuntu Update for linux USN-1533-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU11\.10");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1533-1");
  script_tag(name:"affected", value:"linux on Ubuntu 11.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"An error was discovered in the Linux kernel's network TUN/TAP device
  implementation. A local user with access to the TUN/TAP interface (which is
  not available to unprivileged users until granted by a root user) could
  exploit this flaw to crash the system or potential gain administrative
  privileges. (CVE-2012-2136)

  Ulrich Obergfell discovered an error in the Linux kernel's memory
  management subsystem on 32 bit PAE systems with more than 4GB of memory
  installed. A local unprivileged user could exploit this flaw to crash the
  system. (CVE-2012-2373)

  A flaw was discovered in the Linux kernel's epoll system call. An
  unprivileged local user could use this flaw to crash the system.
  (CVE-2012-3375)

  Some errors where discovered in the Linux kernel's UDF file system, which
  is used to mount some CD-ROMs and DVDs. An unprivileged local user could
  use these flaws to crash the system. (CVE-2012-3400)");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-24-generic", ver:"3.0.0-24.40", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-24-generic-pae", ver:"3.0.0-24.40", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-24-omap", ver:"3.0.0-24.40", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-24-powerpc", ver:"3.0.0-24.40", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-24-powerpc-smp", ver:"3.0.0-24.40", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-24-powerpc64-smp", ver:"3.0.0-24.40", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-24-server", ver:"3.0.0-24.40", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-24-virtual", ver:"3.0.0-24.40", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
