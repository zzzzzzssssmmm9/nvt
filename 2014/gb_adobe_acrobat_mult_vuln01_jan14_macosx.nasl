###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_acrobat_mult_vuln01_jan14_macosx.nasl 34613 2014-01-21 12:57:21Z Jan$
#
# Adobe Acrobat Multiple Vulnerabilities - 01 Jan14 (Mac OS X)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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

CPE = "cpe:/a:adobe:acrobat";
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.804071";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 8200 $");
  script_cve_id("CVE-2014-0493", "CVE-2014-0495", "CVE-2014-0496");
  script_bugtraq_id(64802, 64803, 64804);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-12-20 14:48:45 +0100 (Wed, 20 Dec 2017) $");
  script_tag(name:"creation_date", value:"2014-01-21 12:57:21 +0530 (Tue, 21 Jan 2014)");
  script_name("Adobe Acrobat Multiple Vulnerabilities - 01 Jan14 (Mac OS X)");

  tag_summary =
"This host is installed with Adobe Acrobat and is prone to multiple unspecified
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Flaw is due to some unspecified errors and an error in dereferencing already
freed memory.";

  tag_impact =
"Successful exploitation will allow attackers to, execute arbitrary code and
compromise a user's system.

Impact Level: System/Application";

  tag_affected =
"Adobe Acrobat X Version 10.x prior to 10.1.9 on Mac OS X
Adobe Acrobat XI Version 11.x prior to 11.0.06 on Mac OS X";

  tag_solution =
"Update to Adobe Acrobat Version 10.1.9 or 11.0.06 or later,
For updates refer to http://www.adobe.com/in/products/acrobat.html";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/56303");
  script_xref(name : "URL" , value : "http://helpx.adobe.com/security/products/acrobat/apsb14-01.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_macosx.nasl");
  script_mandatory_keys("Adobe/Acrobat/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
acrobatVer = "";

## Get version
if(!acrobatVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

if(acrobatVer && acrobatVer =~ "^10|11")
{
  ## Check Adobe Acrobat vulnerable version
  if((version_in_range(version:acrobatVer, test_version:"10.0", test_version2: "10.1.8"))||
     (version_in_range(version:acrobatVer, test_version:"11.0", test_version2: "11.0.05")))
  {
    security_message(0);
    exit(0);
  }
}
