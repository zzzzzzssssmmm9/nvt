###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for icedtea-web CESA-2012:1434 centos6 
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
tag_insight = "The IcedTea-Web project provides a Java web browser plug-in and an
  implementation of Java Web Start, which is based on the Netx project. It
  also contains a configuration tool for managing deployment settings for the
  plug-in and Web Start implementations.

  A buffer overflow flaw was found in the IcedTea-Web plug-in. Visiting a
  malicious web page could cause a web browser using the IcedTea-Web plug-in
  to crash or, possibly, execute arbitrary code. (CVE-2012-4540)
  
  Red Hat would like to thank Arthur Gerkis for reporting this issue.
  
  This erratum also upgrades IcedTea-Web to version 1.2.2. Refer to the NEWS
  file, linked to in the References, for further information.
  
  All IcedTea-Web users should upgrade to these updated packages, which
  resolve this issue. Web browsers using the IcedTea-Web browser plug-in must
  be restarted for this update to take effect.";

tag_affected = "icedtea-web on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-November/018977.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881534");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-11-09 09:33:53 +0530 (Fri, 09 Nov 2012)");
  script_cve_id("CVE-2012-4540");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2012:1434");
  script_name("CentOS Update for icedtea-web CESA-2012:1434 centos6 ");

  script_tag(name: "summary" , value: "Check for the Version of icedtea-web");
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

  if ((res = isrpmvuln(pkg:"icedtea-web", rpm:"icedtea-web~1.2.2~1.el6_3", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"icedtea-web-javadoc", rpm:"icedtea-web-javadoc~1.2.2~1.el6_3", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
