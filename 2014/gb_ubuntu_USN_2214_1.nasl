###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2214_1.nasl 9651 2018-04-27 08:59:56Z cfischer $
#
# Ubuntu Update for libxml2 USN-2214-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.841826");
  script_version("$Revision: 9651 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 10:59:56 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-05-19 11:25:10 +0530 (Mon, 19 May 2014)");
  script_cve_id("CVE-2014-0191");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_name("Ubuntu Update for libxml2 USN-2214-1");


  script_tag(name : "affected" , value : "libxml2 on Ubuntu 14.04 LTS ,
  Ubuntu 13.10 ,
  Ubuntu 12.10 ,
  Ubuntu 12.04 LTS ,
  Ubuntu 10.04 LTS");
  script_tag(name : "insight" , value : "Daniel Berrange discovered that libxml2 would incorrectly
perform entity substitution even when requested not to. If a user or automated
system were tricked into opening a specially crafted document, an attacker
could possibly cause resource consumption, resulting in a denial of service.");
  script_tag(name : "solution" , value : "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "2214-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2214-1/");
  script_tag(name:"summary", value:"Check for the Version of libxml2");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|12\.04 LTS|10\.04 LTS|13\.10|12\.10)");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libxml2:i386", ver:"2.9.1+dfsg1-3ubuntu4.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libxml2", ver:"2.7.8.dfsg-5.1ubuntu4.7", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libxml2", ver:"2.7.6.dfsg-1ubuntu1.11", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU13.10")
{

  if ((res = isdpkgvuln(pkg:"libxml2:i386", ver:"2.9.1+dfsg1-3ubuntu2.1", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.10")
{

  if ((res = isdpkgvuln(pkg:"libxml2", ver:"2.8.0+dfsg1-5ubuntu2.5", rls:"UBUNTU12.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
