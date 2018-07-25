###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for libpng RHSA-2015:2594-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871519");
  script_version("$Revision: 6689 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:50:06 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-12-10 06:35:09 +0100 (Thu, 10 Dec 2015)");
  script_cve_id("CVE-2015-7981", "CVE-2015-8126", "CVE-2015-8472");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for libpng RHSA-2015:2594-01");
  script_tag(name: "summary", value: "Check the version of libpng");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The libpng packages contain a library of
functions for creating and manipulating PNG (Portable Network Graphics) image
format files.

It was discovered that the png_get_PLTE() and png_set_PLTE() functions of
libpng did not correctly calculate the maximum palette sizes for bit depths
of less than 8. In case an application tried to use these functions in
combination with properly calculated palette sizes, this could lead to a
buffer overflow or out-of-bounds reads. An attacker could exploit this to
cause a crash or potentially execute arbitrary code by tricking an
unsuspecting user into processing a specially crafted PNG image. However,
the exact impact is dependent on the application using the library.
(CVE-2015-8126, CVE-2015-8472)

An array-indexing error was discovered in the png_convert_to_rfc1123()
function of libpng. An attacker could possibly use this flaw to cause an
out-of-bounds read by tricking an unsuspecting user into processing a
specially crafted PNG image. (CVE-2015-7981)

All libpng users are advised to upgrade to these updated packages, which
contain backported patches to correct these issues.
");
  script_tag(name: "affected", value: "libpng on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "RHSA", value: "2015:2594-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2015-December/msg00029.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"libpng", rpm:"libpng~1.2.49~2.el6_7", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng-debuginfo", rpm:"libpng-debuginfo~1.2.49~2.el6_7", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpng-devel", rpm:"libpng-devel~1.2.49~2.el6_7", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
