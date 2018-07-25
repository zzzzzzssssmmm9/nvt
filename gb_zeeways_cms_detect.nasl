###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_zeeways_cms_detect.nasl 8078 2017-12-11 14:28:55Z cfischer $
#
# Zeeways CMS Remote Detection
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808107");
  script_version("$Revision: 8078 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-12-11 15:28:55 +0100 (Mon, 11 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-06-03 17:28:29 +0530 (Fri, 03 Jun 2016)");
  script_name("Zeeways CMS Remote Detection");

  script_tag(name:"summary", value:"Detection of Zeeways CMS.

  This script sends HTTP GET request and try to get the version from the
  response, and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

## Variable Initialization
dir = "";
zeePort = 0;
rcvRes = "";

##Get HTTP Port
if(!zeePort = get_http_port(default:80)){
  exit(0);
}

if(!can_host_php(port:zeePort)) exit(0);

##Iterate over possible paths
foreach dir(make_list_unique("/", "/zeeways", "/cms",  cgi_dirs(port:zeePort))) 
{
  install = dir;
  if(dir == "/") dir = "";

  ## Send and receive response
  sndReq = http_get(item: dir + "/admin/index.php", port:zeePort);
  rcvRes = http_send_recv(port:zeePort, data:sndReq);

  ##Confirm application
  if('<title>ZeewaysCMS - Admin Login</title>' >< rcvRes && 'Username' >< rcvRes
     && 'Password' >< rcvRes) 
  {
    version = "unknown";

    ## Set the KB value
    set_kb_item(name:"ZeewaysCMS/Installed", value:TRUE);

    ## build cpe and store it as host_detail
    ## Created new cpe
    cpe = "cpe:/a:zeewayscms:zeeway";

    register_product(cpe:cpe, location:install, port:zeePort);

    log_message( data:build_detection_report( app:"ZeewaysCMS",
                                              version:version,
                                              install:install,
                                              cpe:cpe,
                                              concluded:version),
                                              port:zeePort);
    exit(0);
  }
}
exit(0);
