###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_118b9abf99_webkit2gtk3_fc28.nasl 10721 2018-08-02 03:07:04Z ckuersteiner $
#
# Fedora Update for webkit2gtk3 FEDORA-2018-118b9abf99
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
  script_oid("1.3.6.1.4.1.25623.1.0.874687");
  script_version("$Revision: 10721 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-02 05:07:04 +0200 (Thu, 02 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-06-17 06:06:02 +0200 (Sun, 17 Jun 2018)");
  script_cve_id("CVE-2018-4190", "CVE-2018-4199", "CVE-2018-4218", "CVE-2018-4222", 
                "CVE-2018-4232", "CVE-2018-4233", "CVE-2018-4246", "CVE-2018-11646");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for webkit2gtk3 FEDORA-2018-118b9abf99");
  script_tag(name:"summary", value:"Check the version of webkit2gtk3");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"WebKitGTK+ is the port of the portable web 
rendering engine WebKit to the GTK+ platform.

This package contains WebKit2 based WebKitGTK+ for GTK+ 3.
");
  script_tag(name:"affected", value:"webkit2gtk3 on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-118b9abf99");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GY5NYBUZRNA46WQEP2XZCOJFY4BVEJ3X");
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

  if ((res = isrpmvuln(pkg:"webkit2gtk3", rpm:"webkit2gtk3~2.20.3~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
