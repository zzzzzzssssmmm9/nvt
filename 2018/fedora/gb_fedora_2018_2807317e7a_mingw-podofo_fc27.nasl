###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_2807317e7a_mingw-podofo_fc27.nasl 10363 2018-06-29 05:51:28Z ckuersteiner $
#
# Fedora Update for mingw-podofo FEDORA-2018-2807317e7a
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
  script_oid("1.3.6.1.4.1.25623.1.0.874740");
  script_version("$Revision: 10363 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-29 07:51:28 +0200 (Fri, 29 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-26 06:05:46 +0200 (Tue, 26 Jun 2018)");
  script_cve_id("CVE-2017-7380", "CVE-2017-7381", "CVE-2017-7382", "CVE-2017-7383", 
                "CVE-2017-5852", "CVE-2017-5853", "CVE-2017-6844", "CVE-2017-5854", 
                "CVE-2017-5855", "CVE-2017-5886", "CVE-2018-8000", "CVE-2017-6840", 
                "CVE-2017-6842", "CVE-2017-6843", "CVE-2017-6845", "CVE-2017-6847", 
                "CVE-2017-6848", "CVE-2017-7378", "CVE-2017-7379", "CVE-2017-7994", 
                "CVE-2017-8054", "CVE-2017-8378", "CVE-2017-8787", "CVE-2018-5295", 
                "CVE-2018-5308");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mingw-podofo FEDORA-2018-2807317e7a");
  script_tag(name:"summary", value:"Check the version of mingw-podofo");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"MinGW Windows podofo library.
");
  script_tag(name:"affected", value:"mingw-podofo on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-2807317e7a");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BQK6XI7F62RB2RAR7ADGIHYR2V5TU6KP");
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

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"mingw32-podofo", rpm:"mingw32-podofo~0.9.5~6.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mingw64-podofo", rpm:"mingw64-podofo~0.9.5~6.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
