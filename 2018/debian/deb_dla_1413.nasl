###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1413.nasl 10478 2018-07-11 06:07:00Z ckuersteiner $
#
# Auto-generated from advisory DLA 1413-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.891413");
  script_version("$Revision: 10478 $");
  script_cve_id("CVE-2017-18123");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1413-1] dokuwiki security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-11 08:07:00 +0200 (Wed, 11 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-10 00:00:00 +0200 (Tue, 10 Jul 2018)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/07/msg00004.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"dokuwiki on Debian Linux");
  script_tag(name:"insight", value:"DokuWiki is a wiki mainly aimed at creating documentation of any kind.
It is targeted at developer teams, workgroups and small companies. It
has a simple but powerful syntax which makes sure the datafiles remain
readable outside the wiki and eases the creation of structured texts.
All data is stored in plain text files -- no database is required.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
0.0.20140505.a+dfsg-4+deb8u1.

We recommend that you upgrade your dokuwiki packages.");
  script_tag(name:"summary",  value:"The call parameter of /lib/exe/ajax.php in DokuWiki through
2017-02-19e does not properly encode user input, which leads to a
reflected file download vulnerability, and allows remote attackers to
run arbitrary programs.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"dokuwiki", ver:"0.0.20140505.a+dfsg-4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
