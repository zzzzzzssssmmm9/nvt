##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_stable-channel-update-for-desktop-2017-05_macosx.nasl 7798 2017-11-17 05:43:16Z teissa $
#
# Google Chrome Security Updates(stable-channel-update-for-desktop-2017-05)-MAC OS X
#
# Authors:
# Antu Sanadi <santu@secpod.com> 
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

CPE = "cpe:/a:google:chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810772");
  script_version("$Revision: 7798 $");
  script_cve_id("CVE-2017-5068" );
  script_tag(name:"cvss_base", value:"5.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-11-17 06:43:16 +0100 (Fri, 17 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-05-03 11:37:14 +0530 (Wed, 03 May 2017)");
  script_name("Google Chrome Security Updates(stable-channel-update-for-desktop-2017-05)-MAC OS X");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  and is prone to race condition vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The Flaw exists due to the Race condition in WebRTC.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary code or to cause a denial of service

  Impact Level: Application");

  script_tag(name: "affected" , value:"Google Chrome version prior to 58.0.3029.96 on MAC OS X");

  script_tag(name: "solution", value:"Upgrade to Google Chrome version
  58.0.3029.96 or later. For updates refer to http://www.google.com/chrome");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://chromereleases.googleblog.com/2017/05/stable-channel-update-for-desktop.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_macosx.nasl");
  script_mandatory_keys("GoogleChrome/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
chr_ver = "";

## Get version
if(!chr_ver = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:chr_ver, test_version:"58.0.3029.96"))
{
  report = report_fixed_ver(installed_version:chr_ver, fixed_version:"58.0.3029.96");
  security_message(data:report);
  exit(0);
}
