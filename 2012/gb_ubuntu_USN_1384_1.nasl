###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1384_1.nasl 9649 2018-04-27 08:45:50Z cfischer $
#
# Ubuntu Update for linux-lts-backport-oneiric USN-1384-1
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
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-1384-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.840922");
  script_version("$Revision: 9649 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 10:45:50 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-03-07 11:20:07 +0530 (Wed, 07 Mar 2012)");
  script_cve_id("CVE-2011-4097", "CVE-2011-4127", "CVE-2011-4622", "CVE-2012-0038",
                "CVE-2012-0055", "CVE-2012-0207");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_xref(name: "USN", value: "1384-1");
  script_name("Ubuntu Update for linux-lts-backport-oneiric USN-1384-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU10\.04 LTS");
  script_tag(name : "summary" , value : "Ubuntu Update for Linux kernel vulnerabilities USN-1384-1");
  script_tag(name : "affected" , value : "linux-lts-backport-oneiric on Ubuntu 10.04 LTS");
  script_tag(name : "solution" , value : "Please Install the Updated Packages.");
  script_tag(name : "insight" , value : "A bug was discovered in the Linux kernel's calculation of OOM (Out of
  memory) scores, that would result in the wrong process being killed. A user
  could use this to kill the process with the highest OOM score, even if that
  process belongs to another user or the system. (CVE-2011-4097)

  Paolo Bonzini discovered a flaw in Linux's handling of the SG_IO ioctl
  command. A local user, or user in a VM could exploit this flaw to bypass
  restrictions and gain read/write access to all data on the affected block
  device. (CVE-2011-4127)

  A flaw was found in KVM's Programmable Interval Timer (PIT). When a virtual
  interrupt control is not available a local user could use this to cause a
  denial of service by starting a timer. (CVE-2011-4622)

  A flaw was discovered in the XFS filesystem. If a local user mounts a
  specially crafted XFS image it could potential execute arbitrary code on
  the system. (CVE-2012-0038)

  Andy Whitcroft discovered a that the Overlayfs filesystem was not doing the
  extended permission checks needed by cgroups and Linux Security Modules
  (LSMs). A local user could exploit this to by-pass security policy and
  access files that should not be accessible. (CVE-2012-0055)

  A flaw was found in the linux kernels IPv4 IGMP query processing. A remote
  attacker could exploit this to cause a denial of service. (CVE-2012-0207)");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-16-generic", ver:"3.0.0-16.29~lucid1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-16-generic-pae", ver:"3.0.0-16.29~lucid1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-16-server", ver:"3.0.0-16.29~lucid1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.0.0-16-virtual", ver:"3.0.0-16.29~lucid1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
