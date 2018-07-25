###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-151.nasl 4770 2016-12-14 13:44:16Z antu123 $
#
# Microsoft Windows Kernel Mode Drivers Multiple Vulnerabilities (3205651)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810308");
  script_version("$Revision: 4770 $");
  script_cve_id("CVE-2016-7259", "CVE-2016-7260");
  script_bugtraq_id(94785, 94771);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2016-12-14 14:44:16 +0100 (Wed, 14 Dec 2016) $");
  script_tag(name:"creation_date", value:"2016-12-14 08:12:22 +0530 (Wed, 14 Dec 2016)");
  script_name("Microsoft Windows Kernel Mode Drivers Multiple Vulnerabilities (3205651)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-151");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The multiple flaws are due to,
  - The Windows Graphics Component improperly handles objects in memory.
  - The Windows kernel-mode driver fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code in kernel mode and run processes in an elevated context.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows 10 x32/x64.
  Microsoft Windows Server 2016.
  Microsoft Windows 8.1 x32/x64 Edition.
  Microsoft Windows Server 2012/2012R2.
  Microsoft Windows 10 Version 1511 x32/x64.
  Microsoft Windows 10 Version 1607 x32/x64.
  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior.
  Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior.
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior.
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS16-151");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3205651");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/library/security/ms16-151");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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
winVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2, winVistax64:3, win2008x64:3,
                   win2012:1, win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1, win2016:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

## Get the Win32k.sys version
winVer = fetch_file_version(sysPath, file_name:"system32\Win32k.sys");
if(!winVer){
  exit(0);
}

## Windows Vista and Windows Server 2008
if(hotfix_check_sp(winVista:3, winVistax64:3, win2008:3, win2008x64:3) > 0)
{
  ## Check for Win32k.sys version
  if(version_is_less(version:winVer, test_version:"6.0.6002.19712"))
  {
    Vulnerable_range = "Less than 6.0.6002.19712";
    VULN = TRUE ;
  }
  else if(version_in_range(version:winVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.24033"))
  {
    Vulnerable_range = "6.0.6002.23000 - 6.0.6002.24033";
    VULN = TRUE ;
  }
}

## Windows 7 and Windows 2008 R2
else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0 )
{
  ## Check for Win32k.sys version
  if(version_is_less(version:winVer, test_version:"6.1.7601.23591"))
  {
    Vulnerable_range = "Less than 6.1.7601.23591";
    VULN = TRUE ;
  }
}

# Windows server 2012
else if(hotfix_check_sp(win2012:1) > 0 )
{
  ## Check for Win32k.sys version
  if(version_is_less(version:winVer, test_version:"6.2.9200.22029"))
  {
     Vulnerable_range = "Less than 6.2.9200.22029";
     VULN = TRUE ;
  }
}

## Windows 8.1 and Server 2012R2
else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0 )
{
  ## Check for Win32k.sys version
  if(version_is_less(version:winVer, test_version:"6.3.9600.18533"))
  {
    Vulnerable_range = "Less than 6.3.9600.18533";
    VULN = TRUE ;
  }
}

##Windows 10 and Server 2016
else if(hotfix_check_sp(win10:1, win10x64:1, win2016:1) > 0 )
{
  ## Check for Win32k.sys version
  ##Windows 10 core
  if(version_is_less(version:winVer, test_version:"10.0.10240.16384"))
  {
    Vulnerable_range = "Less than 10.0.10240.16384";
    VULN = TRUE ;
  }
  ##Windows 10 Version 1511
  else if(version_in_range(version:winVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.19"))
  {
    Vulnerable_range = "10.0.10586.0 - 10.0.10586.19";
    VULN = TRUE ;
  }
  ##Windows 10 Version 1607 and Windows Server 2016
  else if(version_in_range(version:winVer, test_version:"10.0.14393.0", test_version2:"10.0.14393.575"))
  {
    Vulnerable_range = "10.0.14393.0 - 10.0.14393.575";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\system32\Win32k.sys"+ '\n' +
           'File version:     ' + winVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}