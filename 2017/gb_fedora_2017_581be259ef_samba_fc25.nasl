###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_581be259ef_samba_fc25.nasl 11771 2018-10-08 05:52:02Z asteins $
#
# Fedora Update for samba FEDORA-2017-581be259ef
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
  script_oid("1.3.6.1.4.1.25623.1.0.873488");
  script_version("$Revision: 11771 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-08 07:52:02 +0200 (Mon, 08 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-10-07 09:16:11 +0200 (Sat, 07 Oct 2017)");
  script_cve_id("CVE-2017-12150", "CVE-2017-12151", "CVE-2017-12163");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for samba FEDORA-2017-581be259ef");
  script_tag(name: "summary", value: "Check the version of samba");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Samba is the standard Windows interoperability 
suite of programs for Linux and Unix.");
  script_tag(name: "affected", value: "samba on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-581be259ef");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/XLQWVMPVT6Q4OD7F4QRLRBGEGCJKSOOJ");
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

if(release == "FC25")
{

  if ((res = isrpmvuln(pkg:"samba", rpm:"samba~4.5.14~0.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
