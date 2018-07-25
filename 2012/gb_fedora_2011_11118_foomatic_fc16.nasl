###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for foomatic FEDORA-2011-11118
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "Foomatic is a comprehensive, spooler-independent database of printers,
  printer drivers, and driver descriptions. This package contains
  utilities to generate driver description files and printer queues for
  CUPS, LPD, LPRng, and PDQ using the database (packaged separately).
  There is also the possibility to read the PJL options out of PJL-capable
  laser printers and take them into account at the driver description
  file generation.

  There are spooler-independent command line interfaces to manipulate
  queues (foomatic-configure) and to print files/manipulate jobs
  (foomatic printjob).

  The site <A HREF= &qt http://www.linuxprinting.org/ &qt >http://www.linuxprinting.org/</A> is based on this database.";

tag_affected = "foomatic on Fedora 16";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2011-August/064898.html");
  script_oid("1.3.6.1.4.1.25623.1.0.864026");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-04-02 13:01:58 +0530 (Mon, 02 Apr 2012)");
  script_cve_id("CVE-2011-2924", "CVE-2011-2923");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "FEDORA", value: "2011-11118");
  script_name("Fedora Update for foomatic FEDORA-2011-11118");

  script_tag(name: "summary" , value: "Check for the Version of foomatic");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC16")
{

  if ((res = isrpmvuln(pkg:"foomatic", rpm:"foomatic~4.0.8~4.fc16", rls:"FC16")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
