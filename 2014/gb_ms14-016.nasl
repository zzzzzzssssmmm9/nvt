###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms14-016.nasl 9354 2018-04-06 07:15:32Z cfischer $
#
# Microsoft Windows SAMR Protocol Security Bypass Vulnerability (2934418)
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804245");
  script_version("$Revision: 9354 $");
  script_cve_id("CVE-2014-0317");
  script_bugtraq_id(66012);
  script_tag(name:"cvss_base", value:"5.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:N/I:C/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-03-12 08:48:40 +0530 (Wed, 12 Mar 2014)");
  script_tag(name:"solution_type", value: "VendorFix");
  script_name("Microsoft Windows SAMR Protocol Security Bypass Vulnerability (2934418)");

  tag_summary =
"This host is missing an important security update according to Microsoft
Bulletin MS14-016.";

  tag_vuldetect =
"Get the vulnerable file version and check appropriate patch is applied
or not.";

  tag_insight =
"Flaw is due to improper validation of user lockout state by Security Account
Manager Remote (SAMR) protocol .";

  tag_impact =
"Successful exploitation will allow attackers to bypass certain security
features.

Impact Level: System/Application";

  tag_affected =
"Microsoft Windows XP Service Pack 3 and prior
Microsoft Windows XP x64 Edition Service Pack 2 and prior
Microsoft Windows 2003 x32/x64 Service Pack 2 and prior
Microsoft Windows Vista x32/x64 Service Pack 2 and prior
Microsoft Windows Server 2008 x32/x64 Service Pack 2 and prior
Microsoft Windows Server 2008 R2 x64 Service Pack 1 and prior
Microsoft Windows Server 2012
Microsoft Windows Server 2012 R2";

  tag_solution =
"Run Windows Update and update the listed hotfixes or download and
update mentioned hotfixes in the advisory from the below link,
https://technet.microsoft.com/en-us/security/bulletin/ms14-016";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2934418");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/security/bulletin/ms14-016");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Check for OS and Service Pack
if(hotfix_check_sp(xp:4, xpx64:3, win2003:3, win2003x64:3, winVista:3, win2008:3,
                   win2008r2:2, win2012:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

if(registry_key_exists(key:"SYSTEM\CurrentControlSet\Services\ADAM\Linkage"))
{
  adamdsaVer = fetch_file_version(sysPath, file_name:"ADAM\Adamdsa.dll");

  if(adamdsaVer != NULL)
  {
    if(hotfix_check_sp(xp:4) > 0)
    {
      if(version_is_less(version:adamdsaVer, test_version:"1.1.3790.5289"))
      {
        security_message(0);
        exit(0);
      }
    }

    if(hotfix_check_sp(win2003:3, win2003x64:3, xpx64:3) > 0 )
    {
      if(version_is_less(version:adamdsaVer, test_version:"1.1.3790.5297"))
      {
        security_message(0);
        exit(0);
      }
    }
  }
}

#i# Get the version for Samsrv.dll
dllVer = fetch_file_version(sysPath, file_name:"system32\Samsrv.dll");
if(!dllVer){
  exit(0);
}

if(hotfix_check_sp(win2003:3, win2003x64:3) > 0 )
{
  if(version_is_less(version:dllVer, test_version:"5.2.3790.5297"))
  {
    security_message(0);
    exit(0);
  }
}

## Windows Vista and Windows Server 2008
## Currently not supporting for Vista and Windows Server 2008 64 bit
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  ## Check for Samsrv.dll version
  if(version_is_less(version:dllVer, test_version:"6.0.6002.19029") ||
     version_in_range(version:dllVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23316"))
  {
    security_message(0);
    exit(0);
  }
}


## Windows Server 2008 R2
if(hotfix_check_sp(win2008r2:2) > 0)
{
  ## Check for Samsrv.dll version
  if(version_is_less(version:dllVer, test_version:"6.1.7601.18377") ||
     version_in_range(version:dllVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.22578"))
  {
    security_message(0);
    exit(0);
  }
}


## Windows Server 2012
if(hotfix_check_sp(win2012:1) > 0)
{
  ## Check for Samsrv.dll version
  if(version_is_less(version:dllVer, test_version:"6.2.9200.16791") ||
     version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.20909"))
  {
    security_message(0);
    exit(0);
  }
}
