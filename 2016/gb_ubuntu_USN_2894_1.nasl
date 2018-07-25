###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for postgresql-9.4 USN-2894-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842636");
  script_version("$Revision: 9653 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:15:50 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2016-02-12 06:15:17 +0100 (Fri, 12 Feb 2016)");
  script_cve_id("CVE-2016-0773", "CVE-2016-0766");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for postgresql-9.4 USN-2894-1");
  script_tag(name: "summary", value: "Check the version of postgresql-9.4");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "It was discovered that PostgreSQL incorrectly
  handled certain regular expressions. A remote attacker could possibly use this
  issue to cause PostgreSQL to crash, resulting in a denial of service. (CVE-2016-0773)

  It was discovered that PostgreSQL incorrectly handled certain configuration
  settings (GUCS) for users of PL/Java. A remote attacker could possibly use
  this issue to escalate privileges. (CVE-2016-0766)");
  script_tag(name: "affected", value: "postgresql-9.4 on Ubuntu 15.10 ,
  Ubuntu 14.04 LTS ,
  Ubuntu 12.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "2894-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2894-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|12\.04 LTS|15\.10)");
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

  if ((res = isdpkgvuln(pkg:"postgresql-9.3", ver:"9.3.11-0ubuntu0.14.04", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"postgresql-9.1", ver:"9.1.20-0ubuntu0.12.04", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU15.10")
{

  if ((res = isdpkgvuln(pkg:"postgresql-9.4", ver:"9.4.6-0ubuntu0.15.10", rls:"UBUNTU15.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}