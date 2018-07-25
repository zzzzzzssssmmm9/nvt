###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_multiple_products_50372.nasl 10005 2018-05-29 13:54:41Z cfischer $
#
# Multiple Cisco Products 'file' Parameter () Directory Traversal Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH
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
 script_oid("1.3.6.1.4.1.25623.1.0.103402");
 script_bugtraq_id(50372);
 script_cve_id("CVE-2011-3315");
 script_tag(name:"cvss_base", value:"7.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:N/A:N");
 script_version("$Revision: 10005 $");

 script_name("Multiple Cisco Products 'file' Parameter () Directory Traversal Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/50372");
 script_xref(name : "URL" , value : "http://www.cisco.com");
 script_xref(name : "URL" , value : "http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20111026-cucm");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/520414");
 script_xref(name : "URL" , value : "http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20111026-uccx");

 script_tag(name:"last_modification", value:"$Date: 2018-05-29 15:54:41 +0200 (Tue, 29 May 2018) $");
 script_tag(name:"creation_date", value:"2012-01-26 15:59:27 +0100 (Thu, 26 Jan 2012)");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("CISCO");
 script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");

 script_tag(name : "summary" , value : "Multiple Cisco products are prone to a directory-traversal
vulnerability.");
 script_tag(name : "impact" , value : "Exploiting this issue will allow an attacker to read arbitrary files
from locations outside of the application's current directory. This
could help the attacker launch further attacks.");
 script_tag(name : "affected" , value : "Cisco Unified IP Interactive Voice Response Cisco Unified Contact

Center Express Cisco Unified Communications Manager");
 script_tag(name : "insight" , value : "This issue is tracked by Cisco BugID CSCts44049 and CSCth09343.");
 script_tag(name : "solution" , value : "Vendor updates are available. Please see the references for details.");

 script_tag(name:"solution_type", value:"VendorFix");

 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

url = string("/");
if(http_vuln_check(port:port, url:url,pattern:"cisco", usecache:TRUE)) {

  url = "/ccmivr/IVRGetAudioFile.do?file=../../../../../../../../../../../../../../../etc/passwd";

  if(http_vuln_check(port:port, url:url,pattern:"root:.*:0:[01]:")) {
    security_message(port:port);
    exit(0);
  }
}

exit(0);
