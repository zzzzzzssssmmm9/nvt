###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms17-001.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# Microsoft Edge Privilege Elevation Vulnerability (3214288)
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
  script_oid("1.3.6.1.4.1.25623.1.0.810268");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2017-0002");
  script_bugtraq_id(95284);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-01-11 08:29:24 +0530 (Wed, 11 Jan 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Edge Privilege Elevation Vulnerability (3214288)");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft Bulletin MS17-001.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"The flaw exists when Microsoft Edge does 
  not properly enforce cross-domain policies with 'about:blank', which could 
  allow an attacker to access information from one domain and inject it into 
  another domain.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to gain elevated privileges on affected system.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows 10 x32/x64
  Microsoft Windows Server 2016 x64
  Microsoft Windows 10 Version 1511 x32/x64
  Microsoft Windows 10 Version 1607 x32/x64");

  script_tag(name:"solution", value:"Run Windows update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS17-001");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3213986");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3210721");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3210720");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/library/security/MS17-001");
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
dllVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win10:1, win10x64:1, win2016:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Fetch the version of 'Edgehtml.dll'
edgeVer = fetch_file_version(sysPath, file_name:"system32\Edgehtml.dll");
if(!edgeVer){
  exit(0);
}

## Windows 10
if(hotfix_check_sp(win10:1, win10x64:1, win2016:1) > 0)
{
  ## Check for Edgehtml.dll version
  if(version_is_less(version:edgeVer, test_version:"11.0.10240.17236"))
  {
    Vulnerable_range = "Less than 11.0.10240.17236";
    VULN = TRUE ;
  }

  ## Windows 10 Version 1511
  else if(version_in_range(version:edgeVer, test_version:"11.0.10586.0", test_version2:"11.0.10586.752"))
  {
    Vulnerable_range = "11.0.10586.0 - 11.0.10586.752";
    VULN = TRUE ;
  }

  ## Windows 10 version 1607 and Windows Server 2016
  else if(version_in_range(version:edgeVer, test_version:"11.0.14393.0", test_version2:"11.0.14393.692"))
  {
    Vulnerable_range = "11.0.14393.0 - 11.0.14393.692";
    VULN = TRUE ;
  }

  if(VULN)
  {
    report = 'File checked:     ' + sysPath + "\system32\Edgehtml.dll" + '\n' +
             'File version:     ' + edgeVer  + '\n' +
             'Vulnerable range: ' + Vulnerable_range + '\n' ;
    security_message(data:report);
    exit(0);
  }
}

exit(0);
