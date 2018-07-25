###############################################################################
# OpenVAS Vulnerability Test
# $Id: sw_homematic_webui_detect.nasl 6032 2017-04-26 09:02:50Z teissa $
#
# HomeMatic WebUI Detection
#
# Authors:
# Christian Fischer <info@schutzwerk.com>
#
# Copyright:
# Copyright (c) 2015 SCHUTZWERK GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.111065");
  script_version("$Revision: 6032 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-26 11:02:50 +0200 (Wed, 26 Apr 2017) $");
  script_tag(name:"creation_date", value:"2015-12-09 15:00:00 +0100 (Wed, 09 Dec 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_name("HomeMatic WebUI Detection");

  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2015 SCHUTZWERK GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name : "summary" , value : "The script sends a HTTP request
  to the server and attempts to extract the version from the reply.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");
include("cpe.inc");

port = get_http_port( default:80 );

buf = http_get_cache( item: "/index.htm", port:port);

if( sid = eregmatch( pattern:"Location: /index.htm\?sid=@(.*)@", string:buf) ) {

  req = http_get( item: "/pages/index.htm?sid=@" + sid[1] + "@", port:port);
  buf = http_keepalive_send_recv( port:port, data:req );

  if( "<title>HomeMatic WebUI</title>" >< buf ) {

    version = 'unknown';
    location = port + '/tcp';

    ver = eregmatch( pattern:'WEBUI_VERSION = "([0-9.]+)";', string:buf );

    if( ! isnull( ver[1] ) ) version = ver[1];

    #CPE not registered/available yet
    cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:homematic:homematic_webui:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:homematic:homematic_webui';

    set_kb_item( name:"www/" + port + "/homematic_webui", value:version );
    set_kb_item( name:"homematic_webui/installed", value:TRUE );

    register_product( cpe:cpe, location:location, port:port );

    log_message( data: build_detection_report( app:"HomeMatic WebUI",
                                               version:version,
                                               concluded:ver[0],
                                               install:location,
                                               cpe:cpe),
                                               port:port);
  }
}

exit(0);
