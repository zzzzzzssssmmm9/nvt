###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_8344cb89ac_yara_fc28.nasl 11292 2018-09-10 03:14:17Z ckuersteiner $
#
# Fedora Update for yara FEDORA-2018-8344cb89ac
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
  script_oid("1.3.6.1.4.1.25623.1.0.875034");
  script_version("$Revision: 11292 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-10 05:14:17 +0200 (Mon, 10 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-06 07:30:22 +0200 (Thu, 06 Sep 2018)");
  script_cve_id("CVE-2018-12034", "CVE-2018-12035");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for yara FEDORA-2018-8344cb89ac");
  script_tag(name:"summary", value:"Check the version of yara");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
 on the target host.");
  script_tag(name:"insight", value:"YARA is a tool aimed at (but not limited to)
 helping malware researchers to identify and classify malware samples. With YARA
 you can create descriptions of malware families (or whatever you want to describe)
 based on textual or binary patterns. Each description, a.k.a rule, consists of a
 set of strings and a Boolean expression which determine its logic.
");
  script_tag(name:"affected", value:"yara on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-8344cb89ac");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/Z7XDB2FNZBTA6P2SX7EQCXWDOHDSPA7Q");
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

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"yara", rpm:"yara~3.8.1~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
