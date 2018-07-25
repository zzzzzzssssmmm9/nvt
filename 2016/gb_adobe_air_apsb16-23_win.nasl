###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_air_apsb16-23_win.nasl 8176 2017-12-19 12:50:00Z cfischer $
#
# Adobe Air Security Updates( apsb16-23 )-Windows
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:adobe:adobe_air";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808167");
  script_version("$Revision: 8176 $");
  script_cve_id("CVE-2016-4126" );
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-12-19 13:50:00 +0100 (Tue, 19 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-06-17 10:47:28 +0530 (Fri, 17 Jun 2016)");
  script_name("Adobe Air Security Updates( apsb16-23 )-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Air
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to an error in the
  directory search path used by the AIR installer that could potentially allow
  an attacker to take control of the affected system.");

  script_tag(name:"impact" , value:"Successful exploitation will allow remote
  attackers to conduct code execution.

  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Adobe Air version before
  22.0.0.153 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Air version
  22.0.0.153 or later.
  For updates refer to http://get.adobe.com/air");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/air/apsb16-23.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("Adobe/Air/Win/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
airVer = "";

## Get version
if(!airVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:airVer, test_version:"22.0.0.153"))
{
  report = report_fixed_ver(installed_version:airVer, fixed_version:"22.0.0.153");
  security_message(data:report);
  exit(0);
}
