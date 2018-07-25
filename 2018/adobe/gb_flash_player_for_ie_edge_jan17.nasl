###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_flash_player_for_ie_edge_jan17.nasl 9314 2018-04-05 06:27:30Z cfischer $
#
# Microsoft IE And Microsoft Edge Flash Player Security Update (KB4056887)
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

CPE = "cpe:/a:adobe:flash_player_internet_explorer";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812722");
  script_version("$Revision: 9314 $");
  script_cve_id("CVE-2018-4871");
  script_bugtraq_id(102465);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-04-05 08:27:30 +0200 (Thu, 05 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-01-10 15:35:52 +0530 (Wed, 10 Jan 2018)");
  script_name("Microsoft IE And Microsoft Edge Flash Player Security Update (KB4056887)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4056887");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"The flaw exist due to an out-of-bounds
  read error.");

  script_tag(name: "impact" , value:"Successful exploitation of this vulnerability
  will lead to information exposure.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Windows 10 Version 1511 for x32/x64 Edition,

  Windows 10 Version 1607 for x32/x64 Edition,

  Windows 10 Version 1703 for x32/x64 Edition,

  Windows 10 Version 1709 for x32/x64 Edition,

  Windows 10 x32/x64 Edition,

  Windows 8.1 for x32/x64 Edition and

  Windows Server 2012/2012 R2/2016");

  script_tag(name:"solution", value:"Run Windows update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/kb/4056887");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/4056887");
  script_xref(name : "URL" , value : "https://helpx.adobe.com/security/products/flash-player/apsb18-01.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_flash_player_within_ie_edge_detect.nasl");
  script_mandatory_keys("AdobeFlash/IE_or_EDGE/Installed");
  exit(0);
}

include("host_details.inc");
include("secpod_reg.inc");
include("version_func.inc");

if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012:1, win2012R2:1, win10:1,
                   win10x64:1, win2016:1) <= 0){
  exit(0);
}

if(!infos = get_app_version_and_location(cpe:CPE))
{
  CPE = "cpe:/a:adobe:flash_player_edge";
  if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE)){
    exit(0);
  }
}

flashVer = infos['version'];
if(!flashVer){
  exit(0);
}

flashPath = infos['location'];
if(flashPath){
  flashPath = flashPath + "\Flashplayerapp.exe";
} else {
  flashPath = "Could not find the install location";
}

if(version_is_less(version:flashVer, test_version:"28.0.0.137"))
{
  report = report_fixed_ver(file_checked:flashPath,
                            file_version:flashVer, vulnerable_range:"Less than 28.0.0.137");
  security_message(data:report);
  exit(0);
}

exit(99);
