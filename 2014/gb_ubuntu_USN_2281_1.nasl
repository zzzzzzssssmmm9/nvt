###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2281_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux-ec2 USN-2281-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.841896");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2014-07-21 16:49:06 +0530 (Mon, 21 Jul 2014)");
  script_cve_id("CVE-2014-4943", "CVE-2014-3917", "CVE-2014-4608");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux-ec2 USN-2281-1");


  script_tag(name:"affected", value:"linux-ec2 on Ubuntu 10.04 LTS");
  script_tag(name:"insight", value:"Sasha Levin reported a flaw in the Linux kernel's
point-to-point protocol (PPP) when used with the Layer Two Tunneling Protocol
(L2TP). A local user could exploit this flaw to gain administrative privileges.
(CVE-2014-4943)

A flaw was discovered in the Linux kernel's audit subsystem when auditing
certain syscalls. A local attacker could exploit this flaw to obtain
potentially sensitive single-bit values from kernel memory or cause a
denial of service (OOPS). (CVE-2014-3917)

Don Bailey discovered a flaw in the LZO decompress algorithm used by the
Linux kernel. An attacker could exploit this flaw to cause a denial of
service (memory corruption or OOPS). (CVE-2014-4608)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2281-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2281-1/");
  script_tag(name:"summary", value:"Check for the Version of linux-ec2");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU10\.04 LTS");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-368-ec2", ver:"2.6.32-368.84", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
