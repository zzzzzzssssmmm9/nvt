###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_6679a0a2e1_freexl_fc26.nasl 7227 2017-09-22 06:36:11Z santu $
#
# Fedora Update for freexl FEDORA-2017-6679a0a2e1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.873384");
  script_version("$Revision: 7227 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-22 08:36:11 +0200 (Fri, 22 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-09-18 07:35:36 +0200 (Mon, 18 Sep 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for freexl FEDORA-2017-6679a0a2e1");
  script_tag(name: "summary", value: "Check the version of freexl");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "FreeXL is a library to extract valid data
from within an Excel spreadsheet (.xls)

Design goals:
    * simple and lightweight
    * stable, robust and efficient
    * easily and universally portable
    * completely ignore any GUI-related oddity
");
  script_tag(name: "affected", value: "freexl on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-6679a0a2e1");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BZX64SEZIIKP3LYW4G4HQMHWABUBYWMD");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"freexl", rpm:"freexl~1.0.4~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}