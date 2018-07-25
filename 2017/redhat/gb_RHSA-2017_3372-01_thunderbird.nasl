###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_RHSA-2017_3372-01_thunderbird.nasl 8019 2017-12-07 07:42:09Z santu $
#
# RedHat Update for thunderbird RHSA-2017:3372-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.812500");
  script_version("$Revision: 8019 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-07 08:42:09 +0100 (Thu, 07 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-12-04 07:32:06 +0100 (Mon, 04 Dec 2017)");
  script_cve_id("CVE-2017-7826", "CVE-2017-7828", "CVE-2017-7830");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for thunderbird RHSA-2017:3372-01");
  script_tag(name: "summary", value: "Check the version of thunderbird");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
  detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "Mozilla Thunderbird is a standalone mail and 
  newsgroup client. This update upgrades Thunderbird to version 52.5.0. Security 
  Fix(es): * Multiple flaws were found in the processing of malformed web content. 
  A web page containing malicious content could cause Thunderbird to crash or, 
  potentially, execute arbitrary code with the privileges of the user running 
  Thunderbird. (CVE-2017-7826, CVE-2017-7828, CVE-2017-7830) Red Hat would like to 
  thank the Mozilla project for reporting these issues. Upstream acknowledges 
  Christian Holler, David Keeler, Jon Coppeard, Julien Cristau, Jan de Mooij, 
  Jason Kratzer, Philipp, Nicholas Nethercote, Oriol Brufau, Andr Bargull, Bob 
  Clary, Jet Villegas, Randell Jesup, Tyson Smith, Gary Kwong, Ryan VanderMeulen, 
  Nils, and Jun Kokatsu as the original reporters. "); 
  script_tag(name: "affected", value: "thunderbird on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2017:3372-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2017-December/msg00000.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~52.5.0~1.el6_9", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"thunderbird-debuginfo", rpm:"thunderbird-debuginfo~52.5.0~1.el6_9", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}