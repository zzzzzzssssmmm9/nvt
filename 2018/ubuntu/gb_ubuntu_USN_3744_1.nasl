###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3744_1.nasl 11043 2018-08-18 15:09:49Z cfischer $
#
# Ubuntu Update for postgresql-10 USN-3744-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843619");
  script_version("$Revision: 11043 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-18 17:09:49 +0200 (Sat, 18 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-17 05:57:27 +0200 (Fri, 17 Aug 2018)");
  script_cve_id("CVE-2018-10915", "CVE-2018-10925");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for postgresql-10 USN-3744-1");
  script_tag(name:"summary", value:"Check the version of postgresql-10");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Andrew Krasichkov discovered that the PostgreSQL
client library incorrectly reset its internal state between connections. A remote
attacker could possibly use this issue to bypass certain client-side connection security
features. This issue only affected Ubuntu 16.04 LTS and Ubuntu 18.04 LTS.
(CVE-2018-10915)

It was discovered that PostgreSQL incorrectly checked authorization on
certain statements. A remote attacker could possibly use this issue to
read arbitrary server memory or alter certain data. (CVE-2018-10925)");
  script_tag(name:"affected", value:"postgresql-10 on Ubuntu 18.04 LTS,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"USN", value:"3744-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3744-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|18\.04 LTS|16\.04 LTS)");
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

  if ((res = isdpkgvuln(pkg:"postgresql-9.3", ver:"9.3.24-0ubuntu0.14.04", rls:"UBUNTU14.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"postgresql-10", ver:"10.5-0ubuntu0.18.04", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"postgresql-9.5", ver:"9.5.14-0ubuntu0.16.04", rls:"UBUNTU16.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
