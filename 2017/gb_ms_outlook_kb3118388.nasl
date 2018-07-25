###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_outlook_kb3118388.nasl 9381 2018-04-06 11:21:01Z cfischer $
#
# Microsoft Office Outlook Security Bypass and Remote Code Execution Vulnerabilities (KB3118388)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.810741");
  script_version("$Revision: 9381 $");
  script_cve_id("CVE-2017-0106", "CVE-2017-0204");
  script_bugtraq_id(97413, 97458);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 13:21:01 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2017-04-12 14:43:05 +0530 (Wed, 12 Apr 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Outlook Security Bypass and Remote Code Execution Vulnerabilities (KB3118388)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft security update KB3118388");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"
  - A remote code execution vulnerability exists in the way that Microsoft
    Outlook parses specially crafted email messages
  - A security feature bypass vulnerability exists in Microsoft Office software
    when the Office software improperly handles the parsing of file formats.");

  script_tag(name:"impact", value:"Successful exploitation will allow a to execute
  arbitrary code in the context of the current user and to take control of the
  affected system and bypass the security features.

  Impact Level: Application");

  script_tag(name:"affected", value:"Microsoft Outlook 2014");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  https://support.microsoft.com/en-us/help/3118388");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/3118388");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Outlook/Version");
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

# Variable Initialization
outlookVer = "";
outlookFile = "";

## Check for Office outlook 2014
outlookVer = get_kb_item("SMB/Office/Outlook/Version");

if(!outlookVer || !(outlookVer =~ "^14\.")){
  exit(0);
}

## Office outlook
outlookFile = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion" +
                              "\App Paths\OUTLOOK.EXE", item:"Path");
if(!outlookFile){
  exit(0);
}

outlookVer = fetch_file_version(sysPath:outlookFile, file_name:"outlook.exe");
if(!outlookVer){
  exit(0);
}

if(version_in_range(version:outlookVer, test_version:"14.0", test_version2:"14.0.7180.5000"))
{
  report = 'File checked:     ' +  outlookFile + "outlook.exe" + '\n' +
           'File version:     ' +  outlookVer  + '\n' +
           'Vulnerable range:  14.0 - 14.0.7180.5000'+ '\n' ;
  security_message(data:report);
  exit(0);
}
