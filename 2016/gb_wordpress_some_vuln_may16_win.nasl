###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_some_vuln_may16_win.nasl 7545 2017-10-24 11:45:30Z cfischer $
#
# WordPress Same Origin Method Execution Vulnerability May16 (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.808048");
  script_version("$Revision: 7545 $");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:45:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2016-05-19 10:40:58 +0530 (Thu, 19 May 2016)");
  script_name("WordPress Same Origin Method Execution Vulnerability May16 (Windows)");

  script_tag(name:"summary", value:"This host is running WordPress and is prone
  to same origin method execution vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to an error in wordpress
  Plupload library used for uploading files.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  remote attacker to execute arbitrary script code on the endpoint's domain.

  Impact Level: Application");

  script_tag(name:"affected", value:"WordPress versions prior to 4.5.2 on Windows.");

  script_tag(name:"solution", value:"Upgrade to WordPress version 4.5.2 or later,
  For updates refer to https://wordpress.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name : "URL" , value : "https://wordpress.org/news/2016/05/wordpress-4-5-2");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("os_detection.nasl", "secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed","Host/runs_windows");
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

if(version_is_less(version:wpVer, test_version:"4.5.2"))
{
  report = report_fixed_ver(installed_version:wpVer, fixed_version:"4.5.2");
  security_message(data:report, port:wpPort);
  exit(0);
}
