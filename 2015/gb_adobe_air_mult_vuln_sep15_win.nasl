###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_air_mult_vuln_sep15_win.nasl 8176 2017-12-19 12:50:00Z cfischer $
#
# Adobe Air Multiple Vulnerabilities Sep15 (Windows)
#
# Authors:
# Deependra Bapna <bdeependra@secpod.com>
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

CPE = "cpe:/a:adobe:adobe_air";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805744");
  script_version("$Revision: 8176 $");
  script_cve_id("CVE-2015-5567", "CVE-2015-5568", "CVE-2015-5570", "CVE-2015-5571",
                "CVE-2015-5572", "CVE-2015-5573", "CVE-2015-5574", "CVE-2015-5575",
                "CVE-2015-5576", "CVE-2015-5577", "CVE-2015-5578", "CVE-2015-5579",
                "CVE-2015-5580", "CVE-2015-5581", "CVE-2015-5582", "CVE-2015-5584",
                "CVE-2015-5587", "CVE-2015-5588", "CVE-2015-6676", "CVE-2015-6677",
                "CVE-2015-6678", "CVE-2015-6679", "CVE-2015-6682");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-12-19 13:50:00 +0100 (Tue, 19 Dec 2017) $");
  script_tag(name:"creation_date", value:"2015-09-24 13:05:29 +0530 (Thu, 24 Sep 2015)");
  script_name("Adobe Air Multiple Vulnerabilities Sep15 (Windows)");

  script_tag(name: "summary" , value: "This host is installed with Adobe Air
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "Multiple flaws exist due to,
  - Multiple memory corruption errors.
  - Multiple unspecified errors.
  - Multiple use-after-free vulnerabilities.");

  script_tag(name: "impact" , value: "Successful exploitation will allow remote
  attackers to gain access to potentially sensitive information, conduct denial
  of service attack and potentially execute arbitrary code in the context of the
  affected user.

  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Adobe Air versions before
  19.0.0.190 version on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Adobe Air version
  19.0.0.190 or later.
  For updates refer to http://get.adobe.com/air");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name: "URL" , value : "https://helpx.adobe.com/security/products/flash-player/apsb15-23.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("Adobe/Air/Win/Installed");
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
## Fix will be updated once the solution details are available
if(version_is_less(version:playerVer, test_version:"19.0.0.190"))
{
  report = 'Installed version: ' + playerVer + '\n' +
           'Fixed version:     ' + "19.0.0.190" + '\n';
  security_message(data:report);
  exit(0);
}
