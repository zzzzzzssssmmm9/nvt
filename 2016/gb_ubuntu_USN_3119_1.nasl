###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for bind9 USN-3119-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842937");
  script_version("$Revision: 9653 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:15:50 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2016-11-08 15:52:42 +0530 (Tue, 08 Nov 2016)");
  script_cve_id("CVE-2016-8864");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for bind9 USN-3119-1");
  script_tag(name: "summary", value: "Check the version of bind9");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "Tony Finch and Marco Davids discovered
  that Bind incorrectly handled certain responses containing a DNAME answer.
  A remote attacker could possibly use this issue to cause Bind to crash, resulting
  in a denial of service.");
  script_tag(name: "affected", value: "bind9 on Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS,
  Ubuntu 16.10,
  Ubuntu 12.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3119-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3119-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|12\.04 LTS|16\.04 LTS|16\.10)");
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

  if ((res = isdpkgvuln(pkg:"bind9", ver:"1:9.9.5.dfsg-3ubuntu0.10", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"bind9", ver:"1:9.8.1.dfsg.P1-4ubuntu0.19", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"bind9", ver:"1:9.10.3.dfsg.P4-8ubuntu1.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.10")
{

  if ((res = isdpkgvuln(pkg:"bind9", ver:"1:9.10.3.dfsg.P4-10.1ubuntu1.1", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
