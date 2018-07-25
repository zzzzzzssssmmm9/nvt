###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_compat_pack_ms16-148.nasl 4855 2016-12-27 10:54:25Z antu123 $
#
# Microsoft Office Compatibility Pack Multiple Vulnerabilities (3204068)
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
  script_oid("1.3.6.1.4.1.25623.1.0.809753");
  script_version("$Revision: 4855 $");
  script_cve_id("CVE-2016-7262", "CVE-2016-7264", "CVE-2016-7265", "CVE-2016-7266",
                "CVE-2016-7268", "CVE-2016-7290", "CVE-2016-7291");
  script_bugtraq_id(94769, 94721, 94662, 94672, 94670, 94671);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2016-12-27 11:54:25 +0100 (Tue, 27 Dec 2016) $");
  script_tag(name:"creation_date", value:"2016-12-14 11:48:46 +0530 (Wed, 14 Dec 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Compatibility Pack Multiple Vulnerabilities (3204068)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-148.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws exists as,
  - Microsoft Office software reads out of bound memory.
  - Microsoft Office improperly handles input.
  - Microsoft Office improperly checks registry settings when an attempt is made
    to run embedded content.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to gain access to potentially sensitive information and run arbitrary
  code in the context of the current user.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Office Compatibility Pack Service Pack 3 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  https://technet.microsoft.com/library/security/ms16-148");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3128024");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3128022");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/ms16-148");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/ComptPack/Version", "SMB/Office/XLCnv/Version");
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variable Initialization
xlcnvVer = "";
wordcnvVer = "";
path = "";
sysVer = "";

path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                              item:"ProgramFilesDir");
if(!path){
  exit(0);
}

# Check for Office Compatibility Pack 2007
if(get_kb_item("SMB/Office/ComptPack/Version") =~ "^12\..*")
{
  xlcnvVer = get_kb_item("SMB/Office/XLCnv/Version");

  if(xlcnvVer && xlcnvVer =~ "^12.*")
  {
    offpath = path + "\Microsoft Office\Office12";
    sysVer = fetch_file_version(sysPath:offpath, file_name:"excelcnv.exe");
    if(sysVer)
    {
      ## Check for Office Version 2007 with compatibility pack version 12.0 < 12.0.6762.5000
      ## https://support.microsoft.com/en-us/kb/3128022
      if(version_in_range(version:sysVer, test_version:"12.0", test_version2:"12.0.6762.4999"))
      {
        report = 'File checked:      ' + offpath + "\excelcnv.exe" + '\n' +
                 'File version:      ' + sysVer  + '\n' +
                 'Vulnerable range:  12.0 - 12.0.6762.4999' + '\n' ;
        security_message(data:report);
        exit(0);
      }
    }
  }

  wordcnvVer = get_kb_item("SMB/Office/WordCnv/Version");
  if(wordcnvVer && wordcnvVer =~ "^12.*")
  {
    offpath = path + "\Microsoft Office\Office12";
    {
      sysVer = fetch_file_version(sysPath:offpath, file_name:"Wordcnv.dll");
      if(sysVer)
      {
        ## Check for Office Version 2007 with compatibility pack version 12.0 < 12.0.6762.5000
        ## https://support.microsoft.com/en-us/kb/3128024
        if(version_in_range(version:sysVer, test_version:"12.0", test_version2:"12.0.6762.4999"))
        {
          report = 'File checked:      ' + offpath + "\Wordcnv.dll" + '\n' +
                   'File version:      ' + sysVer  + '\n' +
                   'Vulnerable range:  12.0 - 12.0.6762.4999' + '\n' ;
          security_message(data:report);
          exit(0);
        }
      }
    }
  }
}
