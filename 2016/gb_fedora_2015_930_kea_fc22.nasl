###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for kea FEDORA-2015-930
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
  script_oid("1.3.6.1.4.1.25623.1.0.806937");
  script_version("$Revision: 6632 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:48:18 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-01-08 06:29:49 +0100 (Fri, 08 Jan 2016)");
  script_cve_id("CVE-2015-8373");
  script_tag(name:"cvss_base", value:"7.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for kea FEDORA-2015-930");
  script_tag(name: "summary", value: "Check the version of kea");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "DHCP implementation from Internet Systems
  Consortium, Inc. that features fully functional DHCPv4, DHCPv6 and Dynamic DNS
  servers. Both DHCP servers fully support server discovery, address assignment,
  renewal, rebinding and release. The DHCPv6 server supports prefix delegation.
  Both servers support DNS Update mechanism, using stand-alone DDNS daemon.");

  script_tag(name: "affected", value: "kea on Fedora 22");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2015-930");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2016-January/175218.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC22")
{

  if ((res = isrpmvuln(pkg:"kea", rpm:"kea~0.9.2~2.fc22", rls:"FC22")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
