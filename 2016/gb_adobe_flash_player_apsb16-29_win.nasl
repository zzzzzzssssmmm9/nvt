##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb16-29_win.nasl 11702 2018-10-01 07:31:38Z asteins $
#
# Adobe Flash Player Security Updates( apsb16-29 )-Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.809221");
  script_version("$Revision: 11702 $");
  script_cve_id("CVE-2016-4271", "CVE-2016-4272", "CVE-2016-4274", "CVE-2016-4275",
                "CVE-2016-4276", "CVE-2016-4277", "CVE-2016-4278", "CVE-2016-4279",
                "CVE-2016-4280", "CVE-2016-4281", "CVE-2016-4282", "CVE-2016-4283",
                "CVE-2016-4284", "CVE-2016-4285", "CVE-2016-4287", "CVE-2016-6921",
                "CVE-2016-6922", "CVE-2016-6923", "CVE-2016-6924", "CVE-2016-6925",
                "CVE-2016-6926", "CVE-2016-6927", "CVE-2016-6929", "CVE-2016-6930",
                "CVE-2016-6931", "CVE-2016-6932", "CVE-2016-4182", "CVE-2016-4237",
                "CVE-2016-4238");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 09:31:38 +0200 (Mon, 01 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-09-14 08:14:40 +0530 (Wed, 14 Sep 2016)");
  script_name("Adobe Flash Player Security Updates( apsb16-29 )-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exists due to,

  - An integer overflow vulnerability.

  - The use-after-free vulnerabilities.

  - The security bypass vulnerabilities.

  - The memory corruption vulnerabilities.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow remote attackers lead to code execution and
  information disclosure.");

  script_tag(name:"affected", value:"Adobe Flash Player version before
  18.0.0.375 and 22.x before 23.0.0.162 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player version
  18.0.0.375, or 23.0.0.162, or later.
  For updates refer to http://get.adobe.com/flashplayer");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb16-29.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Win/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_in_range(version:playerVer, test_version:"22", test_version2:"23.0.0.161"))
{
  fix = "23.0.0.162";
  VULN = TRUE;
}

else if(version_is_less(version:playerVer, test_version:"18.0.0.375"))
{
  fix = "18.0.0.375";
  VULN = TRUE;
}

if(VULN)
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}

