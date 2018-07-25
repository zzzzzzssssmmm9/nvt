###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_mfsa_2016-01_2016-15_win.nasl 10135 2018-06-08 11:42:28Z asteins $
#
# Mozilla Thunderbird Security Updates( mfsa_2016-01_2016-15 )-Windows
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
  script_oid("1.3.6.1.4.1.25623.1.0.808689");
  script_version("$Revision: 10135 $");
  script_cve_id("CVE-2016-1935", "CVE-2016-1930", "CVE-2016-1931", "CVE-2016-1523");
  script_bugtraq_id(81952, 81953, 82991);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 13:42:28 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2016-09-07 12:05:44 +0530 (Wed, 07 Sep 2016)");
  script_name("Mozilla Thunderbird Security Updates( mfsa_2016-01_2016-15 )-Windows");

  script_tag(name: "summary" , value:"This host is installed with Mozilla
  Thunderbird and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name: "insight" , value:"Multiple flaws exist due to,
  - The Buffer overflow in the BufferSubData function.
  - Multiple unspecified Vulnerabilities.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to cause a denial of service
  (memory corruption and application crash) or possibly execute arbitrary code.
  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Mozilla Thunderbird version before
  38.6 on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Thunderbird version 38.6
  For updates refer https://www.mozilla.org/en-US/thunderbird");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-03/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-01/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-14/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_thunderbird_detect_portable_win.nasl");
  script_mandatory_keys("Thunderbird/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!tbVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:tbVer, test_version:"38.6"))
{
  report = report_fixed_ver(installed_version:tbVer, fixed_version:"38.6");
  security_message(data:report);
  exit(0);
}
