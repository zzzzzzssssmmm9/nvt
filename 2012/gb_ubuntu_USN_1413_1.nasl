###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1413_1.nasl 9649 2018-04-27 08:45:50Z cfischer $
#
# Ubuntu Update for nova USN-1413-1
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
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-1413-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.840973");
  script_tag(name:"cvss_base", value:"4.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
 script_version("$Revision: 9649 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 10:45:50 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-04-02 10:35:01 +0530 (Mon, 02 Apr 2012)");
  script_cve_id("CVE-2012-1585");
  script_xref(name: "USN", value: "1413-1");
  script_name("Ubuntu Update for nova USN-1413-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU11\.10");
  script_tag(name : "summary" , value : "Ubuntu Update for Linux kernel vulnerabilities USN-1413-1");
  script_tag(name : "affected" , value : "nova on Ubuntu 11.10");
  script_tag(name : "solution" , value : "Please Install the Updated Packages.");
  script_tag(name : "insight" , value : "Dan Prince discovered that Nova did not properly perform input validation on
  the length of server names. An authenticated attacker could issue requests
  using long server names to exhaust the storage resources containing the Nova
  API log file.");
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

if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"python-nova", ver:"2011.3-0ubuntu6.5", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
