###################################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ortro_detect.nasl 9633 2018-04-26 14:07:08Z jschulte $
#
# Ortro Version Detection
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
################################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800980");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 9633 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-26 16:07:08 +0200 (Thu, 26 Apr 2018) $");
  script_tag(name:"creation_date", value:"2010-01-13 15:42:20 +0100 (Wed, 13 Jan 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Ortro Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed Ortro version and sets
  the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/", "/ortro", "/ortro/www", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache( item: dir + "/index.php", port:port );

  if( "Powered by" >< rcvRes && "Ortro" >< rcvRes && "img/ortro-logo.png" >< rcvRes ) {
    version = "unknown";

    ver = eregmatch(pattern:"v(([0-9.]+).([a-zA-Z0-9]+)?)", string:rcvRes );

    if( ver[1] != NULL ) {
      version = ereg_replace( pattern:"-| ", replace:".", string:ver[1] );
    }

    tmp_version = version + " under " + install;
    set_kb_item( name:"www/"+ port + "/Ortro", value:tmp_version );

    cpe = build_cpe( value: version, exp:"^([0-9.]+([a-z0-9]+)?)", base:"cpe:/a:ortro:ortro:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:ortro:ortro';

    register_product( cpe:cpe, location:install, port:port );

    log_message( data: build_detection_report( app:"Ortro",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               concluded:ver[0] ),
                                               port:port );
  }
}

exit( 0 );
