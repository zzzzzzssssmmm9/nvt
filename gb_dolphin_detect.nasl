###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dolphin_detect.nasl 8078 2017-12-11 14:28:55Z cfischer $
#
# Dolphin Version Detection
#
# Authors:
# Rinu Kuriaksoe <krinu@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808217");
  script_version("$Revision: 8078 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-12-11 15:28:55 +0100 (Mon, 11 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-06-06 15:55:57 +0530 (Mon, 06 Jun 2016)");
  script_name("Dolphin Version Detection");

  script_tag(name : "summary" , value : "Check for the presence of Dolphin 
  Software.

  This script sends HTTP GET request and try to ensure the presence of Dolphin
  from the response, and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");


##Get HTTP Port
dol_port = get_http_port(default:80);

# Check Host Supports PHP
if(! can_host_php(port:dol_port)) exit(0);

##Iterate over possible paths
foreach dir(make_list_unique("/", "/dolph", "/dolphin", cgi_dirs(port:dol_port))) 
{

  install = dir;
  if( dir == "/" ) dir = "";

  url = dir + '/administration/profiles.php';
  ##Send Request and Receive Response
  sndReq = http_get(item:url, port:dol_port);
  rcvRes = http_send_recv(port:dol_port, data:sndReq);

  ## Confirm the application
  if("Dolphin" >< rcvRes && "boonex" >< rcvRes && "<title>Login</title>" >< rcvRes &&
     'id="admin_username"' >< rcvRes && 'id="admin_password"' >< rcvRes)
  {
    version = "unknown";

    ## Set KB
    set_kb_item(name:"Dolphin/Installed", value:TRUE);

    ## build cpe and store it as host_detail
    cpe = "cpe:/a:boonex:dolphin";

    register_product(cpe:cpe, location:install, port:dol_port);

    log_message(data:build_detection_report(app:"Dolphin",
                                            version:version,
                                            install:install,
                                            cpe:cpe),
                                            port:dol_port);
  }
}
exit(0);
