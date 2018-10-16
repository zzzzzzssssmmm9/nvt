###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-lts-utopic USN-2797-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842517");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2015-11-06 06:02:37 +0100 (Fri, 06 Nov 2015)");
  script_cve_id("CVE-2015-0272", "CVE-2015-2925", "CVE-2015-5257", "CVE-2015-5283");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-lts-utopic USN-2797-1");
  script_tag(name:"summary", value:"Check the version of linux-lts-utopic");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that the Linux kernel
did not check if a new IPv6 MTU set by a user space application was valid. A
remote attacker could forge a route advertisement with an invalid MTU that a
user space daemon like NetworkManager would honor and apply to the kernel,
causing a denial of service. (CVE-2015-0272)

It was discovered that in certain situations, a directory could be renamed
outside of a bind mounted location. An attacker could use this to escape
bind mount containment and gain access to sensitive information.
(CVE-2015-2925)

Moein Ghasemzadeh discovered that the USB WhiteHEAT serial driver contained
hardcoded attributes about the USB devices. An attacker could construct a
fake WhiteHEAT USB device that, when inserted, causes a denial of service
(system crash). (CVE-2015-5257)

It was discovered that the SCTP protocol implementation in the Linux kernel
performed an incorrect sequence of protocol-initialization steps. A local
attacker could use this to cause a denial of service (system crash).
(CVE-2015-5283)");
  script_tag(name:"affected", value:"linux-lts-utopic on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"USN", value:"2797-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2797-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-52-generic", ver:"3.16.0-52.71~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-52-generic-lpae", ver:"3.16.0-52.71~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-52-lowlatency", ver:"3.16.0-52.71~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-52-powerpc-e500mc", ver:"3.16.0-52.71~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-52-powerpc-smp", ver:"3.16.0-52.71~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-52-powerpc64-emb", ver:"3.16.0-52.71~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-52-powerpc64-smp", ver:"3.16.0-52.71~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
