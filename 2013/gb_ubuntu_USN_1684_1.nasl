###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1684_1.nasl 9650 2018-04-27 08:51:00Z cfischer $
#
# Ubuntu Update for linux-ec2 USN-1684-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-1684-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.841271");
  script_version("$Revision: 9650 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 10:51:00 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-01-11 16:49:32 +0530 (Fri, 11 Jan 2013)");
  script_cve_id("CVE-2012-4530");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:N/A:N");
  script_xref(name: "USN", value: "1684-1");
  script_name("Ubuntu Update for linux-ec2 USN-1684-1");

  script_tag(name: "summary" , value: "Check for the Version of linux-ec2");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU10\.04 LTS");
  script_tag(name : "affected" , value : "linux-ec2 on Ubuntu 10.04 LTS");
  script_tag(name : "insight" , value : "A flaw was discovered in the Linux kernel's handling of script execution
  when module loading is enabled. A local attacker could exploit this flaw to
  cause a leak of kernel stack contents.");
  script_tag(name : "solution" , value : "Please Install the Updated Packages.");
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

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-350-ec2", ver:"2.6.32-350.59", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
