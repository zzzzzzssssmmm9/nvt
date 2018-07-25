###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln01_may15_macosx.nasl 2015-05-04 14:23:48 +0530 May$
#
# Google Chrome Multiple Vulnerabilities-01 May15 (Mac OS X)
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

CPE = "cpe:/a:google:chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805377");
  script_version("$Revision: 6207 $");
  script_cve_id("CVE-2015-1250", "CVE-2015-1243");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-24 11:04:07 +0200 (Wed, 24 May 2017) $");
  script_tag(name:"creation_date", value:"2015-05-04 14:23:48 +0530 (Mon, 04 May 2015)");
  script_name("Google Chrome Multiple Vulnerabilities-01 May15 (Mac OS X)");

  script_tag(name: "summary" , value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws are due to,
  - A Use-after-free flaw in the MutationObserver::disconnect function
    in core/dom/MutationObserver.cpp script in the DOM implementation in Blink.
  - Multiple Unspecified flaws due to unknown vectors.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to cause a denial-of-service condition and other unspecified impacts.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Google Chrome version prior to
  42.0.2311.135 on Mac OS X.");

  script_tag(name: "solution" , value:"Upgrade to Google Chrome version
  42.0.2311.135 or later,
  For updates refer to http://www.google.com/chrome");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.in/2015/04/stable-channel-update_28.html");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_macosx.nasl");
  script_mandatory_keys("GoogleChrome/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
chromeVer = "";

## Get version
if(!chromeVer = get_app_version(cpe:CPE)) exit(0);

## Grep for vulnerable version
if(version_is_less(version:chromeVer, test_version:"42.0.2311.135"))
{
  report = 'Installed version: ' + chromeVer + '\n' +
           'Fixed version:     42.0.2311.135'  + '\n';
  security_message(data:report);
  exit(0);
}
