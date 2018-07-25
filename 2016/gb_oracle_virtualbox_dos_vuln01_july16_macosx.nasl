###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_virtualbox_dos_vuln01_july16_macosx.nasl 5759 2017-03-29 09:01:08Z teissa $
#
# Oracle Virtualbox Denial of Service Vulnerability-01 July16 (Mac OS X)
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

CPE = "cpe:/a:oracle:vm_virtualbox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808260");
  script_version("$Revision: 5759 $");
  script_cve_id("CVE-2016-3597");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-29 11:01:08 +0200 (Wed, 29 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-07-21 12:24:33 +0530 (Thu, 21 Jul 2016)");
  script_name("Oracle Virtualbox Denial of Service Vulnerability-01 July16 (Mac OS X)");

  script_tag(name: "summary" , value:"This host is installed with Oracle VM
  VirtualBox and is prone to a denial of service vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to some unspecified
  error in the Oracle VM VirtualBox Core component.");

  script_tag(name: "impact" , value:"Successful exploitation will allow local
  attackers to have an impact on availability.

  Impact Level: Application");

  script_tag(name: "affected" , value:"VirtualBox versions prior to 5.0.26
  on Mac OS X.");

  script_tag(name: "solution" , value:"Upgrade to Oracle VirtualBox version
  5.0.26 or later. For updates refer to https://www.virtualbox.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpujul2016-2881720.html");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("secpod_oracle_virtualbox_detect_macosx.nasl");
  script_mandatory_keys("Oracle/VirtualBox/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
virtualVer = "";

## Get version
if(!virtualVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(virtualVer =~ "^5\.0\.")
{
  ## Grep for vulnerable version
  if(version_in_range(version:virtualVer, test_version:"5.0.0", test_version2:"5.0.25"))
  {
    report = report_fixed_ver(installed_version:virtualVer, fixed_version:"5.0.26");
    security_message(data:report);
    exit(0);
  }
}
