###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_eXtplorer_detect.nasl 9584 2018-04-24 10:34:07Z jschulte $
#
# eXtplorer Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
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

tag_summary = "Detection of eXtplorer.
                    
The script sends a connection request to the server and attempts to
extract the version number from the reply.";

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103640";   

if (description)
{
 script_oid(SCRIPT_OID);
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"qod_type", value:"remote_banner");
 script_version ("$Revision: 9584 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-24 12:34:07 +0200 (Tue, 24 Apr 2018) $");
 script_tag(name:"creation_date", value:"2013-01-10 12:49:27 +0100 (Thu, 10 Jan 2013)");
 script_name("eXtplorer Detection");
 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

foreach dir( make_list_unique( "/eXtplorer", "/extplorer", cgi_dirs( port:port ) ) ) {

 install = dir;
 if( dir == "/" ) dir = "";
 url = dir + "/extplorer.xml";
 req = http_get(item:url, port:port);
 buf = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
 if( buf == NULL )continue;

 if("<name>eXtplorer</name>" >< buf) {

    vers = string("unknown");
    ### try to get version 
    version = eregmatch(string: buf, pattern: "<version>([^<]+)</version>",icase:TRUE);

    if ( !isnull(version[1]) ) {
       vers=chomp(version[1]);
    }

    set_kb_item(name: string("www/", port, "/eXtplorer"), value: string(vers," under ",install));
    set_kb_item(name:"eXtplorer/installed", value:TRUE);

    cpe = build_cpe(value:vers, exp:"^([0-9.]+)(RC[0-9])?", base:"cpe:/a:extplorer:extplorer:");
    if(isnull(cpe))
      cpe = 'cpe:/a:extplorer:extplorer';

    register_product(cpe:cpe, location:install, port:port);
    log_message(data: build_detection_report(app:"eXtplorer", version:vers, install:install, cpe:cpe, concluded: version[0]),
                port:port);
    exit(0);

 }
}
exit(0);
