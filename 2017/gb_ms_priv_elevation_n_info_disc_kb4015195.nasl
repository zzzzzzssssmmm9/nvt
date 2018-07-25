###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_priv_elevation_n_info_disc_kb4015195.nasl 6106 2017-05-11 10:32:49Z antu123 $
#
# Microsoft Privilege Elevation And Information Disclosure Vulnerabilities (KB4015195)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.810925");
  script_version("$Revision: 6106 $");
  script_cve_id("CVE-2017-0058", "CVE-2017-0155");
  script_bugtraq_id(97462, 97471);
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-11 12:32:49 +0200 (Thu, 11 May 2017) $");
  script_tag(name:"creation_date", value:"2017-04-12 17:38:58 +0530 (Wed, 12 Apr 2017)");
  script_name("Microsoft Privilege Elevation And Information Disclosure Vulnerabilities (KB4015195)");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft security update KB4015195.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"Multiple flaws are due to,
  - The win32k component improperly provides kernel information.
  - The Microsoft Graphics Component fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code in kernel mode. An attacker could then install programs; 
  view, change, or delete data; or create new accounts with full user rights and
  obtain information to further compromise the users system.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows Vista x32/x64 Edition Service Pack 2
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-gb/help/4015195");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-gb/help/4015195");
  script_xref(name : "URL" , value : "https://portal.msrc.microsoft.com/en-us/security-guidance");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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
asVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(winVista:3, win2008:3, winVistax64:3, win2008x64:3) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

## Fetch the version of Win32k.sys
winVer = fetch_file_version(sysPath, file_name:"Win32k.sys");
if(!winVer){
  exit(0);
}

## Windows Vista and Windows Server 2008
if(hotfix_check_sp(winVista:3, winVistax64:3, win2008:3, win2008x64:3) > 0)
{
  if(version_is_less(version:winVer, test_version:"6.0.6002.19749"))
  {
    Vulnerable_range = "Less than 6.0.6002.19749";
    VULN = TRUE ;
  }

  else if(version_in_range(version:winVer, test_version:"6.0.6002.24000", test_version2:"6.0.6002.24071"))
  {
    Vulnerable_range = "6.0.6002.24000 - 6.0.6002.24071";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "Win32k.sys" + '\n' +
           'File version:     ' + winVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}

exit(0);
