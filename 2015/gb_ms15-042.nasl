###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-042.nasl 6125 2017-05-15 09:03:42Z teissa $
#
# Microsoft Windows Hyper-V Denial of Service Vulnerability (3047234)
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
if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805532");
  script_version("$Revision: 6125 $");
  script_cve_id("CVE-2015-1647");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-15 11:03:42 +0200 (Mon, 15 May 2017) $");
  script_tag(name:"creation_date", value:"2015-04-15 07:56:26 +0530 (Wed, 15 Apr 2015)");
  script_name("Microsoft Windows Hyper-V Denial of Service Vulnerability (3047234)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-042.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Flaw exists due to error in Hyper-V that is
  triggered when running a specially crafted application in a virtual machine
  (VM) session.");

  script_tag(name:"impact", value:"Successful exploitation will allow local
  guest to cause a denial of service for other guests on the system.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Windows Server 2012 R2  and
  Microsoft Windows 8.1 x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS15-042");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3047234");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS15-042");

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
exeVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win2012R2:1, win8_1x64:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

##Fetch Vmms.exe version
exeVer = fetch_file_version(sysPath, file_name:"system32\Vmms.exe");
if(!exeVer){
  exit(0);
}

## Win 8.1 and win2012R2
if(hotfix_check_sp(win8_1x64:1, win2012R2:1) > 0)
{
  ## Check for Vmms.exe version
  if(version_is_less(version:exeVer, test_version:"6.3.9600.17729")){
    security_message(0);
  }
  exit(0);
}
