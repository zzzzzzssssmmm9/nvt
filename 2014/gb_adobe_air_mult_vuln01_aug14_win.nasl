###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_air_mult_vuln01_aug14_win.nasl 8176 2017-12-19 12:50:00Z cfischer $
#
# Adobe AIR Multiple Vulnerabilities-01 Aug14 (Windows)
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

CPE = "cpe:/a:adobe:adobe_air";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804745");
  script_version("$Revision: 8176 $");
  script_cve_id("CVE-2014-0538", "CVE-2014-0540", "CVE-2014-0541", "CVE-2014-0542",
                "CVE-2014-0543", "CVE-2014-0544", "CVE-2014-0545", "CVE-2014-5333");
  script_bugtraq_id(69192, 69190, 69191, 69194, 69195, 69196, 69197, 69320);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-12-19 13:50:00 +0100 (Tue, 19 Dec 2017) $");
  script_tag(name:"creation_date", value:"2014-08-19 14:52:44 +0530 (Tue, 19 Aug 2014)");
  script_name("Adobe AIR Multiple Vulnerabilities-01 Aug14 (Windows)");

  tag_summary =
"This host is installed with Adobe Air and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Multiple Flaws are due to an unspecified error and an use-after-free error.";

  tag_impact =
"Successful exploitation will allow attackers to bypass certain security
restrictions and compromise a user's system.

Impact Level: System/Application";

  tag_affected =
"Adobe AIR before version 14.0.0.178 on Windows.";

  tag_solution =
"Update to Adobe AIR version 14.0.0.178 or later,
For updates refer to  http://get.adobe.com/air";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/58593");
  script_xref(name : "URL" , value : "http://helpx.adobe.com/security/products/flash-player/apsb14-18.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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
if(version_is_less(version:airVer, test_version:"14.0.0.178"))
{
  security_message(0);
  exit(0);
}
