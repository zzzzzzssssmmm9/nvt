###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_imagemagick_pixel_cache_morphology_bof_macosx.nasl 4855 2016-12-27 10:54:25Z antu123 $
#
# ImageMagick 'ContrastStretchImage()' Buffer Overflow Vulnerability (Mac OS X)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:imagemagick:imagemagick";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810257");
  script_version("$Revision: 4855 $");
  script_cve_id("CVE-2016-6520");
  script_bugtraq_id(92252);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2016-12-27 11:54:25 +0100 (Tue, 27 Dec 2016) $");
  script_tag(name:"creation_date", value:"2016-06-06 18:38:55 +0530 (Mon, 06 Jun 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("ImageMagick 'ContrastStretchImage()' Buffer Overflow Vulnerability (Mac OS X)");

  script_tag(name: "summary" , value:"The host is installed with ImageMagick
  and is prone to a buffer overflow vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to an out-of-bounds memory 
  read error in 'ContrastStretchImage' function in 'MagickCore/enhance.c' script.");

  script_tag(name: "impact" , value:"Successful exploitation will allow
  remote attackers to disclose potentially sensitive information or cause the 
  target application to crash.

  Impact Level: Application");

  script_tag(name: "affected" , value:"ImageMagick versions before 7.0.2-7 on 
  Mac OS X.");

  script_tag(name: "solution" , value:"Upgrade to ImageMagick version
  7.0.2-7 or later. For updates refer to http://www.imagemagick.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.openwall.com/lists/oss-security/2016/08/02/10");
  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1036502");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Buffer overflow");
  script_dependencies("gb_imagemagick_detect_macosx.nasl");
  script_mandatory_keys("ImageMagick/MacOSX/Version");
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
if(version_is_less(version:imVer, test_version:"7.0.2.7"))
{
  report = report_fixed_ver(installed_version:imVer, fixed_version:"7.0.2-7");
  security_message(data:report);
  exit(0);
}
