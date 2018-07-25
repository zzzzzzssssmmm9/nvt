###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for apache2 USN-2523-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842123");
  script_version("$Revision: 9652 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 11:09:48 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2015-03-11 06:40:48 +0100 (Wed, 11 Mar 2015)");
  script_cve_id("CVE-2013-5704", "CVE-2014-3581", "CVE-2014-3583", "CVE-2014-8109",
                "CVE-2015-0228");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for apache2 USN-2523-1");
  script_tag(name: "summary", value: "Check the version of apache2");
  script_tag(name: "vuldetect", value: "Checks if a vulnerable version is present on the target host.");
  script_tag(name: "insight", value: "Martin Holst Swende discovered that the
mod_headers module allowed HTTP trailers to replace HTTP headers during request
processing. A remote attacker could possibly use this issue to bypass
RequestHeaders directives. (CVE-2013-5704)

Mark Montague discovered that the mod_cache module incorrectly handled
empty HTTP Content-Type headers. A remote attacker could use this issue to
cause the server to stop responding, leading to a denial of service. This
issue only affected Ubuntu 14.04 LTS and Ubuntu 14.10. (CVE-2014-3581)

Teguh P. Alko discovered that the mod_proxy_fcgi module incorrectly
handled long response headers. A remote attacker could use this issue to
cause the server to stop responding, leading to a denial of service. This
issue only affected Ubuntu 14.10. (CVE-2014-3583)

It was discovered that the mod_lua module incorrectly handled different
arguments within different contexts. A remote attacker could possibly use
this issue to bypass intended access restrictions. This issue only affected
Ubuntu 14.10. (CVE-2014-8109)

Guido Vranken discovered that the mod_lua module incorrectly handled a
specially crafted websocket PING in certain circumstances. A remote
attacker could possibly use this issue to cause the server to stop
responding, leading to a denial of service. This issue only affected
Ubuntu 14.10. (CVE-2015-0228)");
  script_tag(name: "affected", value: "apache2 on Ubuntu 14.10 ,
  Ubuntu 14.04 LTS ,
  Ubuntu 12.04 LTS ,
  Ubuntu 10.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "USN", value: "2523-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2523-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.10|14\.04 LTS|12\.04 LTS|10\.04 LTS)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.10")
{

  if ((res = isdpkgvuln(pkg:"apache2.2-bin", ver:"2.4.10-1ubuntu1.1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"apache2.2-bin", ver:"2.4.7-1ubuntu4.4", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"apache2.2-bin", ver:"2.2.22-1ubuntu1.8", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"apache2.2-bin", ver:"2.2.14-5ubuntu8.15", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}