###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_b73bfea3af_boost_fc26.nasl 9691 2018-05-02 11:26:19Z santu $
#
# Fedora Update for boost FEDORA-2018-b73bfea3af
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
  script_oid("1.3.6.1.4.1.25623.1.0.874401");
  script_version("$Revision: 9691 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-02 13:26:19 +0200 (Wed, 02 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-02 16:58:55 +0530 (Wed, 02 May 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for boost FEDORA-2018-b73bfea3af");
  script_tag(name: "summary", value: "Check the version of boost");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Boost provides free peer-reviewed portable C++ 
source libraries.  The emphasis is on libraries which work well with the C++ Standard
Library, in the hopes of establishing 'existing practice' for extensions and 
providing reference implementations so that the Boost libraries are suitable for 
eventual standardization. (Some of the libraries have already been included in the 
C++ 2011 standard and others have been proposed to the C++ Standards Committee for 
inclusion in future standards.)
");
  script_tag(name: "affected", value: "boost on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-b73bfea3af");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/TRTGKWDNWDRFHSSG66LIXZIO27GHRU5Z");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"boost", rpm:"boost~1.63.0~12.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}