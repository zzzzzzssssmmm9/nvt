###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_clipbucket_detect.nasl 8971 2018-02-28 06:08:38Z ckuersteiner $
#
# ClipBucket Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.809038");
  script_version("$Revision: 8971 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-02-28 07:08:38 +0100 (Wed, 28 Feb 2018) $");
  script_tag(name:"creation_date", value:"2016-09-08 11:15:03 +0530 (Thu, 08 Sep 2016)");

  script_name("ClipBucket Detection");

  script_tag(name: "summary" , value: "Detection of ClipBucket.

The script sends a connection request to the server and attempts to detect ClipBucket and to extract its
version.");

  script_tag(name:"qod_type", value:"remote_banner");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80, 443);

  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name: "URL", value: "https://clipbucket.com/");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port(default: 80);

if (!can_host_php(port: port))
  exit(0);

foreach dir (make_list_unique("/", "/clipbucket", "/ClipBucket", cgi_dirs(port: port))) {
  install = dir;
  if( dir == "/" ) dir = "";

  res = http_get_cache(port: port, item: dir + "/admin_area/login.php");
    
  if ('ClipBucket Copyright' >< res &&
      ('>Sign in with your Clipbucket Account' >< res || '>Username' >< res) &&
      (res =~ "<title>Admin Login - ClipBucket.*</title>" || "Arslan Hassan" >< res)) 
  {
    version = "unknown";

    res = http_get_cache(port: port, item: dir + "/");

    vers = eregmatch(pattern: "ClipBucket version ([0-9.]+)", string: res);
    if (!isnull(vers[1]))
      version = vers[1];

    set_kb_item(name: "clipbucket/Installed", value: TRUE);

    cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:clipbucket_project:clipbucket:");
    if(!cpe)
      cpe = "cpe:/a:clipbucket_project:clipbucket";

    register_product(cpe: cpe, location: install, port: port);

    log_message(data: build_detection_report(app: "ClipBucket", version: version, install: install, cpe: cpe,
                                             concluded: vers[0]),
                port: port);
    exit(0);
  }
}

exit(0);
