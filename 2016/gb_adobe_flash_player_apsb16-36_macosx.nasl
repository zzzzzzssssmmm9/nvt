##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb16-36_macosx.nasl 4759 2016-12-14 06:59:05Z antu123 $
#
# Adobe Flash Player Security Updates( apsb16-36 )-MAC OS X
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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

CPE = "cpe:/a:adobe:flash_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809464");
  script_version("$Revision: 4759 $");
  script_cve_id("CVE-2016-7855" );
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2016-12-14 07:59:05 +0100 (Wed, 14 Dec 2016) $");
  script_tag(name:"creation_date", value:"2016-10-27 18:42:32 +0530 (Thu, 27 Oct 2016)");
  script_name("Adobe Flash Player Security Updates( apsb16-36 )-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The Flaw exists due to,
  a use-after-free vulnerability");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to take control of the affected system.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Adobe Flash Player version
  22.x before 23.0.0.205 on MAC OS X.");

  script_tag(name: "solution", value:"Upgrade to Adobe Flash Player version
  23.0.0.205, or later.
  For updates refer to http://get.adobe.com/flashplayer");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/flash-player/apsb16-36.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_macosx.nasl");
  script_mandatory_keys("Adobe/Flash/Player/MacOSX/Version");
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
if(version_in_range(version:playerVer, test_version:"22", test_version2:"23.0.0.204"))
{  
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"23.0.0.205");
  security_message(data:report);
  exit(0);
}

