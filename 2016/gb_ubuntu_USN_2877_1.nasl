###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for oxide-qt USN-2877-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842619");
  script_version("$Revision: 9653 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:15:50 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2016-01-28 06:33:14 +0100 (Thu, 28 Jan 2016)");
  script_cve_id("CVE-2016-1612", "CVE-2016-1614", "CVE-2016-1617", "CVE-2016-1618",
                "CVE-2016-1620", "CVE-2016-2051", "CVE-2016-2052");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for oxide-qt USN-2877-1");
  script_tag(name: "summary", value: "Check the version of oxide-qt");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "A bad cast was discovered in V8. If
  a user were tricked in to opening a specially crafted website, an attacker
  could potentially exploit this to cause a denial of service via renderer
  crash or execute arbitrary code with the privileges of the sandboxed
  render process. (CVE-2016-1612)

  An issue was discovered when initializing the UnacceleratedImageBufferSurface
  class in Blink. If a user were tricked in to opening a specially crafted
  website, an attacker could potentially exploit this to obtain sensitive
  information. (CVE-2016-1614)

  An issue was discovered with the CSP implementation in Blink. If a user
  were tricked in to opening a specially crafted website, an attacker could
  potentially exploit this to determine whether specific HSTS sites had been
  visited by reading a CSP report. (CVE-2016-1617)

  An issue was discovered with random number generator in Blink. An attacker
  could potentially exploit this to defeat cryptographic protection
  mechanisms. (CVE-2016-1618)

  Multiple security issues were discovered in Chromium. If a user were
  tricked in to opening a specially crafted website, an attacker could
  potentially exploit these to read uninitialized memory, cause a denial
  of service via application crash or execute arbitrary code with the
  privileges of the user invoking the program. (CVE-2016-1620)

  Multiple security issues were discovered in V8. If a user were tricked
  in to opening a specially crafted website, an attacker could potentially
  exploit these to read uninitialized memory, cause a denial of service via
  renderer crash or execute arbitrary code with the privileges of the
  sandboxed render process. (CVE-2016-2051)

  Multiple security issues were discovered in Harfbuzz. If a user were
  tricked in to opening a specially crafted website, an attacker could
  potentially exploit these to cause a denial of service via renderer
  crash or execute arbitrary code with the privileges of the sandboxed
  render process. (CVE-2016-2052)");
  script_tag(name: "affected", value: "oxide-qt on Ubuntu 15.10 ,
  Ubuntu 15.04 ,
  Ubuntu 14.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "2877-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2877-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(15\.04|14\.04 LTS|15\.10)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU15.04")
{

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:amd64", ver:"1.12.5-0ubuntu0.15.04.1", rls:"UBUNTU15.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:i386", ver:"1.12.5-0ubuntu0.15.04.1", rls:"UBUNTU15.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:amd64", ver:"1.12.5-0ubuntu0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:i386", ver:"1.12.5-0ubuntu0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU15.10")
{

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:amd64", ver:"1.12.5-0ubuntu0.15.10.1", rls:"UBUNTU15.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:i386", ver:"1.12.5-0ubuntu0.15.10.1", rls:"UBUNTU15.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }


  if (__pkg_match) exit(99);
  exit(0);
}
