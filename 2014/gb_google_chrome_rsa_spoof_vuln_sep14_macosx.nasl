#############################################################################/##
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_rsa_spoof_vuln_sep14_macosx.nasl 6759 2017-07-19 09:56:33Z teissa $
#
# Google Chrome RSA Spoof Vulnerability September14 (Macosx)
#
# Authors:
# Deepmala <kdeepmala@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.804927");
  script_version("$Revision: 6759 $");
  script_cve_id("CVE-2014-1568");
  script_bugtraq_id(70116);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-19 11:56:33 +0200 (Wed, 19 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-09-30 10:00:31 +0530 (Tue, 30 Sep 2014)");

  script_name("Google Chrome RSA Spoof Vulnerability September14 (Macosx)");

  script_tag(name: "summary" , value:"This host is installed with Google Chrome
  and is prone to spoof vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Flaw exists due to improper handling of
  ASN.1 values while parsing RSA signature");

  script_tag(name: "impact" , value:"Successful exploitation will allow attackers
  to conduct spoofing attacks.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Google Chrome before 37.0.2062.124 on Macosx");

  script_tag(name: "solution" , value:"Upgrade to Google Chrome version 37.0.2062.124
  or later, For updates refer to http://www.google.com/chrome");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://googlechromereleases.blogspot.in/2014/09/stable-channel-update-for-chrome-os_24.html");
  script_xref(name:"URL", value:"http://googlechromereleases.blogspot.in/2014/09/stable-channel-update_24.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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
if(!chromeVer = get_app_version(cpe:CPE)){
  exit(0);
}

# Check for vulnerable version
if(version_is_less(version:chromeVer, test_version:"37.0.2062.124"))
{
  security_message(0);
  exit(0);
}
