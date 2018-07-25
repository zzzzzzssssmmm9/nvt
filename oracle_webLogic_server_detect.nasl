###############################################################################
# OpenVAS Vulnerability Test
# $Id: oracle_webLogic_server_detect.nasl 9544 2018-04-20 07:54:47Z ckuersteiner $
#
# Oracle WebLogic Server Detection
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.100493");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 9544 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-20 09:54:47 +0200 (Fri, 20 Apr 2018) $");
  script_tag(name:"creation_date", value:"2010-02-14 12:35:00 +0100 (Sun, 14 Feb 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Oracle WebLogic Server Detection");

  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_require_ports("Services/www", 7001);
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_tag(name: "summary", value: "Detection of Oracle WebLogic Server.

The script sends a connection request to the server and attempts to extract the version number from the reply.");
  exit(0);
}

include("cpe.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");
include("host_details.inc");

port = get_http_port(default:7001);

url = "/console/login/LoginForm.jsp";

buf = http_get_cache(item:url, port:port);

if (buf && ("<title>Oracle WebLogic Server Administration Console" >< buf ||
    egrep(pattern: "<TITLE>WebLogic Server.*Console Login", string: buf))) {
  vers = "unknown";

  version = eregmatch(string: buf, pattern: "WebLogic Server ([0-9.]+)",icase:TRUE);
  if (!isnull(version[1])){
    vers = version[1];
  }
  else {
    version = eregmatch(string: buf, pattern: "WebLogic Server Version: ([0-9.]+)",icase:TRUE);
    if (!isnull(version[1]))
      vers = version[1];
  }

  set_kb_item(name:"OracleWebLogicServer/installed", value:TRUE);

  cpe = build_cpe(value: vers, exp: "^([0-9.]+)", base: "cpe:/a:bea:weblogic_server:");
  if (!cpe)
    cpe = 'cpe:/a:bea:weblogic_server';

  register_product(cpe:cpe, location: "/", port:port);

  log_message(data: build_detection_report(app: "Oracle WebLogic Server", version: vers, install: "/", cpe: cpe,
                                           concluded: version[0], concludedUrl: url),
              port: port);
  exit(0);
}

exit(0);
