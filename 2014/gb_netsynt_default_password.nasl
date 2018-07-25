###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_netsynt_default_password.nasl 6715 2017-07-13 09:57:40Z teissa $
#
# Netsynt CRD Voice Router Telnet CLI Default Password
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103901";

tag_summary = 'The remote Netsynt CRD Voice Router has a default password.';

tag_impact = 'This issue may be exploited by a remote attacker to gain
access to sensitive information or modify system configuration.';

tag_insight = 'It was possible to login using "netsynt" as password.';
tag_vuldetect = 'Connect to the telnet service and try to login with default password.';
tag_solution = 'Change the password.';

if (description)
{
 script_oid(SCRIPT_OID); 
 script_version("$Revision: 6715 $");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("Netsynt CRD Voice Router Telnet CLI Default Password");


 script_xref(name:"URL" , value:"http://dariusfreamon.wordpress.com/2014/02/04/netsynt-crd-voice-router-telnet-cli-default-password/");

 script_tag(name:"last_modification", value:"$Date: 2017-07-13 11:57:40 +0200 (Thu, 13 Jul 2017) $");
 script_tag(name:"creation_date", value:"2014-02-06 15:02:06 +0200 (Thu, 06 Feb 2014)");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Default Accounts");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("telnetserver_detect_type_nd_version.nasl");
 script_require_ports("Services/telnet", 23);

 script_tag(name : "summary" , value : tag_summary);
 script_tag(name : "impact" , value : tag_impact);
 script_tag(name : "vuldetect" , value : tag_vuldetect);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);

 exit(0);
}

include("telnet_func.inc");

port = get_kb_item("Services/telnet");
if( ! port ) port = 23;
if( ! get_port_state( port ) ) exit( 0 );

soc = open_sock_tcp( port );
if( ! soc ) exit( 0 );

recv = telnet_negotiate( socket:soc );

if( "Netsynt " >!< recv && "Password:" >!< recv ) exit( 0 );

send( socket:soc, data: 'netsynt\n' );
send( socket:soc, data:'\n' );

recv = recv( socket:soc, length:2048 );
close( soc );

if( "Type Help to display the list of commands" >< recv )
{
  security_message( port:port );
  exit( 0 );
}

exit ( 99 );

