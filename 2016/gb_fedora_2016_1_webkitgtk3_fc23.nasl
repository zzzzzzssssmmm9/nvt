###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for webkitgtk3 FEDORA-2016-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.807720");
  script_version("$Revision: 6631 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:36:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-03-21 07:26:15 +0100 (Mon, 21 Mar 2016)");
  script_cve_id("CVE-2015-1120", "CVE-2015-1076", "CVE-2015-1071", "CVE-2015-1081",
                "CVE-2015-1122", "CVE-2015-1155", "CVE-2014-1748", "CVE-2015-3752",
                "CVE-2015-5809", "CVE-2015-5928", "CVE-2015-3749", "CVE-2015-3659",
                "CVE-2015-3748", "CVE-2015-3743", "CVE-2015-3731", "CVE-2015-3745",
                "CVE-2015-5822", "CVE-2015-3658", "CVE-2015-3741", "CVE-2015-3727",
                "CVE-2015-5801", "CVE-2015-5788", "CVE-2015-3747", "CVE-2015-5794",
                "CVE-2015-1127", "CVE-2015-1153", "CVE-2015-1083");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for webkitgtk3 FEDORA-2016-1");
  script_tag(name: "summary", value: "Check the version of webkitgtk3");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "WebKitGTK+ is the port of the portable web
  rendering engine WebKit to the GTK+ platform.

  This package contains WebKitGTK+ for GTK+ 3.");

  script_tag(name: "affected", value: "webkitgtk3 on Fedora 23");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-1");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2016-March/179133.html");
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

if(release == "FC23")
{

  if ((res = isrpmvuln(pkg:"webkitgtk3", rpm:"webkitgtk3~2.4.10~1.fc23", rls:"FC23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
