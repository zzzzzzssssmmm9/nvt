###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb3172459.nasl 9135 2018-03-19 12:37:31Z asteins $
#
# Microsoft Office 2013 Service Pack 1 Information Disclosure Vulnerability (KB3172459)
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
  script_oid("1.3.6.1.4.1.25623.1.0.812902");
  script_version("$Revision: 9135 $");
  script_cve_id("CVE-2018-0853");
  script_bugtraq_id(102868);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-03-19 13:37:31 +0100 (Mon, 19 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-02-14 09:14:46 +0530 (Wed, 14 Feb 2018)");
  script_name("Microsoft Office 2013 Service Pack 1 Information Disclosure Vulnerability (KB3172459)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB3172459");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists due to an error in the
  Microsoft Office software which reads out of bound memory due to an 
  uninitialized variable, which could disclose the contents of memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  who successfully exploited the vulnerability to view out of bound memory. 

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Office 2013 Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/3172459");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/3172459");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

msPath = "";
msdllVer = "";
offPath = "";

offVer = get_kb_item("MS/Office/Ver");
if(!offVer || !(offVer =~ "^15\.")){
  exit(0);
}

msPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                            item:"CommonFilesDir");
if(msPath)
{
  offPath = msPath + "\Microsoft Shared\Office15";
  msdllVer = fetch_file_version(sysPath:offPath, file_name:"acecore.dll");

  if(msdllVer && msdllVer =~ "15\.")
  {
    if(version_is_less(version:msdllVer, test_version:"15.0.5007.1000"))
    {
      report = report_fixed_ver( file_checked:offPath + "\acecore.dll",
                                 file_version:msdllVer, vulnerable_range:"15.0 - 15.0.5007.0999");
      security_message(data:report);
      exit(0);
    }
  }
}
exit(0);
