###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for gitolite3 FEDORA-2013-23951
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.867218");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-01-06 15:39:05 +0530 (Mon, 06 Jan 2014)");
  script_cve_id("CVE-2013-7203");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Fedora Update for gitolite3 FEDORA-2013-23951");

  tag_insight = "Gitolite allows a server to host many git repositories and provide access
to many developers, without having to give them real userids on the server.
The essential magic in doing this is ssh's pubkey access and the authorized
keys file, and the inspiration was an older program called gitosis.

Gitolite can restrict who can read from (clone/fetch) or write to (push) a
repository. It can also restrict who can push to what branch or tag, which
is very important in a corporate environment. Gitolite can be installed
without requiring root permissions, and with no additional software than git
itself and perl. It also has several other neat features described below and
elsewhere in the doc/ directory.
";

  tag_affected = "gitolite3 on Fedora 18";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "FEDORA", value: "2013-23951");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2014-January/125609.html");
  script_tag(name:"summary", value:"Check for the Version of gitolite3");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC18")
{

  if ((res = isrpmvuln(pkg:"gitolite3", rpm:"gitolite3~3.5.3.1~1.fc18", rls:"FC18")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
