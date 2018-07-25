##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_within_chrome_apsb17-23_macosx.nasl 8108 2017-12-14 06:10:17Z santu $
#
# Adobe Flash Player Within Google Chrome Security Update( apsb17-23 )- MAC OS X
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
  script_oid("1.3.6.1.4.1.25623.1.0.811611");
  script_version("$Revision: 8108 $");
  script_cve_id("CVE-2017-3085", "CVE-2017-3106" );
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-12-14 07:10:17 +0100 (Thu, 14 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-08-09 10:42:02 +0530 (Wed, 09 Aug 2017)");
  script_name("Adobe Flash Player Within Google Chrome Security Update( apsb17-23 )- MAC OS X");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The multiple flaws exists due to,
  - A security bypass vulnerability.

  - A type confusion.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to execute remote code and can get
  sensitive information.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Adobe Flash Player prior to 26.0.0.151
  within Google Chrome on MAC OS X.");

  script_tag(name: "solution", value:"Upgrade to Adobe Flash Player for 
  Google Chrome 26.0.0.151, or later.
  For updates refer to http://get.adobe.com/flashplayer");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/flash-player/apsb17-23.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_flash_player_within_google_chrome_detect_macosx.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Chrome/MacOSX/Ver");
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
if(version_is_less(version:playerVer, test_version:"26.0.0.151"))
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"26.0.0.151");
  security_message(data:report);
  exit(0);
}
exit(0);
