##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb18-16_win.nasl 9919 2018-05-22 12:05:34Z jschulte $
#
# Adobe Flash Player Security Updates(apsb18-16)-Windows
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:adobe:flash_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813347");
  script_version("$Revision: 9919 $");
  script_cve_id("CVE-2018-4944");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-05-22 14:05:34 +0200 (Tue, 22 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-09 12:22:30 +0530 (Wed, 09 May 2018)");
  script_name("Adobe Flash Player Security Updates(apsb18-16)-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name: "insight" , value:"The flaw exists due to a type confusion
  error.");

  script_tag(name: "impact" , value:"Successful exploitation will allow
  attackers to conduct arbitrary code execution.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Adobe Flash Player version before
  29.0.0.171 on Windows.");

  script_tag(name: "solution", value:"Upgrade to Adobe Flash Player version
  29.0.0.171, or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/flash-player/apsb18-16.html");
  script_xref(name: "URL" , value :"http://get.adobe.com/flashplayer");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

if(version_is_less(version:vers, test_version:"29.0.0.171"))
{
  report =  report_fixed_ver(installed_version:vers, fixed_version:"29.0.0.171", install_path:path);
  security_message(data:report);
  exit(0);
}

exit(99);
