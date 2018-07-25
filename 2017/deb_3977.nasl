###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_3977.nasl 7336 2017-10-04 05:42:02Z asteins $
#
# Auto-generated from advisory DSA 3977-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.703977");
  script_version("$Revision: 7336 $");
  script_cve_id("CVE-2017-14500");
  script_name("Debian Security Advisory DSA 3977-1 (newsbeuter - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-10-04 07:42:02 +0200 (Wed, 04 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-09-18 00:00:00 +0200 (Mon, 18 Sep 2017)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://www.debian.org/security/2017/dsa-3977.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"newsbeuter on Debian Linux");
  script_tag(name:"insight", value:"newsbeuter is an innovative RSS feed reader for the text console.
It supports OPML import/exports, HTML rendering, podcast (podbeuter),
offline reading, searching and storing articles to your filesystem,
and many more features.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 2.8-2+deb8u2.

For the stable distribution (stretch), this problem has been fixed in
version 2.9-5+deb9u2.

For the unstable distribution (sid), this problem has been fixed in
version 2.9-7.

We recommend that you upgrade your newsbeuter packages.");
  script_tag(name:"summary",  value:"It was discovered that podbeuter, the podcast fetcher in newsbeuter, a
text-mode RSS feed reader, did not properly escape the name of the media
enclosure (the podcast file), allowing a remote attacker to run an
arbitrary shell command on the client machine. This is only exploitable
if the file is also played in podbeuter.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"newsbeuter", ver:"2.9-5+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"newsbeuter", ver:"2.8-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"newsbeuter-dbg", ver:"2.8-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
