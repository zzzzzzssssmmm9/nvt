###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2109_1.nasl 9651 2018-04-27 08:59:56Z cfischer $
#
# Ubuntu Update for linux USN-2109-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.841713");
  script_version("$Revision: 9651 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 10:59:56 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-02-20 15:13:24 +0530 (Thu, 20 Feb 2014)");
  script_cve_id("CVE-2013-2929", "CVE-2013-4345", "CVE-2013-4587", "CVE-2013-6367",
                "CVE-2013-6380", "CVE-2013-6382", "CVE-2013-7263", "CVE-2013-7264",
                "CVE-2013-7265", "CVE-2013-7266", "CVE-2013-7267", "CVE-2013-7268",
                "CVE-2013-7269", "CVE-2013-7270", "CVE-2013-7271", "CVE-2013-7281");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux USN-2109-1");


  script_tag(name : "affected" , value : "linux on Ubuntu 12.04 LTS");
  script_tag(name : "insight" , value : "Vasily Kulikov reported a flaw in the Linux kernel's implementation of
ptrace. An unprivileged local user could exploit this flaw to obtain
sensitive information from kernel memory. (CVE-2013-2929)

Stephan Mueller reported an error in the Linux kernel's ansi cprng random
number generator. This flaw makes it easier for a local attacker to break
cryptographic protections. (CVE-2013-4345)

Andrew Honig reported a flaw in the Linux Kernel's kvm_vm_ioctl_create_vcpu
function of the Kernel Virtual Machine (KVM) subsystem. A local user could
exploit this flaw to gain privileges on the host machine. (CVE-2013-4587)

Andrew Honig reported a flaw in the apic_get_tmcct function of the Kernel
Virtual Machine (KVM) subsystem if the Linux kernel. A guest OS user could
exploit this flaw to cause a denial of service or host OS system crash.
(CVE-2013-6367)

Nico Golde and Fabian Yamaguchi reported a flaw in the driver for Adaptec
AACRAID scsi raid devices in the Linux kernel. A local user could use this
flaw to cause a denial of service or possibly other unspecified impact.
(CVE-2013-6380)

Nico Golde and Fabian Yamaguchi reported buffer underflow errors in the
implementation of the XFS filesystem in the Linux kernel. A local user with
CAP_SYS_ADMIN could exploit these flaw to cause a denial of service (memory
corruption) or possibly other unspecified issues. (CVE-2013-6382)

mpd reported an information leak in the recvfrom, recvmmsg, and recvmsg
system calls in the Linux kernel. An unprivileged local user could exploit
this flaw to obtain sensitive information from kernel stack memory.
(CVE-2013-7263)

mpb reported an information leak in the Layer Two Tunneling Protocol (l2tp)
of the Linux kernel. A local user could exploit this flaw to obtain
sensitive information from kernel stack memory. (CVE-2013-7264)

mpb reported an information leak in the Phone Network protocol (phonet) in
the Linux kernel. A local user could exploit this flaw to obtain sensitive
information from kernel stack memory. (CVE-2013-7265)

An information leak was discovered in the recvfrom, recvmmsg, and recvmsg
systemcalls when used with ISDN sockets in the Linux kernel. A local user
could exploit this leak to obtain potentially sensitive information from
kernel memory. (CVE-2013-7266)

An information leak was discovered in the recvfrom, recvmmsg, and recvmsg
systemcalls when used with apple talk sockets in the Linux kernel. A local
user could exploit this leak to obtain potentially sensitive information
from kernel memory. (CVE-2013-7267)

An information leak was discovered in the recvfrom, recvmmsg, and recvmsg
systemcalls when used ...

  Description truncated, for more information please check the Reference URL");
  script_tag(name : "solution" , value : "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "2109-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2109-1/");
  script_tag(name:"summary", value:"Check for the Version of linux");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU12\.04 LTS");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-59-generic", ver:"3.2.0-59.90", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-59-generic-pae", ver:"3.2.0-59.90", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-59-highbank", ver:"3.2.0-59.90", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-59-omap", ver:"3.2.0-59.90", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-59-powerpc-smp", ver:"3.2.0-59.90", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-59-powerpc64-smp", ver:"3.2.0-59.90", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-59-virtual", ver:"3.2.0-59.90", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
