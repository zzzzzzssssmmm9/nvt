###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3452_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for ceph USN-3452-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843337");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-10-12 10:27:28 +0200 (Thu, 12 Oct 2017)");
  script_cve_id("CVE-2016-5009", "CVE-2016-7031", "CVE-2016-8626", "CVE-2016-9579");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for ceph USN-3452-1");
  script_tag(name:"summary", value:"Check the version of ceph");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that Ceph incorrectly
  handled the handle_command function. A remote authenticated user could use this
  issue to cause Ceph to crash, resulting in a denial of service. (CVE-2016-5009)
  Rahul Aggarwal discovered that Ceph incorrectly handled the authenticated-read
  ACL. A remote attacker could possibly use this issue to list bucket contents via
  a URL. (CVE-2016-7031) Diluga Salome discovered that Ceph incorrectly handled
  certain POST objects with null conditions. A remote attacker could possibly use
  this issue to cuase Ceph to crash, resulting in a denial of service.
  (CVE-2016-8626) Yang Liu discovered that Ceph incorrectly handled invalid HTTP
  Origin headers. A remote attacker could possibly use this issue to cuase Ceph to
  crash, resulting in a denial of service. (CVE-2016-9579)");
  script_tag(name:"affected", value:"ceph on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3452-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3452-1/");
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

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"ceph", ver:"0.80.11-0ubuntu1.14.04.3", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ceph-common", ver:"0.80.11-0ubuntu1.14.04.3", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
