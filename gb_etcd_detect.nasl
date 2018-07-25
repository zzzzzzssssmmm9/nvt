###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_etcd_detect.nasl 9209 2018-03-27 02:21:30Z ckuersteiner $
#
# etcd Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.140887");
  script_version("$Revision: 9209 $");
  script_tag(name: "last_modification", value: "$Date: 2018-03-27 04:21:30 +0200 (Tue, 27 Mar 2018) $");
  script_tag(name: "creation_date", value: "2018-03-27 08:53:26 +0700 (Tue, 27 Mar 2018)");
  script_tag(name: "cvss_base", value: "0.0");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name: "qod_type", value: "remote_banner");

  script_name("etcd Detection");

  script_tag(name: "summary" , value: "Detection of etcd.

The script sends a connection request to the server and attempts to detect etcd and to extract its
version.");
  
  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 2379);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name: "URL", value: "https://coreos.com/etcd/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 2379);

url = "/version";
res = http_get_cache(port: port, item: url);

if ('"etcdserver":' >< res) {
  version = "unknown";

  # {"etcdserver":"3.1.7","etcdcluster":"3.1.0"}
  vers = eregmatch(pattern: '"etcdserver":"([0-9.]+)', string: res);
  if (!isnull(vers[1]))
    version = vers[1];

  # Get some additional statistics
  req = http_get(port: port, item: "/v2/stats/self");
  res = http_keepalive_send_recv(port: port, data: req);

  # Name
  data = eregmatch(pattern: '"name":"([^"]+)', string: res);
  if (!isnull(data[1]))
    extra += "  Name:    " + data[1] + '\n';

  # Uptime
  data = eregmatch(pattern: '"uptime":"([^"]+)', string: res);
  if (!isnull(data[1]))
    extra += "  Uptime:  " + data[1];

  set_kb_item(name: "etcd/installed", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:coreos:etcd:");
  if (!cpe)
    cpe = 'cpe:/a:coreos:etcd';

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "etcd", version: version, install: "/", cpe: cpe,
                                           concluded: vers[0], concludedUrl: url, extra: extra),
              port: port);
  exit(0);
}

exit(0);
