###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-065.nasl  2015-07-15 12:14:36 +0530 Jul$
#
# Microsoft Internet Explorer Multiple Memory Corruption Vulnerabilities (3076321)
#
# Authors:
# Deependra Bapna <bdeependra@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.805720");
  script_version("$Revision: 6141 $");
  script_cve_id("CVE-2015-1729", "CVE-2015-1733", "CVE-2015-1767", "CVE-2015-2372",
                "CVE-2015-2383", "CVE-2015-2384", "CVE-2015-2385", "CVE-2015-2389",
                "CVE-2015-2390", "CVE-2015-2391", "CVE-2015-2397", "CVE-2015-2398",
                "CVE-2015-2401", "CVE-2015-2402", "CVE-2015-2403", "CVE-2015-2404",
                "CVE-2015-2388", "CVE-2015-2406", "CVE-2015-2408", "CVE-2015-2410",
                "CVE-2015-2411", "CVE-2015-2412", "CVE-2015-2413", "CVE-2015-2414",
                "CVE-2015-2419", "CVE-2015-2421", "CVE-2015-2422", "CVE-2015-2425",
                "CVE-2015-1738");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-17 11:03:37 +0200 (Wed, 17 May 2017) $");
  script_tag(name:"creation_date", value:"2015-07-15 12:14:36 +0530 (Wed, 15 Jul 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Internet Explorer Multiple Memory Corruption Vulnerabilities (3076321)");

  script_tag(name: "summary" , value:"This host is missing a critical security
  update according to Microsoft Bulletin MS15-065.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"Multiple flaws are due to improper
  handling memory objects when accessing it and does not properly validate
  permissions under specific conditions.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to corrupt memory and potentially execute arbitrary code in the
  context of the current user.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Microsoft Internet Explorer version
  6.x/7.x/8.x/9.x/10.x/11.x and VBScript 5.8 on 8.x/9.x/10.x/11.x");

  script_tag(name: "solution" , value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  link, https://technet.microsoft.com/en-us/library/security/MS15-065");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3065822");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/library/security/MS15-065");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_ie_detect.nasl");
  script_mandatory_keys("MS/IE/Version");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
ieVer   = "";
dllVer  = NULL;

## Check for OS and Service Pack
if(hotfix_check_sp(win2003:3, win2003x64:3, winVista:3, win7:2, win7x64:2,
                   win2008:3, win2008r2:2, win8:1, win8x64:1, win2012:1,
                   win2012R2:1, win8_1:1, win8_1x64:1) <= 0){
  exit(0);
}

## Get IE Version
ieVer = get_app_version(cpe:CPE);
if(!ieVer || !(ieVer =~ "^(6|7|8|9|10|11)")){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Get Version from Mshtml.dll
dllVer = fetch_file_version(sysPath, file_name:"system32\Mshtml.dll");
if(!dllVer){
  exit(0);
}

## Windows 2003
if(hotfix_check_sp(win2003:3, win2003x64:3) > 0)
{
  ## Check for Mshtml.dll version
  if(version_is_less(version:dllVer, test_version:"6.0.3790.5662") ||
     version_in_range(version:dllVer, test_version:"7.0.6000.00000", test_version2:"7.0.6000.21480")||
     version_in_range(version:dllVer, test_version:"8.0.6001.18000", test_version2:"8.0.6001.23706")){
    security_message(0);
  }
  exit(0);
}

## Windows Vista and Server 2008
else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  ## Check for Mshtml.dll version
  if(version_in_range(version:dllVer, test_version:"7.0.6002.18000", test_version2:"7.0.6002.19420")||
     version_in_range(version:dllVer, test_version:"7.0.6002.23000", test_version2:"7.0.6002.23727")||
     version_in_range(version:dllVer, test_version:"8.0.6001.18000", test_version2:"8.0.6001.19651")||
     version_in_range(version:dllVer, test_version:"8.0.6001.20000", test_version2:"8.0.6001.23706")||
     version_in_range(version:dllVer, test_version:"9.0.8112.16000", test_version2:"9.0.8112.16668")||
     version_in_range(version:dllVer, test_version:"9.0.8112.20000", test_version2:"9.0.8112.20783")){
    security_message(0);
  }
  exit(0);
}

## Windows 7 and Server 2008r2
else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Check for Mshtml.dll version
  if(version_in_range(version:dllVer, test_version:"8.0.7601.17000", test_version2:"8.0.7601.18895")||
     version_in_range(version:dllVer, test_version:"8.0.7601.22000", test_version2:"8.0.7601.23098")||
     version_in_range(version:dllVer, test_version:"9.0.8112.16000", test_version2:"9.0.8112.16668")||
     version_in_range(version:dllVer, test_version:"9.0.8112.20000", test_version2:"9.0.8112.20783")||
     version_in_range(version:dllVer, test_version:"10.0.9200.16000", test_version2:"10.0.9200.17411")||
     version_in_range(version:dllVer, test_version:"10.0.9200.21000", test_version2:"10.0.9200.21522")||
     version_in_range(version:dllVer, test_version:"11.0.9600.00000", test_version2:"11.0.9600.17914")){
    security_message(0);
  }
  exit(0);
}

## Windows 8 and Server 2012
else if(hotfix_check_sp(win8:1, win2012:1) > 0)
{
  ## Check for Mshtml.dll version
  if(version_in_range(version:dllVer, test_version:"10.0.9200.16000", test_version2:"10.0.9200.17411")||
     version_in_range(version:dllVer, test_version:"10.0.9200.20000", test_version2:"10.0.9200.21522")){
    security_message(0);
  }
  exit(0);
}

## Windows 8.1 and Server 2012 R2
else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  ## Check for Mshtml.dll version
  if(version_is_less(version:dllVer, test_version:"11.0.9600.17905")){
    security_message(0);
  }
  exit(0);
}
