###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_eclipse_jetty_server_fake_pipeline_sec_bypass_vuln.nasl 10443 2018-07-06 12:04:26Z santu $
#
# Eclipse Jetty Server Fake Pipeline Request Security Bypass Vulnerability
#
# Authors:
# Rajat Mishra <rajatm@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:eclipse:jetty";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813551");
  script_version("$Revision: 10443 $");
  script_cve_id("CVE-2017-7658");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-07-06 14:04:26 +0200 (Fri, 06 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-05 11:10:53 +0530 (Thu, 05 Jul 2018)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Eclipse Jetty Server Fake Pipeline Request Security Bypass Vulnerability");

  script_tag(name: "summary" , value:"The host is installed with Eclipse Jetty
  Server and is prone to security bypass vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");
  
  script_tag(name: "insight" , value:"The flaw exists due to an improper validation
  against pipelined requests.");

  script_tag(name: "impact" , value:"Successful exploitation will allow an attacker
  to bypass authorization.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Eclipse Jetty Server versions 9.2.x before
  9.2.25.v20180606, 9.3.x before 9.3.24.v20180605 and 9.4.x before
  9.4.11.v20180605");

  script_tag(name: "solution" , value:"Upgrade to Eclipse Jetty Server version
  9.2.25.v20180606 or 9.3.24.v20180605 or 9.4.11.v20180605 or later as per the
  series. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://bugs.eclipse.org/bugs/show_bug.cgi?id=535669");
  script_xref(name : "URL" , value : "https://www.eclipse.org/jetty/");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_jetty_detect.nasl");
  script_mandatory_keys("Jetty/installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!jPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location( cpe:CPE, port:jPort, exit_no_version:TRUE);
jVer = infos['version'];
jPath = infos['location'];

if(version_in_range(version:jVer, test_version:"9.2.0", test_version2:"9.2.25.20180605")){
  fix = "9.2.25.v20180606";
}
else if(version_in_range(version:jVer, test_version:"9.3.0", test_version2:"9.3.24.20180604")){
  fix = "9.3.24.v20180605";
}
else if(version_in_range(version:jVer, test_version:"9.4.0", test_version2:"9.4.11.20180604")){
  fix = "9.4.11.v20180605";
}

if(fix)
{
  report = report_fixed_ver(installed_version:jVer, fixed_version:fix, install_path:jPath);
  security_message(data:report, port:jPort);
  exit(0);
}

exit(0);
