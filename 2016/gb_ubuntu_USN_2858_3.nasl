###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-raspi2 USN-2858-3
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
  script_oid("1.3.6.1.4.1.25623.1.0.842586");
  script_version("$Revision: 9653 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:15:50 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2016-01-07 05:01:44 +0100 (Thu, 07 Jan 2016)");
  script_cve_id("CVE-2015-8660");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-raspi2 USN-2858-3");
  script_tag(name: "summary", value: "Check the version of linux-raspi2");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "Nathan Williams discovered that overlayfs
  in the Linux kernel incorrectly handled setattr operations. A local
  unprivileged attacker could use this to create files with administrative
  permission attributes and execute arbitrary code with elevated privileges.");
  script_tag(name: "affected", value: "linux-raspi2 on Ubuntu 15.10");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "2858-3");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2858-3/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU15\.10");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU15.10")
{

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-1018-raspi2", ver:"4.2.0-1018.25", rls:"UBUNTU15.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
