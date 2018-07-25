###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_mfsa_2016-88_2016-88_macosx.nasl 5568 2017-03-14 10:00:33Z teissa $
#
# Mozilla Thunderbird Security Updates( mfsa_2016-88_2016-88 )-MAC OS X
#
# Authors:
# kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:mozilla:thunderbird";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809395");
  script_version("$Revision: 5568 $");
  script_cve_id("CVE-2016-5270", "CVE-2016-5272", "CVE-2016-5276", "CVE-2016-5274", 
		"CVE-2016-5277", "CVE-2016-5278", "CVE-2016-5280", "CVE-2016-5284",
		"CVE-2016-5250", "CVE-2016-5257", "CVE-2016-5281");
  script_bugtraq_id(93049, 92260);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-14 11:00:33 +0100 (Tue, 14 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-10-21 15:37:09 +0530 (Fri, 21 Oct 2016)");
  script_name("Mozilla Thunderbird Security Updates( mfsa_2016-88_2016-88 )-MAC OS X");

  script_tag(name: "summary" , value:"This host is installed with Mozilla
  Thunderbird and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exist due to
  - Heap-buffer-overflow in nsCaseTransformTextRunFactory::TransformString.
  - Bad cast in nsImageGeometryMixin.
  - Heap-use-after-free in mozilla::a11y::DocAccessible::ProcessInvalidationList.
  - Use-after-free in nsFrameManager::CaptureFrameState.
  - Use-after-free in DOMSVGLength.
  - Heap-use-after-free in nsRefreshDriver::Tick.
  - Heap-buffer-overflow in nsBMPEncoder::AddImageFrame.
  - Use-after-free in mozilla::nsTextNodeDirectionalityMap::RemoveElementFromMap.
  - Add-on update site certificate pin expiration.
  - Resource Timing API is storing resources sent by the previous page.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to cause denial of service, to get a
  mis-issued certificate for a Mozilla web sit could send malicious add-on updates
  to users on networks controlled by the attacker, to get potential
  information, also allows to run arbitrary code.

  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Mozilla Thunderbird version before 
  45.4 on MAC OS X.");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Thunderbird version 45.4
  For updates refer https://www.mozilla.org/en-US/thunderbird");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-88/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("ThunderBird/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
tbVer = "";

## Get version
if(!tbVer = get_app_version(cpe:CPE)){
  exit(0);
}

# Check for vulnerable version
if(version_is_less(version:tbVer, test_version:"45.4"))
{
  report = report_fixed_ver(installed_version:tbVer, fixed_version:"45.4");
  security_message(data:report);
  exit(0);
}
