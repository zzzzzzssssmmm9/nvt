###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_5dd9b12179_python-dulwich_fc27.nasl 8203 2017-12-21 05:55:19Z cfischer $
#
# Fedora Update for python-dulwich FEDORA-2017-5dd9b12179
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
  script_oid("1.3.6.1.4.1.25623.1.0.873921");
  script_version("$Revision: 8203 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-21 06:55:19 +0100 (Thu, 21 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-12-16 07:46:30 +0100 (Sat, 16 Dec 2017)");
  script_cve_id("CVE-2017-16228");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for python-dulwich FEDORA-2017-5dd9b12179");
  script_tag(name: "summary", value: "Check the version of python-dulwich");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Dulwich is a pure-Python implementation of 
the Git file formats and protocols. The project is named after the village in which 
Mr. and Mrs. Git live in the Monty Python sketch.");
  script_tag(name: "affected", value: "python-dulwich on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-5dd9b12179");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/P3XHUJ4VX7IXGBWKNXIG3JP4Y6TPE2QF");
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

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"python2-dulwich", rpm:"python2-dulwich~0.18.6~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
