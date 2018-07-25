###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for perl-DBD-Pg CESA-2012:1116 centos6 
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
tag_insight = "Perl DBI is a database access Application Programming Interface (API) for
  the Perl language. perl-DBD-Pg allows Perl applications to access
  PostgreSQL database servers.

  Two format string flaws were found in perl-DBD-Pg. A specially-crafted
  database warning or error message from a server could cause an application
  using perl-DBD-Pg to crash or, potentially, execute arbitrary code with the
  privileges of the user running the application. (CVE-2012-1151)
  
  All users of perl-DBD-Pg are advised to upgrade to this updated package,
  which contains a backported patch to fix these issues. Applications using
  perl-DBD-Pg must be restarted for the update to take effect.";

tag_affected = "perl-DBD-Pg on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-July/018765.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881162");
  script_version("$Revision: 8649 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-03 13:16:43 +0100 (Sat, 03 Feb 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 16:27:15 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2012-1151");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2012:1116");
  script_name("CentOS Update for perl-DBD-Pg CESA-2012:1116 centos6 ");

  script_tag(name: "summary" , value: "Check for the Version of perl-DBD-Pg");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"perl-DBD-Pg", rpm:"perl-DBD-Pg~2.15.1~4.el6_3", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
