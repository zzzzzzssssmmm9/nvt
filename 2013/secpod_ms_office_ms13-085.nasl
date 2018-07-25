###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms_office_ms13-085.nasl 9353 2018-04-06 07:14:20Z cfischer $
#
# Microsoft Office Remote Code Execution Vulnerabilities (2885080)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2013 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.903407");
  script_version("$Revision: 9353 $");
  script_cve_id("CVE-2013-3889", "CVE-2013-3890");
  script_bugtraq_id(62829, 62824);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-10-09 10:10:42 +0530 (Wed, 09 Oct 2013)");
  script_name("Microsoft Office Remote Code Execution Vulnerabilities (2885080)");

  tag_summary =
"This host is missing an important security update according to
Microsoft Bulletin MS13-085.";

  tag_vuldetect =
"Get the vulnerable file version and check appropriate patch is applied
or not.";

  tag_insight =
"Multiple flaws are due to error when processing Microsoft Word binary
documents can be exploited to cause a memory corruption";

  tag_impact =
"Successful exploitation will allow remote attackers to execute the arbitrary
code, cause memory corruption and compromise the system.

Impact Level: System/Application ";

  tag_affected =
"Microsoft Office 2013
Microsoft Office 2007 Service Pack 3 and prior
Microsoft Office 2010 Service Pack 2 and prior";

  tag_solution =
"Run Windows Update and update the listed hotfixes or download and update
mentioned hotfixes in the advisory from the below link,
https://technet.microsoft.com/en-us/security/bulletin/ms13-085";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/55141");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2760585");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2760591");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2826023");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2826035");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2817623");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/security/bulletin/ms13-085");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 SecPod");
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

## variable Initialization
comPath = "";
ortVer = "";
ortconVer = "";

# Microsoft Office 2007 Service Pack 2 and
# Microsoft Office 2010 Service Pack 1 and prior
# Microsoft Office 2013 Service Pack 1 and prior
if(!get_kb_item("MS/Office/Ver") =~ "^[12|14|15].*"){
  exit(0);
}

## Get the file version
foreach offpath (make_list("12.0", "14.0", "15.0"))
{
  comPath = registry_get_sz(key:"SOFTWARE\Microsoft\Office\" + offpath  + "\Access\InstallRoot",
                           item:"Path");
  if(comPath)
  {
    ## Get the file versions
    ortVer = fetch_file_version(sysPath:comPath, file_name:"Oart.dll");
    ortconVer = fetch_file_version(sysPath:comPath, file_name:"Oartconv.dll");
    if(!isnull(ortVer) || !isnull(ortconVer))
    {
      ## Check the Oart.dll and Oartconv.dll files version
      if(version_in_range(version:ortVer, test_version:"12.0", test_version2:"12.0.6683.5001") ||
         version_in_range(version:ortconVer, test_version:"12.0", test_version2:"12.0.6683.5001") ||
         version_in_range(version:ortVer, test_version:"14.0", test_version2:"14.0.7108.4999") ||
         version_in_range(version:ortconVer, test_version:"14.0", test_version2:"14.0.7108.4999") ||
         version_in_range(version:ortVer, test_version:"15.0", test_version2:"15.0.4535.1503"))

      {
        security_message(0);
        exit(0);
      }
    }
  }
}
