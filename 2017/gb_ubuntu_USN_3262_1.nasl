###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for curl USN-3262-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843136");
  script_version("$Revision: 11520 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 14:52:31 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2017-04-24 10:35:37 +0200 (Mon, 24 Apr 2017)");
  script_cve_id("CVE-2017-7468");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for curl USN-3262-1");
  script_tag(name:"summary", value:"Check the version of curl");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that curl incorrectly
handled client certificates when resuming a TLS session. A remote attacker could
use this to hijack a previously authenticated connection.");
  script_tag(name:"affected", value:"curl on Ubuntu 17.04");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3262-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3262-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU17\.04");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"curl", ver:"7.52.1-4ubuntu1.1", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libcurl3:amd64", ver:"7.52.1-4ubuntu1.1", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }
  if ((res = isdpkgvuln(pkg:"libcurl3:i386", ver:"7.52.1-4ubuntu1.1", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libcurl3-gnutls:amd64", ver:"7.52.1-4ubuntu1.1", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libcurl3-gnutls:i386", ver:"7.52.1-4ubuntu1.1", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libcurl3-nss:amd64", ver:"7.52.1-4ubuntu1.1", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libcurl3-nss:i386", ver:"7.52.1-4ubuntu1.1", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
