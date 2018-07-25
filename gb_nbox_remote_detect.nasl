###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nbox_remote_detect.nasl 4886 2016-12-30 12:19:10Z antu123 $
#
# NBOX Remote Detection
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.809082");
  script_version("$Revision: 4886 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2016-12-30 13:19:10 +0100 (Fri, 30 Dec 2016) $");
  script_tag(name:"creation_date", value:"2016-11-03 18:01:01 +0530 (Thu, 03 Nov 2016)");
  script_name("NBOX Remote Detection");

  script_tag(name : "summary" , value : "Detection of installed version of NBOX.

  This script sends HTTP GET request and try to get the version from the
  response, and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 443);
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");
include("cpe.inc");
include("host_details.inc");

## Variable initialization
nbPort = 0;
url = "";
auth = "";
req = "";
buf = "";
version = "";

##Get HTTP Port
if(!nbPort = get_http_port(default:443)){
  exit(0);
}

##url
url = "/ntop-bin/dashboard.cgi";

## Default credentials
auth = base64(str:'nbox:nbox');

## Send request and receive response
req = http_get(item:url, port:nbPort);
buf = http_keepalive_send_recv(port:nbPort, data:req, bodyonly:FALSE);

## Confirm the application
if('401 Unauthorized' >< buf && 'WWW-Authenticate: Basic realm="Authentication Required for Accessing the nBox' >< buf)
{
  ## Set the KB value
  set_kb_item(name:"nBox/Installed", value:TRUE);

  version = "unknown";

  ## Send request with default credentials and receive response
  req = ereg_replace(string:req, pattern:'\r\n\r\n', replace: '\r\nAuthorization: Basic ' + auth + '\r\n\r\n');
  buf = http_keepalive_send_recv(port:nbPort, data:req, bodyonly:FALSE);

  ## Confirm the login
  if(buf =~ "HTTP/1.. 200 OK" && '>ntop.org<' >< buf  && '>nBox' >< buf &&
     ">Dashboard" >< buf  && ">System" >< buf && ">Applications" >< buf) 
  {
    ## Grep for the version
    ver = eregmatch(pattern:'>nBox ([0-9.]+)<', string:buf);
    if(ver[1]) version = ver[1];
  }

  ## build cpe and store it as host_detail
  cpe = build_cpe(value: version, exp:"^([0-9.]+)", base:"cpe:/a:ntop:nbox:");
  if(!cpe)
    cpe = "cpe:/a:ntop:nbox";

  register_product(cpe:cpe, location:"/", port:nbPort);

  log_message(data:build_detection_report( app:"nBox",
                                           version:version,
                                           install:"/",
                                           cpe:cpe,
                                           concluded:version ),
                                           port:nbPort);
  exit(0);
}  
exit(0);

