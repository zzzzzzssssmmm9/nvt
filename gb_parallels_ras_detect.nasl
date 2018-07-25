###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_parallels_ras_detect.nasl 8994 2018-03-01 10:02:52Z ckuersteiner $
#
# Parallels Remote Application Server (RAS) Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.140832");
  script_version("$Revision: 8994 $");
  script_tag(name: "last_modification", value: "$Date: 2018-03-01 11:02:52 +0100 (Thu, 01 Mar 2018) $");
  script_tag(name: "creation_date", value: "2018-03-01 14:35:48 +0700 (Thu, 01 Mar 2018)");
  script_tag(name: "cvss_base", value: "0.0");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name: "qod_type", value: "remote_banner");

  script_name("Parallels Remote Application Server (RAS) Detection");

  script_tag(name: "summary" , value: "Detection of Parallels Remote Application Server (RAS).

The script sends a connection request to the server and attempts to detect Parallels RAS and to extract its
version.");
  
  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80, 443);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name: "URL", value: "https://www.parallels.com/products/ras/remote-application-server/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 443);

if (!can_host_asp(port: port))
  exit(0);

res = http_get_cache(port: port, item: "/2XWebPortal/logon.aspx");

if (("RAS Web Portal" >< res && "Parallels Client installed" >< res) ||
    ("2X RAS Portal" >< res && "2X RDP Client installed" >< res)) {
  version = "unknown";

  vers = eregmatch(pattern: "\.js\?v=([0-9.]+)", string: res);
  if (!isnull(vers[1]))
    version = vers[1];

  set_kb_item(name: "parallels_ras/installed", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:parallels:remote_application_server:");
  if (!cpe)
    cpe = 'cpe:/a:parallels:remote_application_server';

  register_product(cpe: cpe, location: "/2XWebPortal", port: port);

  log_message(data: build_detection_report(app: "Parallels RAS", version: version, install: "/2XWebPortal",
                                           cpe: cpe, concluded: vers[0]),
              port: port);
  exit(0);
}

exit(0);
