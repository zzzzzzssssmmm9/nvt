###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_skadate_49502.nasl 7052 2017-09-04 11:50:51Z teissa $
#
# SkaDate 'blogs.php' Cross Site Scripting Vulnerability
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103269");
  script_version("$Revision: 7052 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-04 13:50:51 +0200 (Mon, 04 Sep 2017) $");
  script_tag(name:"creation_date", value:"2011-09-22 13:43:24 +0200 (Thu, 22 Sep 2011)");
  script_bugtraq_id(49502);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_name("SkaDate 'blogs.php' Cross Site Scripting Vulnerability");
  script_category(ACT_ATTACK);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/49502");
  script_xref(name:"URL", value:"http://www.skadate.com");

  script_tag(name:"summary", value:"SkaDate is prone to a cross-site scripting vulnerability because it
  fails to properly sanitize user-supplied input.");
  script_tag(name:"impact", value:"An attacker can exploit this issue to execute arbitrary script code in
  the browser of an unsuspecting user in the context of the affected site. This may help the attacker steal
  cookie-based authentication credentials and launch other attacks.");

  script_tag(name:"qod", value:"50"); # Prone to false positives

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
   
port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/blog", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = dir + "/blogs.php?tag=gamecat+<script>alert(/openvas-xss-test/)</script>"; 

  if( http_vuln_check( port:port, url:url, pattern:"<script>alert\(/openvas-xss-test/\)</script>", check_header:TRUE ) ) {
    report = report_vuln_url( port:port, url:url  );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
