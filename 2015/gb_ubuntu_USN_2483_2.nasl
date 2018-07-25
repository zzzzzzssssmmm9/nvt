###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for ghostscript USN-2483-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.842075");
  script_version("$Revision: 9652 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:09:48 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2015-01-27 05:50:46 +0100 (Tue, 27 Jan 2015)");
  script_cve_id("CVE-2014-8137", "CVE-2014-8138", "CVE-2014-8157", "CVE-2014-8158");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Ubuntu Update for ghostscript USN-2483-2");
  script_tag(name: "summary", value: "Check the version of ghostscript");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "USN-2483-1 fixed vulnerabilities in JasPer.
This update provides the corresponding fix for the JasPer library embedded in the
Ghostscript package.

Original advisory details:

Jose Duart discovered that JasPer incorrectly handled ICC color profiles in
JPEG-2000 image files. If a user were tricked into opening a specially
crafted JPEG-2000 image file, a remote attacker could cause JasPer to crash
or possibly execute arbitrary code with user privileges. (CVE-2014-8137)
Jose Duart discovered that JasPer incorrectly decoded certain malformed
JPEG-2000 image files. If a user were tricked into opening a specially
crafted JPEG-2000 image file, a remote attacker could cause JasPer to crash
or possibly execute arbitrary code with user privileges. (CVE-2014-8138)
It was discovered that JasPer incorrectly handled certain malformed
JPEG-2000 image files. If a user were tricked into opening a specially
crafted JPEG-2000 image file, a remote attacker could cause JasPer to crash
or possibly execute arbitrary code with user privileges. (CVE-2014-8157)
It was discovered that JasPer incorrectly handled memory when processing
JPEG-2000 image files. If a user were tricked into opening a specially
crafted JPEG-2000 image file, a remote attacker could cause JasPer to crash
or possibly execute arbitrary code with user privileges. (CVE-2014-8158)");
  script_tag(name: "affected", value: "ghostscript on Ubuntu 10.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "USN", value: "2483-2");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2483-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU10\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libgs8", ver:"8.71.dfsg.1-0ubuntu5.7", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
