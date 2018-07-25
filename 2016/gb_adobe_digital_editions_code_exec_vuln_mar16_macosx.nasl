###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_digital_editions_code_exec_vuln_mar16_macosx.nasl 5813 2017-03-31 09:01:08Z teissa $
#
# Adobe Digital Editions Code Execution Vulnerability March16 (Mac OS X)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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

CPE = "cpe:/a:adobe:digital_editions";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807474");
  script_version("$Revision: 5813 $");
  script_cve_id("CVE-2016-0954");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-31 11:01:08 +0200 (Fri, 31 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-03-10 12:56:38 +0530 (Thu, 10 Mar 2016)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Adobe Digital Editions Code Execution Vulnerability March16 (Mac OS X)");

  script_tag(name: "summary" , value:"This host is installed with Adobe Digital Edition
  and is prone to code execution Vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight", value:"The flaw is due to memory leak vulnerability.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary code.

  Impact Level: System/Application");
  
  script_tag(name: "affected" , value:"Adobe Digital Edition 4.x before 4.5.1 on Mac OS X.");

  script_tag(name: "solution" , value:"Upgrade to Adobe Digital Edition version 4.5.1
  or later.
  For updates refer to http://www.adobe.com/");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://helpx.adobe.com/security/products/Digital-Editions/apsb16-06.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_digital_edition_detect_macosx.nasl");
  script_mandatory_keys("AdobeDigitalEdition/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
readerVer = "";

## Get version
if(!readerVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check Adobe Digital Edition vulnerable versions
if(version_in_range(version:readerVer, test_version:"4.0.0", test_version2:"4.5.0"))
{
  report = report_fixed_ver(installed_version:readerVer, fixed_version:"4.5.1");
  security_message(data:report);
  exit(0);
}

