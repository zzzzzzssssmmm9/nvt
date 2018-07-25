###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_imagemagick_rle_files_reading_bof_vuln_win.nasl 8173 2017-12-19 11:45:56Z cfischer $
#
# ImageMagick 'coders/rle.c' Remote Buffer Overflow Vulnerability (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:imagemagick:imagemagick";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810272");
  script_version("$Revision: 8173 $");
  script_cve_id("CVE-2016-10049");
  script_bugtraq_id(95180);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-12-19 12:45:56 +0100 (Tue, 19 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-01-13 15:10:00 +0530 (Fri, 13 Jan 2017)");
  script_tag(name:"qod_type", value:"registry");
  script_name("ImageMagick 'coders/rle.c' Remote Buffer Overflow Vulnerability (Windows)");

  script_tag(name: "summary" , value:"The host is installed with ImageMagick
  and is prone to a buffer overflow vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to a buffer-overflow error
  in the 'coders/rle.c' script.");

  script_tag(name: "impact" , value:"Successful exploitation will allow
  attackers to execute arbitrary code in context of the application. Failed 
  exploits may result in denial-of-service conditions.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"ImageMagick versions before 6.9.4-4
  on Windows.");

  script_tag(name: "solution" , value:"Upgrade to ImageMagick version
  6.9.4-4 or later. For updates refer to http://www.imagemagick.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://seclists.org/oss-sec/2016/q4/758");
  script_xref(name : "URL" , value : "https://github.com/ImageMagick/ImageMagick/commit/3e9165285eda6e1bb71172031d3048b51bb443a4");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("secpod_imagemagick_detect_win.nasl");
  script_mandatory_keys("ImageMagick/Win/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
imVer = "";
report = "";

## Get version
if(!imVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:imVer, test_version:"6.9.4.4"))
{
  report = report_fixed_ver(installed_version:imVer, fixed_version:'6.9.4-4');
  security_message(data:report);
  exit(0);
}
