###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for pulp-docker FEDORA-2016-f9db2293a8
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
  script_oid("1.3.6.1.4.1.25623.1.0.808430");
  script_version("$Revision: 6631 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:36:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-06-08 15:40:36 +0200 (Wed, 08 Jun 2016)");
  script_cve_id("CVE-2016-3111");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for pulp-docker FEDORA-2016-f9db2293a8");
  script_tag(name: "summary", value: "Check the version of pulp-docker");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Provides a collection of Pulp server plugins and admin client extensions to
support Docker content.
");
  script_tag(name: "affected", value: "pulp-docker on Fedora 24");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-f9db2293a8");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DO5AN3MOSMX2JBKUS2RNIJI4ALIA3HUL");
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

if(release == "FC24")
{

  if ((res = isrpmvuln(pkg:"pulp-docker", rpm:"pulp-docker~2.0.1~1.fc24", rls:"FC24")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
