###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-003.nasl 11614 2018-09-26 07:39:28Z asteins $
#
# Microsoft Windows JScript and VBScript Remote Code Execution Vulnerability(3125540)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.806658");
  script_version("$Revision: 11614 $");
  script_cve_id("CVE-2016-0002");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-26 09:39:28 +0200 (Wed, 26 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-01-13 08:37:49 +0530 (Wed, 13 Jan 2016)");
  script_name("Microsoft Windows JScript and VBScript Remote Code Execution Vulnerability(3125540)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-003.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists in the way that the VBScript
  engine renders when handling objects in memory, leading to memory corruption
  in certain cases.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code in the context of the currently
  logged-in user.");

  script_tag(name:"affected", value:"Microsoft Windows Vista x32/x64 Edition Service Pack 2
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS16-003");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3125540");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3124624");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-003");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(winVista:3, win2008:3) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllVer = fetch_file_version(sysPath, file_name:"System32\Vbscript.dll");
if(!dllVer){
  exit(0);
}

if (dllVer =~ "^(5\.7\.6002\.2)"){
  Vulnerable_range = "5.7.6002.23000 - 5.7.6002.23876";
}

else if(dllVer =~ "^(5\.7\.6002\.1)"){
  Vulnerable_range = "Less than 5.7.6002.19567";
}

if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if((version_in_range(version:dllVer, test_version:"5.7", test_version2:"5.7.6002.19567")) ||
     (version_in_range(version:dllVer, test_version:"5.7.6002.23000", test_version2:"5.7.6002.23876")))
  {
    report = 'File checked:     ' + sysPath + "\system32\Vbscript.dll" + '\n' +
             'File version:     ' + dllVer  + '\n' +
             'Vulnerable range: ' + Vulnerable_range + '\n' ;
    security_message(data:report);
    exit(0);
  }
}
