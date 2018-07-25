###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1496_1.nasl 9649 2018-04-27 08:45:50Z cfischer $
#
# Ubuntu Update for openoffice.org USN-1496-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-1496-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.841068");
  script_version("$Revision: 9649 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 10:45:50 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-03 10:26:04 +0530 (Tue, 03 Jul 2012)");
  script_cve_id("CVE-2011-2685", "CVE-2011-2713", "CVE-2012-1149", "CVE-2012-2334");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "USN", value: "1496-1");
  script_name("Ubuntu Update for openoffice.org USN-1496-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU10\.04 LTS");
  script_tag(name : "summary" , value : "Ubuntu Update for Linux kernel vulnerabilities USN-1496-1");
  script_tag(name : "affected" , value : "openoffice.org on Ubuntu 10.04 LTS");
  script_tag(name : "solution" , value : "Please Install the Updated Packages.");
  script_tag(name : "insight" , value : "A stack-based buffer overflow was discovered in the Lotus Word Pro import
  filter in OpenOffice.org. The default compiler options for affected
  releases should reduce the vulnerability to a denial of service.
  (CVE-2011-2685)

  Huzaifa Sidhpurwala discovered that OpenOffice.org could be made to crash
  if it opened a specially crafted Word document. (CVE-2011-2713)

  Integer overflows were discovered in the graphics loading code of several
  different image types. If a user were tricked into opening a specially
  crafted file, an attacker could cause OpenOffice.org to crash or possibly
  execute arbitrary code with the privileges of the user invoking the
  program. (CVE-2012-1149)

  Sven Jacobi discovered an integer overflow when processing Escher graphics
  records. If a user were tricked into opening a specially crafted PowerPoint
  file, an attacker could cause OpenOffice.org to crash or possibly execute
  arbitrary code with the privileges of the user invoking the program.
  (CVE-2012-2334)");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"openoffice.org-core", ver:"3.2.0-7ubuntu4.3", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
