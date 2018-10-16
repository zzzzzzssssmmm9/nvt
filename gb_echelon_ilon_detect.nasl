###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_echelon_ilon_detect.nasl 11165 2018-08-30 09:47:45Z ckuersteiner $
#
# Echelon i.LON Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.141412");
  script_version("$Revision: 11165 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-30 11:47:45 +0200 (Thu, 30 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-30 15:22:28 +0700 (Thu, 30 Aug 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Echelon i.LON Detection");

  script_tag(name:"summary", value:"Detection of Echelon i.LON devices.

The script sends a connection request to the server and attempts to detect Echelon i.LON devices.");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://www.echelon.com/products");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);

res = http_get_cache(port: port, item: "/index.htm");

if (("<title>i.LON 600 LonWorks/IP Server</title>" >< res || "<title>i.LON 100 Internet Server</title>" >< res) &&
    "forms/Echelon/SystemInfo.htm" >< res) {
  version = "unknown";

  mod = eregmatch(pattern: "i\.LON ([0-9]+)", string: res);
  model = mod[1];

  set_kb_item(name: "echelon_ilon/detected", value: TRUE);

  cpe = "cpe:/a:echelon:ilon" + model + "_firmware";

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "Echelon i.LON " + model, version: version, install: "/",
                                           cpe: cpe),
              port: port);
  exit(0);
}

exit(0);
