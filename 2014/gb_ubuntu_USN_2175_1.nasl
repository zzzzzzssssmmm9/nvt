###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2175_1.nasl 9651 2018-04-27 08:59:56Z cfischer $
#
# Ubuntu Update for linux-lts-quantal USN-2175-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.841788");
  script_version("$Revision: 9651 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 10:59:56 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-05-02 10:10:47 +0530 (Fri, 02 May 2014)");
  script_cve_id("CVE-2014-0049", "CVE-2014-0069");
  script_tag(name:"cvss_base", value:"7.4");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:S/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux-lts-quantal USN-2175-1");


  script_tag(name : "affected" , value : "linux-lts-quantal on Ubuntu 12.04 LTS");
  script_tag(name : "insight" , value : "A flaw was discovered in the Kernel Virtual Machine (KVM)
subsystem of the Linux kernel. A guest OS user could exploit this flaw to
execute arbitrary code on the host OS. (CVE-2014-0049)

Al Viro discovered an error in how CIFS in the Linux kernel handles
uncached write operations. An unprivileged local user could exploit this
flaw to cause a denial of service (system crash), obtain sensitive
information from kernel memory, or possibly gain privileges.
(CVE-2014-0069)");
  script_tag(name : "solution" , value : "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "2175-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2175-1/");
  script_tag(name:"summary", value:"Check for the Version of linux-lts-quantal");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.5.0-49-generic", ver:"3.5.0-49.73~precise1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
