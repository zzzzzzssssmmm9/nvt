###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4284860.nasl 10180 2018-06-13 14:35:18Z santu $
#
# Microsoft Windows Multiple Vulnerabilities (KB4284860)
#
# Authors:
# Rajat Mishra <rajatm@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.813529");
  script_version("$Revision: 10180 $");
  script_cve_id("CVE-2018-0978", "CVE-2018-1036", "CVE-2018-1040", "CVE-2018-8169", 
                "CVE-2018-8201", "CVE-2018-8205", "CVE-2018-8207", "CVE-2018-8209", 
                "CVE-2018-8210", "CVE-2018-8212", "CVE-2018-8213", "CVE-2018-8215", 
                "CVE-2018-8216", "CVE-2018-8217", "CVE-2018-8221", "CVE-2018-8225", 
                "CVE-2018-8226", "CVE-2018-8229", "CVE-2018-8231", "CVE-2018-8234", 
                "CVE-2018-8235", "CVE-2018-8236", "CVE-2018-8251", "CVE-2018-8267");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-06-13 16:35:18 +0200 (Wed, 13 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-13 09:08:36 +0530 (Wed, 13 Jun 2018)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4284860)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4284860");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaw exists due to errors,
  
  - When the Windows kernel improperly handles objects in memory. 

  - When Windows improperly handles objects in memory. 

  - When the (Human Interface Device) HID Parser Library driver improperly handles 
    objects in memory. 

  - When Windows allows a normal user to access the Wireless LAN profile of an 
    administrative user. 

  - When Microsoft Edge improperly accesses objects in memory. 

  - When Microsoft Edge improperly handles requests of different origins. 

  - When Microsoft Edge improperly handles objects in memory. 

  - When Windows Media Foundation improperly handles objects in memory. 

  - In the way that the Windows Code Integrity Module performs hashing. 

  - When Internet Explorer improperly accesses objects in memory. 

  - When NTFS improperly checks access. 

  - In the way that the Chakra scripting engine handles objects in memory in 
    Microsoft Edge. 

  - In the way that the scripting engine handles objects in memory in Internet 
    Explorer. 

  - In Windows Domain Name System (DNS) DNSAPI."); 

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to obtain information to further compromise the user's system, run processes in
  an elevated context, inject code into a trusted PowerShell process, execute
  arbitrary code, read privileged data, force the browser to send restricted data,
  interject cross-process communication, install programs, view, change, or delete
  data or create new accounts with full user rights and create a denial of service
  condition.
  
  Impact Level: System");

  script_tag(name:"affected", value:"
  Windows 10 for 32-bit Systems
  Windows 10 for x64-based Systems");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4284860");
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

if(hotfix_check_sp(win10:1, win10x64:1) <= 0){
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

if(version_in_range(version:edgeVer, test_version:"11.0.10240.0", test_version2:"11.0.10240.17888"))
{
  report = report_fixed_ver(file_checked:sysPath + "\Edgehtml.dll",
                            file_version:edgeVer, vulnerable_range:"11.0.10240.0 - 11.0.10240.17888");
  security_message(data:report);
  exit(0);
}
exit(99);
