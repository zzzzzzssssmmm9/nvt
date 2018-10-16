###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3541_2.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux-azure USN-3541-2
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843427");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-01-23 07:38:18 +0100 (Tue, 23 Jan 2018)");
  script_cve_id("CVE-2017-5753", "CVE-2017-5715", "CVE-2017-5754");
  script_tag(name:"cvss_base", value:"4.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-azure USN-3541-2");
  script_tag(name:"summary", value:"Check the version of linux-azure");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"USN-3541-1 addressed vulnerabilities in the
  Linux kernel for Ubuntu 17.10. This update provides the corresponding updates
  for the Linux Hardware Enablement (HWE) kernel from Ubuntu 17.10 for Ubuntu
  16.04 LTS. Jann Horn discovered that microprocessors utilizing speculative
  execution and branch prediction may allow unauthorized memory reads via
  sidechannel attacks. This flaw is known as Spectre. A local attacker could use
  this to expose sensitive information, including kernel memory. This update
  provides mitigations for the i386 (CVE-2017-5753 only), amd64, ppc64el, and
  s390x architectures. (CVE-2017-5715, CVE-2017-5753) USN-3523-2 mitigated
  CVE-2017-5754 (Meltdown) for the amd64 architecture in the Linux Hardware
  Enablement (HWE) kernel from Ubuntu 17.10 for Ubuntu 16.04 LTS. This update
  provides the corresponding mitigations for the ppc64el architecture. Original
  advisory details: Jann Horn discovered that microprocessors utilizing
  speculative execution and indirect branch prediction may allow unauthorized
  memory reads via sidechannel attacks. This flaw is known as Meltdown. A local
  attacker could use this to expose sensitive information, including kernel
  memory. (CVE-2017-5754)");
  script_tag(name:"affected", value:"linux-azure on Ubuntu 16.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3541-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3541-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU16\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-4.13.0-1006-azure", ver:"4.13.0-1006.8", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.13.0-1007-gcp", ver:"4.13.0-1007.10", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.13.0-1017-oem", ver:"4.13.0-1017.18", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.13.0-31-generic", ver:"4.13.0-31.34~16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.13.0-31-lowlatency", ver:"4.13.0-31.34~16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-azure", ver:"4.13.0.1006.7", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-gcp", ver:"4.13.0.1007.9", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic-hwe-16.04", ver:"4.13.0.31.51", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-gke", ver:"4.13.0.1007.9", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-lowlatency-hwe-16.04", ver:"4.13.0.31.51", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-oem", ver:"4.13.0.1017.21", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"Please", ver:"note that fully mitigating CVE-2017-5715 (Spectre Variant 2)", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"in", ver:"virtual environments, hypervisor updates. On i386 and amd64", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"kernel", ver:"mitigations. Ubuntu is working with Intel and AMD to provide", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"contact", ver:"the vendor to identify necessary firmware updates. Ubuntu", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"self-hosted", ver:"virtual environments in coordination with upstream QEMU.", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"CPU", ver:"features to virtual machines.", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
