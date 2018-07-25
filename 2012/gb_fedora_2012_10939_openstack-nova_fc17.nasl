###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for openstack-nova FEDORA-2012-10939
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
tag_affected = "openstack-nova on Fedora 17";
tag_insight = "OpenStack Compute (codename Nova) is open source software designed to
  provision and manage large networks of virtual machines, creating a
  redundant and scalable cloud computing platform. It gives you the
  software, control panels, and APIs required to orchestrate a cloud,
  including running instances, managing networks, and controlling access
  through users and projects. OpenStack Compute strives to be both
  hardware and hypervisor agnostic, currently supporting a variety of
  standard hardware configurations and seven major hypervisors.";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-July/084355.html");
  script_oid("1.3.6.1.4.1.25623.1.0.864565");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-08-30 11:17:30 +0530 (Thu, 30 Aug 2012)");
  script_cve_id("CVE-2012-3371", "CVE-2012-3360", "CVE-2012-3361", "CVE-2012-2654");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:P");
  script_xref(name: "FEDORA", value: "2012-10939");
  script_name("Fedora Update for openstack-nova FEDORA-2012-10939");

  script_tag(name: "summary" , value: "Check for the Version of openstack-nova");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
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

if(release == "FC17")
{

  if ((res = isrpmvuln(pkg:"openstack-nova", rpm:"openstack-nova~2012.1.1~4.fc17", rls:"FC17")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}