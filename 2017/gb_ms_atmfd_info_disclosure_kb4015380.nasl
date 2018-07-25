###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_atmfd_info_disclosure_kb4015380.nasl 6169 2017-05-19 08:26:16Z antu123 $
#
# Microsoft Windows 'ATMFD.dll' Information Disclosure Vulnerability (KB4015380)
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
  script_oid("1.3.6.1.4.1.25623.1.0.810924");
  script_version("$Revision: 6169 $");
  script_cve_id("CVE-2017-0192");
  script_bugtraq_id(97452);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-05-19 10:26:16 +0200 (Fri, 19 May 2017) $");
  script_tag(name:"creation_date", value:"2017-04-12 10:47:16 +0530 (Wed, 12 Apr 2017)");
  script_name("Microsoft Windows 'ATMFD.dll' Information Disclosure Vulnerability (KB4015380)");

  script_tag(name:"qod_type", value:"registry");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft KB4015380.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"The flaw exists when Adobe Type Manager Font Driver 
  (ATMFD.dll) fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to obtain information to further compromise the user's system.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows Vista x32/x64 Edition Service Pack 2
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-gb/help/4015380");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-gb/help/4015380");
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

##Fetch the version of 'Atmfd.dll'
asVer = fetch_file_version(sysPath, file_name:"Atmfd.dll");
if(!asVer){
  exit(0);
}

## Windows Vista and Windows Server 2008
## Check for Asycfilt.dll version 
if(version_is_less(version:asVer, test_version:"5.1.2.251"))
{
  Vulnerable_range = "Less than 5.1.2.251";
  report = 'File checked:     ' + sysPath + "\Atmfd.dll" + '\n' +
           'File version:     ' + asVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
