###############################################################################
# OpenVAS Vulnerability Test
# $Id: phpScheduleIt_31520.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# phpScheduleIt 'reserve.php' Remote Code Execution Vulnerability
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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

tag_summary = "phpScheduleIt is prone to a vulnerability that lets remote attackers
execute arbitrary code because the application fails to sanitize user-
supplied input.

An attacker can leverage this issue to execute arbitrary PHP code on
an affected computer with the privileges of the webserver process.

phpScheduleIt 1.2.10 is vulnerable; other versions may also be
affected.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100234");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-07-20 17:00:58 +0200 (Mon, 20 Jul 2009)");
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2008-6132");
 script_bugtraq_id(31520);

 script_name("phpScheduleIt 'reserve.php' Remote Code Execution Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/31520");
 script_xref(name : "URL" , value : "http://www.php.brickhost.com/");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("phpScheduleIt_detect.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

if (!can_host_php(port:port)) exit(0);

if(!version = get_kb_item(string("www/", port, "/phpScheduleIt")))exit(0);
if(!matches = eregmatch(string:version, pattern:"^(.+) under (/.*)$"))exit(0);

vers = matches[1];

if(!isnull(vers) && vers >!< "unknown") {

  if(version_is_less_equal(version: vers, test_version: "1.2.10")) {
      security_message(port:port);
      exit(0);
  }

}

exit(0);
