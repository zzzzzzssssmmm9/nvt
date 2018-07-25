###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_robohelp_code_exec_vuln_win.nasl 8194 2017-12-20 11:29:51Z cfischer $
#
# Adobe RoboHelp Arbitrary Code Execution Vulnerability (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:robohelp";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803771");
  script_version("$Revision: 8194 $");
  script_cve_id("CVE-2013-5327");
  script_bugtraq_id(62887);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-12-20 12:29:51 +0100 (Wed, 20 Dec 2017) $");
  script_tag(name:"creation_date", value:"2013-10-17 16:38:27 +0530 (Thu, 17 Oct 2013)");
  script_name("Adobe RoboHelp Arbitrary Code Execution Vulnerability (Windows)");

  tag_summary = "This host is installed with Adobe RoboHelp and is prone to arbitrary code
execution vulnerability.";

  tag_vuldetect = "Get the installed version with the help of detect NVT and check the
version is vulnerable or not.";

  tag_insight = "The flaw is due to an unspecified error and can be exploited to cause
memory corruption.";

  tag_impact = "Successful exploitation will allow attackers to execute arbitrary code,
cause a denial of service (application crash).

Impact Level: System/Application";

  tag_affected = "Adobe RoboHelp version 10.x on Windows";

  tag_solution = "Apply the patch from below link,
http://www.adobe.com/support/security/bulletins/apsb13-24.html ";

  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/54647");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb13-24.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_robohelp_detect_win.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("Adobe/RoboHelp/Win/Ver", "Adobe/RoboHelp/Win/InstallPath");
  exit(0);
}

include("smb_nt.inc");
include("version_func.inc");
include("host_details.inc");
include("secpod_smb_func.inc");

## Variable Initialization
arhVer = "";
dllPath = "";

## Get version
if(!arhVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(arhVer =~ "^10.*")
{
  dllPath = get_kb_item("Adobe/RoboHelp/Win/InstallPath");

  ## Exit if install location is not available
  if(dllPath && "Could not find the install location" >< dllPath){
    exit(0);
  }

  ## Get the file version
  dllVer = fetch_file_version(sysPath:dllPath, file_name:"\RoboHTML\MDBMS.dll");
  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"10.0", test_version2:"10.0.1.293"))
    {
      security_message(0);
      exit(0);
    }
  }
}
