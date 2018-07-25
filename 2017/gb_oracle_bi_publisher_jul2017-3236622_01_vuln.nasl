###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_bi_publisher_jul2017-3236622_01_vuln.nasl 6924 2017-08-15 11:45:18Z teissa $
#
# Oracle BI Publisher Multiple Unspecified Vulnerabilities-01 (jul2017-3236622)
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
CPE = "cpe:/a:oracle:business_intelligence_publisher";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811247");
  script_version("$Revision: 6924 $");
  script_cve_id("CVE-2017-10025", "CVE-2017-10024", "CVE-2017-10028", "CVE-2017-10029",
                "CVE-2017-10030", "CVE-2017-10059");
  script_bugtraq_id(99697, 99723, 99724, 99738, 99740, 99743);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-08-15 13:45:18 +0200 (Tue, 15 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-07-19 17:26:23 +0530 (Wed, 19 Jul 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Oracle BI Publisher Multiple Unspecified Vulnerabilities-01 (jul2017-3236622)");

  script_tag(name:"summary", value:"This host is installed with Oracle BI Publisher
  and is prone to multiple unspecified vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to unspecified
  errors in 'Mobile Service', 'Web Server', 'Layout Tools' and 'BI Publisher
  Security' components of the application.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to have impact on
  confidentiality and integrity.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Oracle BI Publisher version 11.1.1.7.0");

  script_tag(name:"solution", value:"Apply update from the link mentioned below
  http://www.oracle.com/technetwork/security-advisory/cpujul2017-3236622.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpujul2017-3236622.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_oracle_bi_publisher_detect.nasl");
  script_mandatory_keys("Oracle/BI/Publisher/Enterprise/installed");
  script_require_ports("Services/www", 9704);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable Initialization
obpPort = "";
obpVer = "";

if(!obpPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!obpVer = get_app_version(cpe:CPE, port:obpPort)){
  exit(0);
}

## Check for version 11.1.1.7.0
if(obpVer == "11.1.1.7.0")
{
  report = report_fixed_ver(installed_version:obpVer, fixed_version:"Apply Patch");
  security_message(data:report, port:obpPort);
  exit(0);
}
