###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_915602df63_xen_fc27.nasl 11231 2018-09-05 06:30:46Z santu $
#
# Fedora Update for xen FEDORA-2018-915602df63
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
  script_oid("1.3.6.1.4.1.25623.1.0.875025");
  script_version("$Revision: 11231 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-05 08:30:46 +0200 (Wed, 05 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-01 07:41:08 +0200 (Sat, 01 Sep 2018)");
  script_cve_id("CVE-2018-3620", "CVE-2018-3646", "CVE-2018-12891", "CVE-2018-12893",
                "CVE-2018-12892", "CVE-2018-3665", "CVE-2018-3639", "CVE-2018-8897",
                "CVE-2018-10982", "CVE-2018-10981", "CVE-2018-7540", "CVE-2018-7541",
                "CVE-2018-7542", "CVE-2017-15595", "CVE-2017-17566", "CVE-2017-17563",
                "CVE-2017-17564", "CVE-2017-17565", "CVE-2017-17044", "CVE-2017-17045",
                "CVE-2017-15592", "CVE-2017-15597", "CVE-2017-15590", "CVE-2017-15591",
                "CVE-2017-15589", "CVE-2017-15588", "CVE-2017-15593", "CVE-2017-15594",
                "CVE-2018-15469", "CVE-2018-15468", "CVE-2018-15470");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for xen FEDORA-2018-915602df63");
  script_tag(name:"summary", value:"Check the version of xen");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
on the target host.");
  script_tag(name:"insight", value:"This package contains the XenD daemon and xm command
line tools, needed to manage virtual machines running under the Xen hypervisor
");
  script_tag(name:"affected", value:"xen on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-915602df63");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OXSMCV65ODY76PDV2TGMQ3V3JWMQAFFG");
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

  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~4.9.2~7.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
