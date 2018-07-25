###############################################################################
# OpenVAS Vulnerability Test
# $Id: femitter_httpd_36656.nasl 8654 2018-02-05 08:19:22Z cfischer $
#
# Acritum Femitter Server HTTP Request Remote File Disclosure Vulnerability
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100304");
  script_version("$Revision: 8654 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-05 09:19:22 +0100 (Mon, 05 Feb 2018) $");
  script_tag(name:"creation_date", value:"2009-10-15 20:14:59 +0200 (Thu, 15 Oct 2009)");
  script_bugtraq_id(36656);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("Acritum Femitter Server HTTP Request Remote File Disclosure Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Web Servers");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  tag_summary = "Acritum Femitter Server is prone to a remote file-disclosure
  vulnerability because it fails to properly sanitize user-supplied input.";

  tag_impact = "An attacker can exploit this vulnerability to view the source code of
  the files in the context of the server process. This may aid in
  further attacks.";

  tag_affected = "Acritum Femitter Server 1.03 is affected; other versions may be
  vulnerable as well.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/36656");
  script_xref(name:"URL", value:"http://www.acritum.com/fem/index.htm");

  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
   
port = get_http_port(default:80);

files = get_kb_list(string("www/", port, "/content/extensions/htm*"));
if(!files) {
  file = "/index.htm";
} else {
  files = make_list(files); 
  file  = files[0];
}  

url = file;
buf = http_get_cache(item:url, port:port);

if(egrep(pattern: "Content-Type", string: buf, icase: TRUE)) {

  content_typ = eregmatch(pattern:"Content-Type: ([a-zA-Z/-]+)",string:buf);

  if(content_typ) {

    url = string(file,".");
    req = http_get(item:url, port:port);
    buf = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
    if( buf == NULL ) exit(0);

    if(egrep(pattern: "Content-Type", string: buf, icase: TRUE)) {
      content_typ1 = eregmatch(pattern:"Content-Type: ([a-zA-Z/-]+)",string:buf);
      if(content_typ[1] >!< content_typ1[1] && "application/binary" >< content_typ1[1]) {
        security_message(port:port);
        exit(0);
      }   
    }
  }
}

exit(0);
