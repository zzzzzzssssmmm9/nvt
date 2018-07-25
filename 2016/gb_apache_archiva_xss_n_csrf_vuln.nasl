###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_archiva_xss_n_csrf_vuln.nasl 61548 2016-08-02 19:48:44Z Aug$
#
# Apache Archiva Cross Site Scripting And CSRF Vulnerabilities
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:apache:archiva";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808280");
  script_version("$Revision: 5759 $");
  script_cve_id("CVE-2016-4469", "CVE-2016-5005");
  script_bugtraq_id(91707, 91703);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-29 11:01:08 +0200 (Wed, 29 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-08-02 19:48:44 +0530 (Tue, 02 Aug 2016)");
  script_name("Apache Archiva Cross Site Scripting And CSRF Vulnerabilities");

  script_tag(name:"summary", value:"This host is installed with Apache Archiva
  and is prone to cross-site request forgery and cross-site scripting 
  vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to,
  - An insufficient validation of user supplied input via HTTP POST parameter 
   'connector.sourceRepoId' to 'admin/addProxyConnector_commit.action'.
  - The application lacks a Cross-Site Request Forgery protection to certain 
    HTTP POST-based functions");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to perform sensitive administrative actions and to inject arbitrary 
  web script or HTML.

  Impact Level: Application");

  script_tag(name:"affected", value:"Apache Archiva version 1.3.9 and prior.");

  script_tag(name:"solution", value:"Upgrade to Apache Archiva 2.2.1 or later.
  For updates refer to https://archiva.apache.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");
  script_xref(name : "URL" , value :"https://packetstormsecurity.com/files/137870");
  script_xref(name : "URL" , value :"https://packetstormsecurity.com/files/137869");
  script_xref(name : "URL" , value :"http://www.securityfocus.com/archive/1/archive/1/538877/100/0/threaded");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_apache_archiva_detect.nasl");
  script_mandatory_keys("apache_archiva/installed");
  script_require_ports("Services/www", 8080, 80);
  exit(0);
}


## Code starts from here

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
arPort = "";
arVer= "";

## Get HTTP Port
if(!arPort = get_app_port(cpe:CPE)){
  exit(0);
}

# Get Version
if(!arVer = get_app_version(cpe:CPE, port:arPort)){
  exit(0);
}

if(version_is_less(version:arVer, test_version:"2.2.1"))
{
  report = report_fixed_ver(installed_version:arVer, fixed_version:"2.2.1");
  security_message(data:report, port:arPort);
  exit(0);
}
