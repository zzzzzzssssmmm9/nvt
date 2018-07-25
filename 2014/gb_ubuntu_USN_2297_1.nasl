###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2297_1.nasl 9651 2018-04-27 08:59:56Z cfischer $
#
# Ubuntu Update for acpi-support USN-2297-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.841908");
  script_version("$Revision: 9651 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 10:59:56 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-07-28 16:38:09 +0530 (Mon, 28 Jul 2014)");
  script_cve_id("CVE-2014-1419");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for acpi-support USN-2297-1");


  script_tag(name : "affected" , value : "acpi-support on Ubuntu 12.04 LTS");
  script_tag(name : "insight" , value : "CESG discovered that acpi-support incorrectly handled certain
privileged operations when checking for power management daemons. A local
attacker could use this flaw to execute arbitrary code and elevate privileges
to root.");
  script_tag(name : "solution" , value : "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "2297-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2297-1/");
  script_tag(name:"summary", value:"Check for the Version of acpi-support");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU12\.04 LTS");
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

  if ((res = isdpkgvuln(pkg:"acpi-support", ver:"0.140.2", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
