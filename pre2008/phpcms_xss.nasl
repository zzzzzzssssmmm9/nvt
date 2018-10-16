###############################################################################
# OpenVAS Vulnerability Test
# $Id: phpcms_xss.nasl 10862 2018-08-09 14:51:58Z cfischer $
#
# phpCMS XSS
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
#
# Copyright:
# Copyright (C) 2004 David Maciejak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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

# Ref: Cyrille Barthelemy <cb-publicbox ifrance com>

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.15850");
  script_version("$Revision: 10862 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-09 16:51:58 +0200 (Thu, 09 Aug 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2004-1202");
  script_bugtraq_id(11765);
  script_name("phpCMS XSS");
  script_category(ACT_ATTACK);
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl", "cross_site_scripting.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"solution", value:"Upgrade to version 1.2.1pl1 or newer");
  script_tag(name:"summary", value:"The remote host runs phpCMS, a content management system
  written in PHP.

  This version is vulnerable to cross-site scripting due to a lack of
  sanitization of user-supplied data in parser.php script.
  Successful exploitation of this issue may allow an attacker to execute
  malicious script code on a vulnerable server.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod", value:"50"); # No extra check, prone to false positives and doesn't match existing qod_types

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if ( ! can_host_php( port:port ) ) exit( 0 );
host = http_host_name( dont_add_port:TRUE );
if( get_http_has_generic_xss( port:port, host:host ) ) exit( 0 );

url = "/parser/parser.php?file=<script>foo</script>";
buf = http_get( item:url, port:port );
res = http_keepalive_send_recv( port:port, data:buf, bodyonly:FALSE );
if( isnull( res ) ) exit( 0 );

if( res =~ "^HTTP/1\.[01] 200" && egrep( pattern:"<script>foo</script>", string:res ) ) {
  report = report_vuln_url( port:port, url:url );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );