##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_within_chrome_apsb17-17_win.nasl 6352 2017-06-16 05:57:54Z emoss $
#
# Adobe Flash Player Within Google Chrome Security Update (apsb17-17)-Windows
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:adobe:flash_player_chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811191");
  script_version("$Revision: 6352 $");
  script_cve_id("CVE-2017-3075", "CVE-2017-3081", "CVE-2017-3083", "CVE-2017-3084", 
		"CVE-2017-3076", "CVE-2017-3077", "CVE-2017-3078", "CVE-2017-3079", 
		"CVE-2017-3082" );
  script_bugtraq_id(99023, 99025);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-06-16 07:57:54 +0200 (Fri, 16 Jun 2017) $");
  script_tag(name:"creation_date", value:"2017-06-14 08:19:40 +0530 (Wed, 14 Jun 2017)");
  script_name("Adobe Flash Player Within Google Chrome Security Update (apsb17-17)-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The multiple flaws exists due to,
  - A Use After Free vulnerability.

  - A Memory Corruption vulnerability.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to conduct remote code execution.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Adobe Flash Player prior to 26.0.0.126
  within Google Chrome on Windows.");

  script_tag(name: "solution", value:"Upgrade to Adobe Flash Player for 
  Google Chrome 26.0.0.126, or later.
  For updates refer to http://get.adobe.com/flashplayer");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/flash-player/apsb17-17.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_flash_player_within_google_chrome_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Chrome/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
playerVer = "";

## Get version
if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:playerVer, test_version:"26.0.0.126"))
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"26.0.0.126");
  security_message(data:report);
  exit(0);
}
