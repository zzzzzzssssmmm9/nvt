###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4343898.nasl 10988 2018-08-15 14:37:17Z santu $
#
# Microsoft Windows Multiple Vulnerabilities (KB4343898)
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
  script_oid("1.3.6.1.4.1.25623.1.0.813846");
  script_version("$Revision: 10988 $");
  script_cve_id("CVE-2018-3615", "CVE-2018-3620", "CVE-2018-3646", "CVE-2018-8316",
                "CVE-2018-8339", "CVE-2018-8340", "CVE-2018-8341", "CVE-2018-8343",
                "CVE-2018-8344", "CVE-2018-8345", "CVE-2018-8348", "CVE-2018-8349",
                "CVE-2018-8351", "CVE-2018-8353", "CVE-2018-8355", "CVE-2018-8371",
                "CVE-2018-8372", "CVE-2018-8373", "CVE-2018-8385", "CVE-2018-8389",
                "CVE-2018-8394", "CVE-2018-8398", "CVE-2018-8403", "CVE-2018-8404",
                "CVE-2018-8405");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 16:37:17 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-15 13:48:12 +0530 (Wed, 15 Aug 2018)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4343898)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4343898");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - A new speculative execution side channel vulnerability known as L1 Terminal
    Fault.

  - 'Microsoft COM for Windows' fails to properly handle serialized objects.

  - Windows kernel improperly handles objects in memory.

  - NDIS fails to check the length of a buffer prior to copying memory to it.

  - Active Directory Federation Services (AD FS) improperly handles multi-factor
    authentication requests.

  - Windows font library improperly handles specially crafted embedded fonts.

  - Windows GDI component improperly discloses the contents of its memory.

  - Internet Explorer improperly validates hyperlinks before loading executable
    libraries.

  - Scripting engine handles objects in memory in Microsoft browsers.

  - Microsoft browsers improperly allow cross-frame interaction.

  - Windows Installer fails to properly sanitize input leading to an insecure library
    loading behavior.

  - Microsoft browsers improperly access objects in memory.

  - Windows Win32k component fails to properly handle objects in memory.

  - The DirectX Graphics Kernel (DXGKRNL) driver improperly handles objects in
    memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow  an attacker
  to execute arbitrary code, run processes in an elevated context, obtain
  information to further compromise the user's system, trick a user into believing
  that the user was on a legitimate website, read privileged data across trust
  boundaries and also bypass certain security restrictions

  Impact Level: System");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 for 32-bit/x64

  Microsoft Windows Server 2012 R2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4343898");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

fileVer = fetch_file_version(sysPath, file_name:"mshtml.dll");
if(!fileVer){
  exit(0);
}

if(version_is_less(version:fileVer, test_version:"11.0.9600.19101"))
{
  report = report_fixed_ver(file_checked:sysPath + "\mshtml.dll",
                            file_version:fileVer, vulnerable_range:"Less than 11.0.9600.19101");
  security_message(data:report);
  exit(0);
}
exit(99);
