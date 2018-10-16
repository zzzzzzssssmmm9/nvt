###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2384_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for mysql-5.5 USN-2384-1
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.842009");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2014-10-16 06:00:46 +0200 (Thu, 16 Oct 2014)");
  script_cve_id("CVE-2012-5615", "CVE-2014-4274", "CVE-2014-4287", "CVE-2014-6463",
                "CVE-2014-6464", "CVE-2014-6469", "CVE-2014-6478", "CVE-2014-6484",
                "CVE-2014-6491", "CVE-2014-6494", "CVE-2014-6495", "CVE-2014-6496",
                "CVE-2014-6500", "CVE-2014-6505", "CVE-2014-6507", "CVE-2014-6520",
                "CVE-2014-6530", "CVE-2014-6551", "CVE-2014-6555", "CVE-2014-6559");
  script_tag(name:"cvss_base", value:"8.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:C");
  script_name("Ubuntu Update for mysql-5.5 USN-2384-1");

  script_tag(name:"summary", value:"Check the version of mysql-5.5");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple security issues were discovered in
MySQL and this update includes a new upstream MySQL version to fix these issues.
MySQL has been updated to 5.5.40.

In addition to security fixes, the updated packages contain bug fixes,
new features, and possibly incompatible changes.

Please see the following for more information:
http://dev.mysql.com/doc/relnotes/mysql/5.5/en/news-5-5-39.html
http://dev.mysql.com/doc/relnotes/mysql/5.5/en/news-5-5-40.html
http://www.oracle.com/technetwork/topics/security/cpuoct2014-1972960.html");
  script_tag(name:"affected", value:"mysql-5.5 on Ubuntu 14.04 LTS,
  Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2384-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2384-1/");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|12\.04 LTS)");
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

  if ((res = isdpkgvuln(pkg:"mysql-server-5.5", ver:"5.5.40-0ubuntu0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"mysql-server-5.5", ver:"5.5.40-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
