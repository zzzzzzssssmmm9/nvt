###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4026061.nasl 6800 2017-07-26 06:58:22Z cfischer $
#
# Microsoft WordPad Remote Code Execution Vulnerability (KB4026061)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.811458");
  script_version("$Revision: 6800 $");
  script_cve_id("CVE-2017-8588");
  script_bugtraq_id(99400);
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-26 08:58:22 +0200 (Wed, 26 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-07-12 11:38:56 +0530 (Wed, 12 Jul 2017)");
  script_name("Microsoft WordPad Remote Code Execution Vulnerability (KB4026061)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4026061");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists due to the way that
  Microsoft WordPad parses specially crafted files.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to run arbitrary code on affected system. 

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4026061");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4026061");
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
fileVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win2008:3, win2008x64:3) <= 0){
  exit(0);
}

if(!sysPath =  registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                               item:"ProgramFilesDir")){
  exit(0);
}

##Fetch the version of 'wordpad.exe'
fileVer = fetch_file_version(sysPath, file_name:"Windows NT\Accessories\wordpad.exe");
if(!fileVer){
  exit(0);
}

## Check for wordpad.exe version
if(version_is_less(version:fileVer, test_version:"6.0.6002.19812"))
{
  Vulnerable_range = "Less than 6.0.6002.19812";
  VULN = TRUE ;
}

else if(version_in_range(version:fileVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.24132"))
{
  Vulnerable_range = "6.0.6002.23000 - 6.0.6002.24132";
  VULN = TRUE ;
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\Windows NT\Accessories\wordpad.exe" + '\n' +
           'File version:     ' + fileVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
