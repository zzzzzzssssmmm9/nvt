###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_picasa_camp_section_bof_vuln_macosx.nasl 6357 2017-06-16 10:00:29Z teissa $
#
# Google Picasa 'CAMF' Section Buffer Overflow Vulnerability (Mac OS X)
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
CPE = "cpe:/a:google:picasa";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806630");
  script_version("$Revision: 6357 $");
  script_cve_id("CVE-2015-8221");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-06-16 12:00:29 +0200 (Fri, 16 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-11-26 13:18:12 +0530 (Thu, 26 Nov 2015)");
  script_name("Google Picasa 'CAMF' Section Buffer Overflow Vulnerability (Mac OS X)");

  script_tag(name: "summary" , value:"This host is installed with Google Picasa
  and is prone to buffer overflow vulnerability.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "The flaw is due to an integer overflow
  error when processing CAMF section in FOVb images.");

  script_tag(name: "impact" , value: "Successful exploitation will allow remote
  attackers to execute arbitrary code on the affected system.

  Impact Level: System/Application");

  script_tag(name: "affected" , value: "Google Picasa before version 3.9.140
  build 259 on MAc OS X");

  script_tag(name: "solution" , value: "Upgrade to Google Picasa version 3.9.140 
  build 259 or later. For updates refer http://picasa.google.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://packetstormsecurity.com/files/134315");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/536878/100/0/threaded");

  script_category(ACT_GATHER_INFO);
  script_family("Buffer overflow");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_dependencies("gb_google_picasa_detect_macosx.nasl");
  script_mandatory_keys("picVer/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
picVer = "";

## Get version
if(!picVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check for Google Picasa Version less than 3.9.140 build 259
if(version_is_less(version:picVer, test_version:"3.9.140.259"))
{
  report = 'Installed Version: ' + picVer + '\n' +
           'Fixed Version:     3.9.140 build 259 \n';
  security_message(data:report);
  exit(0);
}
