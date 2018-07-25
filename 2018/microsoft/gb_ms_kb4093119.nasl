###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4093119.nasl 9974 2018-05-28 03:25:02Z ckuersteiner $
#
# Microsoft Windows Multiple Vulnerabilities (KB4093119)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.813080");
  script_version("$Revision: 9974 $");
  script_cve_id("CVE-2018-0870", "CVE-2018-0887", "CVE-2018-8116", "CVE-2018-0890", 
                "CVE-2018-0892", "CVE-2018-0956", "CVE-2018-0957", "CVE-2018-0960", 
                "CVE-2018-0963", "CVE-2018-0966", "CVE-2018-0967", "CVE-2018-0968", 
                "CVE-2018-0969", "CVE-2018-0970", "CVE-2018-0971", "CVE-2018-0972", 
                "CVE-2018-0973", "CVE-2018-0974", "CVE-2018-0975", "CVE-2018-0976", 
                "CVE-2018-0979", "CVE-2018-0980", "CVE-2018-0981", "CVE-2018-0987", 
                "CVE-2018-0988", "CVE-2018-0989", "CVE-2018-0990", "CVE-2018-0991", 
                "CVE-2018-0993", "CVE-2018-0994", "CVE-2018-0995", "CVE-2018-0996", 
                "CVE-2018-0997", "CVE-2018-0998", "CVE-2018-1000", "CVE-2018-1001", 
                "CVE-2018-1009", "CVE-2018-1010", "CVE-2018-1012", "CVE-2018-1013", 
                "CVE-2018-1015", "CVE-2018-1016", "CVE-2018-1018", "CVE-2018-1020", 
                "CVE-2018-1023", "CVE-2018-1003", "CVE-2018-1004", "CVE-2018-1008");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-05-28 05:25:02 +0200 (Mon, 28 May 2018) $");
  script_tag(name:"creation_date", value:"2018-04-11 10:50:56 +0530 (Wed, 11 Apr 2018)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4093119)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4093119");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,
  
  - Internet Explorer improperly accesses objects in memory. 

  - Windows font library improperly handles specially crafted embedded fonts. 

  - Scripting engine handles objects in memory in Internet Explorer. 

  - Microsoft Edge PDF Reader improperly handles objects in memory. 

  - Windows kernel fails to properly initialize a memory address. 

  - An error in Windows Adobe Type Manager Font Driver (ATMFD). 

  - Chakra scripting engine handles objects in memory in Microsoft Edge. 

  - A Kernel Address Space Layout Randomization (ASLR) bypass error in windows. 

  - Windows SNMP Service improperly handles malformed SNMP traps. 

  - A security feature bypass exists when Device Guard incorrectly validates an 
    untrusted file. 

  - Microsoft browsers improperly access objects in memory.
 
  - Windows kernel improperly handles objects in memory. 

  - VBScript engine improperly handles objects in memory. 

  - Microsoft Edge improperly handles objects in memory. 

  - An error when Active Directory incorrectly applies Network Isolation settings. 

  - An error in Remote Desktop Protocol (RDP). 

  - An error in the HTTP 2. 

  - Windows Hyper-V on a host operating system fails to properly validate 
    input from an authenticated user on a guest operating system. 

  - An error in the Microsoft JET Database Engine.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to conduct arbitrary code execution, disclose sensitive information, escalate
  privileges, bypass security and cause denial of service condition.

  Impact Level: System");

  script_tag(name:"affected", value:"Microsoft Windows 10 Version 1607 x32/x64

  Microsoft Windows Server 2016");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the link mentioned in reference.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4093119");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win10:1, win10x64:1, win2016:1) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

edgeVer = fetch_file_version(sysPath, file_name:"edgehtml.dll");
if(!edgeVer){
  exit(0);
}

if(version_in_range(version:edgeVer, test_version:"11.0.14393.0", test_version2:"11.0.14393.2188"))
{
  report = report_fixed_ver(file_checked:sysPath + "\Edgehtml.dll",
                            file_version:edgeVer, vulnerable_range:"11.0.14393.0 - 11.0.14393.2188");
  security_message(data:report);
  exit(0);
}
exit(0);
