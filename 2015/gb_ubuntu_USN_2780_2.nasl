###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for miniupnpc USN-2780-2
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.842502");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2015-10-26 15:33:24 +0100 (Mon, 26 Oct 2015)");
  script_cve_id("CVE-2015-6031");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for miniupnpc USN-2780-2");
  script_tag(name:"summary", value:"Check the version of miniupnpc");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"USN-2780-1 fixed a vulnerability in the
MiniUPnP library in Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, and Ubuntu 15.04. This
update provides the corresponding update for Ubuntu 15.10.

Original advisory details:

Aleksandar Nikolic discovered a buffer overflow vulnerability in the
XML parser functionality of the MiniUPnP library. A remote attacker
could use this to cause a denial of service (application crash) or
possibly execute arbitrary code with privileges of the user running
an application that uses the MiniUPnP library.");
  script_tag(name:"affected", value:"miniupnpc on Ubuntu 15.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"USN", value:"2780-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2780-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU15\.10");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU15.10")
{

  if ((res = isdpkgvuln(pkg:"libminiupnpc10:amd64", ver:"1.9.20140610-2ubuntu2", rls:"UBUNTU15.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libminiupnpc10:i386", ver:"1.9.20140610-2ubuntu2", rls:"UBUNTU15.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }


  if (__pkg_match) exit(99);
  exit(0);
}
