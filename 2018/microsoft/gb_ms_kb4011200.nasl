###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011200.nasl 9135 2018-03-19 12:37:31Z asteins $
#
# Microsoft Outlook 2007 Service Pack 3 Multiple Vulnerabilities (KB4011200)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.812909");
  script_version("$Revision: 9135 $");
  script_cve_id("CVE-2018-0850", "CVE-2018-0852");
  script_bugtraq_id(102866, 102871);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-03-19 13:37:31 +0100 (Mon, 19 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-02-14 10:54:29 +0530 (Wed, 14 Feb 2018)");
  script_name("Microsoft Outlook 2007 Service Pack 3 Multiple Vulnerabilities (KB4011200)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4011200");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - An error in Microsoft Outlook when the software fails to properly handle
    objects in memory.

  - When Microsoft Outlook initiates processing of incoming messages without
    sufficient validation of the formatting of the messages.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  who successfully exploited the vulnerability to run arbitrary code in the
  context of the current user and force Outlook to load a local or remote message
  store (over SMB).

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Outlook 2007 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4011200");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4011200");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Outlook/Version");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

outlookVer = "";
outlookFile = "";

outlookVer = get_kb_item("SMB/Office/Outlook/Version");

if(!outlookVer || !(outlookVer =~ "^12\.")){
  exit(0);
}

outlookFile = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion" +
                              "\App Paths\OUTLOOK.EXE", item:"Path");
if(!outlookFile){
  exit(0);
}

outlookVer = fetch_file_version(sysPath:outlookFile, file_name:"outlook.exe");
if(!outlookVer || !(outlookVer =~ "^12\.")){
  exit(0);
}

if(version_is_less(version:outlookVer, test_version:"12.0.6785.5000"))
{
  report = report_fixed_ver(file_checked:outlookFile + "outlook.exe",
           file_version:outlookVer, vulnerable_range:"12.0 - 12.0.6785.4999");
  security_message(data:report);
  exit(0);
}
exit(0);