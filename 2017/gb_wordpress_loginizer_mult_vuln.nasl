###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_loginizer_mult_vuln.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# WordPress Loginizer Plugin Multiple Vulnerabilities
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

CPE = "cpe:/a:wordpress:wordpress";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140287");
  script_version("$Revision: 11874 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-08-08 16:16:18 +0700 (Tue, 08 Aug 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2017-12650", "CVE-2017-12651");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress Loginizer Plugin Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name:"summary", value:"WordPress Loginizer plugin is prone to multiple vulnerabilities.");

  script_tag(name:"insight", value:"WordPress Loginizer plugin is prone to multiple vulnerabilities:

  - SQL Injection via the X-Forwarded-For HTTP header. (CVE-2017-12650)

  - Cross Site Request Forgery (CSRF) in the Blacklist and Whitelist IP Wizard in init.php because the HTTP Referer
header is not checked. (CVE-2017-12651)");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"affected", value:"WordPress Loginizer plugin version 1.3.5 and prior.");

  script_tag(name:"solution", value:"Update to version 1.3.6 or later.");

  script_xref(name:"URL", value:"https://sv.wordpress.org/plugins/loginizer/#developers");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if (dir == "/")
  dir = "";

res = http_get_cache(port: port, item: dir + "/wp-content/plugins/loginizer/readme.txt");

if ("Loginizer" >< res && "Changelog" >< res) {
  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);
  if (!isnull(vers[1])) {
    if (version_is_less(version: vers[1], test_version: "1.3.6")) {
      report = report_fixed_ver(installed_version: vers[1], fixed_version: "1.3.6");
      security_message(port: port, data: report);
      exit(0);
    }
  }
}

exit(0);
