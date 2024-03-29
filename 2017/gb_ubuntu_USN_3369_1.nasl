###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3369_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for freeradius USN-3369-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843261");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-07-28 07:24:26 +0200 (Fri, 28 Jul 2017)");
  script_cve_id("CVE-2017-10978", "CVE-2017-10979", "CVE-2017-10980", "CVE-2017-10981",
                "CVE-2017-10982", "CVE-2017-10983", "CVE-2017-10984", "CVE-2017-10985",
                "CVE-2017-10986", "CVE-2017-10987");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for freeradius USN-3369-1");
  script_tag(name:"summary", value:"Check the version of freeradius");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Guido Vranken discovered that FreeRADIUS
  incorrectly handled memory when decoding packets. A remote attacker could use
  this issue to cause FreeRADIUS to crash or hang, resulting in a denial of
  service, or possibly execute arbitrary code.");
  script_tag(name:"affected", value:"freeradius on Ubuntu 17.04,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3369-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3369-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|17\.04|16\.04 LTS)");
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

  if ((res = isdpkgvuln(pkg:"freeradius", ver:"2.1.12+dfsg-1.2ubuntu8.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"freeradius", ver:"3.0.12+dfsg-4ubuntu1.2", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"freeradius", ver:"2.2.8+dfsg-0.1ubuntu0.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
