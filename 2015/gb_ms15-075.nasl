###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-075.nasl 6237 2017-05-29 13:53:57Z cfi $
#
# Microsoft Windows OLE Privilege Elevation Vulnerability (3072633)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805677");
  script_version("$Revision: 6237 $");
  script_cve_id("CVE-2015-2416", "CVE-2015-2417");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-05-29 15:53:57 +0200 (Mon, 29 May 2017) $");
  script_tag(name:"creation_date", value:"2015-07-15 08:49:13 +0530 (Wed, 15 Jul 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows OLE Privilege Elevation Vulnerability (3072633)");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-075.");

  script_tag(name: "vuldetect" , value: "Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name: "insight" , value: "The flaw is due to Microsoft Windows
  incorrectly handles OLE objects in documents.");

  script_tag(name: "impact" , value: "Successful exploitation will allow attackers
  to bypass security protections on affected systems.

  Impact Level: System");

  script_tag(name: "affected" , value:"Microsoft Windows 8 x32/x64

  Microsoft Windows 8.1 x32/x64

  Microsoft Windows Server 2012

  Microsoft Windows Server 2012R2

  Microsoft Windows 2003 x32/x64 Edition Service Pack 2 and prior

  Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior

  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior

  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior

  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior.");

  script_tag(name: "solution" , value: "Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS15-075");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3072633");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS15-075");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
dllVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win2003:3, win2003x64:3, winVista:3, win7:2, win7x64:2,
                   win2008:3, win2008r2:2, win8:1, win8x64:1, win8_1:1,
                   win8_1x64:1, win2012:1,  win2012R2:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

## Get Version from 'Ole32.dll' file
dllVer = fetch_file_version(sysPath, file_name:"system32\Ole32.dll");
if(!dllVer){
  exit(0);
}

## Windows Vista and Windows Server 2008
## Currently not supporting for Vista and Windows Server 2008 64 bit
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  ## Check for Ole32.dll version
  if(version_is_less(version:dllVer, test_version:"6.0.6002.19435") ||
     version_in_range(version:dllVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23742")){
    security_message(0);
  }
  exit(0);
}

## Windows 2003
if(hotfix_check_sp(win2003:3, win2003x64:3) > 0)
{
  ## Check for Ole32.dll version
  if(version_is_less(version:dllVer, test_version:"5.2.3790.5663")){
    security_message(0);
  }
  exit(0);
}

## Windows 7 and Windows 2008 R2
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Check for Ole32.dll version
  if(version_is_less(version:dllVer, test_version:"6.1.7601.18896") ||
     version_in_range(version:dllVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.23098")){
    security_message(0);
  }
  exit(0);
}

## Win 8 and 2012
if(hotfix_check_sp(win8:1, win8x64:1, win2012:1) > 0)
{
  ## Check for Ole32.dll version
  if(version_is_less(version:dllVer, test_version:"6.2.9200.17414") ||
     version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21523")){
    security_message(0);
  }
  exit(0);
}

## Win 8.1 and win2012R2
if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  ## Check for Ole32.dll version
  if(version_is_less(version:dllVer, test_version:"6.3.9600.17905")){
    security_message(0);
  }
  exit(0);
}
