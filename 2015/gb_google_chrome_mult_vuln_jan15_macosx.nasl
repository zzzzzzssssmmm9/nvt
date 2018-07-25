###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln_jan15_macosx.nasl 6600 2017-07-07 09:58:31Z teissa $
#
# Google Chrome Multiple Vulnerabilities - Jan15 (Mac OS X)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.805408");
  script_version("$Revision: 6600 $");
  script_cve_id("CVE-2011-1798", "CVE-2011-1796", "CVE-2011-1795", "CVE-2011-1794",
                "CVE-2011-1793");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:58:31 +0200 (Fri, 07 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-01-02 12:58:34 +0530 (Fri, 02 Jan 2015)");
  script_name("Google Chrome Multiple Vulnerabilities - Jan15 (Mac OS X)");

  script_tag(name: "summary" , value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple Flaws are due to,
  - Use-after-free vulnerability in the FrameView::calculateScrollbarModesForLayout
  function in page/FrameView.cpp script within WebCore in WebKit.
  - Integer underflow in the HTMLFormElement::removeFormElement function in
  html/HTMLFormElement.cpp script within WebCore in WebKit.
  - Integer overflow in the FilterEffect::copyImageBytes function in
  platform/graphics/filters/FilterEffect.cpp script within WebCore in WebKit.
  - Integer overflow in the FilterEffect.
  - Two unspecified errors in rendering/svg/RenderSVGText.cpp script within
  WebCore in WebKit.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to cause a denial of service (application crash) or possibly have
  unspecified other impacts.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Google Chrome version prior to
  11.0.696.65 on Mac OS X.");

  script_tag(name: "solution" , value:"Upgrade to Google Chrome version
  11.0.696.65 or later, For updates refer to http://www.google.com/chrome");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://trac.webkit.org/changeset/85406");
  script_xref(name : "URL" , value : "https://code.google.com/p/chromium/issues/detail?id=67923");
  script_xref(name : "URL" , value : "https://bugs.launchpad.net/ubuntu/+source/chromium-browser/+bug/778822");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
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

## Grep for vulnerable version
if(version_is_less(version:chromeVer, test_version:"11.0.696.65"))
{
  security_message(0);
  exit(0);
}
