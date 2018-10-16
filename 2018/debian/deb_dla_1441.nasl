###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1441.nasl 11099 2018-08-24 03:13:46Z ckuersteiner $
#
# Auto-generated from advisory DLA 1441-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891441");
  script_version("$Revision: 11099 $");
  script_cve_id("CVE-2018-1000550");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1441-1] sympa security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-08-24 05:13:46 +0200 (Fri, 24 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-25 00:00:00 +0200 (Wed, 25 Jul 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/07/msg00033.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"sympa on Debian Linux");
  script_tag(name:"insight", value:"Sympa is a scalable and highly customizable modern mailing list manager
capable of handling big setups: 20.000 lists with 700,000 subscribers.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
6.1.23~dfsg-2+deb8u2.

We recommend that you upgrade your sympa packages.");
  script_tag(name:"summary",  value:"A vulnerability has been discovered in Sympa, a modern mailing list
manager, that allows write access to files on the server filesystem.
This flaw allows to create or modify any file writable by the Sympa
user, located on the server filesystem, using the function of Sympa
web interface template file saving.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"sympa", ver:"6.1.23~dfsg-2+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}