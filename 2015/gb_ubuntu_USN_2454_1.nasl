###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for exiv2 USN-2454-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842069");
  script_version("$Revision: 9652 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:09:48 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2015-01-23 12:59:14 +0100 (Fri, 23 Jan 2015)");
  script_cve_id("CVE-2014-9449");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Ubuntu Update for exiv2 USN-2454-1");
  script_tag(name: "summary", value: "Check the version of exiv2");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "It was discovered that Exiv2 incorrectly
handled certain tag values in video files. If a user or automated system were
tricked into opening a specially-crafted video file, a remote attacker could cause
Exiv2 to crash, resulting in a denial of service.");
  script_tag(name: "affected", value: "exiv2 on Ubuntu 14.10");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "USN", value: "2454-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2454-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.10");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.10")
{

  if ((res = isdpkgvuln(pkg:"libexiv2-13:amd64", ver:"0.24-2ubuntu1.1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libexiv2-13:i386", ver:"0.24-2ubuntu1.1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
