###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_visual_basic_ms16-004.nasl 5782 2017-03-30 09:01:05Z teissa $
#
# Microsoft Visual Basic ASLR Bypass Vulnerability (3124585)
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
  script_oid("1.3.6.1.4.1.25623.1.0.806661");
  script_version("$Revision: 5782 $");
  script_cve_id("CVE-2016-0012");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-03-30 11:01:05 +0200 (Thu, 30 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-01-13 15:09:48 +0530 (Wed, 13 Jan 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Visual Basic ASLR Bypass Vulnerability (3124585)");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-004.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"The flaw exists due to error within Microsoft
  Office which fails to use the Address Space Layout Randomization (ASLR) security
  feature, allowing an attacker to more reliably predict the memory offsets of
  specific instructions in a given call stack.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to bypass Address Space Layout Randomization (ASLR) security feature.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Microsoft Visual Basic 6.0 Runtime");

  script_tag(name: "solution" , value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  https://technet.microsoft.com/library/security/MS16-004");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3096896");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS16-004");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
key = "";
appName = "";
sysVer = "";
sysPath = "";


## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}



##Get Architecture
osArch = get_kb_item("SMB/Windows/Arch");
if(!osArch){
  exit(0);
}

## if os is 32 bit iterate over comman path
if("x86" >< osArch){
  key_list = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
}

## Check for 64 bit platform
else if("x64" >< osArch){
 key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\",
                      "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

# Check for existence of Visual Basic and then check Mscomctl.Ocx file
foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    appName = registry_get_sz(item:"DisplayName", key:key + item);

    ##Check Visual Basic is installed
    if("Microsoft Visual Basic" >< appName)
    {
      ## Get Version from Mscomctl.Ocx file
      sysVer = fetch_file_version(sysPath, file_name:"system32\Mscomctl.Ocx");
      if(sysVer)
      {
        ## Check for Mscomctl.Ocx file
        if(version_is_less(version:sysVer, test_version:"6.1.98.46"))
        {
          report = 'File checked:     ' + sysPath + "\system32\Mscomctl.Ocx" + '\n' +
                   'File version:     ' + sysVer  + '\n' +
                   'Vulnerable range: ' + "Less than 6.1.98.46" + '\n' ;
          security_message(data:report);
          exit(0);
        }
      }
    }
  }
}
