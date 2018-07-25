###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_seamonkey_mult_vuln01_nov13_macosx.nasl 17396 2013-11-07 16:22:33Z nov$
#
# Mozilla SeaMonkey Multiple Vulnerabilities-01 Nov13 (Mac OS X)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:mozilla:seamonkey";
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.804141";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6093 $");
  script_cve_id("CVE-2013-5603", "CVE-2013-5604", "CVE-2013-5602", "CVE-2013-5601",
                "CVE-2013-5600", "CVE-2013-5599", "CVE-2013-5597", "CVE-2013-5591",
                "CVE-2013-5590", "CVE-2013-5593", "CVE-2013-5595", "CVE-2013-5596");
  script_bugtraq_id(63416, 63430, 63424, 63428, 63427, 63423, 63422,63417,
                    63415, 63429, 63421, 63420);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-10 11:03:18 +0200 (Wed, 10 May 2017) $");
  script_tag(name:"creation_date", value:"2013-11-07 19:50:51 +0530 (Thu, 07 Nov 2013)");
  script_name("Mozilla SeaMonkey Multiple Vulnerabilities-01 Nov13 (Mac OS X)");

  tag_summary =
"This host is installed with Mozilla Seamonkey and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Multiple flaws due to,
- Use-after-free vulnerability in the
'nsContentUtils::ContentIsHostIncludingDescendantOf' function.
- Improper data initialization in the 'txXPathNodeUtils::getBaseURI' function.
- An error in 'Worker::SetEventListener' function Web workers implementation.
- Use-after-free vulnerability in the
'nsEventListenerManager::SetEventHandler' function.
- Use-after-free vulnerability in 'nsIOService::NewChannelFromURIWithProxyFlags'
function.
- Use-after-free vulnerability in the 'nsIPresShell::GetPresContext' function.
- Use-after-free vulnerability in 'nsDocLoader::doStopDocumentLoad' function.
- Multiple unspecified vulnerabilities in the browser engine.
- Improper restriction of the nature or placement of HTML within a dropdown
menu.
- Improper memory allocation for unspecified functions by JavaScript engine.
- Improper determination of the thread for release of an image object.";

  tag_impact =
"Successful exploitation will allow attackers to execute arbitrary code,
cause a denial of service, spoof the address bar, conduct clickjacking attacks
and conduct buffer overflow attacks.

Impact Level: System/Application";

  tag_affected =
"Mozilla SeaMonkey before version 2.22 on Mac OS X";

  tag_solution =
"Upgrade to version 2.22 or later,
For updates refer to http://www.mozilla.org/projects/seamonkey";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/55520");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2013/mfsa2013-102.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("SeaMonkey/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
smVer = "";

## Get version
if(!smVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

# Check for vulnerable version
if(version_is_less(version:smVer, test_version:"2.22"))
{
  security_message(0);
  exit(0);
}
