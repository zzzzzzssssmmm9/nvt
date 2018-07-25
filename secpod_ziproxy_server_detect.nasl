###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ziproxy_server_detect.nasl 9996 2018-05-29 07:18:44Z cfischer $
#
# Ziproxy Server Version Detection
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.900522");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 9996 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-29 09:18:44 +0200 (Tue, 29 May 2018) $");
  script_tag(name:"creation_date", value:"2009-03-26 11:19:12 +0100 (Thu, 26 Mar 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Ziproxy Server Version Detection");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 8080);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_tag(name : "summary" , value : "This script detects the installed version of Ziproxy Server
  and sets the version in KB.");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

SCRIPT_DESC = "Ziproxy Server Version Detection";

zipPort = get_http_port(default:8080);

sndReq = string("GET / \r\n\r\n", "Host: ", get_host_name(), "\r\n");
rcvRes = http_keepalive_send_recv(port:zipPort, data:sndReq);
if("Server: ziproxy" >< rcvRes)
{
  ziproxyVer = eregmatch(pattern:"ziproxy/([0-9.]+)", string:rcvRes);

  if(ziproxyVer[1] != NULL){
    set_kb_item(name:"www/" + zipPort + "/Ziproxy", value:ziproxyVer[1]);
    set_kb_item(name:"Ziproxy/installed", value:TRUE);
    log_message(data:"Ziproxy Server version " + ziproxyVer[1] + " was detected on the host");

    cpe = build_cpe(value:ziproxyVer[1], exp:"^([0-9.]+)", base:"cpe:/a:ziproxy:ziproxy:");
    if(!isnull(cpe))
      register_host_detail(name:"App", value:cpe, desc:SCRIPT_DESC);
  }
}
