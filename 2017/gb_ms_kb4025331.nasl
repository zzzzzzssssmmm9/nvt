###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4025331.nasl 6706 2017-07-12 14:51:44Z santu $
#
# Microsoft Windows Server 2012 Multiple Vulnerabilities (KB4025331)
#
# Authors:
# Rinu <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.811517");
  script_version("$Revision: 6706 $");
  script_cve_id("CVE-2017-0170", "CVE-2017-8463", "CVE-2017-8606", "CVE-2017-8467", 
                "CVE-2017-8486", "CVE-2017-8607", "CVE-2017-8608", "CVE-2017-8495", 
                "CVE-2017-8556", "CVE-2017-8618", "CVE-2017-8557", "CVE-2017-8561", 
                "CVE-2017-8562", "CVE-2017-8563", "CVE-2017-8564", "CVE-2017-8565", 
                "CVE-2017-8573", "CVE-2017-8577", "CVE-2017-8578", "CVE-2017-8580", 
                "CVE-2017-8581", "CVE-2017-8582", "CVE-2017-8587", "CVE-2017-8588", 
                "CVE-2017-8589", "CVE-2017-8590", "CVE-2017-8592");
  script_bugtraq_id(99389, 99408, 99409, 99414, 99410, 99412, 99424, 99439, 99399, 
                    99398, 99426, 99397, 99402, 99428, 99394, 99431, 99416, 99419, 
                    99421, 99423, 99429, 99413, 99400, 99425, 99427, 99396);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 16:51:44 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-07-12 10:01:25 +0530 (Wed, 12 Jul 2017)");
  script_name("Microsoft Windows Server 2012 Multiple Vulnerabilities (KB4025331)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4025331");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - An error in Microsoft Windows which fails to properly handle objects in
    memory.

  - An error in the way JavaScript engines render when handling objects in memory
    in Microsoft browsers.

  - An error in Windows Explorer which improperly handles executable files and
    shares during rename operations.

  - An affected Microsoft browser does not properly parse HTTP content.

  - Windows improperly handles calls to Advanced Local Procedure Call (ALPC).

  - Microsoft Windows when Kerberos falls back to NT LAN Manager (NTLM)
    Authentication Protocol as the default authentication protocol.

  - Windows Kernel improperly handles objects in memory.

  - The Windows kernel fails to properly initialize a memory address, allowing an
    attacker to retrieve information that could lead to a Kernel Address Space
    Layout Randomization (KASLR) bypass.

  - PSObject wraps a CIM Instance.

  - Microsoft Graphics Component fails to properly handle objects in memory.

  - VBScript engine, when rendered in Internet Explorer, improperly handles
    objects in memory.

  - Microsoft Browsers improperly handle redirect requests.

  - Microsoft Windows when Kerberos fails to prevent tampering with the SNAME
    field during ticket exchange.

  - Internet Explorer improperly accesses objects in memory.

  - Windows System Information Console when it improperly parses XML input
    containing a reference to an external entity.

  - Windows Performance Monitor Console when it improperly parses XML input
    containing a reference to an external entity.

  - Microsoft WordPad parses specially crafted files.

  - Windows Search improperly handles objects in memory.

  - Windows Explorer attempts to open a non-existent file.

  - Windows improperly handles objects in memory.");
  
  script_tag(name:"impact", value:"Successful exploitation will allow
  an attacker to obtain information to further compromise the user's system,
  gain the same user rights as the current user, run arbitrary
  code in the context of another user, trick a user by redirecting the user
  to a specially crafted website, run processes in an elevated context,
  retrieve the base address of the kernel driver from a compromised process,
  embed an ActiveX control marked 'safe for initialization' in an application or
  Microsoft Office document that hosts the Internet Explorer rendering engine,
  force the browser to send data that would otherwise be restricted to a
  destination web site of their choice, bypass Extended Protection for
  Authentication, read arbitrary files via an XML external entity (XXE)
  declaration and cause a denial of service.

  Impact Level: System");

  script_tag(name:"affected", value:"Microsoft Windows Server 2012");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4025331");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4025331");
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
if(hotfix_check_sp(win2012:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

##Fetch the version of 'mshtml.dll'
fileVer = fetch_file_version(sysPath, file_name:"mshtml.dll");
if(!fileVer){
  exit(0);
}

## Check for mshtml.dll version
if(version_is_less(version:fileVer, test_version:"10.0.9200.22207"))
{
  report = 'File checked:     ' + sysPath + "\mshtml.dll" + '\n' +
           'File version:     ' + fileVer  + '\n' +
           'Vulnerable range:  Less than 10.0.9200.22207\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
