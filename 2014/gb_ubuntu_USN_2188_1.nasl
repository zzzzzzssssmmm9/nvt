###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2188_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for elfutils USN-2188-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.841793");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2014-05-05 11:24:12 +0530 (Mon, 05 May 2014)");
  script_cve_id("CVE-2014-0172");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("Ubuntu Update for elfutils USN-2188-1");


  script_tag(name:"affected", value:"elfutils on Ubuntu 14.04 LTS,
  Ubuntu 13.10,
  Ubuntu 12.10");
  script_tag(name:"insight", value:"Florian Weimer discovered that the elfutils libdw library
incorrectly handled malformed compressed debug sections in ELF files. If a user
or automated system were tricked into processing a specially crafted ELF file,
applications linked against libdw could be made to crash, or possibly
execute arbitrary code.");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2188-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2188-1/");
  script_tag(name:"summary", value:"Check for the Version of elfutils");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|13\.10|12\.10)");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libdw1:i386", ver:"0.158-0ubuntu5.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU13.10")
{

  if ((res = isdpkgvuln(pkg:"libdw1:i386", ver:"0.157-1ubuntu1.1", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.10")
{

  if ((res = isdpkgvuln(pkg:"libdw1", ver:"0.153-1ubuntu1.1", rls:"UBUNTU12.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
