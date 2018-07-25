###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1732_3.nasl 9650 2018-04-27 08:51:00Z cfischer $
#
# Ubuntu Update for openssl USN-1732-3
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-1732-3/");
  script_oid("1.3.6.1.4.1.25623.1.0.841378");
  script_version("$Revision: 9650 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 10:51:00 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-03-28 09:51:04 +0530 (Thu, 28 Mar 2013)");
  script_cve_id("CVE-2013-0169", "CVE-2012-2686");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "USN", value: "1732-3");
  script_name("Ubuntu Update for openssl USN-1732-3");

  script_tag(name:"summary", value:"Check for the Version of openssl");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(12\.04 LTS|12\.10)");
  script_tag(name : "affected" , value : "openssl on Ubuntu 12.10 ,
  Ubuntu 12.04 LTS");
  script_tag(name : "solution" , value : "Please Install the Updated Packages.");
  script_tag(name : "insight" , value : "USN-1732-1 fixed vulnerabilities in OpenSSL. The fix for CVE-2013-0169 and
  CVE-2012-2686 was reverted in USN-1732-2 because of a regression. This
  update restores the security fix, and includes an extra fix from upstream
  to address the AES-NI regression. We apologize for the inconvenience.

  Original advisory details:

  Adam Langley and Wolfgang Ettlingers discovered that OpenSSL incorrectly
  handled certain crafted CBC data when used with AES-NI. A remote attacker
  could use this issue to cause OpenSSL to crash, resulting in a denial of
  service. This issue only affected Ubuntu 12.04 LTS and Ubuntu 12.10.
  (CVE-2012-2686)
  Nadhem Alfardan and Kenny Paterson discovered that the TLS protocol as
  used
  in OpenSSL was vulnerable to a timing side-channel attack known as the
  &quot;Lucky Thirteen&quot; issue. A remote attacker could use this issue to perform
  plaintext-recovery attacks via analysis of timing data. (CVE-2013-0169)");
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

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libssl1.0.0", ver:"1.0.1-4ubuntu5.8", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.10")
{

  if ((res = isdpkgvuln(pkg:"libssl1.0.0", ver:"1.0.1c-3ubuntu2.3", rls:"UBUNTU12.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
