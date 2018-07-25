###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3480_2.nasl 9654 2018-04-27 09:20:40Z cfischer $
#
# Ubuntu Update for apport USN-3480-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.843368");
  script_version("$Revision: 9654 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:20:40 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2017-11-21 07:31:03 +0100 (Tue, 21 Nov 2017)");
  script_cve_id("CVE-2017-14177", "CVE-2017-14180");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for apport USN-3480-2");
  script_tag(name: "summary", value: "Check the version of apport");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "USN-3480-1 fixed vulnerabilities in Apport.
  The fix for CVE-2017-14177 introduced a regression in the ability to handle
  crashes for users that configured their systems to use the Upstart init system
  in Ubuntu 16.04 LTS and Ubuntu 17.04. The fix for CVE-2017-14180 temporarily
  disabled crash forwarding to containers. This update addresses the problems. We
  apologize for the inconvenience. Original advisory details: Sander Bos
  discovered that Apport incorrectly handled core dumps for setuid binaries. A
  local attacker could use this issue to perform a denial of service via resource
  exhaustion or possibly gain root privileges. (CVE-2017-14177) Sander Bos
  discovered that Apport incorrectly handled core dumps for processes in a
  different PID namespace. A local attacker could use this issue to perform a
  denial of service via resource exhaustion or possibly gain root privileges.
  (CVE-2017-14180)");
  script_tag(name: "affected", value: "apport on Ubuntu 17.10 ,
  Ubuntu 17.04 ,
  Ubuntu 16.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3480-2");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3480-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(17\.10|17\.04|16\.04 LTS)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU17.10")
{

  if ((res = isdpkgvuln(pkg:"apport", ver:"2.20.7-0ubuntu3.5", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"apport", ver:"2.20.4-0ubuntu4.8", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"apport", ver:"2.20.1-0ubuntu2.13", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
