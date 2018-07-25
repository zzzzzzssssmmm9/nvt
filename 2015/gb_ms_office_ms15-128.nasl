###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_ms15-128.nasl 6194 2017-05-23 09:04:00Z teissa $
#
# Microsoft Office Remote Code Execution Vulnerabilities (3104503)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.806179");
  script_version("$Revision: 6194 $");
  script_cve_id("CVE-2015-6106", "CVE-2015-6107", "CVE-2015-6108");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-23 11:04:00 +0200 (Tue, 23 May 2017) $");
  script_tag(name:"creation_date", value:"2015-12-09 16:03:44 +0530 (Wed, 09 Dec 2015)");
  script_name("Microsoft Office Remote Code Execution Vulnerabilities (3104503)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS15-128.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists due to improper handling of
  TrueType fonts.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to execute arbitrary code on the affected system.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"
  Microsoft Office 2007 Service Pack 3
  Microsoft Office 2010 Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS15-128");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3085616");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3085612");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS15-128");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
path = "";
dllVer = "";
offPath = "";

## MS Office 2007/2010
if(!get_kb_item("MS/Office/Ver") =~ "^[12|14].*"){
  exit(0);
}

path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                            item:"CommonFilesDir");
if(path)
{
  foreach ver (make_list("OFFICE12", "OFFICE14"))
  {
    ## Get Version from Ogl.dll
    offPath = path + "\Microsoft Shared\" + ver;
    dllVer = fetch_file_version(sysPath:offPath, file_name:"Ogl.dll");

    if(dllVer)
    {
      if(dllVer =~ "^(12)"){
        Vulnerable_range  =  "12.0 - 12.0.6738.4999";
      }
      else if(dllVer =~ "^(14)"){
        Vulnerable_range  =  "14 - 14.0.7164.4999";
      }

      if(version_in_range(version:dllVer, test_version:"14.0", test_version2:"14.0.7164.4999") ||
         version_in_range(version:dllVer, test_version:"12.0", test_version2:"12.0.6738.4999"))
      {
        report = 'File checked:     ' + offPath + "\Ogl.dll" + '\n' +
                 'File version:     ' + dllVer  + '\n' +
                 'Vulnerable range: ' + Vulnerable_range + '\n' ;
        security_message(data:report);
        exit(0);
      }
    }
  }
}
