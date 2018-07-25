###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for munin USN-3215-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.843073");
  script_version("$Revision: 9654 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:20:40 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2017-03-04 05:49:36 +0100 (Sat, 04 Mar 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for munin USN-3215-2");
  script_tag(name: "summary", value: "Check the version of munin");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "USN-3215-1 fixed a vulnerability in Munin.
  The upstream patch caused a regression leading to errors being appended to the
  log file. This update fixes the problem.

Original advisory details:

It was discovered that Munin incorrectly handled CGI graphs. A remote
attacker could use this issue to overwrite arbitrary files as the www-data
user.");
  script_tag(name: "affected", value: "munin on Ubuntu 14.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3215-2");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3215-2/");
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

  if ((res = isdpkgvuln(pkg:"munin", ver:"2.0.19-3ubuntu0.3", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}