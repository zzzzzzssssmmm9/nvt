###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln01_jan14_lin.nasl 6759 2017-07-19 09:56:33Z teissa $
#
# Google Chrome Multiple Vulnerabilities-01 Jan2014 (Linux)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.804187";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6759 $");
  script_cve_id("CVE-2013-6641", "CVE-2013-6643", "CVE-2013-6644", "CVE-2013-6645",
                "CVE-2013-6646");
  script_bugtraq_id(64805, 64981);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-19 11:56:33 +0200 (Wed, 19 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-01-21 10:15:43 +0530 (Tue, 21 Jan 2014)");
  script_name("Google Chrome Multiple Vulnerabilities-01 Jan2014 (Linux)");

  tag_summary =
"The host is installed with Google Chrome and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Multiple flaws are due to,
 - A use-after-free error exists within web workers.
 - Use-after-free vulnerability in 'FormAssociatedElement::formRemovedFromTree'
 function in Blink.
 - Multiple unspecified errors.
 - Use-after-free vulnerability in 'OnWindowRemovingFromRootWindow' function.
 - An error in 'OneClickSigninBubbleView::WindowClosing' function.";

  tag_impact =
"Successful exploitation will allow remote attackers to conduct  denial of
service, execute an arbitrary code, trigger a sync with an arbitrary Google
account and other impacts.

Impact Level: System/Application";

  tag_affected =
"Google Chrome version prior to 32.0.1700.77 on Linux.";

  tag_solution =
"Upgrade to version 32.0.1700.77 or later,
For updates refer to http://www.google.com/chrome";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/56248");
  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1029611");
  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.in/2014/01/stable-channel-update.html");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_lin.nasl");
  script_mandatory_keys("Google-Chrome/Linux/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
chromeVer = "";

## Get version
if(!chromeVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:chromeVer, test_version:"32.0.1700.77"))
{
  security_message(0);
  exit(0);
}