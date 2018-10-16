###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-047.nasl 11640 2018-09-27 07:15:20Z asteins $
#
# Microsoft Windows SAM and LSAD Privilege Elevation Vulnerability (3148527)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.807660");
  script_version("$Revision: 11640 $");
  script_cve_id("CVE-2016-0128");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-27 09:15:20 +0200 (Thu, 27 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-04-13 08:09:15 +0530 (Wed, 13 Apr 2016)");
  script_name("Microsoft Windows SAM and LSAD Privilege Elevation Vulnerability (3148527)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-047");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to the way the
  SAM and LSAD remote protocols establish the Remote Procedure Call (RPC) channel.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  authenticated user to execute code with elevated privileges that could
  gain access to the SAM database.");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 x32/x64 Edition
  Microsoft Windows Server 2012/2012R2
  Microsoft Windows Vista x32/x64 Edition Service Pack 2
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2
  Microsoft Windows 7 x32/x64 Edition Service Pack 1
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1.
  Microsoft Windows 10 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS16-047");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3148527");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-047");

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


if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2, win8:1,
                   win2012:1, win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

dllPath = smb_get_systemroot();
if(!dllPath ){
  exit(0);
}

sysVer = fetch_file_version(sysPath:dllPath, file_name:"System32\Samsrv.dll");
if(!sysVer){
  exit(0);
}

if (sysVer =~ "^(6\.0\.6002\.1)"){
  Vulnerable_range = "Less than 6.0.6002.19623";
}
else if (sysVer =~ "^(6\.0\.6002\.2)"){
  Vulnerable_range = "6.0.6002.23000 - 6.0.6002.23935";
}
else if (sysVer =~ "^(6\.3\.9600\.1)"){
  Vulnerable_range = "Less than 6.3.9600.18265";
}
else if (sysVer =~ "^(10\.0\.10240)"){
  Vulnerable_range = "Less than 10.0.10240.16766";
}
else if (sysVer =~ "^(10\.0\.10586)"){
  Vulnerable_range = "10.0.10586.0 - 10.0.10586.211";
}

if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if(version_is_less(version:sysVer, test_version:"6.0.6002.19623")||
     version_in_range(version:sysVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23935")){
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Presently GDR information is not available.
  #if(version_is_less(version:sysVer, test_version:"6.1.7601.23000", test_version2:"6.1.7601.23389")){
  if(version_is_less(version:sysVer, test_version:"6.1.7601.23390")){
    Vulnerable_range = "Less than 6.1.7601.23390";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win2012:1) > 0)
{
  ## Presently GDR information is not available.
  #if(version_in_range(version:sysVer, test_version:"6.2.9200.21000", test_version2:"6.2.9200.21810")){
  if(version_is_less(version:sysVer, test_version:"6.2.9200.21811")){
     Vulnerable_range = "Less than 6.2.9200.21811";
     VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  if(version_is_less(version:sysVer, test_version:"6.3.9600.18265")){
    VULN = TRUE ;
  }
}

if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(version_is_less(version:sysVer, test_version:"10.0.10240.16766") ||
     version_in_range(version:sysVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.211")){
     VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + dllPath + "\system32\Samsrv.dll" + '\n' +
           'File version:     ' + sysVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
