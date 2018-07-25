###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_awstats_dir_trav_vuln.nasl 8493 2018-01-23 06:43:13Z ckuersteiner $
#
# AWStats Directory Traversal Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

CPE = "cpe:/a:awstats:awstats";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140659");
  script_version("$Revision: 8493 $");
  script_tag(name: "last_modification", value: "$Date: 2018-01-23 07:43:13 +0100 (Tue, 23 Jan 2018) $");
  script_tag(name: "creation_date", value: "2018-01-08 11:12:36 +0700 (Mon, 08 Jan 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2017-1000501");

  script_tag(name: "qod_type", value: "remote_active");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("AWStats Directory Traversal Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("awstats_detect.nasl");
  script_mandatory_keys("awstats/installed");

  script_tag(name: "summary", value: "AWStats is vulnerable to a path traversal flaw in the handling of the
'config' and 'migrate' parameters resulting in unauthenticated remote code execution.");

  script_tag(name: "vuldetect", value: "Sends a crafted HTTP GET request and checks the response.");

  script_tag(name: "affected", value: "AWStats 7.6 and prior.");

  script_tag(name: "solution", value: "Upgrade to Version 7.7 or later");

  script_xref(name: "URL", value: "https://awstats.sourceforge.io/docs/awstats_changelog.txt");
  script_xref(name: "URL", value: "http://seclists.org/oss-sec/2017/q4/435");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if (dir == "/")
  dir = "";

url = dir + "/awstats.pl?config=../../../../../etc/passwd";

if (http_vuln_check(port: port, url: url, pattern: "../../../../../etc/passwd", check_header: TRUE,
                    extra_check: make_list("Warning: Syntax error line", "file, web server or permissions) may be wrong."))) {
  security_message(port: port);
  exit(0);
}

exit(0);
