###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_ninja-forms_xss_vuln.nasl 9067 2018-03-09 10:13:17Z cfischer $
#
# WordPress Ninja Forms Plugin XSS Vulnerability
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.112239");
  script_version("$Revision: 9067 $");
  script_tag(name: "last_modification", value: "$Date: 2018-03-09 11:13:17 +0100 (Fri, 09 Mar 2018) $");
  script_tag(name: "creation_date", value: "2018-02-22 11:00:00 +0100 (Thu, 22 Feb 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_cve_id("CVE-2018-7280");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("WordPress Ninja Forms Plugin XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name: "summary", value: "Ninja Forms plugin for WordPress is prone to a cross-site scripting (XSS) vulnerability.");
  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "affected", value: "WordPress Ninja Forms plugin before version 3.2.14.");

  script_tag(name: "solution", value: "Upgrade to version 3.2.14 or later.");

  script_xref(name: "URL", value: "https://wordpress.org/plugins/ninja-forms/#developers");

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

res = http_get_cache(port: port, item: dir + "/wp-content/plugins/ninja-forms/readme.txt");

if ("=== Ninja Forms" >< res && "Changelog" >< res) {

  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);

  if (!isnull(vers[1]) && version_is_less(version: vers[1], test_version: "3.2.14")) {
    report = report_fixed_ver(installed_version: vers[1], fixed_version: "3.2.14");
    security_message(port: port, data: report);
    exit(0);
  }
}
exit(0);
