##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb17-10_win.nasl 8178 2017-12-19 13:42:38Z cfischer $
#
# Adobe Flash Player Security Updates( apsb17-10 )-Windows
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

CPE = "cpe:/a:adobe:flash_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810839");
  script_version("$Revision: 8178 $");
  script_cve_id("CVE-2017-3058", "CVE-2017-3059", "CVE-2017-3060", "CVE-2017-3061", 
                "CVE-2017-3062", "CVE-2017-3063", "CVE-2017-3064", "CVE-2015-5122", 
                "CVE-2015-5123");
  script_bugtraq_id(97551, 97557, 75712, 75710);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-12-19 14:42:38 +0100 (Tue, 19 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-04-12 08:46:59 +0530 (Wed, 12 Apr 2017)");
  script_name("Adobe Flash Player Security Updates( apsb17-10 )-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,
  - Use-after-free vulnerabilities that could lead to code execution.
  - Memory corruption vulnerabilities that could lead to code execution.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerabilities will allow remote attackers to execute arbitrary code on
  the target user's system and that could potentially allow an attacker to
  take control of the affected system.

  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Adobe Flash Player version before 
  25.0.0.148 on Windows.");

  script_tag(name: "solution", value:"Upgrade to Adobe Flash Player version
  25.0.0.148, or later. For updates refer to http://get.adobe.com/flashplayer");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/flash-player/apsb17-10.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Win/Installed");
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
if(version_is_less(version:playerVer, test_version:"25.0.0.148"))
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"25.0.0.148");
  security_message(data:report);
  exit(0);
}