###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for cups-filters USN-2725-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842454");
  script_version("$Revision: 9652 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:09:48 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2015-09-18 10:43:49 +0200 (Fri, 18 Sep 2015)");
  script_cve_id("CVE-2015-6520");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for cups-filters USN-2725-1");
  script_tag(name: "summary", value: "Check the version of cups-filters");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "Seth Arnold discovered that ippusbxd in
the cups-filters package would incorrectly listen to all configured network
interfaces. A remote attacker could use this issue to possibly access
locally-connected printers.");
  script_tag(name: "affected", value: "cups-filters on Ubuntu 15.04");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "USN", value: "2725-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2725-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU15\.04");
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

  if ((res = isdpkgvuln(pkg:"cups-filters-ippusbxd", ver:"1.0.67-0ubuntu2.4", rls:"UBUNTU15.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}