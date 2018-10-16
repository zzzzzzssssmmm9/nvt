###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1613_2.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for python2.4 USN-1613-2
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



if(description)
{
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1613-2/");
  script_oid("1.3.6.1.4.1.25623.1.0.841194");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-10-19 09:53:38 +0530 (Fri, 19 Oct 2012)");
  script_cve_id("CVE-2008-5983", "CVE-2010-1634", "CVE-2010-2089", "CVE-2010-3493",
                "CVE-2011-1015", "CVE-2011-1521", "CVE-2011-4940", "CVE-2011-4944",
                "CVE-2012-0845", "CVE-2012-0876", "CVE-2012-1148");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name:"USN", value:"1613-2");
  script_name("Ubuntu Update for python2.4 USN-1613-2");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU8\.04 LTS");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1613-2");
  script_tag(name:"affected", value:"python2.4 on Ubuntu 8.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"USN-1613-1 fixed vulnerabilities in Python 2.5. This update provides the
  corresponding updates for Python 2.4.

  Original advisory details:

  It was discovered that Python would prepend an empty string to sys.path
  under certain circumstances. A local attacker with write access to the
  current working directory could exploit this to execute arbitrary code.
  (CVE-2008-5983)

  It was discovered that the audioop module did not correctly perform input
  validation. If a user or automatated system were tricked into opening a
  crafted audio file, an attacker could cause a denial of service via
  application crash. (CVE-2010-1634, CVE-2010-2089)

  Giampaolo Rodola discovered several race conditions in the smtpd module.
  A remote attacker could exploit this to cause a denial of service via
  daemon outage. (CVE-2010-3493)

  It was discovered that the CGIHTTPServer module did not properly perform
  input validation on certain HTTP GET requests. A remote attacker could
  potentially obtain access to CGI script source files. (CVE-2011-1015)

  Niels Heinen discovered that the urllib and urllib2 modules would process
  Location headers that specify a redirection to file: URLs. A remote
  attacker could exploit this to obtain sensitive information or cause a
  denial of service. (CVE-2011-1521)

  It was discovered that SimpleHTTPServer did not use a charset parameter in
  the Content-Type HTTP header. An attacker could potentially exploit this
  to conduct cross-site scripting (XSS) attacks against Internet Explorer 7
  users. (CVE-2011-4940)

  It was discovered that Python distutils contained a race condition when
  creating the ~/.pypirc file. A local attacker could exploit this to obtain
  sensitive information. (CVE-2011-4944)

  It was discovered that SimpleXMLRPCServer did not properly validate its
  input when handling HTTP POST requests. A remote attacker could exploit
  this to cause a denial of service via excessive CPU utilization.
  (CVE-2012-0845)

  It was discovered that the Expat module in Python 2.5 computed hash values
  without restricting the ability to trigger hash collisions predictably. If
  a user or application using pyexpat were tricked into opening a crafted XML
  file, an attacker could cause a denial of service by consuming excessive
  CPU resources. (CVE-2012-0876)

  Tim Boddy discovered that the Expat module in Python 2.5 did not properly
  handle memory reallocation when processing XML files. If a user or
  application using pyexpat were tricked into opening a crafted XML file, an
  attacker could cause a denial of service by consuming excessive memory
  resources. (CVE-2012-1148)");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU8.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"python2.4", ver:"2.4.5-1ubuntu4.4", rls:"UBUNTU8.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"python2.4-minimal", ver:"2.4.5-1ubuntu4.4", rls:"UBUNTU8.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
