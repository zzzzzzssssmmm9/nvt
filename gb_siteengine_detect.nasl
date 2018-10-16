###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_siteengine_detect.nasl 11396 2018-09-14 16:36:30Z cfischer $
#
# SiteEngine Version Detection
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.801681");
  script_version("$Revision: 11396 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-14 18:36:30 +0200 (Fri, 14 Sep 2018) $");
  script_tag(name:"creation_date", value:"2010-12-31 07:04:16 +0100 (Fri, 31 Dec 2010)");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("SiteEngine Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script finds the running SiteEngine version and saves
  the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port)) exit(0);

foreach dir (make_list_unique("/", "/SiteEngine", cgi_dirs(port:port))) {

  install = dir;
  if(dir == "/") dir = "";

  res = http_get_cache(item:dir + "/index.php", port:port);

  if("Powered by SiteEngine" >< res) {

    version = "unknown";

    ver = eregmatch(pattern:'SiteEngine ([0-9.]+)', string:res);
    if(ver[1]) {
      version = ver[1];
    }

    tmp_version = version +  " under " + install;
    set_kb_item(name:"www/" + port + "/SiteEngine", value:tmp_version);

    cpe = build_cpe(value:version, exp:"^([0-9.]+)", base:"cpe:/a:boka:siteengine:");
    if(!cpe)
      cpe = 'cpe:/a:boka:siteengine';

    register_product(cpe:cpe, location: install, port:port);
    log_message(data: build_detection_report(app:"SiteEngine",
                                             version:version,
                                             install:install,
                                             cpe:cpe,
                                             concluded:ver[0]),
                                             port:port);

  }
}
