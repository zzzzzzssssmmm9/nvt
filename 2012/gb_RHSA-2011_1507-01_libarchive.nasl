###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for libarchive RHSA-2011:1507-01
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
tag_insight = "The libarchive programming library can create and read several different
  streaming archive formats, including GNU tar and cpio. It can also read ISO
  9660 CD-ROM images.

  Two heap-based buffer overflow flaws were discovered in libarchive. If a
  user were tricked into expanding a specially-crafted ISO 9660 CD-ROM image
  or tar archive with an application using libarchive, it could cause the
  application to crash or, potentially, execute arbitrary code with the
  privileges of the user running the application. (CVE-2011-1777,
  CVE-2011-1778)

  All libarchive users should upgrade to these updated packages, which
  contain backported patches to correct these issues. All running
  applications using libarchive must be restarted for this update to take
  effect.";

tag_affected = "libarchive on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-December/msg00001.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870616");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-09 10:34:18 +0530 (Mon, 09 Jul 2012)");
  script_cve_id("CVE-2011-1777", "CVE-2011-1778", "CVE-2010-4666", "CVE-2011-1779");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "RHSA", value: "2011:1507-01");
  script_name("RedHat Update for libarchive RHSA-2011:1507-01");

  script_tag(name: "summary" , value: "Check for the Version of libarchive");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"libarchive", rpm:"libarchive~2.8.3~3.el6_1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libarchive-debuginfo", rpm:"libarchive-debuginfo~2.8.3~3.el6_1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
