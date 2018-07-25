###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_code_exec_vuln_mar15_macosx.nasl 6486 2017-06-29 09:59:06Z teissa $
#
# Mozilla Firefox ESR Just-in-time (JIT) Code Execution Vulnerability Mar15 (Mac OS X) 
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:mozilla:firefox_esr";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805511");
  script_version("$Revision: 6486 $");
  script_cve_id("CVE-2015-0817");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-06-29 11:59:06 +0200 (Thu, 29 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-03-27 13:06:46 +0530 (Fri, 27 Mar 2015)");
  script_name("Mozilla Firefox ESR Just-in-time (JIT) Code Execution Vulnerability Mar15 (Mac OS X)");

  script_tag(name: "summary" , value:"This host is installed with Mozilla Firefox ESR
  and is prone to code execution vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to an out-of-bounds access
  error in asmjs/AsmJSValidate.cpp within the JavaScript Just-in-time Compilation
  (JIT)");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to conduct arbitrary code execution.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Mozilla Firefox ESR 31.x before 31.5.2 on
  Mac OS X");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Firefox ESR version
  31.5.2 or later, For updates refer to
  https://www.mozilla.org/en-US/firefox/organizations");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"http://www.securitytracker.com/id/1031958");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-29");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox-ESR/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
ffVer = "";

## Get version
if(!ffVer = get_app_version(cpe:CPE)){
  exit(0);
}

# Check for vulnerable version
if(ffVer =~ "^(31)\.")
{
  if((version_in_range(version:ffVer, test_version:"31.0", test_version2:"31.5.1")))
  {
    report = 'Installed version: ' + ffVer + '\n' +
             'Fixed version:     ' + "31.5.2"  + '\n';
    security_message(data:report);
    exit(0);
  }
}