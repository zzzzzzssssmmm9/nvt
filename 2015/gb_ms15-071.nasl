###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-071.nasl 6505 2017-07-03 09:58:27Z teissa $
#
# Microsoft Windows NETLOGON Privilege Elevation Vulnerability (3068457)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.805075");
  script_version("$Revision: 6505 $");
  script_cve_id("CVE-2015-2374");
  script_bugtraq_id(75633);
  script_tag(name:"cvss_base", value:"3.3");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-03 11:58:27 +0200 (Mon, 03 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-07-15 09:12:11 +0530 (Wed, 15 Jul 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows NETLOGON Privilege Elevation Vulnerability (3068457)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-071.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Flaw is due to Netlogon service improperly
  establishes a secure communications channel belonging to a different machine
  with a spoofed computer name.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  man-in-the-middle attacker to conduct SMB relay attacks on domain environments
  utilizing SMB Signing enforcement, and decrypt SMB3 communications intercepted.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows Server 2012/R2
  Microsoft Windows 2003 x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the given link, https://technet.microsoft.com/library/security/MS15-071");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3068457");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/library/security/MS15-071");

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
if(hotfix_check_sp(win2003:3, win2003x64:3, win2008:3,
                   win2008r2:2, win2012:1, win2012R2:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllVer = fetch_file_version(sysPath, file_name:"system32\Netlogon.dll");
if(!dllVer){
  exit(0);
}

## Windows Server 2003
if(hotfix_check_sp(win2003x64:3,win2003:3) > 0)
{
  ## Check for Netlogon.dll version
  if(version_is_less(version:dllVer, test_version:"5.2.3790.5648")){
    security_message(0);
  }
  exit(0);
}

## Windows Server 2008
## Currently not supporting for Windows Server 2008 64 bit
if(hotfix_check_sp(win2008:3) > 0)
{
  ## Check for Netlogon.dll version
  if(version_is_less(version:dllVer, test_version:"6.0.6002.19409") ||
     version_in_range(version:dllVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23715")){
    security_message(0);
  }
  exit(0);
}

## Windows Server 2008 R2
if(hotfix_check_sp(win2008r2:2) > 0)
{
  ## Check for Netlogon.dll version
  if(version_is_less(version:dllVer, test_version:"6.1.7601.18880") ||
     version_in_range(version:dllVer, test_version:"6.1.7601.23000", test_version2:"6.1.7601.23082")){
    security_message(0);
  }
  exit(0);
}

## Windows Server 2012
if(hotfix_check_sp(win2012:1) > 0)
{
  ## Check for Netlogon.dll version
  if(version_is_less(version:dllVer, test_version:"6.2.9200.17395") ||
     version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21505")){
    security_message(0);
  }
  exit(0);
}

## win2012R2
if(hotfix_check_sp(win2012R2:1) > 0)
{
  ## Check for Netlogon.dll version
  if(version_is_less(version:dllVer, test_version:"6.3.9600.17901")){
    security_message(0);
  }
  exit(0);
}
