###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3690_2.nasl 10556 2018-07-20 11:13:07Z cfischer $
#
# Ubuntu Update for amd64-microcode USN-3690-2
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843581");
  script_version("$Revision: 10556 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-20 13:13:07 +0200 (Fri, 20 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-06 05:49:44 +0200 (Fri, 06 Jul 2018)");
  script_cve_id("CVE-2017-5715");
  script_tag(name:"cvss_base", value:"4.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for amd64-microcode USN-3690-2");
  script_tag(name:"summary", value:"Check the version of amd64-microcode");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"USN-3690-1 provided updated microcode for AMD processors to address
CVE-2017-5715 (aka Spectre). Unfortunately, the update caused some
systems to fail to boot. This update reverts the update for Ubuntu
14.04 LTS.

We apologize for the inconvenience.

Original advisory details:

Jann Horn discovered that microprocessors utilizing speculative execution
and branch prediction may allow unauthorized memory reads via sidechannel
attacks. This flaw is known as Spectre. A local attacker could use this to
expose sensitive information, including kernel memory.

This update provides the microcode updates for AMD 17H family
processors required for the corresponding Linux kernel updates.");
  script_tag(name:"affected", value:"amd64-microcode on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"USN", value:"3690-2");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3690-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"amd64-microcode", ver:"3.20180524.1~ubuntu0.14.04.2+really20130710.1", rls:"UBUNTU14.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
