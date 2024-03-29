###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_http_server_dos_vuln_jun17_win.nasl 7543 2017-10-24 11:02:02Z cfischer $
#
# Apache HTTP Server Denial-Of-Service Vulnerability June17 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:apache:http_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811215");
  script_version("$Revision: 7543 $");
  script_cve_id("CVE-2017-7668");
  script_bugtraq_id(99137);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:02:02 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-06-21 18:06:43 +0530 (Wed, 21 Jun 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Apache HTTP Server Denial-Of-Service Vulnerability June17 (Windows)");

  script_tag(name:"summary", value:"This host is running Apache HTTP Server
  and is prone to denial-of-service vulnerability");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to an error in the
  token list parsing, which allows ap_find_token() to search past the end of its
  input string. By maliciously crafting a sequence of request headers, an
  attacker may be able to cause a segmentation fault, or to force
  ap_find_token() to return an incorrect value.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial-of-service condition.

  Impact Level: Application");

  script_tag(name:"affected", value:"Apache HTTP Server versions 2.2.32, 2.4.24
  and 2.4.25 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Apache HTTP Server 2.2.33 or 2.4.26
  or later. For updates refer to https://httpd.apache.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://seclists.org/oss-sec/2017/q2/510");
  script_xref(name : "URL" , value : "http://httpd.apache.org/security/vulnerabilities_22.html");
  script_xref(name : "URL" , value : "http://httpd.apache.org/security/vulnerabilities_24.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("secpod_apache_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("apache/installed", "Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
httpd_port = 0;
httpd_ver = "";

## Get HTTP Port
if(!httpd_port = get_app_port(cpe:CPE)){
  exit(0);
}

## Get Version
if(!httpd_ver = get_app_version(cpe:CPE, port:httpd_port)){
  exit(0);
}

if(httpd_ver =~ "^2\.4")
{
  ## Checking for Vulnerable version
  if(version_is_equal(version:httpd_ver, test_version:"2.4.25")||
     version_is_equal(version:httpd_ver, test_version:"2.4.24")){
    fix = "2.4.26";
  }
}
else if(httpd_ver =~ "^2\.2")
{
  ## Checking for Vulnerable version
  if(version_is_equal(version:httpd_ver, test_version:"2.2.32")){
    fix = "2.2.33";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:httpd_ver, fixed_version:fix);
  security_message(data:report, port:httpd_port);
  exit(0);
}
