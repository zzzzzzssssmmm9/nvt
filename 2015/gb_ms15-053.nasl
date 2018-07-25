###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-053.nasl 6243 2017-05-30 09:04:14Z teissa $
#
# Microsoft Windows JScript & VBScript Security Bypass Vulnerability (3057263)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:microsoft:ie";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805614");
  script_version("$Revision: 6243 $");
  script_cve_id("CVE-2015-1684", "CVE-2015-1686");
  script_bugtraq_id(74530, 74522);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-05-30 11:04:14 +0200 (Tue, 30 May 2017) $");
  script_tag(name:"creation_date", value:"2015-05-13 11:43:10 +0530 (Wed, 13 May 2015)");
  script_name("Microsoft Windows JScript & VBScript Security Bypass Vulnerability (3057263)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-053.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Flaw exists as the JScript and VBScript
  engines fails to use the Address Space Layout Randomization (ASLR) security
  feature, allowing an attacker to more reliably predict the memory offsets of
  specific instructions in a given call stack.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  context-dependent attacker to bypass certain security restrictions and execute
  arbitrary code in conjunction with some another vulnerability.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"
  Microsoft Windows 2003 x32/x64 Service Pack 2 and prior
  Microsoft Windows Vista x32/x64 Service Pack 2 and prior
  Microsoft Windows Server 2008 x32/x64 Service Pack 2 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS15-053");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/3050946");
  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/3050941");
  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/3050945");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS15-053");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl", "gb_ms_ie_detect.nasl");
  script_mandatory_keys("MS/IE/Version");
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
v_dllVer = "";
j_dllVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win2003:3, win2003x64:3, winVista:3, win2008:3) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Get IE Version
ieVer = get_app_version(cpe:CPE);
if(ieVer =~ "^(8|9|10|11)"){
  exit(0);
}

## Get Version from Vbscript.dll file
v_dllVer = fetch_file_version(sysPath, file_name:"system32\Vbscript.dll");
if(!v_dllVer){
  exit(0);
}

## Get Version from Jscript.dll file
j_dllVer = fetch_file_version(sysPath, file_name:"system32\Jscript.dll");
if(!j_dllVer){
  exit(0);
}

##Windows 2003
if(hotfix_check_sp(win2003:3, win2003x64:3) > 0)
{
  ## Check for Vbscript.dll and Jscript.dll version
  if((version_in_range(version:v_dllVer, test_version:"5.6", test_version2:"5.6.0.8854")) ||
     (version_in_range(version:v_dllVer, test_version:"5.7.6002.23000", test_version2:"5.7.6002.23658")) ||
     (version_in_range(version:j_dllVer, test_version:"5.6", test_version2:"5.6.0.8854")) ||
     (version_in_range(version:j_dllVer, test_version:"5.7.6002.23000", test_version2:"5.7.6002.23658"))){
    security_message(0);
  }
  exit(0);
}

## Windows Vista and Windows Server 2008
## Currently not supporting for Vista and Windows Server 2008 64 bit
if(hotfix_check_sp(win2008:3) > 0)
{
  ## Check for Vbscript.dll and Jscript.dll version
  if((version_in_range(version:v_dllVer, test_version:"5.8.7601.17000", test_version2:"5.8.7601.18810")) ||
     (version_in_range(version:v_dllVer, test_version:"5.8.7601.21000", test_version2:"5.8.7601.23015")) ||
     (version_in_range(version:v_dllVer, test_version:"5.7", test_version2:"5.7.6002.19350")) ||
     (version_in_range(version:v_dllVer, test_version:"5.7.6002.23000", test_version2:"5.7.6002.23658")) ||
     (version_in_range(version:j_dllVer, test_version:"5.8.7601.17000", test_version2:"5.8.7601.18810")) ||
     (version_in_range(version:j_dllVer, test_version:"5.8.7601.21000", test_version2:"5.8.7601.23015")) ||
     (version_in_range(version:j_dllVer, test_version:"5.7", test_version2:"5.7.6002.19350")) ||
     (version_in_range(version:j_dllVer, test_version:"5.7.6002.23000", test_version2:"5.7.6002.23658"))){
    security_message(0);
  }
  exit(0);
}


if(hotfix_check_sp(winVista:3) > 0)
{
  ## Check for Vbscript.dll and Jscript.dll version
  if((version_in_range(version:v_dllVer, test_version:"5.7", test_version2:"5.7.6002.19350")) ||
     (version_in_range(version:v_dllVer, test_version:"5.7.6002.23000", test_version2:"5.7.6002.23658")) ||
     (version_in_range(version:j_dllVer, test_version:"5.7", test_version2:"5.7.6002.19350")) ||
     (version_in_range(version:j_dllVer, test_version:"5.7.6002.23000", test_version2:"5.7.6002.23658"))){
    security_message(0);
  }
  exit(0);
}
