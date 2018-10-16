###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-lts-wily USN-2978-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.842746");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2016-05-17 13:39:45 +0200 (Tue, 17 May 2016)");
  script_cve_id("CVE-2016-3713", "CVE-2016-0758");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-lts-wily USN-2978-2");
  script_tag(name:"summary", value:"Check the version of linux-lts-wily");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"USN-2978-1 fixed vulnerabilities in the
  Linux kernel for Ubuntu 15.10. This update provides the corresponding updates
  for the Linux Hardware Enablement (HWE) kernel from Ubuntu 15.10 for
  Ubuntu 14.04 LTS.

  David Matlack discovered that the Kernel-based Virtual Machine (KVM)
  implementation in the Linux kernel did not properly restrict variable
  Memory Type Range Registers (MTRR) in KVM guests. A privileged user in a
  guest VM could use this to cause a denial of service (system crash) in the
  host, expose sensitive information from the host, or possibly gain
  administrative privileges in the host. (CVE-2016-3713)

  Philip Pettersson discovered that the Linux kernel's ASN.1 DER decoder did
  not properly process certificate files with tags of indefinite length. A
  local unprivileged attacker could use this to cause a denial of service
  (system crash) or possibly execute arbitrary code with administrative
  privileges. (CVE-2016-0758)");
  script_tag(name:"affected", value:"linux-lts-wily on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"2978-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2978-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-generic", ver:"4.2.0-36.42~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-generic-lpae", ver:"4.2.0-36.42~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-lowlatency", ver:"4.2.0-36.42~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-powerpc-e500mc", ver:"4.2.0-36.42~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-powerpc-smp", ver:"4.2.0-36.42~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-powerpc64-emb", ver:"4.2.0-36.42~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-powerpc64-smp", ver:"4.2.0-36.42~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
