##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_csrf_n_dire_trav_vuln_lin.nasl 7545 2017-10-24 11:45:30Z cfischer $
#
# WordPress Core Ajax handlers CSRF and Directory Traversal Vulnerabilities (Linux)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809157");
  script_version("$Revision: 7545 $");
  script_cve_id("CVE-2016-6896", "CVE-2016-6897", "CVE-2016-10148");
  script_bugtraq_id(92573, 92572);
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:45:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2016-08-26 15:12:51 +0530 (Fri, 26 Aug 2016)");
  script_name("WordPress Core Ajax handlers CSRF and Directory Traversal Vulnerabilities (Linux)");

  script_tag(name:"summary", value:"This host is running WordPress and is prone
  to CSRF and directory traversal vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to improper capability
  check in 'wp_ajax_update_plugin' and 'wp_ajax_delete_plugin' functions
  which are used in 'ajax-actions.php' script.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  attacker to take over an authenticated user's session (privilege escalation)
  using a forged HTML page and to crash the web server.

  Impact Level: Application");

  script_tag(name:"affected", value:"WordPress version 4.5.3 on Linux.");

  script_tag(name:"solution", value:"Upgrade to WordPress version 4.6 or later,
  For updates refer to https://wordpress.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name : "URL" , value : "https://www.exploit-db.com/exploits/40288/");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("os_detection.nasl", "secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed","Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
wpPort = "";
wpVer = "";

## get the port
if(!wpPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!wpVer = get_app_version(cpe:CPE, port:wpPort)){
  exit(0);
}

## Check for wordpress vulnerable version
if(version_is_equal(version:wpVer, test_version:"4.5.3"))
{
  report = report_fixed_ver(installed_version:wpVer, fixed_version:"4.6");
  security_message(data:report, port:wpPort);
  exit(0);
}
