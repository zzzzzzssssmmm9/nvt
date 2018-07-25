###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_emc_esrs_webinterface.nasl 8078 2017-12-11 14:28:55Z cfischer $
#
# EMC Secure Remote Services Webinterface Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.140137");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version ("$Revision: 8078 $");
 script_tag(name:"last_modification", value:"$Date: 2017-12-11 15:28:55 +0100 (Mon, 11 Dec 2017) $");
 script_tag(name:"creation_date", value:"2017-01-31 15:41:36 +0100 (Tue, 31 Jan 2017)");
 script_name("EMC Secure Remote Services Webinterface Detection");

 script_tag(name: "summary" , value: "This script perfoms HTTP based detection of EMC Secure Remote Services Webinterface");
 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 9443);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");
include("host_details.inc");

port = get_http_port( default:9443);

url = '/esrs/html/about.html';
req = http_get( item:url, port:port );
buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( "<h2>About EMC Secure Remote Services" >< buf )
{
  cpe = 'cpe:/a:emc:secure_remote_services';

  register_product( cpe:cpe, location:"/esrs", port:port, service:"www" );
  log_message( port:port, data:'The EMC Secure Remote Services Webinterface is running at this port.\nCPE: ' + cpe + '\n' );
  exit( 0 );
}

exit( 0 );
