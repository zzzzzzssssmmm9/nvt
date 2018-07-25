###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_word_viewer_ms16-120.nasl 5557 2017-03-13 10:00:29Z teissa $
#
# Microsoft Office Word Viewer Remote Code Execution Vulnerabilities (3192884)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.807372");
  script_version("$Revision: 5557 $");
  script_cve_id("CVE-2016-3209", "CVE-2016-3262", "CVE-2016-3263", "CVE-2016-3396", "CVE-2016-7182");
  script_bugtraq_id(93385, 93390, 93394, 93380, 93395);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-13 11:00:29 +0100 (Mon, 13 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-10-12 10:48:54 +0530 (Wed, 12 Oct 2016)");
  script_name("Microsoft Office Word Viewer Remote Code Execution Vulnerabilities (3192884)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-120.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to the windows
  True Type Font and  GDI+ libraries are improperly handles specially crafted
  embedded fonts.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to execute arbitrary code on the affected system.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Word Viewer");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS16-120");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3118394");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS16-120");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/WordView/Version");
  exit(0);
}

include("smb_nt.inc");
include("secpod_smb_func.inc");
include("version_func.inc");


## Variable Initailization
wordviewVer = "";

wordviewPath = get_kb_item("SMB/Office/WordView/Install/Path");
if(!wordviewPath){
  exit(0);
}

if(wordviewPath)
{
  wordviewVer = fetch_file_version(sysPath:wordviewPath, file_name:"gdiplus.dll");

  if(wordviewVer)
  {
    ## gdipluss.dll will update for https://support.microsoft.com/en-us/kb/3118394
    if(version_in_range(version:wordviewVer, test_version:"11.0", test_version2:"11.0.8434"))
    {
      report = 'File checked:     ' + wordviewPath + "gdiplus.dll" + '\n' +
               'File version:     ' + wordviewVer  + '\n' +
               'Vulnerable range: 11.0 - 11.0.8434 \n' ;
      security_message(data:report);
      exit(0);
    }
  }
}
