###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_virtualbox_mult_unspecified_vuln01_aug14_win.nasl 6637 2017-07-10 09:58:13Z teissa $
#
# Oracle VM VirtualBox Multiple Unspecified Vulnerabilities-01 Aug2014 (Windows)
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

CPE = "cpe:/a:oracle:vm_virtualbox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804692");
  script_version("$Revision: 6637 $");
  script_cve_id("CVE-2014-4261", "CVE-2014-2487");
  script_bugtraq_id(68588, 68613);
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 11:58:13 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-08-04 18:39:05 +0530 (Mon, 04 Aug 2014)");
  script_name("Oracle VM VirtualBox Multiple Unspecified Vulnerabilities-01 Aug2014 (Windows)");

  tag_summary =
"This host is installed with Oracle VM VirtualBox and is prone to multiple
unspecified vulnerabilities.";

  tag_vuldetect =
"Get the installed version of Oracle VM VirtualBox and check the version
is vulnerable or not.";

  tag_insight =
"The flaw is due to unspecified errors related to the 'core' subcomponent.";

  tag_impact =
"Successful exploitation will allow local users to affect confidentiality,
integrity, and availability via unknown vectors.

Impact Level: Application";

  tag_affected =
"Oracle VM VirtualBox before versions 3.2.24, 4.0.26, 4.1.34, 4.2.26, and
4.3.14";

  tag_solution =
"Apply the patch from below link,
http://www.oracle.com/technetwork/topics/security/cpujul2014-1972956.html";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/59510");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpujul2014-1972956.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_sun_virtualbox_detect_win.nasl");
  script_mandatory_keys("Oracle/VirtualBox/Win/Ver");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable Initialization
virtualVer = "";

## Get version
if(!virtualVer = get_app_version(cpe:CPE))
{
  CPE = "cpe:/a:sun:virtualbox";
  if(!virtualVer=get_app_version(cpe:CPE)){
    exit(0);
  }
}

if(virtualVer =~ "^((3|4)\.)")
{
  ## Check for vulnerable version
  if(version_in_range(version:virtualVer, test_version:"3.2.0", test_version2:"3.2.23")||
     version_in_range(version:virtualVer, test_version:"4.0.0", test_version2:"4.0.25")||
     version_in_range(version:virtualVer, test_version:"4.1.0", test_version2:"4.1.33")||
     version_in_range(version:virtualVer, test_version:"4.2.0", test_version2:"4.2.25")||
     version_in_range(version:virtualVer, test_version:"4.3.0", test_version2:"4.3.13"))
  {
    security_message(0);
    exit(0);
  }
}
