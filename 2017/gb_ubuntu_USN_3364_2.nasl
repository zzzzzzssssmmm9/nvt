###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3364_2.nasl 9654 2018-04-27 09:20:40Z cfischer $
#
# Ubuntu Update for linux-lts-xenial USN-3364-2
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843254");
  script_version("$Revision: 9654 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:20:40 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2017-07-25 07:24:47 +0200 (Tue, 25 Jul 2017)");
  script_cve_id("CVE-2014-9900", "CVE-2015-8944", "CVE-2017-1000380", "CVE-2017-7346",
                "CVE-2017-9150", "CVE-2017-9605");
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-lts-xenial USN-3364-2");
  script_tag(name: "summary", value: "Check the version of linux-lts-xenial");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "USN-3364-1 fixed vulnerabilities in the
  Linux kernel for Ubuntu 16.04 LTS. This update provides the corresponding
  updates for the Linux Hardware Enablement (HWE) kernel from Ubuntu 16.04 LTS for
  Ubuntu 14.04 LTS. It was discovered that the Linux kernel did not properly
  initialize a Wake- on-Lan data structure. A local attacker could use this to
  expose sensitive information (kernel memory). (CVE-2014-9900) It was discovered
  that the Linux kernel did not properly restrict access to /proc/iomem. A local
  attacker could use this to expose sensitive information. (CVE-2015-8944)
  Alexander Potapenko discovered a race condition in the Advanced Linux Sound
  Architecture (ALSA) subsystem in the Linux kernel. A local attacker could use
  this to expose sensitive information (kernel memory). (CVE-2017-1000380) Li
  Qiang discovered that the DRM driver for VMware Virtual GPUs in the Linux kernel
  did not properly validate some ioctl arguments. A local attacker could use this
  to cause a denial of service (system crash). (CVE-2017-7346) Jann Horn
  discovered that bpf in Linux kernel does not restrict the output of the
  print_bpf_insn function. A local attacker could use this to obtain sensitive
  address information. (CVE-2017-9150) Murray McAllister discovered that the DRM
  driver for VMware Virtual GPUs in the Linux kernel did not properly initialize
  memory. A local attacker could use this to expose sensitive information (kernel
  memory). (CVE-2017-9605)");
  script_tag(name: "affected", value: "linux-lts-xenial on Ubuntu 14.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3364-2");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3364-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-87-generic", ver:"4.4.0-87.110~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-87-generic-lpae", ver:"4.4.0-87.110~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-87-lowlatency", ver:"4.4.0-87.110~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-87-powerpc-e500mc", ver:"4.4.0-87.110~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-87-powerpc-smp", ver:"4.4.0-87.110~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-87-powerpc64-emb", ver:"4.4.0-87.110~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-87-powerpc64-smp", ver:"4.4.0-87.110~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic-lpae-lts-xenial", ver:"4.4.0.87.72", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic-lts-xenial", ver:"4.4.0.87.72", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-lowlatency-lts-xenial", ver:"4.4.0.87.72", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-powerpc-e500mc-lts-xenial", ver:"4.4.0.87.72", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-powerpc-smp-lts-xenial", ver:"4.4.0.87.72", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-powerpc64-emb-lts-xenial", ver:"4.4.0.87.72", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-powerpc64-smp-lts-xenial", ver:"4.4.0.87.72", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
