###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_mult_vuln01_oct15_lin.nasl 6534 2017-07-05 09:58:29Z teissa $
#
# Adobe Flash Player Multiple Vulnerabilities - 01 Oct15 (Linux)
#
# Authors:
# Rinu <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.806095");
  script_version("$Revision: 6534 $");
  script_cve_id("CVE-2015-5569", "CVE-2015-7625", "CVE-2015-7626", "CVE-2015-7627",
                "CVE-2015-7628", "CVE-2015-7629", "CVE-2015-7630", "CVE-2015-7631",
                "CVE-2015-7632", "CVE-2015-7633", "CVE-2015-7634", "CVE-2015-7635",
                "CVE-2015-7636", "CVE-2015-7637", "CVE-2015-7638", "CVE-2015-7639",
                "CVE-2015-7640", "CVE-2015-7641", "CVE-2015-7642", "CVE-2015-7643",
                "CVE-2015-7644");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-05 11:58:29 +0200 (Wed, 05 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-10-16 13:35:25 +0530 (Fri, 16 Oct 2015)");
  script_name("Adobe Flash Player Multiple Vulnerabilities - 01 Oct15 (Linux)");

  script_tag(name: "summary" , value: "This host is installed with Adobe Flash
  Player and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "Multiple flaws exists due to,
  - Improper implementation of the Flash broker API.
  - Multiple memory corruption errors.
  - An use-after-free error.
  - An error in same origin policy.
  - A buffer overflow error.");

  script_tag(name: "impact" , value: "Successful exploitation will allow attackers
  to obtain sensitive information, execute arbitrary code or cause a denial of
  service and have other unspecified impacts.

  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Adobe Flash Player before version
  11.2.202.535 on Linux.");

  script_tag(name: "solution" , value:"Upgrade to Adobe Flash Player version
  11.2.202.535 or later. For updates refer to
  http://get.adobe.com/flashplayer");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/flash-player/apsb15-25.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_lin.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Linux/Ver");
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
if(version_is_less(version:playerVer, test_version:"11.2.202.535"))
{
  report = 'Installed version: ' + playerVer + '\n' +
           'Fixed version:     11.2.202.535 \n';
  security_message(data:report);
  exit(0);
}
