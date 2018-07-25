###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_dns_server_dos_kb4018196.nasl 6231 2017-05-29 09:29:50Z teissa $
#
# Microsoft Windows DNS Server Denial of Service Vulnerability (KB4018196)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.811115");
  script_version("$Revision: 6231 $");
  script_cve_id("CVE-2017-0171");
  script_bugtraq_id(98097);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-29 11:29:50 +0200 (Mon, 29 May 2017) $");
  script_tag(name:"creation_date", value:"2017-05-10 12:41:18 +0530 (Wed, 10 May 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows DNS Server Denial of Service Vulnerability (KB4018196)");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft KB4018196");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"The flaw exists when the server is
  configured to answer version queries. An attacker who successfully exploited
  this vulnerability could cause the DNS Server service to become nonresponsive.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attcker to send malicious DNS queries, which results in denial of service.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-gb/help/4018196");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-gb/help/4018196");
  script_xref(name : "URL" , value : "https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2017-0171");

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
asVer  = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win2008:3, win2008x64:3) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

##Fetch the version of 'Dns.exe'
if(!asVer = fetch_file_version(sysPath, file_name:"Dns.exe")){
  exit(0);
}

## Check for Dns.exe version 
if(version_is_less(version:asVer, test_version:"6.0.6002.19765"))
{
  Vulnerable_range = "Less than 6.0.6002.19765";
  VULN = TRUE ;
}

else if(version_in_range(version:asVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.24088"))
{
  Vulnerable_range = "6.0.6002.23000 - 6.0.6002.24088";
  VULN = TRUE ;
}


if(VULN)
{
  report = 'File checked:     ' + sysPath + "\Dns.exe" + '\n' +
           'File version:     ' + asVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
