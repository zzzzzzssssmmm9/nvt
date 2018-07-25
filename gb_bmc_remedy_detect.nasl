###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_bmc_remedy_detect.nasl 4969 2017-01-09 10:12:25Z ckuerste $
#
# BMC Remedy Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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
  script_oid("1.3.6.1.4.1.25623.1.0.106504");
  script_version("$Revision: 4969 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-09 11:12:25 +0100 (Mon, 09 Jan 2017) $");
  script_tag(name:"creation_date", value:"2017-01-09 10:12:05 +0700 (Mon, 09 Jan 2017)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("BMC Remedy Detection");

  script_tag(name:"summary", value:"Detection of BMC Remedy

The script sends a HTTP connection request to the server and attempts to detect the presence of BMC Remedy and
to extract its version.");

  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 443);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name: "URL", value: "http://www.bmc.com/it-solutions/remedy-itsm.html");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 443);

req = http_get(port: port, item: "/arsys/shared/login.jsp");
res = http_keepalive_send_recv(port: port, data: req);

if ('"product">BMC Remedy Action Request System' >< res && "title>BMC&nbsp;Remedy&nbsp;Mid&nbsp;Tier" >< res) {
  version = "unknown";

  # e.g. /arsys/resources/javascript/8.1.SP02 or /arsys/resources/javascript/8.1.01
  vers = eregmatch(pattern: "/arsys/resources/javascript/([0-9.SP]+)", string: res);
  if (!isnull(vers[1])) {
    version = vers[1];
    set_kb_item(name: "bmc_remedy/version", value: version);
  }

  set_kb_item(name: "bmc_remedy/installed", value: TRUE);

  cpe = build_cpe(value: tolower(version), exp: "^([0-9.sp]+)", base: "cpe:/a:bmc:remedy_action_request_system:");
  if (!cpe)
    cpe = 'cpe:/a:bmc:remedy_action_request_system';

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "BMC Remedy", version: version, install: "/", cpe: cpe,
                                           concluded: vers[0]),
              port: port);
  exit(0);
}

exit(0);
